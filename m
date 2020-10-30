From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Oct 2020 09:32:00 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/cryptsetup:
 backport upstream security fixes
Message-ID: <20201030082129.A63628643A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=957ff8fa25ee4e8e01c3a50379ef912e0a18b860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes CVE-2020-14382: A vulnerability was found in upstream release
cryptsetup-2.2.0 where, there's a bug in LUKS2 format validation code, that
is effectively invoked on every device/image presenting itself as LUKS2
container.  The bug is in segments validation code in file
'lib/luks2/luks2_json_metadata.c' in function hdr_validate_segments(struct
crypt_device *cd, json_object *hdr_jobj) where the code does not check for
possible overflow on memory allocation used for intervals array (see
statement "intervals = malloc(first_backup * sizeof(*intervals));").  Due to
the bug, library can be *tricked* to expect such allocation was successful
but for far less memory then originally expected.  Later it may read data
FROM image crafted by an attacker and actually write such data BEYOND
allocated memory.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eck-segment-gaps-regardless-of-heap-space.patch | 64 ++++++++++++++++++++++
 ...essly-large-allocations-in-LUKS2-validati.patch | 47 ++++++++++++++++
 .../0006-Simplify-validation-code-a-bit.patch      | 64 ++++++++++++++++++++++
 3 files changed, 175 insertions(+)

