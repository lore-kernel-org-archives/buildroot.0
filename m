From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 16:22:28 +0200
Subject: [Buildroot] [PATCH 1/2] package/libseccomp: bump version to 2.2.0
Message-ID: <1427638949-3191-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change upstream URL, project moved to github
- removed patches not needed anymore since project switched to autoconf
- add newly supported platforms to Config.in

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libseccomp/0001-remove-static.patch        |   29 ++++++++++++++
 .../0001-use-system-headers-from-sysroot.patch     |   17 --------
 .../0002-Remove-the-dependency-on-proc.patch       |   42 --------------------
 package/libseccomp/Config.in                       |    5 ++-
 package/libseccomp/libseccomp.hash                 |    4 +-
 package/libseccomp/libseccomp.mk                   |   17 ++++----
 6 files changed, 42 insertions(+), 72 deletions(-)
 create mode 100644 package/libseccomp/0001-remove-static.patch
 delete mode 100644 package/libseccomp/0001-use-system-headers-from-sysroot.patch
 delete mode 100644 package/libseccomp/0002-Remove-the-dependency-on-proc.patch

diff --git a/package/libseccomp/0001-remove-static.patch b/package/libseccomp/0001-remove-static.patch
new file mode 100644
index 0000000..6fd81f9
--- /dev/null
+++ b/package/libseccomp/0001-remove-static.patch
@@ -0,0 +1,29 @@
+Do not force static link, it breaks build with
+# BR2_STATIC_LIBS is not set
+BR2_SHARED_LIBS=y
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libseccomp-2.2.0.org/tests/Makefile.am libseccomp-2.2.0/tests/Makefile.am
+--- libseccomp-2.2.0.org/tests/Makefile.am	2015-02-11 21:57:11.000000000 +0100
++++ libseccomp-2.2.0/tests/Makefile.am	2015-03-29 16:03:49.668946652 +0200
+@@ -16,7 +16,6 @@
+ # along with this library; if not, see <http://www.gnu.org/licenses>.
+ #
+ 
+-AM_LDFLAGS = -static
+ LDADD = util.la ../src/libseccomp.la
+ 
+ check_LTLIBRARIES = util.la
+diff -uNr libseccomp-2.2.0.org/tools/Makefile.am libseccomp-2.2.0/tools/Makefile.am
+--- libseccomp-2.2.0.org/tools/Makefile.am	2015-02-11 21:57:11.000000000 +0100
++++ libseccomp-2.2.0/tools/Makefile.am	2015-03-29 16:03:46.164992302 +0200
+@@ -33,8 +33,6 @@
+ scmp_bpf_sim_SOURCES = scmp_bpf_sim.c bpf.h util.h
+ 
+ scmp_sys_resolver_LDADD = ../src/libseccomp.la
+-scmp_sys_resolver_LDFLAGS = -static
+ scmp_arch_detect_LDADD = ../src/libseccomp.la
+-scmp_arch_detect_LDFLAGS = -static
+ scmp_bpf_disasm_LDADD = util.la
+ scmp_bpf_sim_LDADD = util.la
diff --git a/package/libseccomp/0001-use-system-headers-from-sysroot.patch b/package/libseccomp/0001-use-system-headers-from-sysroot.patch
deleted file mode 100644
index 0997edd..0000000
--- a/package/libseccomp/0001-use-system-headers-from-sysroot.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-configure: check headers in sysroot, not in host's system headers
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN libseccomp-1.0.0.orig/configure libseccomp-1.0.0/configure
---- libseccomp-1.0.0.orig/configure	2012-07-27 22:35:05.000000000 +0200
-+++ libseccomp-1.0.0/configure	2012-10-27 00:12:50.739196219 +0200
-@@ -205,7 +205,8 @@
- #
- 
- # system seccomp includes
--if [[ -r "/usr/include/linux/seccomp.h" ]]; then
-+# ${SYSROOT} added by buildroot for cross-compilation
-+if [[ -r "${SYSROOT}/usr/include/linux/seccomp.h" ]]; then
- 	opt_sysinc_seccomp="yes"
- else
- 	opt_sysinc_seccomp="no"
diff --git a/package/libseccomp/0002-Remove-the-dependency-on-proc.patch b/package/libseccomp/0002-Remove-the-dependency-on-proc.patch
deleted file mode 100644
index 081bca7..0000000
--- a/package/libseccomp/0002-Remove-the-dependency-on-proc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 58c34ae1343e2a452e08cd160936a231bcdb67a1 Mon Sep 17 00:00:00 2001
-From: Maxime Ripard <maxime.ripard@free-electrons.com>
-Date: Tue, 18 Dec 2012 09:57:47 +0100
-Subject: [PATCH] Remove the dependency on /proc
-
-The Makefile relied on a broken logic for the INSTALL_PC_MACRO.
-It was used like this: $(INSTALL_PC_MACRO) file.
-
-The INSTALL_PC_MACRO was then expanded with a trailing sharp, to pass
-the name of the file to install as a comment at the end of the command.
-
-And then, to retrieve the file to copy, it used the $NF variable of awk
-on the /proc/self/cmdline file to happily reinvent the argument
-mechanism.
-
-This patch removes of this crazy stuff by using the -t option of
-install, that keeps the same calling convention.
-
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- macros.mk |    5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/macros.mk b/macros.mk
-index 6162900..eb61ead 100644
---- a/macros.mk
-+++ b/macros.mk
-@@ -150,9 +150,8 @@ endif
- INSTALL_PC_MACRO += \
- 		$(INSTALL) -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) \
- 			-d "$(INSTALL_LIB_DIR)/pkgconfig"; \
--		$(INSTALL) -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) -m 0644 \
--			"$$(cat /proc/$$$$/cmdline | awk '{print $$(NF)}')" \
--			"$(INSTALL_LIB_DIR)/pkgconfig"; \#
-+		$(INSTALL) -o $(INSTALL_OWNER) -g $(INSTALL_GROUP) -m 0644 -t \
-+			"$(INSTALL_LIB_DIR)/pkgconfig"
- 
- ifeq ($(V),0)
- 	INSTALL_INC_MACRO = @echo " INSTALL $^ ($(INSTALL_INC_DIR))";
--- 
-1.7.9.5
-
diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index e851011..4e893c8 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSECCOMP
 	bool "libseccomp"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || \
