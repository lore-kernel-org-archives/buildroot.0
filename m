From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Tue, 8 Dec 2015 23:27:28 +0000
Subject: [Buildroot] [PATCH] gptfdisk: Add host package
Message-ID: <1449617254.26955.31.camel@rtred1test09.kymeta.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This tool is useful for scripts that create flash images with
multiple partitions.  The host-parted package can do this too, but is
missing a number of features that the gptfdisk program has for dealing
with GPT.

The interactive gdisk and curses based sgdisk aren't built.  Just the
scriptable tool sgdisk.  The target package allows configuring which
tools are built, but this seem unnecessarily complex for the host
package.

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
---
 package/Config.in.host          |  1 +
 package/gptfdisk/Config.in.host |  9 +++++++++
 package/gptfdisk/gptfdisk.mk    | 11 +++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/gptfdisk/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index ce1b6bc..d757316 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
diff --git a/package/gptfdisk/Config.in.host b/package/gptfdisk/Config.in.host
new file mode 100644
index 0000000..7bdfd00
--- /dev/null
+++ b/package/gptfdisk/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_GPTFDISK
+	bool "host gptfdisk"
+	help
+          GPT fdisk (consisting of the gdisk and sgdisk programs) is a
+          text-mode partitioning tool that works on Globally Unique Identifier
+          (GUID) Partition Table (GPT) disks, rather than on the more common
+          (through 2010) Master Boot Record (MBR) partition tables.
+
+          http://www.rodsbooks.com/gdisk/
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index abfddfb..089e862 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -46,4 +46,15 @@ define GPTFDISK_INSTALL_TARGET_CMDS
 	done
 endef
 
+HOST_GPTFDISK_DEPENDENCIES = host-util-linux host-popt
+define HOST_GPTFDISK_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
+		sgdisk
+endef
+
+define HOST_GPTFDISK_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/sgdisk $(HOST_DIR)/usr/sbin/sgdisk
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.8.3.1
