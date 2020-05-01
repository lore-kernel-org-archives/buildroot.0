From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 11:57:20 +0200
Subject: [Buildroot] [git commit] package/libhtp: security bump to version
 0.5.33
Message-ID: <20200501094507.C40CE90C3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3d51946964546f26a026c4dea337e8084e64e58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- ChangeLog:
  - compression bomb protection
  - memory handling issue found by Oss-Fuzz
  - improve handling of anomalies in traffic
- Drop first patch (already in version)
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-fix-build-without-GNU-libiconv.patch      | 60 ----------------------
 ...=> 0001-htp.pc.in-add-lz-to-Libs.private.patch} |  2 +-
 package/libhtp/libhtp.hash                         |  4 +-
 package/libhtp/libhtp.mk                           |  2 +-
 4 files changed, 4 insertions(+), 64 deletions(-)

diff --git a/package/libhtp/0001-fix-build-without-GNU-libiconv.patch b/package/libhtp/0001-fix-build-without-GNU-libiconv.patch
deleted file mode 100644
index 8f6cddf2da..0000000000
--- a/package/libhtp/0001-fix-build-without-GNU-libiconv.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 1531a8e9b91b567979a2a0d7fd6a4c2e9126b01c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 6 Mar 2019 23:06:54 +0100
-Subject: [PATCH] fix build without GNU libiconv
-
-iconvctl is only defined in GNU libiconv so check for the availability
-of this function before using it
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OISF/libhtp/pull/193]
----
- configure.ac         | 18 ++++++++++++++++++
- htp/htp_transcoder.c |  2 +-
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7f0a58d..388ec7b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -155,6 +155,24 @@ sinclude(m4/lib-link.m4)
- sinclude(m4/lib-prefix.m4)
- AM_ICONV
- 
-+# iconvctl is not standard, it is defined only in GNU libiconv
-+AC_MSG_CHECKING(for iconvctl)
-+TMPLIBS="${LIBS}"
-+LIBS="${LIBS} ${LIBICONV}"
-+
-+AC_TRY_LINK([#include <stdlib.h>
-+             #include <iconv.h>],
-+            [int iconv_param = 0;
-+             iconv_t cd = iconv_open("","");
-+             iconvctl(cd, ICONV_SET_DISCARD_ILSEQ, &iconv_param);
-+             iconv_close(cd);],
-+            [ac_cv_func_iconvctl=yes])
-+AC_MSG_RESULT($ac_cv_func_iconvctl)
-+if test "$ac_cv_func_iconvctl" == yes; then
-+    AC_DEFINE(HAVE_ICONVCTL,1,"Define to 1 if you have the `iconvctl' function.")
-+fi
-+LIBS="${TMPLIBS}"
-+
- dnl -----------------------------------------------
- dnl Check and enable the GCC opts we want to use.
- dnl We may need to add more checks
-diff --git a/htp/htp_transcoder.c b/htp/htp_transcoder.c
-index 57ff74c..d8e8280 100644
---- a/htp/htp_transcoder.c
-+++ b/htp/htp_transcoder.c
-@@ -64,7 +64,7 @@ int htp_transcode_params(htp_connp_t *connp, htp_table_t **params, int destroy_o
-         return HTP_ERROR;
-     }
- 
--    #if (_LIBICONV_VERSION >= 0x0108)
-+    #if (_LIBICONV_VERSION >= 0x0108 && HAVE_ICONVCTL)
-     int iconv_param = 0;
-     iconvctl(cd, ICONV_SET_TRANSLITERATE, &iconv_param);
-     iconv_param = 1;
--- 
-2.14.1
-
diff --git a/package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch b/package/libhtp/0001-htp.pc.in-add-lz-to-Libs.private.patch
similarity index 93%
rename from package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch
rename to package/libhtp/0001-htp.pc.in-add-lz-to-Libs.private.patch
index f79a9ebb3a..b21ea6053a 100644
--- a/package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch
+++ b/package/libhtp/0001-htp.pc.in-add-lz-to-Libs.private.patch
@@ -7,7 +7,7 @@ zlib is a mandatory dependency so add it to Libs.private otherwise
 static linking of packages linking with htp (e.g. suricata) will fail.
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
+[Upstream status: https://github.com/OISF/libhtp/pull/294]
 ---
  htp.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index b3775c3ad3..765acd5bf9 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	a6a6f3b3f1fb6e8b8a1dae02db8a0090c438f0d057102dd8e52208224868c4e4	libhtp-0.5.32.tar.gz
-sha256	87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15	LICENSE
+sha256  953651fdfe828805bb82dc1aa8b56187b0e2f80781727343e68ccf8afd6a9122  libhtp-0.5.33.tar.gz
+sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 577b700953..b77d8715f9 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.32
+LIBHTP_VERSION = 0.5.33
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
