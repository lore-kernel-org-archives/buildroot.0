From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 18:20:00 +0200
Subject: [Buildroot] [git commit] libunwind: new package
Message-ID: <20130728162017.2EE8F9AD30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56a5e5a1486c46f44418acce5aa53e8a4822bc87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: added patch to disable build of tests that fail on uClibc,
added dependencies for architectures that are supported.]

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                               |    1 +
 package/libunwind/Config.in                     |    8 +++++
 package/libunwind/libunwind-disable-tests.patch |   32 +++++++++++++++++++++++
 package/libunwind/libunwind.mk                  |   13 +++++++++
 4 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ac7b16d..ed373de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -629,6 +629,7 @@ source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
 source "package/libseccomp/Config.in"
+source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
 source "package/log4cxx/Config.in"
diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
new file mode 100644
index 0000000..4f130f0
--- /dev/null
+++ b/package/libunwind/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBUNWIND
+	bool "libunwind"
+	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
+		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
+	help
+	  C API to determine the call-chain of a program.
+
+	  http://www.nongnu.org/libunwind/index.html
diff --git a/package/libunwind/libunwind-disable-tests.patch b/package/libunwind/libunwind-disable-tests.patch
new file mode 100644
index 0000000..05475a5
--- /dev/null
+++ b/package/libunwind/libunwind-disable-tests.patch
@@ -0,0 +1,32 @@
+Disable building of tests
+
+libunwind tests do not build with uClibc, so we disable them.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -36,7 +36,7 @@
+ 
+ nodist_include_HEADERS = include/libunwind-common.h
+ 
+-SUBDIRS = src tests doc
++SUBDIRS = src doc
+ 
+ noinst_HEADERS = include/dwarf.h include/dwarf_i.h include/dwarf-eh.h	\
+ 	include/compiler.h include/libunwind_i.h include/mempool.h	\
+Index: b/Makefile.in
+===================================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -313,7 +313,7 @@
+ 	$(am__append_7) $(am__append_8) $(am__append_9) \
+ 	$(am__append_10)
+ nodist_include_HEADERS = include/libunwind-common.h
+-SUBDIRS = src tests doc
++SUBDIRS = src doc
+ noinst_HEADERS = include/dwarf.h include/dwarf_i.h include/dwarf-eh.h	\
+ 	include/compiler.h include/libunwind_i.h include/mempool.h	\
+ 	include/remote.h						\
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
new file mode 100644
index 0000000..f573722
--- /dev/null
+++ b/package/libunwind/libunwind.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libunwind
+#
+################################################################################
+
+LIBUNWIND_VERSION = 1.1
+LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
+LIBUNWIND_INSTALL_STAGING = YES
+LIBUNWIND_LICENSE_FILES = COPYING
+LIBUNWIND_LICENSE = MIT
+
+$(eval $(autotools-package))
