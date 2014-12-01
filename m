From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:42:44 +0100
Subject: [Buildroot] [git commit] mpd: install configuration file
	unconditionally
Message-ID: <20141201234334.A32E57FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=649a6a64290ea214a034e5fb138d5c205eb44d98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

[Peter: use install -m as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 1eedcbc..c80de41 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -228,10 +228,7 @@ MPD_CONF_OPTS += --disable-wavpack
 endif
 
 define MPD_INSTALL_EXTRA_FILES
-	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
-		$(INSTALL) -D package/mpd/mpd.conf \
-			$(TARGET_DIR)/etc/mpd.conf; \
-	fi
+	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
 endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
