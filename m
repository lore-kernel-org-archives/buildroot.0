From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 21:37:50 +0100
Subject: [Buildroot] [git commit] package/libseccomp: new package
Message-ID: <20121216204049.6A4259A2B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd303038febaf7008a1f04262dc5decb32d1cfab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix typo in help text]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/libseccomp/Config.in                       |   13 +++++++++++
 ...ibseccomp-use-system-headers-from-sysroot.patch |   17 +++++++++++++++
 package/libseccomp/libseccomp.mk                   |   22 ++++++++++++++++++++
 4 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d3f5e80..1b8c5b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -524,6 +524,7 @@ source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
 source "package/libtpl/Config.in"
+source "package/libseccomp/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
 source "package/lttng-libust/Config.in"
diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
new file mode 100644
index 0000000..1e524d2
--- /dev/null
+++ b/package/libseccomp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBSECCOMP
+	bool "libseccomp"
+	help
+	  High level interface to the Linux Kernel's seccomp filter
+	  
+	  The libseccomp library provides an easy to use, platform independent,
+	  interface to the Linux Kernel's syscall filtering mechanism: seccomp.
+	  The libseccomp API is designed to abstract away the underlying BPF
+	  based syscall filter language and present a more conventional
+	  function-call based filtering interface that should be familiar to,
+	  and easily adopted by application developers.
+	  
+	  http://sourceforge.net/projects/libseccomp/
diff --git a/package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch b/package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch
new file mode 100644
index 0000000..0997edd
--- /dev/null
+++ b/package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch
@@ -0,0 +1,17 @@
+configure: check headers in sysroot, not in host's system headers
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN libseccomp-1.0.0.orig/configure libseccomp-1.0.0/configure
+--- libseccomp-1.0.0.orig/configure	2012-07-27 22:35:05.000000000 +0200
++++ libseccomp-1.0.0/configure	2012-10-27 00:12:50.739196219 +0200
+@@ -205,7 +205,8 @@
+ #
+ 
+ # system seccomp includes
+-if [[ -r "/usr/include/linux/seccomp.h" ]]; then
++# ${SYSROOT} added by buildroot for cross-compilation
++if [[ -r "${SYSROOT}/usr/include/linux/seccomp.h" ]]; then
+ 	opt_sysinc_seccomp="yes"
+ else
+ 	opt_sysinc_seccomp="no"
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
new file mode 100644
index 0000000..73fe632
--- /dev/null
+++ b/package/libseccomp/libseccomp.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# libseccomp
+#
+#############################################################
+
+LIBSECCOMP_VERSION         = 1.0.0
+LIBSECCOMP_SOURCE          = libseccomp-$(LIBSECCOMP_VERSION).tar.gz
+LIBSECCOMP_SITE            = http://downloads.sourceforge.net/project/libseccomp
+LIBSECCOMP_LICENSE         = LGPLv2.1
+LIBSECCOMP_LICENSE_FILES   = LICENSE
+LIBSECCOMP_INSTALL_STAGING = YES
+
+# Needed for configure to find our system headers:
+LIBSECCOMP_CONF_ENV            = SYSROOT=$(STAGING_DIR)
+LIBSECCOMP_MAKE_ENV            = $(TARGET_CONFIGURE_OPTS)
+LIBSECCOMP_MAKE_OPT            = SUBDIRS_BUILD=src
+LIBSECCOMP_INSTALL_STAGING_OPT = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
+LIBSECCOMP_INSTALL_TARGET_OPT  = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
+
+# Not a real autotools package, but works quite OK nonetheless
+$(eval $(autotools-package))
