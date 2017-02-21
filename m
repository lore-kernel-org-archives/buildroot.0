From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Feb 2017 22:12:22 +0100
Subject: [Buildroot] [PATCH] package/sslh: fix script,
	does not build in parallel
Message-ID: <1487711542-31294-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile is not parallel-safe, so we build with MAKE1. Since the
source is very small, this has minor impact on perforance.

The genver.sh script conaains a troll character U+c2a0 (non-break space)
which is refused by some versions of /bin/sh. Patch it away.

Fixes:
    http://autobuild.buildroot.net/results/867/867c74ed74fd04ab06d1a10ff34ca177fe005fd2/
    http://autobuild.buildroot.net/results/f97/f971629bc99147f9014e52c6ef71c3417faa6b67/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David Bachelart <david.bachelart@bbright.com>
---
 package/sslh/0002-replace-U+c2a0.patch | 12 ++++++++++++
 package/sslh/sslh.mk                   |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 package/sslh/0002-replace-U+c2a0.patch

diff --git a/package/sslh/0002-replace-U+c2a0.patch b/package/sslh/0002-replace-U+c2a0.patch
new file mode 100644
index 0000000..38093fa
--- /dev/null
+++ b/package/sslh/0002-replace-U+c2a0.patch
@@ -0,0 +1,12 @@
+diff -durN sslh-v1.18.orig/genver.sh sslh-v1.18/genver.sh
+--- sslh-v1.18.orig/genver.sh	2017-02-21 22:03:40.849161283 +0100
++++ sslh-v1.18/genver.sh	2017-02-21 22:03:59.173402356 +0100
+@@ -25,7 +25,7 @@
+         fi
+ fi
+ 
+-if [ -d .git ]?&& head=`git rev-parse --verify HEAD 2>/dev/null`; then
++if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
+ 	# generate the version info based on the tag
+ 	release=`(git describe --tags || git --describe || git describe --all --long) \
+ 		2>/dev/null | tr -d '\n'`
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 3177444..17aafd1 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -12,7 +12,7 @@ SSLH_LICENSE_FILES = COPYING
 SSLH_DEPENDENCIES = libconfig
 
 define SSLH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define SSLH_INSTALL_TARGET_CMDS
-- 
2.7.4
