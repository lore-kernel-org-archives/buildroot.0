From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] ncftp: use correct way of
	overriding steps
Message-ID: <20100916113828.0A1818AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0de10bf4915ba1efe482486705adc36cfa52cfa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncftp/ncftp.mk |   23 +++++++++--------------
 1 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 757cc6e..f3f4780 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -23,6 +23,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_BATCH),y)
 NCFTP_TARGET_BINS+=ncftpbatch
+NCFTP_INSTALL_NCFTP_BATCH = \
+	ln -s /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_BOOKMARKS),y)
@@ -30,20 +32,13 @@ NCFTP_TARGET_BINS+=ncftpbookmarks
 NCFTP_DEPENDENCIES:=ncurses
 endif
 
-$(eval $(call AUTOTARGETS,package,ncftp))
-
-$(NCFTP_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing to target")
+define NCFTP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(addprefix $(NCFTP_DIR)/bin/, $(NCFTP_TARGET_BINS)) $(TARGET_DIR)/usr/bin
-ifeq ($(BR2_PACKAGE_NCFTP_BATCH),y)
-	ln -s /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
-endif
-ifeq ($(BR2_ENABLE_DEBUG),)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
-endif
-	touch $@
+	$(NCFTP_INSTALL_NCFTP_BATCH)
+endef
 
-$(NCFTP_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define NCFTP_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS) ncftpspooler)
-	rm -f $(NCFTP_TARGET_INSTALL_TARGET)
+endef
+
+$(eval $(call AUTOTARGETS,package,ncftp))
-- 
1.7.1
