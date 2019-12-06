From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2019 09:21:04 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/jasper: Apply fix
 for CVE-2018-19541
Message-ID: <20191206082858.2E4D98830A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3566998816efe449f7e274926bdc4eb1457e1c3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add 0001-verify-data-range-CVE-2018-19541.patch:
We need to verify the data is in the expected range. Otherwise we get
problems later.

Patch was proposed upstream[1] but upstream is very inactive. Linux
distributions use the same fix to patch their packages.

1: https://github.com/mdadams/jasper/pull/211
Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fddee3cf7436bd39d08c30a83a15ee9687e88401)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-verify-data-range-CVE-2018-19541.patch    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/jasper/0001-verify-data-range-CVE-2018-19541.patch b/package/jasper/0001-verify-data-range-CVE-2018-19541.patch
new file mode 100644
index 0000000000..35b4299dcf
--- /dev/null
+++ b/package/jasper/0001-verify-data-range-CVE-2018-19541.patch
@@ -0,0 +1,35 @@
+From 24fc4d6f01d2d4c8297d1bebec02360f796e01c2 Mon Sep 17 00:00:00 2001
+From: Michael Vetter <jubalh@iodoru.org>
+Date: Mon, 4 Nov 2019 18:17:44 +0100
+Subject: [PATCH] Verify range data in jp2_pclr_getdata
+
+This fixes CVE-2018-19541.
+We need to verify the data is in the expected range. Otherwise we get
+problems later.
+
+This is a better fix for https://github.com/mdadams/jasper/pull/199
+which caused segfaults under certain circumstances.
+
+Patch by Adam Majer <adam.majer@suse.de>
+Signed-off-by: Michael Vetter <jubalh@iodoru.org>
+---
+ src/libjasper/jp2/jp2_cod.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/libjasper/jp2/jp2_cod.c b/src/libjasper/jp2/jp2_cod.c
+index 890e6ad..0f8d804 100644
+--- a/src/libjasper/jp2/jp2_cod.c
++++ b/src/libjasper/jp2/jp2_cod.c
+@@ -855,6 +855,12 @@ static int jp2_pclr_getdata(jp2_box_t *box, jas_stream_t *in)
+ 	  jp2_getuint8(in, &pclr->numchans)) {
+ 		return -1;
+ 	}
++
++    // verify in range data as per I.5.3.4 - Palette box
++    if (pclr->numchans < 1 || pclr->numlutents < 1 || pclr->numlutents > 1024) {
++        return -1;
++    }
++
+ 	lutsize = pclr->numlutents * pclr->numchans;
+ 	if (!(pclr->lutdata = jas_alloc2(lutsize, sizeof(int_fast32_t)))) {
+ 		return -1;
