From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:23:08 +0100
Subject: [Buildroot] [git commit] package/asterisk: bump version to 16.0.0
Message-ID: <20181209211922.18F6C8B759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78790d3e9c37cb7fc75b03305f5ae4af30e566b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed patches applied upstream, re-numbered remaining patches
- not available for static builds anymore:
  https://github.com/asterisk/asterisk/commit/8e36064109b6fabc6cd8caa59e48f9b523c7485b
- fixed license hashes after upstream whitespace removal
  https://github.com/asterisk/asterisk/commit/fd0ca1c3f9b972a52d48a82b492fd6bac772dc78
- removed configure options not provided by upstream anymore
- fixed configure error, the file is included in asterisk source:
    checking for bridges/bridge_softmix/include/hrirs.h... configure:
    error: cannot check for file existence when cross compiling
- added "-without-pjproject-bundled" as noted in
  https://wiki.asterisk.org/wiki/display/AST/New+in+15
- upstream switched from ncurses to libedit:
  https://github.com/asterisk/asterisk/commit/d6fda173a40e078db219e9aaceb7f3ce9ba1b4e4
- added libatomic when needed
- updated core sound package

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-configure-do-not-configure-in-menuselect.patch |  58 -------
 ...1-sounds-do-not-download-and-check-sha1s.patch} |   0
 ...0002-configure-fix-detection-of-libcrypt.patch} |   0
 ...sure-target-directory-for-modules-exists.patch} |   0
 ...0004-install-samples-need-the-data-files.patch} |   0
 ...006-build-fix-issues-building-without-ssl.patch |  57 -------
 ...rtp-Add-support-for-libsrtp2-with-AES-GCM.patch | 171 ---------------------
 package/asterisk/Config.in                         |  11 +-
 package/asterisk/asterisk.hash                     |  10 +-
 package/asterisk/asterisk.mk                       |  25 ++-
 10 files changed, 30 insertions(+), 302 deletions(-)

