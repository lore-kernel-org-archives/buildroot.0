From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:11:01 +0100
Subject: [Buildroot] [PATCH 1/3 v2] package/x11r7: introduce X11-global
	configure options
In-Reply-To: <cover.1457719643.git.yann.morin.1998@free.fr>
References: <cover.1457719643.git.yann.morin.1998@free.fr>
Message-ID: <caa14cc0c9835ac75e291feb71c420cbe80e2e3a.1457719643.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we bumped pkgconf in the Xorg packages end up installing files in
$(TARGET_DIR)/$(SYROOT_DIR), like so:

    /home/ymorin/dev/buildroot/O/target/home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/share/fonts/X11/encodings/

This is because the various ./configure scripts ask pkg-config to get a
few variables, like the path to what Xorg calls the 'sdkdir', or the
path to the fonts directory.

It then uses those paths verbatim, to install things as:

    $(DESTDIR)/$(sdkdir)

But since pkg-config prepends the sysroot path to all the variables it
returns, we end up with such incorrect paths.

Introduce a ./configure option global to all the Xorg packages, that
overrides the autodetection, and removes the sysroot dir from such
paths.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/x11r7/x11r7.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/x11r7/x11r7.mk b/package/x11r7/x11r7.mk
index 85ecbc5..dce6732 100644
--- a/package/x11r7/x11r7.mk
+++ b/package/x11r7/x11r7.mk
@@ -1 +1,17 @@
+# Get an Xorg-related pkg-config variable, and fixup paths,
+# so they do not include the build directory.
+# $(1): pkg-config variable
+# $(2): pkg-config package
+X11R7_PKGCONFIG_VARIABLE = \
+	`$(PKG_CONFIG_HOST_BINARY) --variable=$(1) $(2) \
+	|sed -r -e 's:^$(STAGING_DIR)::'`
+
+X11R7_CONF_OPTS = \
+	--with-xorg-conf-dir=$(call X11R7_PKGCONFIG_VARIABLE,sysconfigdir,xorg-server) \
+	--with-appdefaultdir=$(call X11R7_PKGCONFIG_VARIABLE,appdefaultdir,xt) \
+	--with-fontrootdir=$(call X11R7_PKGCONFIG_VARIABLE,fontrootdir,fontutil) \
+	--with-fc-confdir=$(call X11R7_PKGCONFIG_VARIABLE,confdir,fontconfig) \
+	--with-cursordir=$(call X11R7_PKGCONFIG_VARIABLE,icondir,xcursor) \
+	--with-sdkdir=$(call X11R7_PKGCONFIG_VARIABLE,sdkdir,xorg-server)
+
 include $(sort $(wildcard package/x11r7/*/*.mk))
-- 
1.9.1
