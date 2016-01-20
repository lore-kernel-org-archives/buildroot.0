From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 22:31:52 +0100
Subject: [Buildroot] [git commit] alsa-lib: disable libdl for static only
	builds
Message-ID: <20160120213237.661C580124@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e209d022d751b7874e71858b59ca6cd320d50fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-ldl includes the reference to the library that has
the symbols for loading dynamic libraries.
So there is no need for this library for static only builds.
Even though alsa-lib uses dlopen, it has functions snd_dlopen
and others which can emulate dynamic linking for the static
build of the alsa-lib library and there is no need in libdl
dlopen when static build only.
This patch fixes build failures of the shairport-sync
(and probably other packages) when static libs are used.

Fixes:
http://autobuild.buildroot.net/results/85a/85a3f01bcd4eb2ce7ac480e63b4cc04bf7c8f3e5/

[Thomas: use a single ALSA_LIB_CONF_OPTS for both --enable-shared=no
and --without-libdl.]

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/alsa-lib.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index ea2351c..2075d41 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -20,7 +20,9 @@ ALSA_LIB_CONF_OPTS = \
 
 # Can't build with static & shared at the same time (1.0.25+)
 ifeq ($(BR2_STATIC_LIBS),y)
-ALSA_LIB_CONF_OPTS += --enable-shared=no
+ALSA_LIB_CONF_OPTS += \
+	--enable-shared=no \
+	--without-libdl
 else
 ALSA_LIB_CONF_OPTS += --enable-static=no
 endif
