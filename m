From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jul 2015 17:25:57 +0200
Subject: [Buildroot] [PATCH v2] package: Remove shell completion at finalize
	stage
Message-ID: <1436714757-20767-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of doing a removal of the completion file package per package,
do it all at the finalize stage so it's done once and for all.

Note: This fixes an issue with systemd where passing a --bashcompletiondir
or --zshcompletiondir would be evaluated to '.' by the autotools macro.
This would create a 'target./' directory.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
V1 -> V2: fix inverted path between bash and zsh
---
 Makefile                         | 6 ++++++
 package/kmod/kmod.mk             | 4 ----
 package/systemd/systemd.mk       | 8 --------
 package/util-linux/util-linux.mk | 6 ------
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index b1bcf78..307f13c 100644
--- a/Makefile
+++ b/Makefile
@@ -556,6 +556,12 @@ target-finalize: $(PACKAGES)
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
 endif
+ifneq ($(BR2_PACKAGE_BASH),y)
+	rm -rf $(TARGET_DIR)/usr/share/bash-completion
+endif
+ifneq ($(BR2_PACKAGE_ZSH),y)
+	rm -rf $(TARGET_DIR)/usr/share/zsh
+endif
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 98d9998..ae09330 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -59,10 +59,6 @@ else
 KMOD_CONF_OPTS += --disable-tools
 endif

-ifeq ($(BR2_PACKAGE_BASH),)
-KMOD_CONF_OPTS += --with-bashcompletiondir=
-endif
-
 # We only install depmod, since that's the only tool used for the
 # host.
 define HOST_KMOD_INSTALL_TOOLS
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7eb7abe..5c9effa 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -123,14 +123,6 @@ else
 SYSTEMD_CONF_OPTS += --disable-smack
 endif

-ifeq ($(BR2_PACKAGE_BASH),)
-SYSTEMD_CONF_OPTS += --with-bashcompletiondir=
-endif
-
-ifeq ($(BR2_PACKAGE_ZSH),)
-SYSTEMD_CONF_OPTS += --with-zshcompletiondir=
-endif
-
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPTS += LIBS=-lrt
 SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3ca147a..a44a45e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -26,12 +26,6 @@ UTIL_LINUX_CONF_OPTS += \
 	--disable-makeinstall-chown \
 	--without-python

-ifeq ($(BR2_PACKAGE_BASH),)
-UTIL_LINUX_CONF_OPTS += \
-	--disable-bash-completion \
-	--with-bashcompletiondir=
-endif
-
 # We don't want the host-busybox dependency to be added automatically
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf

--
2.1.4
