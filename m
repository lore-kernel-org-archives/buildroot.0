From: Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Jul 2016 16:08:41 +0930
Subject: [Buildroot] [PATCH v2] package/pflash: new package
In-Reply-To: <1469426487-19558-1-git-send-email-joel@jms.id.au>
References: <1469426487-19558-1-git-send-email-joel@jms.id.au>
Message-ID: <1469428721-27145-1-git-send-email-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pflash is a tool for reading and writing to the PNOR on OpenPower
servers, for firmware upgrades, and extracting diagnostic information.

This includes a fix so that pflash can build with musl, which has been submitted
upstream[1].

[1] http://patchwork.ozlabs.org/patch/652168/

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - fix whitespcae in pflash.mk
 - drop PFLASH_INSTALL_STAGING; we do not install headers and therefore do not
   need to install the package to staging
 - add url to help text

 package/Config.in                                  |  1 +
 ...-pflash-use-atexit-for-musl-compatibility.patch | 42 ++++++++++++++++++++++
 package/pflash/Config.in                           |  8 +++++
 package/pflash/pflash.mk                           | 30 ++++++++++++++++
 4 files changed, 81 insertions(+)
 create mode 100644 package/pflash/0001-pflash-use-atexit-for-musl-compatibility.patch
 create mode 100644 package/pflash/Config.in
 create mode 100644 package/pflash/pflash.mk

diff --git a/package/Config.in b/package/Config.in
index 814141f18784..9f873c31fa58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -426,6 +426,7 @@ endmenu
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
+	source "package/pflash/Config.in"
 	source "package/picocom/Config.in"
 	source "package/pifmrds/Config.in"
 	source "package/powertop/Config.in"
diff --git a/package/pflash/0001-pflash-use-atexit-for-musl-compatibility.patch b/package/pflash/0001-pflash-use-atexit-for-musl-compatibility.patch
new file mode 100644
index 000000000000..f8ac58eba329
--- /dev/null
+++ b/package/pflash/0001-pflash-use-atexit-for-musl-compatibility.patch
@@ -0,0 +1,42 @@
+From 7f6b017b8dc3b5f276b30353e0a7186e4e433e7a Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Mon, 25 Jul 2016 13:24:37 +0930
+Subject: [PATCH] pflash: use atexit for musl compatibility
+To: skiboot at lists.ozlabs.org
+
+I accidentally built myself a cross-toolchain with the musl libc. It does
+not support on_exit which we use to clean up in pflash.
+
+Instead use atexit with is supported by both uclibc, musl and glibc.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ external/pflash/pflash.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/external/pflash/pflash.c b/external/pflash/pflash.c
+index c124356fd3d9..27000469052e 100644
+--- a/external/pflash/pflash.c
++++ b/external/pflash/pflash.c
+@@ -509,7 +509,7 @@ static void print_help(const char *pname)
+ 	printf("\t\tThis message.\n\n");
+ }
+ 
+-void exiting(int d, void *p)
++void exiting(void)
+ {
+ 	if (need_relock)
+ 		arch_flash_set_wrprotect(bl, 1);
+@@ -775,8 +775,7 @@ int main(int argc, char *argv[])
+ 		exit(1);
+ 	}
+ 
+-	on_exit(exiting, NULL);
+-
++	atexit(exiting);
+ 
+ 	rc = blocklevel_get_info(bl, &fl_name,
+ 			    &fl_total_size, &fl_erase_granule);
+-- 
+2.8.1
+
diff --git a/package/pflash/Config.in b/package/pflash/Config.in
new file mode 100644
index 000000000000..c1937f2cea32
--- /dev/null
+++ b/package/pflash/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PFLASH
+	bool "pflash"
+	depends on BR2_arm || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
+	help
+	  PNOR Flash reading and writing tool for OpenPower servers. Used for
+	  firmware upgrades and extracting diagnostic infromation from flash.
+
+	  https://github.com/open-power/skiboot
diff --git a/package/pflash/pflash.mk b/package/pflash/pflash.mk
new file mode 100644
index 000000000000..ce5c546fc043
--- /dev/null
+++ b/package/pflash/pflash.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# pflash
+#
+################################################################################
+
+PFLASH_VERSION = skiboot-5.2.4
+PFLASH_SITE = $(call github,open-power,skiboot,$(PFLASH_VERSION))
+PFLASH_LICENSE = Apache 2.0
+PFLASH_LICENSE_FILE = LICENCE
+
+PFLASH_MAKE_OPTS += CROSS_COMPILE="$(TARGET_CROSS)" \
+		    PFLASH_VERSION=$(PFLASH_VERSION) \
+		    DESTDIR=$(TARGET_DIR) \
+		    -C $(@D)/external/pflash \
+
+# A makefile bug causes recent versions of pflash to fail setting CC and LD
+# based on CROSS_COMPILE. Set CC and LD to remain compatible with those
+# versions.
+PFLASH_MAKE_OPTS += CC=$(TARGET_CC) LD=$(TARGET_LD)
+
+define PFLASH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(PFLASH_MAKE_OPTS) all
+endef
+
+define PFLASH_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(PFLASH_MAKE_OPTS) install
+endef
+
+$(eval $(generic-package))
-- 
2.8.1
