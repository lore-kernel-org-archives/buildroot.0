From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:25:31 +0100
Subject: [Buildroot] [git commit] package/mediastreamer: fix build by
	bumping to version 2.14.0
Message-ID: <20170125213156.A60F781EC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b29a9115d7149f2c84cec793d9fe31bc74d97540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current available version 2.12.1 of mediastreamer does not compile with the
latest version 0.27 of oRTP, which was recently updated in Buildroot in [1].
Bump mediastreamer to latest version 2.14.0 to fix the incompatibility:

```
base/msfactory.c:169:3: error: too few arguments to function 'ortp_set_log_level_mask'
   ortp_set_log_level_mask(ORTP_MESSAGE|ORTP_WARNING|ORTP_ERROR|ORTP_FATAL);
```

Note that we need to fetch a patch from upstream to fix the build with
the bctoolbox version 0.4.0.

Fixes:
http://autobuild.buildroot.net/results/9aa/9aa3cdad6e22ad1656eec59fc92fb7cb79afc4cd/
http://autobuild.buildroot.net/results/09e/09e8fabb72cafa284419f096da95299c51c03899/
http://autobuild.buildroot.net/results/29c/29c8ddd25c76f4c5b74f31a576c7ace9f76677db/
.. and some more.

[1] http://patchwork.ozlabs.org/patch/718277/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mediastreamer/mediastreamer.hash | 3 ++-
 package/mediastreamer/mediastreamer.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.hash b/package/mediastreamer/mediastreamer.hash
index 21964a8..0f1ac77 100644
--- a/package/mediastreamer/mediastreamer.hash
+++ b/package/mediastreamer/mediastreamer.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	0dbf8d4f721a04db9ec0982e98a4e852ad2d3acbcbd25edd96a66164a980f2e7	mediastreamer-2.12.1.tar.gz
+sha256  1144849c0c96abafb1153adf56109f0f195a9e4a53cf28cb611bbca7a9012c1a  mediastreamer-2.14.0.tar.gz
+sha256  90091ab0aa7a77381ab1ca5d88cdfa4e7f62505fb452a2bea0f70054d9d1aece  26f884bf977977041fe6f98a0af186be1580bf22.patch
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index a12bfb4..b4f0c52 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEDIASTREAMER_VERSION = 2.12.1
+MEDIASTREAMER_VERSION = 2.14.0
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
 MEDIASTREAMER_INSTALL_STAGING = YES
 MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext
@@ -13,6 +13,13 @@ MEDIASTREAMER_CONF_OPTS = --disable-tests --disable-glx --disable-strict
 MEDIASTREAMER_LICENSE = GPLv2+
 MEDIASTREAMER_LICENSE_FILES = COPYING
 
+# fix compilation issue with latest bctoolbox (touches configure.ac)
+MEDIASTREAMER_PATCH = \
+	https://github.com/BelledonneCommunications/mediastreamer2/commit/26f884bf977977041fe6f98a0af186be1580bf22.patch
+
+# patching configure.ac
+MEDIASTREAMER_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
 MEDIASTREAMER_CONF_OPTS += --enable-alsa
 MEDIASTREAMER_DEPENDENCIES += alsa-lib