diff --git a/package/cryptsetup/0004-Check-segment-gaps-regardless-of-heap-space.patch b/package/cryptsetup/0004-Check-segment-gaps-regardless-of-heap-space.patch
new file mode 100644
index 0000000000..45a2f4b012
--- /dev/null
+++ b/package/cryptsetup/0004-Check-segment-gaps-regardless-of-heap-space.patch
@@ -0,0 +1,64 @@
+From eaec63806b88aa2775271254734e78324c239622 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Mon, 24 Aug 2020 19:21:43 +0200
+Subject: [PATCH 4/6] Check segment gaps regardless of heap space.
+
+Segments are validated in hdr_validate_segments. Gaps in segment keys
+are detected when collecting offsets. But if an invalid segment is very
+large, larger than count, it could happen that cryptsetup is unable to
+allocate enough memory, not giving a clue about what actually is the
+problem.
+
+Therefore check for gaps even if not enough memory is available. This
+gives much more information with debug output enabled.
+
+Obviously cryptsetup still fails if segments are perfectly fine but not
+enough RAM available. But at that stage, the user knows that it's the
+fault of the system, not of an invalid segment.
+
+(cherry picked from commit 52f5cb8cedf22fb3e14c744814ec8af7614146c7)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/luks2/luks2_json_metadata.c | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/lib/luks2/luks2_json_metadata.c b/lib/luks2/luks2_json_metadata.c
+index 19fb9588..67a5512d 100644
+--- a/lib/luks2/luks2_json_metadata.c
++++ b/lib/luks2/luks2_json_metadata.c
+@@ -679,11 +679,10 @@ static int hdr_validate_segments(struct crypt_device *cd, json_object *hdr_jobj)
+ 	if (first_backup < 0)
+ 		first_backup = count;
+ 
+-	intervals = malloc(first_backup * sizeof(*intervals));
+-	if (!intervals) {
+-		log_dbg(cd, "Not enough memory.");
+-		return 1;
+-	}
++	if (first_backup <= count && (size_t)first_backup < SIZE_MAX / sizeof(*intervals))
++		intervals = malloc(first_backup * sizeof(*intervals));
++	else
++		intervals = NULL;
+ 
+ 	for (i = 0; i < first_backup; i++) {
+ 		jobj = json_segments_get_segment(jobj_segments, i);
+@@ -692,8 +691,14 @@ static int hdr_validate_segments(struct crypt_device *cd, json_object *hdr_jobj)
+ 			free(intervals);
+ 			return 1;
+ 		}
+-		intervals[i].offset = json_segment_get_offset(jobj, 0);
+-		intervals[i].length = json_segment_get_size(jobj, 0) ?: UINT64_MAX;
++		if (intervals != NULL) {
++			intervals[i].offset = json_segment_get_offset(jobj, 0);
++			intervals[i].length = json_segment_get_size(jobj, 0) ?: UINT64_MAX;
++		}
++	}
++	if (intervals == NULL) {
++		log_dbg(cd, "Not enough memory.");
++		return 1;
+ 	}
+ 
+ 	r = !validate_segment_intervals(cd, first_backup, intervals);
+-- 
+2.20.1
+
diff --git a/package/cryptsetup/0005-Avoid-needlessly-large-allocations-in-LUKS2-validati.patch b/package/cryptsetup/0005-Avoid-needlessly-large-allocations-in-LUKS2-validati.patch
new file mode 100644
index 0000000000..2bd2ceca0e
--- /dev/null
+++ b/package/cryptsetup/0005-Avoid-needlessly-large-allocations-in-LUKS2-validati.patch
@@ -0,0 +1,47 @@
+From b7d757ad79091da12e509a4989f3e8cfc1f55a03 Mon Sep 17 00:00:00 2001
+From: Ondrej Kozina <okozina@redhat.com>
+Date: Tue, 25 Aug 2020 19:32:48 +0200
+Subject: [PATCH 5/6] Avoid needlessly large allocations in LUKS2 validation
+ code.
+
+In case LUKS2 backup segment creates gap in between last regular
+segment and backup segment report invalid metadata imediately. We stop
+on first error so there's no need to allocate large memory on heap
+(we may ran with mlock(MCL_FUTURE) set).
+
+Example:
+- total segments count is 3
+- regular segments have keys "0" and "1"
+- first backup segment has key "42"
+
+(cherry picked from commit 46ee71edcd13e1dad50815ad65c28779aa6f7503)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/luks2/luks2_json_metadata.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/luks2/luks2_json_metadata.c b/lib/luks2/luks2_json_metadata.c
+index 67a5512d..cd28400c 100644
+--- a/lib/luks2/luks2_json_metadata.c
++++ b/lib/luks2/luks2_json_metadata.c
+@@ -676,10 +676,16 @@ static int hdr_validate_segments(struct crypt_device *cd, json_object *hdr_jobj)
+ 		return 1;
+ 	}
+ 
++	/* avoid needlessly large allocation when first backup segment is invalid */
++	if (first_backup >= count) {
++		log_dbg(cd, "Gap between last regular segment and backup segment at key %d.", first_backup);
++		return 1;
++	}
++
+ 	if (first_backup < 0)
+ 		first_backup = count;
+ 
+-	if (first_backup <= count && (size_t)first_backup < SIZE_MAX / sizeof(*intervals))
++	if ((size_t)first_backup < SIZE_MAX / sizeof(*intervals))
+ 		intervals = malloc(first_backup * sizeof(*intervals));
+ 	else
+ 		intervals = NULL;
+-- 
+2.20.1
+
diff --git a/package/cryptsetup/0006-Simplify-validation-code-a-bit.patch b/package/cryptsetup/0006-Simplify-validation-code-a-bit.patch
new file mode 100644
index 0000000000..8e79fcd8f8
--- /dev/null
+++ b/package/cryptsetup/0006-Simplify-validation-code-a-bit.patch
@@ -0,0 +1,64 @@
+From 45de1eb6e3d31ac3ece6b02671ddcc9dfab06e76 Mon Sep 17 00:00:00 2001
+From: Ondrej Kozina <okozina@redhat.com>
+Date: Tue, 25 Aug 2020 19:23:21 +0200
+Subject: [PATCH 6/6] Simplify validation code a bit.
+
+Keep it simple. If there's not enough memory we can't validate
+segments. The LUKS2 specification does not recommend to continue
+processing LUKS2 metadata if it can not be properly validated.
+
+(cherry picked from commit 752c9a52798f11d3b765b673ebaa3058eb25316e)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/luks2/luks2_json_metadata.c | 19 ++++++++-----------
+ 1 file changed, 8 insertions(+), 11 deletions(-)
+
+diff --git a/lib/luks2/luks2_json_metadata.c b/lib/luks2/luks2_json_metadata.c
+index cd28400c..66ee0b91 100644
+--- a/lib/luks2/luks2_json_metadata.c
++++ b/lib/luks2/luks2_json_metadata.c
+@@ -594,9 +594,9 @@ static bool validate_segment_intervals(struct crypt_device *cd,
+ static int hdr_validate_segments(struct crypt_device *cd, json_object *hdr_jobj)
+ {
+ 	json_object *jobj_segments, *jobj_digests, *jobj_offset, *jobj_size, *jobj_type, *jobj_flags, *jobj;
+-	struct interval *intervals;
+ 	uint64_t offset, size;
+ 	int i, r, count, first_backup = -1;
++	struct interval *intervals = NULL;
+ 
+ 	if (!json_object_object_get_ex(hdr_jobj, "segments", &jobj_segments)) {
+ 		log_dbg(cd, "Missing segments section.");
+@@ -687,8 +687,11 @@ static int hdr_validate_segments(struct crypt_device *cd, json_object *hdr_jobj)
+ 
+ 	if ((size_t)first_backup < SIZE_MAX / sizeof(*intervals))
+ 		intervals = malloc(first_backup * sizeof(*intervals));
+-	else
+-		intervals = NULL;
++
++	if (!intervals) {
++		log_dbg(cd, "Not enough memory.");
++		return 1;
++	}
+ 
+ 	for (i = 0; i < first_backup; i++) {
+ 		jobj = json_segments_get_segment(jobj_segments, i);
+@@ -697,14 +700,8 @@ static int hdr_validate_segments(struct crypt_device *cd, json_object *hdr_jobj)
+ 			free(intervals);
+ 			return 1;
+ 		}
+-		if (intervals != NULL) {
+-			intervals[i].offset = json_segment_get_offset(jobj, 0);
+-			intervals[i].length = json_segment_get_size(jobj, 0) ?: UINT64_MAX;
+-		}
+-	}
+-	if (intervals == NULL) {
+-		log_dbg(cd, "Not enough memory.");
+-		return 1;
++		intervals[i].offset = json_segment_get_offset(jobj, 0);
++		intervals[i].length = json_segment_get_size(jobj, 0) ?: UINT64_MAX;
+ 	}
+ 
+ 	r = !validate_segment_intervals(cd, first_backup, intervals);
+-- 
+2.20.1
+
