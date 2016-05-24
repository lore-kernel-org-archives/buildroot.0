From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 17:43:11 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: add explicit handling
	for xwayland
Message-ID: <20160524154355.EEB2E81E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1370fcaeb7c88e958a967594596769c71a4526f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's normally autodetected, which can lead to unexpected/unhandled
results.
configure checks for libdrm, libepoxy and wayland, however a proper
libxcomposite check is missing thus it can lead to build failure under
some odd conditions.
There's no autobuilder failure to quote here, however there's a mailing
list post that exemplifies this:
http://lists.busybox.net/pipermail/buildroot/2016-May/161793.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 31f6d0d..69e9151 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -80,6 +80,14 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 	--disable-systemd-logind
 endif
 
+# Xwayland support needs libdrm, libepoxy, wayland and libxcomposite
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),yyyy)
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-wayland
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm libepoxy wayland xlib_libXcomposite
+else
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-wayland
+endif
+
 # Present protocol only required for xserver 1.15+, but does not matter if
 # enabled for older versions as they don't use it (not even optionally).
 ifeq ($(BR2_PACKAGE_XPROTO_PRESENTPROTO),y)
