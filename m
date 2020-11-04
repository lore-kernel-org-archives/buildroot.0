From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Nov 2020 20:30:33 +0100
Subject: [Buildroot] [git commit] package/asterisk: disable spandsp
Message-ID: <20201104192313.1A25086C6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22ed1ddc15a7347ee4ca2b943d43958d62a04aa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

asterisk fails to build with spandsp since commit 36c983bfa543de89a
(package/spandsp: bump version to 3.0.0), so disable it.

Fixes:
 - http://autobuild.buildroot.org/results/c984738cad4186edb12a62b8e74115e68efe35f0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.mk | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index eb72104d9a..b9e2b80dd5 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -107,6 +107,9 @@ ASTERISK_CONF_OPTS = \
 # the time of this writing).
 ASTERISK_CONF_OPTS += --without-avcodec
 
+# asterisk is not compatible with freeswitch spandsp
+ASTERISK_CONF_OPTS += --without-spandsp
+
 ASTERISK_CONF_ENV = \
 	ac_cv_file_bridges_bridge_softmix_include_hrirs_h=true \
 	ac_cv_path_CONFIG_LIBXML2=$(STAGING_DIR)/usr/bin/xml2-config
@@ -232,13 +235,6 @@ else
 ASTERISK_CONF_OPTS += --without-ssl
 endif
 
-ifeq ($(BR2_PACKAGE_SPANDSP),y)
-ASTERISK_DEPENDENCIES += spandsp
-ASTERISK_CONF_OPTS += --with-spandsp
-else
-ASTERISK_CONF_OPTS += --without-spandsp
-endif
-
 ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 ASTERISK_DEPENDENCIES += speex
 ASTERISK_CONF_OPTS += --with-speex --with-speexdsp
