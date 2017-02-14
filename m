From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 14 Feb 2017 15:10:06 +0100
Subject: [Buildroot] [PATCH] kmsxx: fix build error for m68k/coldfire
Message-ID: <20170214141006.GA12260@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.org/results/fc8/fc820e0b558537f771588b0e1291a8332427ff8d/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/kmsxx/kmsxx.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 730292e..c06d20b 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -12,6 +12,12 @@ KMSXX_INSTALL_STAGING = YES
 KMSXX_DEPENDENCIES = libdrm host-pkgconf
 KMSXX_CONF_OPTS = -DKMSXX_ENABLE_PYTHON=OFF
 
+# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
+ifeq ($(BR2_m68k_cf),y)
+KMSXX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
+endif
+
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_TESTS = \
 	fbtestpat kmsblank kmscapture \
-- 
2.1.4
