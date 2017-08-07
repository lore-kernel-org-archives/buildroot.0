From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  7 Aug 2017 20:54:14 +0300
Subject: [Buildroot] [PATCH v2] mutt: fix build with
	BR2_PACKAGE_SKELETON_NONE
Message-ID: <6e30bce5e2d63e03119cfcd15c88447b6a90256a.1502128454.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_SKELETON_NONE does not provide the /var subdirectory which break
symlink creation in that directory. Make sure that /var exists before creating
the symlink.

Fixes:
http://autobuild.buildroot.net/results/32d/32dff0df759baf1120e4f11335e735eb0708b237/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Create /var (Yann)
---
 package/mutt/mutt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index abd40e5dd612..b0bf5a7b413f 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -66,6 +66,7 @@ MUTT_CONF_ENV += \
 MUTT_CONF_OPTS += --with-mailpath=/var/mail
 
 define MUTT_VAR_MAIL
+	mkdir -p $(TARGET_DIR)/var
 	ln -sf /tmp $(TARGET_DIR)/var/mail
 endef
 MUTT_POST_INSTALL_TARGET_HOOKS += MUTT_VAR_MAIL
-- 
2.13.2
