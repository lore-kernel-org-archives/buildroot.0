From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 22:34:05 +0100
Subject: [Buildroot] [PATCH 1/4] libpthsem: new package
In-Reply-To: <1364160848-15168-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364160848-15168-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364160848-15168-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Hermant <gregory.hermant@calao-systems.com>

[Thomas: various fixes/improvements]
Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/libpthsem/Config.in                        |    9 +++++++
 ...bpthsem-2.0.8-fix-build-on-linux-3.x-host.patch |   28 ++++++++++++++++++++
 package/libpthsem/libpthsem.mk                     |   18 +++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/libpthsem/Config.in
 create mode 100644 package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch
 create mode 100644 package/libpthsem/libpthsem.mk

diff --git a/package/Config.in b/package/Config.in
index bdfc0f2..1ba356c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -562,6 +562,7 @@ source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libpfm4/Config.in"
+source "package/libpthsem/Config.in"
 source "package/libsigc/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
new file mode 100644
index 0000000..f818ee0
--- /dev/null
+++ b/package/libpthsem/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBPTHSEM
+	bool "libpthsem"
+	select BR2_PACKAGE_ARGP_STANDALONE
+	help
+	  GNU pth is a user mode multi threading library. pthsem is an extend
+	  version, with support for semaphores added.
+
+	  http://www.auto.tuwien.ac.at/~mkoegler/pth/
+
diff --git a/package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch b/package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch
new file mode 100644
index 0000000..21fff4e
--- /dev/null
+++ b/package/libpthsem/libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch
@@ -0,0 +1,28 @@
+From 2d0450bfa3fb7003098da1a7fe24c3ae140912dc Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Mon, 22 Oct 2012 15:11:53 +0200
+Subject: [PATCH] pthsem build on Linux 3.x host
+
+
+Signed-off-by: Michael Markstaller <mm@elabnet.de>
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ acinclude.m4 |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 03b42de..fea9bc8 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -892,6 +892,8 @@ case $PLATFORM in
+         case "x`uname -r`" in
+ changequote(, )dnl
+             x2.[23456789]* ) ;;
++changequote(, )dnl
++            x3.* ) ;;
+ changequote([, ])
+             * ) braindead=yes ;;
+         esac
+-- 
+1.7.9.5
+
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
new file mode 100644
index 0000000..f035fa8
--- /dev/null
+++ b/package/libpthsem/libpthsem.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# libpthsem
+#
+#############################################################
+
+LIBPTHSEM_VERSION = 2.0.8
+LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
+LIBPTHSEM_SITE = http://www.auto.tuwien.ac.at/~mkoegler/pth/
+LIBPTHSEM_LICENSE = LGPLv2.1+
+LIBPTHSEM_LICENSE_FILES = COPYING
+LIBPTHSEM_AUTORECONF = YES
+LIBPTHSEM_INSTALL_STAGING = YES
+LIBPTHSEM_DEPENDENCIES = argp-standalone
+LIBPTHSEM_CONFIG_SCRIPTS = pthsem-config
+
+$(eval $(autotools-package))
+
-- 
1.7.9.5
