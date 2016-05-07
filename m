From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  7 May 2016 08:45:25 +0200
Subject: [Buildroot] [PATCH] alsa-lib: Add option to allow calculations in
	float for soft float targets
Message-ID: <1462603525-4427-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The `--with-softfloat` config option is a little bit misleading as it actually
means: "avoid calculations in float" [1].

Add a menu config option to allow floating point emulation for soft float
targets. This option is enabled by default for soft float targets.

[1]
http://git.alsa-project.org/?p=alsa-lib.git;a=blob;f=configure.ac;h=c265ec9e159bdf76a6829ab8f7d625ac72b25501;#l226

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/alsa-lib/Config.in   | 6 ++++++
 package/alsa-lib/alsa-lib.mk | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 97e8489..8c50e4f 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -33,6 +33,12 @@ config BR2_PACKAGE_ALSA_LIB_DEVDIR
 	string "directory with ALSA device files"
 	default "/dev/snd"
 
+config BR2_PACKAGE_ALSA_LIB_NO_FLOAT
+	bool "Avoid calculation in float"
+	default y if BR2_SOFT_FLOAT
+	help
+	  Disables all calculations requiring floating point routines.
+
 config BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS
 	string "built PCM plugins"
 	default "all" if BR2_USE_MMU
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index ae0377d..b065a54 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -62,7 +62,7 @@ else
 ALSA_LIB_CONF_OPTS += --disable-python
 endif
 
-ifeq ($(BR2_SOFT_FLOAT),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_NO_FLOAT),y)
 ALSA_LIB_CONF_OPTS += --with-softfloat
 endif
 
-- 
2.8.2
