From: Thierry Bultel <tbultel@free.fr>
Date: Tue,  9 Dec 2014 21:46:38 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: add an option to build host
	programs
Message-ID: <1418157998-3183-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/util-linux/Config.in     |  5 +++++
 package/util-linux/util-linux.mk | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 07e1fbb..f913fef 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -12,6 +12,11 @@ config BR2_PACKAGE_UTIL_LINUX
 
 if BR2_PACKAGE_UTIL_LINUX
 
+config BR2_PACKAGE_UTIL_LINUX_HOST_PROGRAMS
+	bool "all programs on host"
+	help
+	   Install all programs on the host
+
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_USE_MMU # fork
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index dc10193..8a91636 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -91,11 +91,19 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
 
 # In the host version of util-linux, we so far only require libuuid,
-# and none of the util-linux utilities, so we disable all of them.
+# and none of the util-linux utilities, so we disable all of them, unless
+# BR2_PACKAGE_UTIL_LINUX_HOST_PROGRAMS is set
+
 HOST_UTIL_LINUX_CONF_OPTS += \
 	--enable-libuuid \
 	--disable-libblkid --disable-libmount \
-	--disable-all-programs --without-ncurses
+	--without-ncurses
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_HOST_PROGRAMS),y)
+HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
+else
+HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
+endif
 
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
-- 
1.9.1
