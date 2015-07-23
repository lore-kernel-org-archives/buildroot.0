From: Christian Stewart <christian@paral.in>
Date: Wed, 22 Jul 2015 23:37:06 -0700
Subject: [Buildroot] [PATCH v3 1/1] mosh: new package
Message-ID: <1437633426-23375-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding mosh, the mobile shell.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                                  |  1 +
 package/mosh/0001-use-version-from-buildroot.patch | 23 ++++++++++++++++++++++
 package/mosh/Config.in                             | 22 +++++++++++++++++++++
 package/mosh/mosh.hash                             |  1 +
 package/mosh/mosh.mk                               | 17 ++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/mosh/0001-use-version-from-buildroot.patch
 create mode 100644 package/mosh/Config.in
 create mode 100644 package/mosh/mosh.hash
 create mode 100644 package/mosh/mosh.mk

diff --git a/package/Config.in b/package/Config.in
index 9942e3a..91fb08a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1248,6 +1248,7 @@ endif
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
 	source "package/monkey/Config.in"
+	source "package/mosh/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mtr/Config.in"
diff --git a/package/mosh/0001-use-version-from-buildroot.patch b/package/mosh/0001-use-version-from-buildroot.patch
new file mode 100644
index 0000000..2d79eb2
--- /dev/null
+++ b/package/mosh/0001-use-version-from-buildroot.patch
@@ -0,0 +1,23 @@
+Alter the Makefile to use Buildroot's VERSION string.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+
+diff -Nau mosh.orig/Makefile.am mosh/Makefile.am
+--- mosh.orig/Makefile.am.orig	2015-07-22 16:55:42.523086477 -0700
++++ mosh/Makefile.am	2015-07-22 16:56:13.615085453 -0700
+@@ -8,14 +8,7 @@
+ .PHONY:	VERSION
+ 
+ VERSION:
+-	@set -e; if [ ! -f VERSION ]; then echo @PACKAGE_STRING@ > VERSION; fi
+-	@set -e; if git status > /dev/null 2>&1; then \
+-		git describe --dirty > VERSION.new;  \
+-		if ! diff -q VERSION VERSION.new > /dev/null 2>&1; then \
+-			mv -f VERSION.new VERSION; \
+-		fi; \
+-	fi
+-	@rm -f VERSION.new
++	@echo $(VERSION) > VERSION
+ 
+ version.h:	VERSION
+ 	@printf '#define BUILD_VERSION "%s"\n' "$$(cat VERSION)" > version.h.new
diff --git a/package/mosh/Config.in b/package/mosh/Config.in
new file mode 100644
index 0000000..7e575ac
--- /dev/null
+++ b/package/mosh/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_MOSH
+	bool "mosh"
+	depends on BR2_PACKAGE_OPENSSH
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_PACKAGE_PROTOBUF
+	help
+	  Remote terminal application that supports intermittent connectivity,
+	  allows roaming, and provides speculative local echo and line editing
+	  of user keystrokes.
+
+	  https://github.com/keithw/mosh
+
+comment "mosh needs openssh to be built"
+	depends on !BR2_PACKAGE_OPENSSH
+
+comment "mosh needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
new file mode 100644
index 0000000..4121d36
--- /dev/null
+++ b/package/mosh/mosh.hash
@@ -0,0 +1 @@
+sha256 56571fb1cb9c9714013ab0fc813863d58e0f5c7d320430aa05df952295e046a7  mosh-1.2.4.95rc2.tar.gz
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
new file mode 100644
index 0000000..4d6f0b3
--- /dev/null
+++ b/package/mosh/mosh.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# mosh
+#
+################################################################################
+
+MOSH_VERSION = 1.2.4.95rc2
+MOSH_SITE = $(call github,keithw,mosh,mosh-$(MOSH_VERSION))
+MOSH_DEPENDENCIES = protobuf
+MOSH_LICENSE = GPLv3
+MOSH_LICENSE_FILES = COPYING COPYING.iOS
+MOSH_MAKE_ENV = VERSION="mosh-$(MOSH_VERSION)"
+
+# Necessary as we are pulling from Git.
+MOSH_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.1.4
