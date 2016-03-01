From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  1 Mar 2016 13:34:55 +0200
Subject: [Buildroot] [PATCH] zsh: use the correct target pcre-config
Message-ID: <5e05faec7b46f08ff3dc732b002a22de706519d8.1456832095.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zsh configure script mis-detects the location of pcre-config, and may use that
of host-pcre or that of the host instead of the target. Make configure use the
correct pcre-config.

Thanks to Thomas Petazzoni for pointing me at the right direction.

Fixes:
http://autobuild.buildroot.net/results/b12/b12aadf3016dab0941cae780fa9ee7bf9be8fcda/
http://autobuild.buildroot.net/results/8e8/8e8b12dbca4ef8cac2e5f33cd3cdcddd8e849840/
http://autobuild.buildroot.net/results/473/473197ec8e323ea7ae0e29e6363525dc42f9da2c/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/zsh/zsh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 8659fc40189d..84dbbde56f92 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -28,6 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
 ZSH_CONF_OPTS += --enable-pcre
+ZSH_CONF_ENV += ac_cv_prog_PCRECONF=$(STAGING_DIR)/usr/bin/pcre-config
 ZSH_DEPENDENCIES += pcre
 else
 ZSH_CONF_OPTS += --disable-pcre
-- 
2.7.0
