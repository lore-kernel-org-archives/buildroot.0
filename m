From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  6 Aug 2017 21:08:25 +0300
Subject: [Buildroot] [PATCH] mutt: fix build with BR2_PACKAGE_SKELETON_NONE
Message-ID: <23d9ad1d2c270c942d286f0fdf779dabfb876ffd.1502042905.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_SKELETON_NONE does not provide the /var subdirectory which break
symlink creation in that directory. Ignore the symlink creation error. It is
up to the user to provide a functional skeleton.

Fixes:
http://autobuild.buildroot.net/results/32d/32dff0df759baf1120e4f11335e735eb0708b237/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mutt/mutt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index abd40e5dd612..447c336b4893 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -66,7 +66,7 @@ MUTT_CONF_ENV += \
 MUTT_CONF_OPTS += --with-mailpath=/var/mail
 
 define MUTT_VAR_MAIL
-	ln -sf /tmp $(TARGET_DIR)/var/mail
+	-ln -sf /tmp $(TARGET_DIR)/var/mail
 endef
 MUTT_POST_INSTALL_TARGET_HOOKS += MUTT_VAR_MAIL
 
-- 
2.13.2
