From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 13:24:42 +0200
Subject: [Buildroot] [git commit] package/pulseaudio: update the condition
	on NLS
Message-ID: <20170705112134.9FA637FBEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=632b6f14775436ba785a1890b43bbfdf3aea9b07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the BR2_SYSTEM_ENABLE_NLS has been introduced [1], the
NLS support can be disabled when BR2_ENABLE_LOCALE is enabled.

So change BR2_ENABLE_LOCALE by BR2_SYSTEM_ENABLE_NLS and while
at it use a positive logic.

Fixes:
[nios2]  http://autobuild.buildroot.net/results/b69/b69c347e2866a97cc2c5d4844d567c4448592d72
[xtensa] http://autobuild.buildroot.net/results/b63/b63fd204fe36200ed5de70fff23cb59cf2bc778c

[1] dc057d2865afafbf76c2bc2685d2dfe852ba7c54

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 54a9a61..d6088b2 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -117,7 +117,7 @@ PULSEAUDIO_DEPENDENCIES += libxcb xlib_libSM xlib_libXtst
 
 # .desktop file generation needs nls support, so fake it for !locale builds
 # https://bugs.freedesktop.org/show_bug.cgi?id=54658
-ifneq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 define PULSEAUDIO_FIXUP_DESKTOP_FILES
 	cp $(@D)/src/daemon/pulseaudio.desktop.in \
 		$(@D)/src/daemon/pulseaudio.desktop
