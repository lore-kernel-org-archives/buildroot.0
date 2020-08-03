From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Aug 2020 22:57:17 +0200
Subject: [Buildroot] [git commit] package/jasper: security bump to version
 2.0.19
Message-ID: <20200803205613.D4B6682DF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0f7b241d4619603adca32fd03d2687126e9e7e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:
* Fix CVE-2018-9154
  https://github.com/jasper-software/jasper/issues/215
  https://github.com/jasper-software/jasper/issues/166
  https://github.com/jasper-software/jasper/issues/175
  https://github.com/jasper-maint/jasper/issues/8

* Fix CVE-2018-19541
  https://github.com/jasper-software/jasper/pull/199
  https://github.com/jasper-maint/jasper/issues/6

* Fix CVE-2016-9399, CVE-2017-13751
  https://github.com/jasper-maint/jasper/issues/1

* Fix CVE-2018-19540
  https://github.com/jasper-software/jasper/issues/182
  https://github.com/jasper-maint/jasper/issues/22

* Fix CVE-2018-9055
  https://github.com/jasper-maint/jasper/issues/9

* Fix CVE-2017-13748
  https://github.com/jasper-software/jasper/issues/168

* Fix CVE-2017-5503, CVE-2017-5504, CVE-2017-5505
  https://github.com/jasper-maint/jasper/issues/3
  https://github.com/jasper-maint/jasper/issues/4
  https://github.com/jasper-maint/jasper/issues/5
  https://github.com/jasper-software/jasper/issues/88
  https://github.com/jasper-software/jasper/issues/89
  https://github.com/jasper-software/jasper/issues/90

* Fix CVE-2018-9252
  https://github.com/jasper-maint/jasper/issues/16

* Fix CVE-2018-19139
  https://github.com/jasper-maint/jasper/issues/14

* Fix CVE-2018-19543, CVE-2017-9782
  https://github.com/jasper-maint/jasper/issues/13
  https://github.com/jasper-maint/jasper/issues/18
  https://github.com/jasper-software/jasper/issues/140
  https://github.com/jasper-software/jasper/issues/182

* Fix CVE-2018-20570
  https://github.com/jasper-maint/jasper/issues/11
  https://github.com/jasper-software/jasper/issues/191

* Fix CVE-2018-20622
  https://github.com/jasper-maint/jasper/issues/12
  https://github.com/jasper-software/jasper/issues/193

* Fix CVE-2016-9398
  https://github.com/jasper-maint/jasper/issues/10

* Fix CVE-2017-14132
  https://github.com/jasper-maint/jasper/issues/17

* Fix CVE-2017-5499
  https://github.com/jasper-maint/jasper/issues/2
  https://github.com/jasper-software/jasper/issues/63

* Fix CVE-2018-18873
  https://github.com/jasper-maint/jasper/issues/15
  https://github.com/jasper-software/jasper/issues/184

* Fix CVE-2017-13750
  https://github.com/jasper-software/jasper/issues/165
  https://github.com/jasper-software/jasper/issues/174

