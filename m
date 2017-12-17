From: Yair Ben Avraham <yairba@tkos.co.il>
Date: Sun, 17 Dec 2017 20:24:48 +0200
Subject: [Buildroot] [PATCH 1/1] tpm-tools: bump to version 1.3.9.1
Message-ID: <1513535088-8955-1-git-send-email-yairba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>
---
 ..._nvread-include-sys-stat.h-for-open-modes.patch |  33 -------
 ...-make-sure-libintl-is-in-LDFLAGS-when-nee.patch | 104 ---------------------
 .../0002-configure.in-remove-Werror.patch          |  27 ------
 package/tpm-tools/tpm-tools.hash                   |   6 +-
 package/tpm-tools/tpm-tools.mk                     |   5 +-
 5 files changed, 4 insertions(+), 171 deletions(-)
 delete mode 100644 package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch
 delete mode 100644 package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch
 delete mode 100644 package/tpm-tools/0002-configure.in-remove-Werror.patch

diff --git a/package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch b/package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch
deleted file mode 100644
index 35fd763..0000000
--- a/package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5fedfd32a226e3ac8a6022227ec2d8fc6df26901 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 24 Dec 2015 08:57:09 +0100
-Subject: [PATCH] tpm_nvread: include <sys/stat.h> for open() modes
-
-As the manual page of open(2) indicates, the <sys/stat.h> header
-should be included. Indeed, it is this header that provides the mode_t
-macros such as S_IRUSR and S_IWUSR.
-
-While the build happens to work with glibc without this included
-header, it fails with other C libraries such as uClibc, due to the
-missing inclusion.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/tpm_mgmt/tpm_nvread.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/tpm_mgmt/tpm_nvread.c b/src/tpm_mgmt/tpm_nvread.c
-index 35fe17c..92f047c 100644
---- a/src/tpm_mgmt/tpm_nvread.c
-+++ b/src/tpm_mgmt/tpm_nvread.c
-@@ -23,6 +23,7 @@
- #include <ctype.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <sys/stat.h>
- 
- #include "tpm_nvcommon.h"
- #include "tpm_tspi.h"
--- 
-2.6.4
-
diff --git a/package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch b/package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch
deleted file mode 100644
index fac7b2c..0000000
--- a/package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-Fetched from: http://sourceforge.net/p/trousers/mailman/message/34728585/
-Upstream status: Submitted
-
-From 924cbdfc67ca405aa4df2f9d3787365618b58630 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Wed, 30 Dec 2015 00:06:33 +0100
-Subject: [PATCH] Makefile.am: make sure libintl is in LDFLAGS when needed
-
-The build-system internally builds a couple of static libraries used to
-build the final programs.
-
-When linking these libraries and the final programs, we need to
-explicitly tell libtool to link with libintl in order to resolve all the
-missing symbols.
-
-This is done in the appropriate LDADD/LIBADD variables (or the per-target
-*_LDADD/*_LIBADD ones when they do not default to LDADD or LIBADD), for
-any sources using gettext/libintl functionalities.
-
-This change fixes build failures [2,3] in cross-compilation, triggered by
-Buildroot buildfarms [1].
-
-[1] http://autobuild.buildroot.org/
-[2] http://autobuild.buildroot.org/?reason=tpm-tools-1.3.8
-[3] http://autobuild.buildroot.org/results/c82/c82a6c1f41c561b15f10e7b7ffcaed15fa0ec895/build-end.log
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- lib/Makefile.am           | 6 +++---
- src/cmds/Makefile.am      | 2 +-
- src/data_mgmt/Makefile.am | 2 +-
- src/tpm_mgmt/Makefile.am  | 2 +-
- 4 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index cef6a2f..c1d7009 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -44,7 +44,7 @@ libtpm_utils_la_SOURCES	=	tpm_utils.c \
- #
- # TSPI interface library
- libtpm_tspi_la_SOURCES	=	tpm_tspi.c
--libtpm_tspi_la_LIBADD	=	libtpm_utils.la -ldl
-+libtpm_tspi_la_LIBADD	=	libtpm_utils.la -ldl @INTLLIBS@
- 
- #
- # PKCS#11 interface library
-@@ -52,7 +52,7 @@ if P11_SUPPORT
- noinst_LTLIBRARIES	+=	libtpm_pkcs11.la
- 
- libtpm_pkcs11_la_SOURCES=	tpm_pkcs11.c
--libtpm_pkcs11_la_LIBADD	=	libtpm_utils.la
-+libtpm_pkcs11_la_LIBADD	=	libtpm_utils.la @INTLLIBS@
- endif
- 
- #
-@@ -80,4 +80,4 @@ endif
- # Unseal library - for addition to existing apps, counter part of seal cmd
- libtpm_unseal_la_SOURCES =	tpm_unseal.c
- libtpm_unseal_la_LDFLAGS =	-shared -version-info 1:0:0
--libtpm_unseal_la_LIBADD  =	-ltspi  libtpm_tspi.la
-+libtpm_unseal_la_LIBADD  =	-ltspi  libtpm_tspi.la @INTLLIBS@
-diff --git a/src/cmds/Makefile.am b/src/cmds/Makefile.am
-index de73ecf..27fc9ef 100644
---- a/src/cmds/Makefile.am
-+++ b/src/cmds/Makefile.am
-@@ -30,7 +30,7 @@ else
- AM_CPPFLAGS	=	-I$(top_srcdir)/include -D_LINUX
- endif
- 
--LDADD		=	$(top_builddir)/lib/libtpm_tspi.la -ltspi $(top_builddir)/lib/libtpm_unseal.la -ltpm_unseal -lcrypto
-+LDADD		=	$(top_builddir)/lib/libtpm_tspi.la -ltspi $(top_builddir)/lib/libtpm_unseal.la -ltpm_unseal -lcrypto @INTLLIBS@
- 
- tpm_sealdata_SOURCES = tpm_sealdata.c
- tpm_unsealdata_SOURCES = tpm_unsealdata.c
-diff --git a/src/data_mgmt/Makefile.am b/src/data_mgmt/Makefile.am
-index f8bf41c..de505e4 100644
---- a/src/data_mgmt/Makefile.am
-+++ b/src/data_mgmt/Makefile.am
-@@ -38,7 +38,7 @@ noinst_HEADERS =	data_common.h \
- # Common build flags
- AM_CPPFLAGS	=	-I$(top_srcdir)/include -D_LINUX
- 
--LDADD		=	$(top_builddir)/lib/libtpm_pkcs11.la -ltspi -ldl
-+LDADD		=	$(top_builddir)/lib/libtpm_pkcs11.la -ltspi -ldl @INTLLIBS@
- 
- 
- #
-diff --git a/src/tpm_mgmt/Makefile.am b/src/tpm_mgmt/Makefile.am
-index 195fba9..7ca47c9 100644
---- a/src/tpm_mgmt/Makefile.am
-+++ b/src/tpm_mgmt/Makefile.am
-@@ -55,7 +55,7 @@ else
- AM_CPPFLAGS	=	-I$(top_srcdir)/include -D_LINUX
- endif
- 
--LDADD		=	$(top_builddir)/lib/libtpm_tspi.la -ltspi
-+LDADD		=	$(top_builddir)/lib/libtpm_tspi.la -ltspi @INTLLIBS@
- 
- tpm_startup_SOURCES =		tpm_startup.c
- tpm_reset_SOURCES =		tpm_reset.c
--- 
-2.6.4
-
diff --git a/package/tpm-tools/0002-configure.in-remove-Werror.patch b/package/tpm-tools/0002-configure.in-remove-Werror.patch
deleted file mode 100644
index c101a95..0000000
--- a/package/tpm-tools/0002-configure.in-remove-Werror.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b060873f444d79f3f5aa388427cb1ede6665834a Mon Sep 17 00:00:00 2001
-From: Kent Yoder <key@linux.vnet.ibm.com>
-Date: Mon, 5 Nov 2012 14:58:31 -0600
-Subject: [PATCH] configure.in: remove -Werror
-
-Signed-off-by: Kent Yoder <key@linux.vnet.ibm.com>
-Signed-off-by: Noe Rubinstein <nrubinstein@aldebaran.com>
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index da170d0..0f175be 100644
---- a/configure.in
-+++ b/configure.in
-@@ -138,7 +138,7 @@ AC_TYPE_SIZE_T
- AC_TYPE_SIGNAL
- AC_TYPE_UID_T
- 
--CFLAGS="$CFLAGS -Wall -Werror -Wreturn-type -Wsign-compare"
-+CFLAGS="$CFLAGS -Wall -Wreturn-type -Wsign-compare"
- 
- AC_CONFIG_FILES(./Makefile		\
- 		po/Makefile.in		\
--- 
-2.1.4
-
diff --git a/package/tpm-tools/tpm-tools.hash b/package/tpm-tools/tpm-tools.hash
index 8c1ff89..c658071 100644
--- a/package/tpm-tools/tpm-tools.hash
+++ b/package/tpm-tools/tpm-tools.hash
@@ -1,3 +1,3 @@
-# http://sourceforge.net/projects/trousers/files/tpm-tools/1.3.8/
-sha1 f2c799ac8dc78f3537e1dbe4ae7c6e93f37e868c tpm-tools-1.3.8.tar.gz
-md5  85a978c4e03fefd4b73cbeadde7c4d0b         tpm-tools-1.3.8.tar.gz
+# http://sourceforge.net/projects/trousers/files/tpm-tools/1.3.9.1/
+sha1 c35cb031c6b5220dd1c8a03995654fdd12aa3031 tpm-tools-1.3.9.1.tar.gz
+md5  1532293aa632a0eaa7e60df87c779855         tpm-tools-1.3.9.1.tar.gz
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index 4dbf50a..23dd5bc 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-TPM_TOOLS_VERSION = 1.3.8
+TPM_TOOLS_VERSION = 1.3.9.1
 TPM_TOOLS_SITE = http://downloads.sourceforge.net/project/trousers/tpm-tools/$(TPM_TOOLS_VERSION)
-TPM_TOOLS_STRIP_COMPONENTS = 2
 TPM_TOOLS_LICENSE = Common Public License Version 1.0
 TPM_TOOLS_LICENSE_FILES = LICENSE
 TPM_TOOLS_DEPENDENCIES = trousers openssl $(TARGET_NLS_DEPENDENCIES)
@@ -14,8 +13,6 @@ TPM_TOOLS_DEPENDENCIES = trousers openssl $(TARGET_NLS_DEPENDENCIES)
 TPM_TOOLS_AUTORECONF = YES
 TPM_TOOLS_GETTEXTIZE = YES
 
-TPM_TOOLS_CONF_OPTS = --disable-pkcs11-support
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TPM_TOOLS_CONF_ENV += LIBS='-liconv'
 endif
-- 
2.7.4
