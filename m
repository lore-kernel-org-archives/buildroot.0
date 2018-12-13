From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:17:16 +0100
Subject: [Buildroot] [git commit] package/sdl2_net: add missing host-pkgconf
 dependency
Message-ID: <20181213201320.4205D8B833@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2a1bcb1b3e56c16a8433a516646d4eb8581fd91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sdl2_net configure script uses pkg-config to finx sdl2. If it
doesn't find pkg-config, it tries to locate sdl2-config, and defaults
to /usr/bin/sdl2-config, which causes the build to fail with:

arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/SDL2'

Fix this by adding host-pkgconf to the dependencies of sdl2_net. We
could have added the right autoconf cache variable to tell the
configure script where sdl2-config is located, but since pkg-config is
tried first, let's use that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2_net/sdl2_net.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_net/sdl2_net.mk b/package/sdl2_net/sdl2_net.mk
index 2fa4a8c2e0..93bf3a2eb3 100644
--- a/package/sdl2_net/sdl2_net.mk
+++ b/package/sdl2_net/sdl2_net.mk
@@ -10,6 +10,6 @@ SDL2_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
 SDL2_NET_LICENSE = Zlib
 SDL2_NET_LICENSE_FILES = COPYING.txt
 SDL2_NET_INSTALL_STAGING = YES
-SDL2_NET_DEPENDENCIES = sdl2
+SDL2_NET_DEPENDENCIES = sdl2 host-pkgconf
 
 $(eval $(autotools-package))