Furthermore, drop now upstreamed patches and change to the new
jasper-software upstream location.

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
[Peter: reword for security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-verify-data-range-CVE-2018-19541.patch    | 35 ----------------------
 ...2-check-null-in-jp2_decode-CVE-2018-19542.patch | 24 ---------------
 .../jasper/0003-test-asclen-CVE-2018-19540.patch   | 29 ------------------
 package/jasper/jasper.hash                         |  2 +-
 package/jasper/jasper.mk                           |  4 +--
 5 files changed, 3 insertions(+), 91 deletions(-)

diff --git a/package/jasper/0001-verify-data-range-CVE-2018-19541.patch b/package/jasper/0001-verify-data-range-CVE-2018-19541.patch
deleted file mode 100644
index 35b4299dcf..0000000000
--- a/package/jasper/0001-verify-data-range-CVE-2018-19541.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 24fc4d6f01d2d4c8297d1bebec02360f796e01c2 Mon Sep 17 00:00:00 2001
-From: Michael Vetter <jubalh@iodoru.org>
-Date: Mon, 4 Nov 2019 18:17:44 +0100
-Subject: [PATCH] Verify range data in jp2_pclr_getdata
-
-This fixes CVE-2018-19541.
-We need to verify the data is in the expected range. Otherwise we get
-problems later.
-
-This is a better fix for https://github.com/mdadams/jasper/pull/199
-which caused segfaults under certain circumstances.
-
-Patch by Adam Majer <adam.majer@suse.de>
-Signed-off-by: Michael Vetter <jubalh@iodoru.org>
----
- src/libjasper/jp2/jp2_cod.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/libjasper/jp2/jp2_cod.c b/src/libjasper/jp2/jp2_cod.c
-index 890e6ad..0f8d804 100644
---- a/src/libjasper/jp2/jp2_cod.c
-+++ b/src/libjasper/jp2/jp2_cod.c
-@@ -855,6 +855,12 @@ static int jp2_pclr_getdata(jp2_box_t *box, jas_stream_t *in)
- 	  jp2_getuint8(in, &pclr->numchans)) {
- 		return -1;
- 	}
-+
-+    // verify in range data as per I.5.3.4 - Palette box
-+    if (pclr->numchans < 1 || pclr->numlutents < 1 || pclr->numlutents > 1024) {
-+        return -1;
-+    }
-+
- 	lutsize = pclr->numlutents * pclr->numchans;
- 	if (!(pclr->lutdata = jas_alloc2(lutsize, sizeof(int_fast32_t)))) {
- 		return -1;
diff --git a/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch b/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch
deleted file mode 100644
index 515a6162cd..0000000000
--- a/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From fc62d1b7164ded2405fd6a0604548b34a5a77462 Mon Sep 17 00:00:00 2001
-From: Timothy Lyanguzov <timothy.lyanguzov@sap.com>
-Date: Mon, 18 Mar 2019 16:46:24 +1300
-Subject: [PATCH] Fix CVE-2018-19542: Check for NULL pointer in jp2_decode
-
-Signed-off-by: Michael Vetter <jubalh@iodoru.org>
----
- src/libjasper/jp2/jp2_dec.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/libjasper/jp2/jp2_dec.c b/src/libjasper/jp2/jp2_dec.c
-index 03b0eaf..a535c19 100644
---- a/src/libjasper/jp2/jp2_dec.c
-+++ b/src/libjasper/jp2/jp2_dec.c
-@@ -388,6 +388,9 @@ jas_image_t *jp2_decode(jas_stream_t *in, const char *optstr)
- 				jas_image_setcmpttype(dec->image, newcmptno, jp2_getct(jas_image_clrspc(dec->image), 0, channo + 1));
- 				}
- #endif
-+			} else {
-+				jas_eprintf("error: invalid MTYP in CMAP box\n");
-+				goto error;
- 			}
- 		}
- 	}
diff --git a/package/jasper/0003-test-asclen-CVE-2018-19540.patch b/package/jasper/0003-test-asclen-CVE-2018-19540.patch
deleted file mode 100644
index 9401da511b..0000000000
--- a/package/jasper/0003-test-asclen-CVE-2018-19540.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e38454aa1a15b78c028a778fc8bfba3587e25c25 Mon Sep 17 00:00:00 2001
-From: Michael Vetter <jubalh@iodoru.org>
-Date: Fri, 15 Mar 2019 11:01:02 +0100
-Subject: [PATCH] Make sure asclen is at least 1
-
-If txtdesc->asclen is < 1, the array index of txtdesc->ascdata will be negative which causes the heap based overflow.
-
-Regards CVE-2018-19540.
-Regards https://github.com/mdadams/jasper/issues/182 bug#3
-Fix by Markus Koschany <apo@debian.org>.
-From https://gist.github.com/apoleon/13598a45bf6522f6a79b77a629205823
-Signed-off-by: Michael Vetter <jubalh@iodoru.org>
----
- src/libjasper/base/jas_icc.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/libjasper/base/jas_icc.c b/src/libjasper/base/jas_icc.c
-index 4607930..762c0e8 100644
---- a/src/libjasper/base/jas_icc.c
-+++ b/src/libjasper/base/jas_icc.c
-@@ -1104,6 +1104,8 @@ static int jas_icctxtdesc_input(jas_iccattrval_t *attrval, jas_stream_t *in,
- 	if (jas_stream_read(in, txtdesc->ascdata, txtdesc->asclen) !=
- 	  JAS_CAST(int, txtdesc->asclen))
- 		goto error;
-+	if (txtdesc->asclen < 1)
-+		goto error;
- 	txtdesc->ascdata[txtdesc->asclen - 1] = '\0';
- 	if (jas_iccgetuint32(in, &txtdesc->uclangcode) ||
- 	  jas_iccgetuint32(in, &txtdesc->uclen))
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 7e9ce0ea90..67ad90d730 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f1d8b90f231184d99968f361884e2054a1714fdbbd9944ba1ae4ebdcc9bbfdb1  jasper-2.0.16.tar.gz
+sha256 b9d16162a088617ada36450f2374d72165377cb64b33ed197c200bcfb73ec76c  jasper-2.0.19.tar.gz
 sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 287c358884..f6ae2ead78 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.16
-JASPER_SITE = $(call github,mdadams,jasper,version-$(JASPER_VERSION))
+JASPER_VERSION = 2.0.19
+JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
