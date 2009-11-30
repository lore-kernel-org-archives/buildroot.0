From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Nov 2009 11:25:30 +0100
Subject: [Buildroot] [git commit master] package/alsamixergui: fix build
Message-ID: <20091130102614.DD002777F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cf1028074477653b7aa7bf86930b2f5c3bc55820
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And provide correct dependencies (alsa-lib).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                              |    2 +-
 package/alsamixergui/Config.in       |    1 +
 package/alsamixergui/alsamixergui.mk |    6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index e250a1c..f7fbda7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Additional fixes and cleanups.
 
-	Updated/fixed packages: fltk
+	Updated/fixed packages: alsamixergui, fltk
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index c7508bb..5a31b20 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ALSAMIXERGUI
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_FLTK
 	bool "alsamixergui"
 	help
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index e575a22..374e9e3 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -10,9 +10,11 @@ ALSAMIXERGUI_AUTORECONF = YES
 ALSAMIXERGUI_INSTALL_STAGING = NO
 ALSAMIXERGUI_INSTALL_TARGET = YES
 
-ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -lstdc++ -lX11"
+ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
+			ac_cv_lib_fltk_fl_numericsort=yes \
+			ac_cv_lib_asound_snd_ctl_open=yes
 
-ALSAMIXERGUI_DEPENDENCIES = fltk
+ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
 $(eval $(call AUTOTARGETS,package,alsamixergui))
 
-- 
1.6.3.3
