From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:10:35 +0200
Subject: [Buildroot] [git commit] lshw: use data files provided by hwdata
Message-ID: <20180326211513.CD69583CC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29bccabdebff7b43189b0eed2090dc4858e1afca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lshw is seldomly released, so its data files become easily
outdated. Instead, this commit makes use of the data files provided by
hwdata. This is easily possible because lshw looks for the files in
several directories, including /usr/share/hwdata, where the hwdata
collection is installed.

We remove the entire /usr/share/lshw directory, where the not very
up-to-date data files where installed. Four files were installed
there: pci.ids, usb.ids (which are now provided by hwdata), manuf.txt
and oui.txt (which are not used at run time).

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Thomas:
 - rework commit log
 - replace patch by a simple removal of the /usr/share/lshw directory
 - add "runtime" comment in Config.in for the BR2_PACKAGE_LSHW
   dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lshw/Config.in | 3 +++
 package/lshw/lshw.mk   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 3caac66c72..5e0e47b6e2 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_LSHW
 	bool "lshw"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_HWDATA # runtime
+	select BR2_PACKAGE_HWDATA_PCI_IDS
+	select BR2_PACKAGE_HWDATA_USB_IDS
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 9b52b09167..4195c073e2 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -23,6 +23,7 @@ endef
 define LSHW_INSTALL_TARGET_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
 		$(LSHW_MAKE_OPTS) install
+	$(RM) -rf $(TARGET_DIR)/usr/share/lshw
 endef
 
 $(eval $(generic-package))
