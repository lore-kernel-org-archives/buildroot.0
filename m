From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 21:34:14 +0100
Subject: [Buildroot] [git commit] openvpn: fix init script name
Message-ID: <20130115204907.6290399699@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41fb3df4bd370b869fea3d0b38d01f596f86f721
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our default (busybox) rc.S implementation requires init scripts to be
named S??*, so rename the openvpn one to S60openvpn (E.G. after network).

At the same time remove the deprecated check-if-custom-skeleton-provided-file
and just always install the init script. People can always fixup/remove
it in their post-build script if needed.

Also name the init script source the same as the destination file name in
TARGET_DIR for consistency.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openvpn/{openvpn.init => S60openvpn} |    0
 package/openvpn/openvpn.mk                   |    8 +++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/openvpn/openvpn.init b/package/openvpn/S60openvpn
similarity index 100%
rename from package/openvpn/openvpn.init
rename to package/openvpn/S60openvpn
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 2658d76..a49daca 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -42,15 +42,13 @@ endif
 define OPENVPN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
-	if [ ! -f $(TARGET_DIR)/etc/init.d/openvpn ]; then \
-		$(INSTALL) -m 755 -D package/openvpn/openvpn.init \
-			$(TARGET_DIR)/etc/init.d/openvpn; \
-	fi
+	$(INSTALL) -m 755 -D package/openvpn/S60openvpn \
+		$(TARGET_DIR)/etc/init.d/S60openvpn
 endef
 
 define OPENVPN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/openvpn
-	rm -f $(TARGET_DIR)/etc/init.d/openvpn
+	rm -f $(TARGET_DIR)/etc/init.d/S60openvpn
 endef
 
 $(eval $(autotools-package))
