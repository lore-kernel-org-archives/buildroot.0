From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 30 Jul 2019 00:38:10 +0200
Subject: [Buildroot] [PATCH] ima-evm-utils: Add as new package
Message-ID: <20190729223810.24617-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ add myself as a maintainer.

Upstream patch from upcoming release is needed to fix build.
Adding build and install hooks to run make in src subdirectory
(root directory asciidoc and xsltproc for manpage).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

not sure if asciidoc and xsltproc should be detected and man page built
if they are available on host.

NOTE: Git contains new version, but it might take some time before upstream
uploads it to sourceforge.

Kind regards,
Petr

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...mctl-use-correct-include-for-xattr.h.patch | 84 +++++++++++++++++++
 package/ima-evm-utils/Config.in               | 13 +++
 package/ima-evm-utils/ima-evm-utils.hash      |  3 +
 package/ima-evm-utils/ima-evm-utils.mk        | 32 +++++++
 6 files changed, 134 insertions(+)
 create mode 100644 package/ima-evm-utils/0001-evmctl-use-correct-include-for-xattr.h.patch
 create mode 100644 package/ima-evm-utils/Config.in
 create mode 100644 package/ima-evm-utils/ima-evm-utils.hash
 create mode 100644 package/ima-evm-utils/ima-evm-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4ab4e36593..12dc02cb8c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1825,6 +1825,7 @@ N:	Petr Kulhavy <brain@jikos.cz>
 F:	package/linuxptp/
 
 N:	Petr Vorel <petr.vorel@gmail.com>
+F:	package/ima-evm-utils/
 F:	package/iproute2/
 F:	package/iputils/
 F:	package/linux-backports/
diff --git a/package/Config.in b/package/Config.in
index 9b2cc7522d..76f1ee1798 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2122,6 +2122,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/ima-evm-utils/Config.in"
 	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
diff --git a/package/ima-evm-utils/0001-evmctl-use-correct-include-for-xattr.h.patch b/package/ima-evm-utils/0001-evmctl-use-correct-include-for-xattr.h.patch
new file mode 100644
index 0000000000..14ce84fb77
--- /dev/null
+++ b/package/ima-evm-utils/0001-evmctl-use-correct-include-for-xattr.h.patch
@@ -0,0 +1,84 @@
+From 6aea54d2ad2287b3e8894c262ee895f3d4a60516 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Mon, 17 Oct 2016 12:45:32 +0100
+Subject: [PATCH] evmctl: use correct include for xattr.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The xattr API/ABI is provided by both the c-library, as well as by the
+libattr package. The c-library's header file is sys/xattr.h, whereas
+libattr's header file can be found in attr/xattr.h.
+
+Given none of the code here *links* against the libattr.so shared library, it
+is wrong to *compile* against libattr's API (header file).
+
+Doing so avoids confusion as to which xattr.h is used as the least problem,
+and potential ABI differences as the worst problem due the mismatching header
+file used.
+
+So make sure we compile and link against the same thing, the c-library in
+both cases.
+
+Signed-off-by: Andr? Draszik <git@andred.net>
+Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com>
+---
+ configure.ac                    | 2 +-
+ packaging/ima-evm-utils.spec    | 1 -
+ packaging/ima-evm-utils.spec.in | 1 -
+ src/evmctl.c                    | 2 +-
+ 4 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0497eb7..a5b4288 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -30,7 +30,7 @@ AC_SUBST(OPENSSL_LIBS)
+ AC_CHECK_HEADER(unistd.h)
+ AC_CHECK_HEADERS(openssl/conf.h)
+ 
+-AC_CHECK_HEADERS(attr/xattr.h, , [AC_MSG_ERROR([attr/xattr.h header not found. You need the libattr development package.])])
++AC_CHECK_HEADERS(sys/xattr.h, , [AC_MSG_ERROR([sys/xattr.h header not found. You need the c-library development package.])])
+ AC_CHECK_HEADERS(keyutils.h, , [AC_MSG_ERROR([keyutils.h header not found. You need the libkeyutils development package.])])
+ 
+ #debug support - yes for a while
+diff --git a/packaging/ima-evm-utils.spec b/packaging/ima-evm-utils.spec
+index a11a27a..63388d2 100644
+--- a/packaging/ima-evm-utils.spec
++++ b/packaging/ima-evm-utils.spec
+@@ -11,7 +11,6 @@ BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root
+ BuildRequires:    autoconf
+ BuildRequires:    automake
+ BuildRequires:    openssl-devel
+-BuildRequires:    libattr-devel
+ BuildRequires:    keyutils-libs-devel
+ 
+ %description
+diff --git a/packaging/ima-evm-utils.spec.in b/packaging/ima-evm-utils.spec.in
+index 7ca6c6f..65c32f9 100644
+--- a/packaging/ima-evm-utils.spec.in
++++ b/packaging/ima-evm-utils.spec.in
+@@ -11,7 +11,6 @@ BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root
+ BuildRequires:    autoconf
+ BuildRequires:    automake
+ BuildRequires:    openssl-devel
+-BuildRequires:    libattr-devel
+ BuildRequires:    keyutils-libs-devel
+ 
+ %description
+diff --git a/src/evmctl.c b/src/evmctl.c
+index 2ffee78..3fbcd33 100644
+--- a/src/evmctl.c
++++ b/src/evmctl.c
+@@ -49,7 +49,7 @@
+ #include <stdint.h>
+ #include <string.h>
+ #include <dirent.h>
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
+ #include <linux/xattr.h>
+ #include <getopt.h>
+ #include <keyutils.h>
+-- 
+2.22.0
+
diff --git a/package/ima-evm-utils/Config.in b/package/ima-evm-utils/Config.in
new file mode 100644
index 0000000000..9cf667e45d
--- /dev/null
+++ b/package/ima-evm-utils/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_IMA_EVM_UTILS
+	bool "ima-evm-utils"
+	#depends on BR2_USE_WCHAR
+	#depends on !BR2_STATIC_LIBS # uses dlfcn.h
+	#depends on BR2_TOOLCHAIN_HAS_THREADS
+	#depends on BR2_USE_MMU # libglib2
+	#depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Linux Integrity Measurement Architecture (IMA)
+	  Extended Verification Module (EVM) tools.
+
+	  https://sourceforge.net/p/linux-ima/wiki/Home/
diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
new file mode 100644
index 0000000000..ea5a896b65
--- /dev/null
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 766b9d5f18e4c929ffd59f262a1a178aeceba9a23dd3186e3f5b57c6965f3c44  ima-evm-utils-1.1.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
new file mode 100644
index 0000000000..cebfde30d9
--- /dev/null
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# ima-evm-utils
+#
+################################################################################
+
+IMA_EVM_UTILS_VERSION = 1.1
+IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
+IMA_EVM_UTILS_LICENSE = GPL-2.0
+IMA_EVM_UTILS_LICENSE_FILES = COPYING
+IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl
+
+# configure is missing but gpm seems not compatible with our autoreconf
+# mechanism so we have to do it manually instead of using IMA_EVM_UTILS_AUTORECONF = YES
+define IMA_EVM_UTILS_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+IMA_EVM_UTILS_PRE_CONFIGURE_HOOKS += IMA_EVM_UTILS_RUN_AUTOGEN
+
+# build just sources in src subdirectory as root directory requires asciidoc
+# and xsltproc for manpage
+define IMA_EVM_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) -C $(@D)/src all
+endef
+define IMA_EVM_UTILS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D)/src install
+endef
+define IMA_EVM_UTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D)/src install
+endef
+
+$(eval $(autotools-package))
-- 
2.22.0
