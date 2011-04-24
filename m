From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Apr 2011 22:56:34 +0200
Subject: [Buildroot] [git commit] haserl: bump dev version to 0.9.28
Message-ID: <20110424210252.6DE8282A34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=36d1a7a5a3b78e278a0576d9856e6fb7ed1fe5c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/Config.in |    2 +-
 package/haserl/haserl.mk |   15 +++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 23101c4..ad9a8e9 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -38,4 +38,4 @@ endchoice
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.27"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.28"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index a8585e8..c62b344 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -4,13 +4,20 @@
 #
 #############################################################
 
-HASERL_VERSION:=$(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
-HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
-HASERL_AUTORECONF:=NO
-HASERL_INSTALL_TARGET:=YES
+HASERL_VERSION = $(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
+HASERL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
 
 # force haserl 0.8.0 to use install-sh so stripping works
 HASERL_CONF_ENV = ac_cv_path_install=./install-sh
+
+# lua2c is only needed when haserl_lualib.inc is older than haserl_lualib.lua
+# So avoid having a host-lua just for this
+define HASERL_NO_LUA2C
+	$(SED) 's/haserl_lualib.lua lua2c/haserl_lualib.lua/' \
+		$(@D)/src/Makefile.in
+endef
+HASERL_POST_EXTRACT_HOOKS += HASERL_NO_LUA2C
+
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \
 		--with-lua-headers=$(STAGING_DIR)
-- 
1.7.3.4
