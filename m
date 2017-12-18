From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 Dec 2017 22:49:47 +0100
Subject: [Buildroot] [PATCH 9/9] vlc: set back upnp support
Message-ID: <20171218214947.16142-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit cb7aa25df8c3c4531354fd0f7d69208f89360c7b has disabled upnp support
as --disable-upnp and --enable-upnp are both set if libupnp or libupnp18
is enabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vlc/vlc.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index febd9e0319..56bfdced53 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -281,16 +281,9 @@ else
 VLC_CONF_OPTS += --disable-theora
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+ifeq ($(BR2_PACKAGE_LIBUPNP)$(BR2_PACKAGE_LIBUPNP18),y)
 VLC_CONF_OPTS += --enable-upnp
-VLC_DEPENDENCIES += libupnp
-else
-VLC_CONF_OPTS += --disable-upnp
-endif
-
-ifeq ($(BR2_PACKAGE_LIBUPNP18),y)
-VLC_CONF_OPTS += --enable-upnp
-VLC_DEPENDENCIES += libupnp18
+VLC_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
 else
 VLC_CONF_OPTS += --disable-upnp
 endif
-- 
2.14.1
