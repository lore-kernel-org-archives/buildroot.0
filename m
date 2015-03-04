From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Mar 2015 23:15:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/vlc: express the dependency on
	freerdp
In-Reply-To: <cover.1425507251.git.yann.morin.1998@free.fr>
References: <cover.1425507251.git.yann.morin.1998@free.fr>
Message-ID: <f6508071f9c26276a9840a3f197ca5a866f1039e.1425507251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vlc can use the freerdp library if present.

This is currently a hidden dependency, as we do not express it in our
vlc.mk rules. Package ordering makes it so that freerdp is built before
vlc; however, manually building vlc (with 'make vlc') would miss the
dependency because of that package ordering.

Explcitly add freerdp (if enabled) as a dependency of vlc to ensure
build order in every vases.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
1.9.1
