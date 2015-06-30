From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 29 Jun 2015 23:36:08 -0400
Subject: [Buildroot] [PATCH 1/1] util-linux: allow programs to be disabled
	by default
Message-ID: <1435635368-26928-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When even a single extra util-linux utility is enabled, the
default build and install will install many more programs,
including many that overlap with those offered by busybox.
Finer control of util-linux can be realized by disabling
everything by default (with --disable-all-programs) and then
overriding the default with specific enables (--enable-<name>).
This patch adds a config switch to disable everything by default.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/util-linux/Config.in     | 6 ++++++
 package/util-linux/util-linux.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 39df11c..9981889 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -47,6 +47,12 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 
 if BR2_PACKAGE_UTIL_LINUX_BINARIES
 
+config BR2_PACKAGE_UTIL_LINUX_DISABLE_BY_DEFAULT
+	bool "Disable programs by default"
+	help
+	  Disable programs by default; only explicitly enabled utilities
+	  and libraries will be built.
+
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3ca147a..3749a71 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -25,6 +25,10 @@ UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown \
 	--without-python
+ 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_DISABLE_BY_DEFAULT),y)
+UTIL_LINUX_CONF_OPTS += --disable-all-programs
+endif
 
 ifeq ($(BR2_PACKAGE_BASH),)
 UTIL_LINUX_CONF_OPTS += \
-- 
1.9.1
