From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Nov 2014 22:45:02 +0100
Subject: [Buildroot] [git commit] xorg-server: needs mmu
Message-ID: <20141124214635.AF1957FED8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c00cd1c31e15daa299e0adc8cab705f03f2bf67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

os/utils.c::System() unconditionally uses fork(), so it only builds on
configurations with mmu.

(Indirectly) fixes:
http://autobuild.buildroot.net/results/497/4970352598a68d7af89acbb33cdf69d656e23f4d/
http://autobuild.buildroot.net/results/d27/d279dc35bff53b7f939af02bee70b1ed3014e49b/
http://autobuild.buildroot.net/results/84b/84b8f19221a5c841de3016959c99b92c96c57e81/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 5581240..bf9f820 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -50,13 +50,14 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	depends on !BR2_avr32
+	depends on BR2_USE_MMU # fork()
 	help
 	  X.Org X server
 
 	  http://xorg.freedesktop.org
 
 comment "xorg-xserver is BROKEN on AVR32"
-	depends on BR2_avr32
+	depends on BR2_avr32 && BR2_USE_MMU
 
 if BR2_PACKAGE_XSERVER_XORG_SERVER
 
