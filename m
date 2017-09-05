From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:24:04 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/jack2: backport
	two build fixes
Message-ID: <20170905220138.9707C81ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e40be53f7b3d634f1e15ead62bea3c52b4cdb470
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

0005-gcc7.patch fixes
http://autobuild.buildroot.net/results/c06/c0610325d7785dfa51c5d36775623ca8fa517f24/

0006-fix-ftbfs-with-clang.patch
fixes the subsequent build error:
common/memops.c.31.o: In function `sample_move_dither_rect_d16_sSs':
memops.c:(.text+0x4dc): undefined reference to `fast_rand'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 50ace0bcc31e375adde289215e2b0c728211f886)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/0005-gcc7.patch                 | 31 +++++++++++++++++++++++++++
 package/jack2/0006-fix-ftbfs-with-clang.patch | 28 ++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/package/jack2/0005-gcc7.patch b/package/jack2/0005-gcc7.patch
new file mode 100644
index 0000000..dadaf44
--- /dev/null
+++ b/package/jack2/0005-gcc7.patch
@@ -0,0 +1,31 @@
+From f7bccdca651592cc4082b28fd4a01ed6ef8ab655 Mon Sep 17 00:00:00 2001
+From: Kjetil Matheussen <k.s.matheussen@notam02.no>
+Date: Sat, 15 Jul 2017 13:21:59 +0200
+Subject: [PATCH] Tests: Fix compilation with gcc7
+
+Fixes
+../tests/test.cpp: In function ???int process4(jack_nframes_t, void*)???:
+../tests/test.cpp:483:73: error: call of overloaded ???abs(jack_nframes_t)??? is ambiguous
+  if (delta_time > 0  && (jack_nframes_t)abs(delta_time - cur_buffer_size) > tolerance) {
+
+Downloaded from upstream commit
+https://github.com/jackaudio/jack2/commit/f7bccdca651592cc4082b28fd4a01ed6ef8ab655
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ tests/test.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test.cpp b/tests/test.cpp
+index 8a8a8117..d2ef9a05 100644
+--- a/tests/test.cpp
++++ b/tests/test.cpp
+@@ -479,7 +479,7 @@ int process4(jack_nframes_t nframes, void *arg)
+ 	jack_nframes_t delta_time = cur_time - last_time;
+ 
+ 	Log("calling process4 callback : jack_frame_time = %ld delta_time = %ld\n", cur_time, delta_time);
+-	if (delta_time > 0  && (jack_nframes_t)abs(delta_time - cur_buffer_size) > tolerance) {
++	if (delta_time > 0  && abs((int64_t)delta_time - (int64_t)cur_buffer_size) > (int64_t)tolerance) {
+ 		printf("!!! ERROR !!! jack_frame_time seems to return incorrect values cur_buffer_size = %d, delta_time = %d tolerance %d\n", cur_buffer_size, delta_time, tolerance);
+ 	}
+ 
diff --git a/package/jack2/0006-fix-ftbfs-with-clang.patch b/package/jack2/0006-fix-ftbfs-with-clang.patch
new file mode 100644
index 0000000..a73fe69
--- /dev/null
+++ b/package/jack2/0006-fix-ftbfs-with-clang.patch
@@ -0,0 +1,28 @@
+From d3c8e2d8d78899fba40a3e677ed4dbe388d82269 Mon Sep 17 00:00:00 2001
+From: Adrian Knoth <adi@drcomp.erfurt.thur.de>
+Date: Thu, 18 Sep 2014 18:29:23 +0200
+Subject: [PATCH] Fix FTBFS with clang++
+
+Forwarded from http://bugs.debian.org/757820
+
+Downloaded from upstream commit
+https://github.com/jackaudio/jack2/commit/d3c8e2d8d78899fba40a3e677ed4dbe388d82269
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ common/memops.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common/memops.c b/common/memops.c
+index 27f6194a..2d416b64 100644
+--- a/common/memops.c
++++ b/common/memops.c
+@@ -198,7 +198,7 @@ static inline __m128i float_24_sse(__m128 s)
+  */
+ static unsigned int seed = 22222;
+ 
+-inline unsigned int fast_rand() {
++static inline unsigned int fast_rand() {
+ 	seed = (seed * 96314165) + 907633515;
+ 	return seed;
+ }
