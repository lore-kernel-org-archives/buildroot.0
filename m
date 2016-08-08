From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 8 Aug 2016 06:46:17 +0200
Subject: [Buildroot] [PATCH] cairo: fix m68k uclinux compile
Message-ID: <20160808044617.GA9742@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GCC manual suggest when getting:
relocation truncated to fit: R_68K_GOT16O foobar
to use -mxgot.

Fixes:
  http://autobuild.buildroot.net/results/31a488316fe3c14729a6dd9259205f8530684cab/
  http://autobuild.buildroot.net/results/dc6b899e3e502d65b2cf2f6d922a4f63857edf82/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/cairo/cairo.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index b798995..d7e370a 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -12,6 +12,11 @@ CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 CAIRO_AUTORECONF = YES
 
+# relocation truncated to fit: R_68K_GOT16O
+ifeq ($(BR2_m68k_cf),y)
+CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
 endif
-- 
2.1.4