diff --git a/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch b/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
deleted file mode 100644
index d6d02d2c3a..0000000000
--- a/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From cc5daff874779475742bdb89a9328bb4fc4c4e09 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Tue, 27 Dec 2016 11:20:19 +0100
-Subject: [PATCH] configure: do not configure in menuselect
-
-When cross-compiling, the arguments and environment for ./configure are
-different for the host and the target, and we want menuselect to be
-compiled for the build machine, not the target.
-
-Although we do not pass any option to ./configure for menuselect, the
-environment may still reference variables for the target, like CC or
-CFLAGS and so on... We can not build menuselect with those variables.
-
-Instead, just assume that menuselect will be pre-compiled.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- configure    | 16 ----------------
- configure.ac | 16 ----------------
- 2 files changed, 32 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 66c8971..121dd93 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2662,12 +2662,6 @@ fi
- 
- AC_SUBST([PBX_SYSLOG])
- 
--if test -f makeopts; then
--	${ac_cv_path_EGREP} 'CURSES|GTK2|OSARCH|NEWT' makeopts > makeopts.acbak
--else
--	touch makeopts.acbak
--fi
--
- AC_CONFIG_FILES([build_tools/menuselect-deps makeopts])
- AST_CHECK_MANDATORY
- 
-@@ -2683,16 +2677,6 @@ fi
- 
- AC_OUTPUT
- 
--${ac_cv_path_EGREP} 'CURSES|GTK2|OSARCH|NEWT' makeopts > makeopts.acbak2
--if test "x${ac_cv_path_CMP}" = "x:"; then
--	( cd `pwd`/menuselect && ./configure )
--else if ${ac_cv_path_CMP} -s makeopts.acbak makeopts.acbak2; then : ; else
--	( cd `pwd`/menuselect && ./configure )
--fi ; fi
--
--rm makeopts.acbak makeopts.acbak2
--
--
- if test "x${silent}" != "xyes" ; then
- echo
- echo "               .\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$=..      "
--- 
-2.7.4
-
diff --git a/package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch b/package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch
similarity index 100%
rename from package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch
rename to package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch
diff --git a/package/asterisk/0003-configure-fix-detection-of-libcrypt.patch b/package/asterisk/0002-configure-fix-detection-of-libcrypt.patch
similarity index 100%
rename from package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
rename to package/asterisk/0002-configure-fix-detection-of-libcrypt.patch
diff --git a/package/asterisk/0004-build-ensure-target-directory-for-modules-exists.patch b/package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch
similarity index 100%
rename from package/asterisk/0004-build-ensure-target-directory-for-modules-exists.patch
rename to package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch
diff --git a/package/asterisk/0005-install-samples-need-the-data-files.patch b/package/asterisk/0004-install-samples-need-the-data-files.patch
similarity index 100%
rename from package/asterisk/0005-install-samples-need-the-data-files.patch
rename to package/asterisk/0004-install-samples-need-the-data-files.patch
diff --git a/package/asterisk/0006-build-fix-issues-building-without-ssl.patch b/package/asterisk/0006-build-fix-issues-building-without-ssl.patch
deleted file mode 100644
index b02031e5ab..0000000000
--- a/package/asterisk/0006-build-fix-issues-building-without-ssl.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 999e0c17d7e4139d36730752a34fbfde18a4f9f1 Mon Sep 17 00:00:00 2001
-From: Corey Farrell <git@cfware.com>
-Date: Sun, 19 Nov 2017 14:52:59 -0500
-Subject: [PATCH] Build: Fix issues building without SSL.
-
-* Fix conditional in libasteriskssl.
-* Use variables produced by configure to link the SSL and uuid libraries
-  into libasteriskpj.so instead of hard-coding them.
-
-ASTERISK-27431
-
-Change-Id: I3977931fd3ef8c4e4376349ccddb354eb839b58d
-
-Downloaded from upstream master branch
-https://github.com/asterisk/asterisk/commit/999e0c17d7e4139d36730752a34fbfde18a4f9f1
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- main/Makefile         | 4 ++--
- main/libasteriskssl.c | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/main/Makefile b/main/Makefile
-index 08d1f65580e..c724e2012b0 100644
---- a/main/Makefile
-+++ b/main/Makefile
-@@ -273,7 +273,7 @@ endif
- 
- $(ASTPJ_LIB).$(ASTPJ_SO_VERSION): _ASTLDFLAGS+=-Wl,-soname=$(ASTPJ_LIB).$(ASTPJ_SO_VERSION) $(PJ_LDFLAGS)
- $(ASTPJ_LIB).$(ASTPJ_SO_VERSION): _ASTCFLAGS+=-fPIC -DAST_MODULE=\"asteriskpj\" -DAST_NOT_MODULE $(PJ_CFLAGS)
--$(ASTPJ_LIB).$(ASTPJ_SO_VERSION): LIBS+=$(PJPROJECT_LDLIBS) -lssl -lcrypto -luuid -lm -lpthread $(RT_LIB)
-+$(ASTPJ_LIB).$(ASTPJ_SO_VERSION): LIBS+=$(PJPROJECT_LDLIBS) $(OPENSSL_LIB) $(UUID_LIB) -lm -lpthread $(RT_LIB)
- ifeq ($(GNU_LD),1)
-     $(ASTPJ_LIB).$(ASTPJ_SO_VERSION): SO_SUPPRESS_SYMBOLS=-Wl,--version-script,libasteriskpj.exports,--warn-common
- endif
-@@ -298,7 +298,7 @@ ASTPJ_LIB:=libasteriskpj.dylib
- # /lib or /usr/lib
- $(ASTPJ_LIB): _ASTLDFLAGS+=-dynamiclib -install_name $(ASTLIBDIR)/$(ASTPJ_LIB) $(PJ_LDFLAGS)
- $(ASTPJ_LIB): _ASTCFLAGS+=-fPIC -DAST_MODULE=\"asteriskpj\" $(PJ_CFLAGS) -DAST_NOT_MODULE
--$(ASTPJ_LIB): LIBS+=$(PJPROJECT_LIBS)  -lssl -lcrypto -luuid -lm -lpthread $(RT_LIB)
-+$(ASTPJ_LIB): LIBS+=$(PJPROJECT_LIBS)  $(OPENSSL_LIB) $(UUID_LIB) -lm -lpthread $(RT_LIB)
- $(ASTPJ_LIB): SOLINK=$(DYLINK)
- 
- # Special rules for building a shared library (not a dynamically loadable module)
-diff --git a/main/libasteriskssl.c b/main/libasteriskssl.c
-index 8b19e247da9..e2e256f8ffe 100644
---- a/main/libasteriskssl.c
-+++ b/main/libasteriskssl.c
-@@ -37,7 +37,7 @@
- #endif
- 
- #if defined(HAVE_OPENSSL) && \
--	!defined(OPENSSL_VERSION_NUMBER) || OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+	(!defined(OPENSSL_VERSION_NUMBER) || OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER))
- 
- #include <dlfcn.h>
- 
diff --git a/package/asterisk/0007-res_srtp-Add-support-for-libsrtp2-with-AES-GCM.patch b/package/asterisk/0007-res_srtp-Add-support-for-libsrtp2-with-AES-GCM.patch
deleted file mode 100644
index 65ebe06582..0000000000
--- a/package/asterisk/0007-res_srtp-Add-support-for-libsrtp2-with-AES-GCM.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From 95b45d1c46b35232ee0b9bdb3135b080c164c7c6 Mon Sep 17 00:00:00 2001
-From: Alexander Traud <pabstraud@compuserve.com>
-Date: Wed, 18 Oct 2017 10:30:25 +0200
-Subject: [PATCH] res_srtp: Add support for libsrtp2 with AES-GCM.
-
-Beside allowing AES-GCM again, this adds AES-192 again.
-
-ASTERISK-27356
-
-Change-Id: Ia97a435faf26300335d9552fa676b5d17e5f7233
-[yann.morin.1998 at free.fr: backport from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- configure              | 104 +++++++++++++++++++++++++++++++++++++++++++++++++
- configure.ac           |   1 +
- res/srtp/srtp_compat.h |  12 ++++++
- 3 files changed, 117 insertions(+)
-
-diff --git a/configure b/configure
-index 59bc3b10b1..588fbfd0be 100755
---- a/configure
-+++ b/configure
-@@ -33793,6 +33793,110 @@ fi
- 
- 
- 
-+if test "x${PBX_SRTP_192}" != "x1" -a "${USE_SRTP_192}" != "no"; then
-+   pbxlibdir=""
-+   # if --with-SRTP_192=DIR has been specified, use it.
-+   if test "x${SRTP_192_DIR}" != "x"; then
-+      if test -d ${SRTP_192_DIR}/lib; then
-+         pbxlibdir="-L${SRTP_192_DIR}/lib"
-+      else
-+         pbxlibdir="-L${SRTP_192_DIR}"
-+      fi
-+   fi
-+   pbxfuncname="srtp_crypto_policy_set_aes_cm_192_hmac_sha1_80"
-+   if test "x${pbxfuncname}" = "x" ; then   # empty lib, assume only headers
-+      AST_SRTP_192_FOUND=yes
-+   else
-+      ast_ext_lib_check_save_CFLAGS="${CFLAGS}"
-+      CFLAGS="${CFLAGS} "
-+      as_ac_Lib=`$as_echo "ac_cv_lib_srtp2_${pbxfuncname}" | $as_tr_sh`
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ${pbxfuncname} in -lsrtp2" >&5
-+$as_echo_n "checking for ${pbxfuncname} in -lsrtp2... " >&6; }
-+if eval \${$as_ac_Lib+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  ac_check_lib_save_LIBS=$LIBS
-+LIBS="-lsrtp2 ${pbxlibdir}  $LIBS"
-+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+
-+/* Override any GCC internal prototype to avoid an error.
-+   Use char because int might match the return type of a GCC
-+   builtin and then its argument prototype would still apply.  */
-+#ifdef __cplusplus
-+extern "C"
-+#endif
-+char ${pbxfuncname} ();
-+int
-+main ()
-+{
-+return ${pbxfuncname} ();
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_link "$LINENO"; then :
-+  eval "$as_ac_Lib=yes"
-+else
-+  eval "$as_ac_Lib=no"
-+fi
-+rm -f core conftest.err conftest.$ac_objext \
-+    conftest$ac_exeext conftest.$ac_ext
-+LIBS=$ac_check_lib_save_LIBS
-+fi
-+eval ac_res=\$$as_ac_Lib
-+	       { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_res" >&5
-+$as_echo "$ac_res" >&6; }
-+if eval test \"x\$"$as_ac_Lib"\" = x"yes"; then :
-+  AST_SRTP_192_FOUND=yes
-+else
-+  AST_SRTP_192_FOUND=no
-+fi
-+
-+      CFLAGS="${ast_ext_lib_check_save_CFLAGS}"
-+   fi
-+
-+   # now check for the header.
-+   if test "${AST_SRTP_192_FOUND}" = "yes"; then
-+      SRTP_192_LIB="${pbxlibdir} -lsrtp2 "
-+      # if --with-SRTP_192=DIR has been specified, use it.
-+      if test "x${SRTP_192_DIR}" != "x"; then
-+         SRTP_192_INCLUDE="-I${SRTP_192_DIR}/include"
-+      fi
-+      SRTP_192_INCLUDE="${SRTP_192_INCLUDE} "
-+      if test "x" = "x" ; then	# no header, assume found
-+         SRTP_192_HEADER_FOUND="1"
-+      else				# check for the header
-+         ast_ext_lib_check_saved_CPPFLAGS="${CPPFLAGS}"
-+         CPPFLAGS="${CPPFLAGS} ${SRTP_192_INCLUDE}"
-+         ac_fn_c_check_header_mongrel "$LINENO" "" "ac_cv_header_" "$ac_includes_default"
-+if test "x$ac_cv_header_" = xyes; then :
-+  SRTP_192_HEADER_FOUND=1
-+else
-+  SRTP_192_HEADER_FOUND=0
-+fi
-+
-+
-+         CPPFLAGS="${ast_ext_lib_check_saved_CPPFLAGS}"
-+      fi
-+      if test "x${SRTP_192_HEADER_FOUND}" = "x0" ; then
-+         SRTP_192_LIB=""
-+         SRTP_192_INCLUDE=""
-+      else
-+         if test "x${pbxfuncname}" = "x" ; then		# only checking headers -> no library
-+            SRTP_192_LIB=""
-+         fi
-+         PBX_SRTP_192=1
-+         cat >>confdefs.h <<_ACEOF
-+#define HAVE_SRTP_192 1
-+_ACEOF
-+
-+      fi
-+   fi
-+fi
-+
-+
-+
- if test "x${PBX_SRTP_GCM}" != "x1" -a "${USE_SRTP_GCM}" != "no"; then
-    pbxlibdir=""
-    # if --with-SRTP_GCM=DIR has been specified, use it.
-diff --git a/configure.ac b/configure.ac
-index 9f95786e11..c729b94aba 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2520,6 +2520,7 @@ AST_EXT_LIB_CHECK_SHARED([SRTP], [srtp2], [srtp_init], [srtp2/srtp.h], [], [], [
- if test "x$PBX_SRTP" = x1;
- then
-     AST_EXT_LIB_CHECK([SRTP_256], [srtp2], [srtp_crypto_policy_set_aes_cm_256_hmac_sha1_80])
-+    AST_EXT_LIB_CHECK([SRTP_192], [srtp2], [srtp_crypto_policy_set_aes_cm_192_hmac_sha1_80])
-     AST_EXT_LIB_CHECK([SRTP_GCM], [srtp2], [srtp_crypto_policy_set_aes_gcm_128_8_auth])
-     AST_EXT_LIB_CHECK([SRTP_SHUTDOWN], [srtp2], [srtp_shutdown], [srtp2/srtp.h])
- 
-diff --git a/res/srtp/srtp_compat.h b/res/srtp/srtp_compat.h
-index 56ffca1cc2..dbd8ddee0f 100644
---- a/res/srtp/srtp_compat.h
-+++ b/res/srtp/srtp_compat.h
-@@ -16,6 +16,18 @@
- #define crypto_policy_set_aes_gcm_128_8_auth srtp_crypto_policy_set_aes_gcm_128_8_auth
- #define crypto_policy_set_aes_gcm_256_8_auth srtp_crypto_policy_set_aes_gcm_256_8_auth
- 
-+#if defined(SRTP_AES_GCM_128_KEY_LEN_WSALT)
-+#define AES_128_GCM_KEYSIZE_WSALT SRTP_AES_GCM_128_KEY_LEN_WSALT
-+#else
-+#define AES_128_GCM_KEYSIZE_WSALT SRTP_AES_128_GCM_KEYSIZE_WSALT
-+#endif
-+
-+#if defined(SRTP_AES_GCM_256_KEY_LEN_WSALT)
-+#define AES_256_GCM_KEYSIZE_WSALT SRTP_AES_GCM_256_KEY_LEN_WSALT
-+#else
-+#define AES_256_GCM_KEYSIZE_WSALT SRTP_AES_256_GCM_KEYSIZE_WSALT
-+#endif
-+
- #define err_status_t srtp_err_status_t
- #define err_status_ok srtp_err_status_ok
- #define err_status_fail srtp_err_status_fail
--- 
-2.14.1
-
diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index 17ac22bfd4..cfea181026 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -3,11 +3,14 @@ config BR2_PACKAGE_ASTERISK
 	# Uses glibc resolver function res_nsearch()
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_USE_MMU # libedit
+	depends on BR2_USE_WCHAR # libedit
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBEDIT
 	select BR2_PACKAGE_LIBILBC
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -22,5 +25,7 @@ config BR2_PACKAGE_ASTERISK
 
 	  http://www.asterisk.org/
 
-comment "asterisk needs a glibc toolchain w/ C++"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
+comment "asterisk needs a glibc toolchain w/ C++, dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 2449aeb4d1..4b3a087ec5 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,15 +1,15 @@
 # Locally computed
-sha256  41c99bd2236af95d056e15f9d044c28b69e00935e67791b18fa70b0614402012  asterisk-14.7.8.tar.gz
+sha256  54f8b172fa41cb7d4450c12666a8f9716ed7ba7391c54d3467c64772f6399d67  asterisk-16.0.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
-sha1    65ee068462c6645ed14a28d6b34eb0e9aa7a6c8d                          asterisk-core-sounds-en-gsm-1.5.tar.gz
-sha256  8d1118c6e0a0c614fafe297e3789f924ef5b04285cf6a8cffb8501dfcf5bbf07  asterisk-core-sounds-en-gsm-1.5.tar.gz
+sha1    721c512feaea102700d5bdce952fdc0bb29dc640                          asterisk-core-sounds-en-gsm-1.6.1.tar.gz
+sha256  d79c3d2044d41da8f363c447dfccc140be86b4fcc41b1ca5a60a80da52f24f2d  asterisk-core-sounds-en-gsm-1.6.1.tar.gz
 sha1    f40fd6ea03dfe8d72ada2540b2288bfdc006381d                          asterisk-moh-opsound-wav-2.03.tar.gz
 sha256  449fb810d16502c3052fedf02f7e77b36206ac5a145f3dacf4177843a2fcb538  asterisk-moh-opsound-wav-2.03.tar.gz
 
 # License files, locally computed
 sha256  82af40ed7f49c08685360811993d9396320842f021df828801d733e8fdc0312f  COPYING
 sha256  ac5571f00e558e3b7c9b3f13f421b874cc12cf4250c4f70094c71544cf486312  main/sha1.c
-sha256  0fcdb946955d20c2819a51f3fe613d8f22da2ea793bd50acb30ce156499acc88  codecs/speex/speex_resampler.h
-sha256  e6e7b7204d34a3dcdf17389a9c8cf64721ec0d15a797fd51c8c1ed8517cc3038  utils/db1-ast/include/db.h
+sha256  309462c10e84f46bda22032ebe6359f3e9e3e23afcf1fc2aaed5b59daf800d84  codecs/speex/speex_resampler.h
+sha256  1ca2c7a7a1ae7ccd75212a8c1e85dd9ec92bdbc9170aafd97ea60459387755fd  utils/db1-ast/include/db.h
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 6de498ed07..eb663a75bf 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 14.7.8
+ASTERISK_VERSION = 16.0.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
 
 ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
 ASTERISK_EXTRA_DOWNLOADS = \
-	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.5.tar.gz \
+	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz
 
 ASTERISK_LICENSE = GPL-2.0, BSD-3c (SHA1, resample), BSD-4c (db1-ast)
@@ -21,7 +21,7 @@ ASTERISK_LICENSE_FILES = \
 	codecs/speex/speex_resampler.h \
 	utils/db1-ast/include/db.h
 
-# For patches 0001, 0003 and 0004
+# For patches 0002 and 0003
 ASTERISK_AUTORECONF = YES
 ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject
 
@@ -29,8 +29,8 @@ ASTERISK_DEPENDENCIES = \
 	host-asterisk \
 	jansson \
 	libcurl \
+	libedit \
 	libxml2 \
-	ncurses \
 	sqlite \
 	util-linux
 
@@ -54,7 +54,6 @@ ASTERISK_CONF_OPTS = \
 	--without-curses \
 	--without-gtk2 \
 	--without-gmime \
-	--without-h323 \
 	--without-hoard \
 	--without-iconv \
 	--without-iksemel \
@@ -67,7 +66,6 @@ ASTERISK_CONF_OPTS = \
 	--without-kqueue \
 	--without-libedit \
 	--without-libxslt \
-	--without-ltdl \
 	--without-lua \
 	--without-misdn \
 	--without-mysqlclient \
@@ -79,8 +77,8 @@ ASTERISK_CONF_OPTS = \
 	--without-oss \
 	--without-postgres \
 	--without-pjproject \
+	--without-pjproject-bundled \
 	--without-popt \
-	--without-pwlib \
 	--without-resample \
 	--without-sdl \
 	--without-SDL_image \
@@ -99,7 +97,7 @@ ASTERISK_CONF_OPTS = \
 	--with-libcurl \
 	--with-ilbc \
 	--with-libxml2 \
-	--with-ncurses="$(STAGING_DIR)/usr" \
+	--with-libedit="$(STAGING_DIR)/usr" \
 	--with-sqlite3="$(STAGING_DIR)/usr" \
 	--with-sounds-cache=$(ASTERISK_DL_DIR)
 
@@ -110,8 +108,14 @@ ASTERISK_CONF_OPTS = \
 ASTERISK_CONF_OPTS += --without-avcodec
 
 ASTERISK_CONF_ENV = \
+	ac_cv_file_bridges_bridge_softmix_include_hrirs_h=true \
 	ac_cv_path_CONFIG_LIBXML2=$(STAGING_DIR)/usr/bin/xml2-config
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ASTERISK_CONF_ENV += LIBS="-latomic"
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ASTERISK_CONF_OPTS += --with-execinfo
 else
@@ -272,6 +276,11 @@ ASTERISK_DIRS = \
 
 ASTERISK_MAKE_OPTS = $(ASTERISK_DIRS)
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ASTERISK_MAKE_OPTS += ASTLDFLAGS="-latomic"
+endif
+
 # We want to install sample configuration files, too.
 ASTERISK_INSTALL_TARGET_OPTS = \
 	$(ASTERISK_DIRS) \