+		BR2_mips64el || BR2_i386 || BR2_x86_64
 	help
 	  High level interface to the Linux Kernel's seccomp filter
 
@@ -11,4 +12,4 @@ config BR2_PACKAGE_LIBSECCOMP
 	  function-call based filtering interface that should be familiar to,
 	  and easily adopted by application developers.
 
-	  http://sourceforge.net/projects/libseccomp/
+	  https://github.com/seccomp/libseccomp
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index f87633e..6bca5c2 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  8812c11e407c383f5ad6afb84a88e5a0224477bcfe8ff03f0c548e5abaac841c  libseccomp-2.1.1.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.2.0
+sha1	5aa8a230f8529d6ee777098550245e43d2247395fdfd5a2176e28cf7236f1b10	libseccomp-2.2.0.tar.gz
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index fbc4f90..a188298 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,18 +4,17 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.1.1
-LIBSECCOMP_SITE = http://downloads.sourceforge.net/project/libseccomp/libseccomp-$(LIBSECCOMP_VERSION)
+LIBSECCOMP_VERSION = v2.2.0
+LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPLv2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
+LIBSECCOMP_AUTORECONF = YES
 
-# Needed for configure to find our system headers:
-LIBSECCOMP_CONF_ENV = SYSROOT=$(STAGING_DIR)
-LIBSECCOMP_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
-LIBSECCOMP_MAKE_OPTS = SUBDIRS_BUILD=src
-LIBSECCOMP_INSTALL_STAGING_OPTS = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
-LIBSECCOMP_INSTALL_TARGET_OPTS = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
+# Needed for autoreconf to work properly, see ./autogen.sh
+define LIBSECCOMP_FIXUP_M4_DIR
+	mkdir $(@D)/m4
+endef
+LIBSECCOMP_POST_EXTRACT_HOOKS += LIBSECCOMP_FIXUP_M4_DIR
 
-# Not a real autotools package, but works quite OK nonetheless
 $(eval $(autotools-package))
-- 
1.7.10.4
