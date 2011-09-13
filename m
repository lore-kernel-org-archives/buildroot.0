From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Sep 2011 23:44:59 +0200
Subject: [Buildroot] [git commit] portaudio: disable parallel build
Message-ID: <20110913214740.DA57F8D59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=94349b4e594f3da847b21b518c1c78c6ebc138c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The portaudio build system contains a race condition, which gets triggered
by high BR2_JLEVEL settings - It tries to use libportaudio.la before it is
created:

make[3]: *** No rule to make target `../../../lib/libportaudio.la',
needed by `libportaudiocpp.la'.  Stop.

Fix it by disabling parallel build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/portaudio/portaudio.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/portaudio/portaudio.mk b/package/multimedia/portaudio/portaudio.mk
index 67dfe36..f403d00 100644
--- a/package/multimedia/portaudio/portaudio.mk
+++ b/package/multimedia/portaudio/portaudio.mk
@@ -8,6 +8,7 @@ PORTAUDIO_VERSION = V19
 PORTAUDIO_SITE = http://www.portaudio.com/archives
 PORTAUDIO_SOURCE = pa_stable_v19_20110326.tgz
 PORTAUDIO_INSTALL_STAGING = YES
+PORTAUDIO_MAKE = $(MAKE1)
 
 PORTAUDIO_DEPENDENCIES = \
        $(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),alsa-lib)
-- 
1.7.3.4
