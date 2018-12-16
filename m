From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 16:02:28 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/lynx: add
 dependency on host-pkgconf
Message-ID: <20181216145836.1BEBC8B448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcd9adeddaa4b020e8c996c65017d0f0a90f80f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

The Lynx configure script uses pkg-config when available:

checking for nios2-buildroot-linux-gnu-pkg-config... /home/thomas/projets/buildroot/output/host/bin/pkg-config
checking pkg-config for openssl... yes
[...]
checking pkg-config for ncurses... yes

Using pkg-config avoids build failures such as:

checking for _nc_freeall... no
configure: error: Configuration does not support color-styles
make: *** [/home/test/autobuild/run/instance-1/output/build/lynx-2.8.9rel.1/.stamp_configured] Error 1

When building with "make lynx", so that pkg-config is not built
before. The issue is that in this case, lynx configure script picks up
the ncurses6-config script for the host ncurses instead of the one in
staging. Using pkg-config solves that nicely.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 67ee7f9eb1bce1542e0a8845d492635151dce36e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lynx/lynx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index a95326a14a..253f1e6d7a 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -10,7 +10,7 @@ LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
 LYNX_LICENSE = GPL-2.0
 LYNX_LICENSE_FILES = COPYING
 
-LYNX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+LYNX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 LYNX_DEPENDENCIES += ncurses
