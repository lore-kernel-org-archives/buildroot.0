From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 17 May 2020 22:11:12 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/alsa-lib: disable versioned
 symbols only when unsupported
In-Reply-To: <20200515183353.4183611-1-joseph.kogut@gmail.com>
References: <20200515183353.4183611-1-joseph.kogut@gmail.com>
Message-ID: <20200518051112.33798-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some libraries such as CEF depend on versioned symbols from alsa-lib,
and the build fails during linking with versioning disabled.

Symbol versioning was originally disabled because some C libraries, such
as uClibc, don't support versioned symbols.

This patch conditionally disables versioned symbols when unsupported by
the toolchain, leaving them enabled otherwise.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/alsa-lib/alsa-lib.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 1855eb3d08..b718b1eb68 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -15,8 +15,11 @@ ALSA_LIB_AUTORECONF = YES
 ALSA_LIB_CONF_OPTS = \
 	--with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 	--with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
-	--with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
-	--without-versioned
+	--with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))"
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ALSA_LIB_CONF_OPTS += --without-versioned
+endif
 
 # Can't build with static & shared at the same time (1.0.25+)
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.26.2
