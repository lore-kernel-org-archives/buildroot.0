From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:26 +0100
Subject: [Buildroot] [PATCH 25/52] package/dahdi-tools: add USB support
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <08cc950c1c63a3a801bb6a3129bfb91924e5a0cf.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dahdi-tools can use either libusb-1.0.x or libusb-0.1.x, and Buildroot
packages both, respectively as libusb and as libusb-compat.

However, the terminology used by dahdi-tools is a little bit confusing.
dahdi-tools references libusb-1.0.x as libusbx, while it knows
libusb-0.1.x as just plain libusb.

So, here's a samll summary table;

    Those tools   |       libusb version        |
    know it as... | 0.1.x         | 1.0.x       |
    --------------+---------------+-------------+
    Buildroot     | libusb-compat | libusb      |
    dahdi-tools   | libusb        | libusbx     |

However, in Buildroot, libusb-compat (0.1.x) depends on libusb (1.0.x).
So, whenever libusb-compat is enabled, we can be sure that libusb is
enabled too.

So, from the perspective of dahdi-tools, we need not care about libusb
(0.1.x) since we will always have libusbx (1.0.x).

Ergo, we only care about Buildroot libusb (1.0.x) to decide whether or
not to enable USB support in dahdi-tools with libusbx, while libusb is
always disabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dahdi-tools/dahdi-tools.mk | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
index e97d944..3930968 100644
--- a/package/dahdi-tools/dahdi-tools.mk
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -21,12 +21,37 @@ DAHDI_TOOLS_CONF_ENV = PERL=/usr/bin/perl
 
 DAHDI_TOOLS_CONF_OPTS = \
 	--without-newt \
-	--without-usb \
 	--without-pcap \
-	--without-libusbx \
 	--without-libusb \
 	--without-selinux \
 	--without-ppp \
 	--with-perllib=/usr/lib/perl5/$(PERL_VERSION)
 
+# dahdi-tools can use either libusb-1.0.x (libusb in Buildroot)
+# or libusb-0.9.x (libusb-compat in Buildroot). The former is
+# enabled using --with-libusbx, while the latter is enabled using
+# --with-libusb. Both require --with-usb for USB support to be
+# effectively enabled.
+#
+# Note: libsubx was a fork of libusb, which was merged back into
+# libusb for the 1.0.18 release in early 2014, but it looks like
+# dahdi-tools uses the libusbx vs. libusb to differentiate whether
+# to use the 1.0.x vs. 0.9.x libusb. Since in Buildroot, libusb-compat
+# anyway depends on libusb, presence of libusb-compat means that
+# libusb is enabled, so we only support libusb for dahdi-tools.
+#
+# Yet, we must ensure build-ordering in case libusb-compat id enabled.
+#
+# Yes, this is very confusing.
+#
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+DAHDI_TOOLS_DEPENDENCIES += libusb
+DAHDI_TOOLS_CONF_OPTS += --with-usb --with-libusbx
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+DAHDI_TOOLS_DEPENDENCIES += libusb-comapt
+endif
+else
+DAHDI_TOOLS_CONF_OPTS += --without-usb --without-libusbx
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
