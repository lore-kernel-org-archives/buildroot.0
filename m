From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 23:10:47 +0200
Subject: [Buildroot] [git commit] package/lm-sensors: always pass
 TARGET_CONFIGURE_OPTS
Message-ID: <20200716210649.077D6862B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=654ade68a69805647f97e3fa456f31e623e72c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lm-sensors dropped MACHINE variable since version 3.6.0 and
https://github.com/lm-sensors/lm-sensors/commit/0863eff8fa1d32797e3aec19672878aff893b0ae
instead it uses $(CC) -dumpmachine to guess the architecture

However, as $(TARGET_CONFIGURE_OPTS) is only passed to build step and
not to install steps, this result in some binaries being built for the
host during install step and raising a build failure on some autobuilders

Fixes:
 - http://autobuild.buildroot.org/results/0180989afdd9272ecd5010a787931e0b10a6cdcf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lm-sensors/lm-sensors.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index a69ca6e2bf..8975efaffa 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -20,7 +20,7 @@ LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_PWMCONFIG) += sbin/pwmconfig
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
 
 LM_SENSORS_MAKE_OPTS = \
-	MACHINE=$(KERNEL_ARCH) \
+	$(TARGET_CONFIGURE_OPTS) \
 	PREFIX=/usr
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -36,7 +36,7 @@ LM_SENSORS_MAKE_OPTS += BUILD_STATIC_LIB=1
 endif
 
 define LM_SENSORS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LM_SENSORS_MAKE_OPTS) -C $(@D)
 endef
 
 define LM_SENSORS_INSTALL_STAGING_CMDS
