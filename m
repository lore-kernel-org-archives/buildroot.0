From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Sep 2012 23:24:14 +0200
Subject: [Buildroot] [git commit] x11vnc: fix build without ipv6 support
Message-ID: <20120926212531.BF49599722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c53079fd2351b56becd1ad5eb8dcc997ac3c6f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/1119dbf055edf281451a9e4216fdebc0b07fffae/

configure script uses --without-ipv6 instead of --disable-ipv6, and configure
option is only used for libraries, not the x11vnc application.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11vnc/x11vnc.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 444a839..51ae0a0 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -11,4 +11,10 @@ X11VNC_CONF_OPT = \
 
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext
 
+ifneq ($(BR2_INET_IPV6),y)
+# configure option only used for libvncserver
+X11VNC_CONF_OPT += --without-ipv6
+X11VNC_CONF_ENV += CFLAGS='$(TARGET_CFLAGS) -DX11VNC_IPV6=0'
+endif
+
 $(eval $(autotools-package))
