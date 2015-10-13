From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Oct 2015 16:48:49 +0100
Subject: [Buildroot] [PATCH] mplayer: remove --enable options for dvdread
	and dvdnav
Message-ID: <1444751329-25523-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When you use --enable-<foo>, mplayer's configure forces the given thing
and skips detection. This includes looking for the include and library
paths and files. So, let's use only the --with-<foo>-config option and
let the autodetection do the rest.

If we don't do that, mplayer will fail to link when dvdread is enabled
and dvdnav isn't, because the linking libs for dvdread will not be
included. The error looks like this:

stream/stream_dvd.o: In function `open_s':
stream_dvd.c:(.text+0x2d8): undefined reference to `DVDOpen'

However, the configure script has an error that makes the
linking libs for dvdnav be included even if you pass --enable-dvdnav,
which is incorrect according to mplayer upstream policy. Given that the
dvdnav.pc file also pulls the libs for dvdread, this failure couldn't be
hightlighted when mplayer is being built with dvdnav support. But after
speaking with mplayer upstream, they agreed that including the dvdnav
libs when passing --enable-dvdnav is incorrect, and that may be removed
from configure in the future. That's why we also remove the --enable
option for dvdnav in the mplayer.mk file, to avoid the same problem we
are having right now with dvdread, but for dvdnav instead.

Fixes:

  http://autobuild.buildroot.net/results/e08/e088e8ef16b56e9c90ca95ede5bd2c921a845e51/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mplayer/mplayer.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index d896b35..bdb94f5 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -105,15 +105,13 @@ endif
 MPLAYER_CONF_OPTS += --disable-libcdio
 
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
-MPLAYER_CONF_OPTS +=  \
-	--enable-dvdread \
+MPLAYER_CONF_OPTS += \
 	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
 MPLAYER_DEPENDENCIES += libdvdread
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
-MPLAYER_CONF_OPTS +=  \
-	--enable-dvdnav \
+MPLAYER_CONF_OPTS += \
 	--with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
 MPLAYER_DEPENDENCIES += libdvdnav
 endif
-- 
1.7.1
