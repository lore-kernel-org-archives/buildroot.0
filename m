From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 15:47:18 +0200
Subject: [Buildroot] [git commit] lirc-tools: add patch to fix parallel
	build issue
Message-ID: <20160526135039.9AF1481F75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6f976b6d4fdd307b81372e9ffbf94ea93852c90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lirc-tools package fails to build once in a while in the
autobuilders. Some quick analysis of the problematic Makefile.am has
revealed one issue. However, since the issue is difficult to
reproduce, we could only check that the new solution continue to work,
and we're not 100% sure it fixes the entire problem: only the
autobuilders can say, over time.

Supposedly fixes:

  http://autobuild.buildroot.org/results/eb47d57de8182d25b1dacbf0ac3726ed20063d04/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...per-linking-method-to-avoid-parallel-buil.patch | 46 ++++++++++++++++++++++
 package/lirc-tools/lirc-tools.mk                   |  2 +
 2 files changed, 48 insertions(+)

diff --git a/package/lirc-tools/0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch b/package/lirc-tools/0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
new file mode 100644
index 0000000..5863128
--- /dev/null
+++ b/package/lirc-tools/0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
@@ -0,0 +1,46 @@
+From f2fc8c48e5e55a91b309225f377b6cb3783fc6f6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 25 May 2016 15:21:57 +0200
+Subject: [PATCH] lib: use proper linking method to avoid parallel build issue
+
+Using <foo>_LDFLAGS = -l<library> is correct when <library> is an
+external library. However, when it is built by the same package, and
+especially in the same directory, this is wrong and can cause parallel
+build issues. In lib/Makefile.am, there was:
+
+libirrecord_la_LDFLAGS      = -llirc
+
+But the liblirc library is built in the same directory. Or, due to the
+using of <foo>_LDFLAGS, make is not aware of the build dependency
+between libirrecord and liblirc.
+
+To solve this, <foo>_LIBADD should be used instead, as follows:
+
+libirrecord_la_LIBADD       = liblirc.la
+
+This fixes parallel build issues seen by automated build tests
+conducted by the Buildroot project, such as:
+
+  http://autobuild.buildroot.org/results/eb4/eb47d57de8182d25b1dacbf0ac3726ed20063d04/build-end.log
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ lib/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index ce5c94c..8780f88 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -29,7 +29,7 @@ liblirc_la_SOURCES          = config_file.c \
+                               transmit.c \
+                               util.c
+ 
+-libirrecord_la_LDFLAGS      = -llirc
++libirrecord_la_LIBADD       = liblirc.la
+ libirrecord_la_SOURCES      = irrecord.c
+ 
+ liblirc_client_la_LDFLAGS   = -version-info 4:0:4
+-- 
+2.7.4
+
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 46886a9..289b9ed 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -11,6 +11,8 @@ LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
+# 0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
+LIRC_TOOLS_AUTORECONF = YES
 
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
 LIRC_TOOLS_CONF_OPTS = --without-x
