From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 17 Jan 2016 23:04:53 +0100
Subject: [Buildroot] [PATCH] package/scrub: new package
Message-ID: <1453068293-16263-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in        |  1 +
 package/scrub/Config.in  |  7 +++++++
 package/scrub/scrub.hash |  2 ++
 package/scrub/scrub.mk   | 18 ++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/scrub/Config.in
 create mode 100644 package/scrub/scrub.hash
 create mode 100644 package/scrub/scrub.mk

diff --git a/package/Config.in b/package/Config.in
index 06ed4a8..0f6a61c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1585,6 +1585,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
 endif
+	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/scrub/Config.in b/package/scrub/Config.in
new file mode 100644
index 0000000..3c7d28b
--- /dev/null
+++ b/package/scrub/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SCRUB
+	bool "scrub"
+	help
+	  Scrub iteratively writes patterns on files or disk devices to make
+	  retrieving the data more difficult.
+
+	  https://code.google.com/p/diskscrub/
diff --git a/package/scrub/scrub.hash b/package/scrub/scrub.hash
new file mode 100644
index 0000000..42f7b2f
--- /dev/null
+++ b/package/scrub/scrub.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  838b061b2e1932b342fb9695c5579cdff5d2d72506cb41d6d8032eba18aed969  scrub-2.6.1.tar.gz
diff --git a/package/scrub/scrub.mk b/package/scrub/scrub.mk
new file mode 100644
index 0000000..92837a1
--- /dev/null
+++ b/package/scrub/scrub.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# scrub
+#
+################################################################################
+
+SCRUB_VERSION = 2.6.1
+SCRUB_SITE = $(call github,chaos,scrub,$(SCRUB_VERSION))
+SCRUB_LICENSE = GPLv2+
+SCRUB_LICENSE_FILES = COPYING
+
+# tarball of the git repo, but autoreconf does not work as expected, so:
+define SCRUB_AUTOCONF_HOOK
+	( cd $(@D) && PATH=$(BR_PATH) $(@D)/autogen.sh )
+endef
+SCRUB_PRE_CONFIGURE_HOOKS += SCRUB_AUTOCONF_HOOK
+
+$(eval $(autotools-package))
-- 
2.7.0
