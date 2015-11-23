From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 23 Nov 2015 22:42:22 +0100
Subject: [Buildroot] [PATCH v2] libvips: fix compile error for sparc64
Message-ID: <20151123214222.GA8423@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following build error:
http://autobuild.buildroot.net/results/1515f070c0fd410c681fc8306700244c34eb1635/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
 - fixes suggested by Thomas Pettazoni
 - better testing done. Compiles for sparc64 and arm.
 - same issue happens with gcc 5.x
---
 package/libvips/libvips.mk |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index d6dddc8..eb034b1 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -12,6 +12,17 @@ LIBVIPS_LICENSE = LGPLv2.1+
 LIBVIPS_LICENSE_FILES = COPYING
 # We're patching gtk-doc.make, so need to autoreconf
 LIBVIPS_AUTORECONF = YES
+
+# Sparc64 compile fails, this seems to be caused by the -Os option we pass
+# by default. To fix the problem, use -O0 with no optimization instead.
+ifeq ($(BR2_sparc64),y)
+LIBVIPS_CXXFLAGS = $(filter-out -Os,$(TARGET_CXXFLAGS))
+LIBVIPS_CXXFLAGS += -O0
+else
+LIBVIPS_CXXFLAGS = $(TARGET_CXXFLAGS)
+endif
+LIBVIPS_CONF_ENV += CXXFLAGS="$(LIBVIPS_CXXFLAGS)"
+
 LIBVIPS_CONF_OPTS = \
 	--disable-introspection \
 	--without-dmalloc \
-- 
1.7.10.4
