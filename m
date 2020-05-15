From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2020 11:33:53 -0700
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: build with versioned
 symbols
Message-ID: <20200515183353.4183611-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some libraries such as CEF depend on versioned symbols from alsa-lib,
and the build fails during linking with versioning disabled.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
CEF is linked to versioned symbols defined by libasound.

$ readelf -Ws libcef.so | grep snd_mixer_selem_id_set_index
  260: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND snd_mixer_selem_id_set_index at ALSA_0.9 (8)

Buildroot's alsa-lib package is currently configured with
--without-versiond, which disables symbol versioning.

$ readelf output/target/usr/lib/libasound.so | grep snd_mixer_selem_id_set_index
  1332: 0000000000052b0c    56 FUNC    GLOBAL DEFAULT   11 snd_mixer_selem_id_set_index

Building alsa-lib with unversioned symbols results in unresolved symbols
during linking.

   <snip>/output/host/bin/aarch64-linux-gcc -o subprocess subprocess.o  -L<snip>/output/target/usr/lib/ -lcef -lX11 -lpython3.8 -lcrypt -lpthread -ldl  -lpthread -lutil -lm -Xlinker -export-dynamic
    <snip>/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: <snip>/output/target/usr/lib/libcef.so: undefined reference to `snd_mixer_selem_id_set_index at ALSA_0.9'

Configuring alsa-lib without the --without-versioned flag fixes this
issue.

$ readelf -Ws buildroot/output/target/usr/lib/libasound.so | grep snd_mixer_selem_id_set_index
  1173: 000000000004be18    56 FUNC    GLOBAL DEFAULT   12 snd_mixer_selem_id_set_index@@ALSA_0.9

Is there a reason to leave --without-versioned in the package, or make
it an optional config? I can't imagine the size difference is all that
great.

 package/alsa-lib/alsa-lib.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 1855eb3d08..1f1d95c177 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -15,8 +15,7 @@ ALSA_LIB_AUTORECONF = YES
 ALSA_LIB_CONF_OPTS = \
 	--with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 	--with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
-	--with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
-	--without-versioned
+	--with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))"
 
 # Can't build with static & shared at the same time (1.0.25+)
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.26.2
