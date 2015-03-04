From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:23:34 +0100
Subject: [Buildroot] [git commit] package/vlc: express the dependency on
	freerdp
Message-ID: <20150304222351.349DE81804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fd087025fd1cfe39e9c5dfaa563cb266bfe5bea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vlc can use the freerdp library if present.

This is currently a hidden dependency, as we do not express it in our
vlc.mk rules. Package ordering makes it so that freerdp is built before
vlc; however, manually building vlc (with 'make vlc') would miss the
dependency because of that package ordering.

Explcitly add freerdp (if enabled) as a dependency of vlc to ensure
build order in every cases.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 56006b5..1499f8b 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -117,6 +117,13 @@ else
 VLC_CONF_OPTS += --disable-flac
 endif
 
+ifeq ($(BR2_PACKAGE_FREERDP),y)
+VLC_CONF_OPTS += --enable-libfreerdp
+VLC_DEPENDENCIES += freerdp
+else
+VLC_CONF_OPTS += --disable-libfreerdp
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 VLC_CONF_OPTS += --enable-glx
 VLC_DEPENDENCIES += libgl
