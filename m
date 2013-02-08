From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Feb 2013 18:32:56 +0100
Subject: [Buildroot] [PATCH 2/6] package/dosfstools: add host-package
	selection
In-Reply-To: <cover.1360344619.git.yann.morin.1998@free.fr>
References: <cover.1360344619.git.yann.morin.1998@free.fr>
Message-ID: <cb7500992ef0651a3689443522eaa5a54afe10c3.1360344619.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add dosfstools as a host-package selection in the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in.host            |    1 +
 package/dosfstools/Config.in.host |    6 ++++++
 package/dosfstools/dosfstools.mk  |    9 +++++++++
 3 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 package/dosfstools/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 8813f5b..43f292c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 source "package/dfu-util/Config.in.host"
+source "package/dosfstools/Config.in.host"
 source "package/e2fsprogs/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
diff --git a/package/dosfstools/Config.in.host b/package/dosfstools/Config.in.host
new file mode 100644
index 0000000..9f9ceab
--- /dev/null
+++ b/package/dosfstools/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_DOSFSTOOLS
+	bool "host dosfstools"
+	help
+	  Tools for creating and checking DOS FAT filesystems.
+	  
+	  http://www.daniel-baumann.ch/software/dosfstools/
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 4f89364..cacd6dd 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -36,4 +36,13 @@ define DOSFSTOOLS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
+define HOST_DOSFSTOOLS_BUILD_CMDS
+	$(MAKE) CC="$(HOSTCC)" -C $(@D)
+endef
+
+define HOST_DOSFSTOOLS_INSTALL_CMDS
+	$(MAKE) -C $(@D) CC="$(HOSTCC)" PREFIX=$(HOST_DIR)/usr install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.2.5
