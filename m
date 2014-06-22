From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 22 Jun 2014 15:45:40 +0200
Subject: [Buildroot] [PATCH 1 of 5 RFC] uclibc: menuconfig: take into
 account initial settings from config file
In-Reply-To: <patchbomb.1403444739@localhost>
References: <patchbomb.1403444739@localhost>
Message-ID: <97d74ccbe054d9a16465.1403444740@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When uclibc-menuconfig is executed from a clean repo, and a custom
configuration file was set, then these custom settings are ignored and
uclibc starts from the default configuration.

This patch adds an explicit copy of the custom config file to the menuconfig
target to fix 'make clean uclibc-menuconfig'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/uclibc/uclibc.mk |  7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff -r 5ea6db6a0838 -r 97d74ccbe054 package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Fri Jun 20 23:38:46 2014 +0200
+++ b/package/uclibc/uclibc.mk	Sun Jun 22 10:37:22 2014 +0200
@@ -413,8 +413,11 @@
 	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
 	HOSTCC="$(HOSTCC)"
 
+define UCLIBC_COPY_DOT_CONFIG
+	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
+endef
+
 define UCLIBC_SETUP_DOT_CONFIG
-	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
 	$(call UCLIBC_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D))
@@ -454,6 +457,7 @@
 endef
 
 define UCLIBC_CONFIGURE_CMDS
+	$(UCLIBC_COPY_DOT_CONFIG)
 	$(UCLIBC_SETUP_DOT_CONFIG)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
@@ -543,6 +547,7 @@
 endef
 
 uclibc-menuconfig: uclibc-patch
+	$(UCLIBC_COPY_DOT_CONFIG)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
