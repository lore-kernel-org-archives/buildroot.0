From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 14 Nov 2016 14:22:37 +0100
Subject: [Buildroot] [PATCH 5/6] xterm: depend on libXinerama if appropriate
In-Reply-To: <20161114132238.6569-1-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
Message-ID: <20161114132238.6569-6-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
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
-- 
2.9.3
