From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 May 2018 12:11:01 +0200
Subject: [Buildroot] [PATCH 1/1] woff2: fix build on m68k
Message-ID: <20180510101101.22094-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Same issue on woff2 than in some other packages such as lcdapi: see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509

Fixes:
 - http://autobuild.buildroot.net/results/6c97a08e6ca2e914d54fbb525b3f0bb90023ef07

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/woff2/woff2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/woff2/woff2.mk b/package/woff2/woff2.mk
index b2ff33fe98..2f0206c82b 100644
--- a/package/woff2/woff2.mk
+++ b/package/woff2/woff2.mk
@@ -21,4 +21,10 @@ ifneq ($(BR2_SHARED_LIBS),y)
 WOFF2_CONF_OPTS += -DCMAKE_SKIP_RPATH=ON
 endif
 
+# Internal error, aborting at dw2gencfi.c:215 in emit_expr_encoded
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
+ifeq ($(BR2_m68k_cf),y)
+WOFF2_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
+endif
+
 $(eval $(cmake-package))
-- 
2.14.1
