From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:08:43 +0100
Subject: [Buildroot] [git commit] package/scrub: new package
Message-ID: <20160308200927.857D380D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4eafcaef56f04943de896f1b564c5b51157ab594
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fetch a patch fixing autoreconf call.
Patch already sent and merged upstream.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/scrub/Config.in  |  7 +++++++
 package/scrub/scrub.hash |  3 +++
 package/scrub/scrub.mk   | 17 +++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c4d98c4..d916154 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1636,6 +1636,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
 endif
+	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/scrub/Config.in b/package/scrub/Config.in
new file mode 100644
index 0000000..84bcc29
--- /dev/null
+++ b/package/scrub/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SCRUB
+	bool "scrub"
+	help
+	  Scrub iteratively writes patterns on files or disk devices
+	  to make retrieving the data more difficult.
+
+	  https://github.com/chaos/scrub/
diff --git a/package/scrub/scrub.hash b/package/scrub/scrub.hash
new file mode 100644
index 0000000..0041fd0
--- /dev/null
+++ b/package/scrub/scrub.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  838b061b2e1932b342fb9695c5579cdff5d2d72506cb41d6d8032eba18aed969  scrub-2.6.1.tar.gz
+sha256  6a129b4e0df6ebe02d449fa481db7b75be5eff08ce518aa77edd74c6b17c5ae4  11d30916dd9c11a26c7c8a0f6db9e6ebca301594.patch
diff --git a/package/scrub/scrub.mk b/package/scrub/scrub.mk
new file mode 100644
index 0000000..b816272
--- /dev/null
+++ b/package/scrub/scrub.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# scrub
+#
+################################################################################
+
+SCRUB_VERSION = 2.6.1
+SCRUB_SITE = $(call github,chaos,scrub,$(SCRUB_VERSION))
+SCRUB_LICENSE = GPLv2+
+SCRUB_LICENSE_FILES = COPYING DISCLAIMER
+SCRUB_PATCH = https://github.com/chaos/scrub/commit/11d30916dd9c11a26c7c8a0f6db9e6ebca301594.patch
+
+# Fetching from the git repo, no configure/Makefile generated, and patching
+# configure.ac
+SCRUB_AUTORECONF = YES
+
+$(eval $(autotools-package))
