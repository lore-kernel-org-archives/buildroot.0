From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:07:29 +0100
Subject: [Buildroot] [git commit] package/tvheadend: Enable bundled build
Message-ID: <20141028211001.91E77B1DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=843db449d901722e602ad29df213d8fee757eea8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python is needed to create a bundled version of the tvheadend binary which
includes all files used by the web UI.

Having host-python alone as dependency is not enough, we need to add
--enable-bundle to enable this functionality.

Also remove the now bundled webinterface files from /usr/share/tvheadend/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 54112a6..979c321 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -37,6 +37,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
 	 --python="$(HOST_DIR)/usr/bin/python"	\
 	 --disable-dvbscan			\
+	 --enable-bundle			\
 	 $(TVHEADEND_CONF_OPTS)			\
 	)
 endef
@@ -49,6 +50,15 @@ define TVHEADEND_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
+# Remove documentation and source files that are not needed because we
+# use the bundled web interface version.
+define TVHEADEND_CLEAN_SHARE
+	rm -rf $(TARGET_DIR)/usr/share/tvheadend/docs
+	rm -rf $(TARGET_DIR)/usr/share/tvheadend/src
+endef
+
+TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_CLEAN_SHARE
+
 #----------------------------------------------------------------------------
 # To run tvheadend, we need:
 #  - a startup script, and its config file
@@ -59,7 +69,7 @@ define TVHEADEND_INSTALL_DB
 	              $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
 	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
 endef
-TVHEADEND_POST_INSTALL_TARGET_HOOKS = TVHEADEND_INSTALL_DB
+TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_INSTALL_DB
 
 define TVHEADEND_INSTALL_INIT_SYSV
 	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
