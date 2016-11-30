From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 23:40:51 +0100
Subject: [Buildroot] [git commit branch/next] xterm: depend on libXinerama
	if appropriate
Message-ID: <20161130224055.AE525819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6013266e58fccb59a406d45648985e307111445a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

xterm may depends on libXinerama.so:

$ arm-linux-readelf -d ./usr/bin/xterm | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libXft.so.2]
 0x00000001 (NEEDED)                     Shared library: [libfontconfig.so.1]
 0x00000001 (NEEDED)                     Shared library: [libXmu.so.6]
 0x00000001 (NEEDED)                     Shared library: [libXaw.so.7]
 0x00000001 (NEEDED)                     Shared library: [libXt.so.6]
 0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
 0x00000001 (NEEDED)                     Shared library: [libXinerama.so.1]
 0x00000001 (NEEDED)                     Shared library: [libXpm.so.4]
 0x00000001 (NEEDED)                     Shared library: [libICE.so.6]
 0x00000001 (NEEDED)                     Shared library: [libncursesw.so.6]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]

However, build order with libXinerama is not defined.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xterm/xterm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index eba781f..645de92 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -22,4 +22,11 @@ else
 XTERM_CONF_OPTS += --disable-freetype
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+XTERM_DEPENDENCIES += xlib_libXinerama
+XTERM_CONF_OPTS += --with-xinerama
+else
+XTERM_CONF_OPTS += --without-xinerama
+endif
+
 $(eval $(autotools-package))
