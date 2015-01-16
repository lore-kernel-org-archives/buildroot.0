From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Jan 2015 09:00:10 +0100
Subject: [Buildroot] [git commit] jquery-ui: use install -t to copy images
	to target
Message-ID: <20150116080100.AFDCB80E34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae5ed8b5c60ce8390d81928f6be294085b067712
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of cp + chmod as there may be other files in the destination
directory that chmod shouldn't change permissions of / where chmod might
fail (E.G. symlinks that are only valid on the target).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jquery-ui/jquery-ui.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index e4d3370..d829d62 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -27,9 +27,8 @@ define JQUERY_UI_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/themes/base/minified/jquery-ui.min.css \
 		$(TARGET_DIR)/var/www/jquery-ui.css
 	$(INSTALL) -d $(TARGET_DIR)/var/www/images
-	cp -a $(@D)/themes/base/minified/images/*.png \
-		$(TARGET_DIR)/var/www/images
-	chmod 0644 $(TARGET_DIR)/var/www/images/*.png
+	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/images \
+		$(@D)/themes/base/minified/images/*.png
 endef
 
 $(eval $(generic-package))
