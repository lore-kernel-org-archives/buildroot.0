From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 23:02:28 +0100
Subject: [Buildroot] [git commit] package/dosfstools: add host-package
	selection
Message-ID: <20130318221419.DD2489B169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24c2535f52550095a863a65e48bbf423b09fbed0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add dosfstools as a host-package selection in the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host            |    1 +
 package/dosfstools/Config.in.host |    6 ++++++
 package/dosfstools/dosfstools.mk  |    9 +++++++++
 3 files changed, 16 insertions(+), 0 deletions(-)

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
index 3a0856a..332f2ee 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -43,4 +43,13 @@ define DOSFSTOOLS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
+define HOST_DOSFSTOOLS_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define HOST_DOSFSTOOLS_INSTALL_CMDS
+	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
