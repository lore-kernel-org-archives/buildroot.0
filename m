From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 15:17:08 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] woff2: fix build on m68k
Message-ID: <20181005174039.35CCD8D2A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=486cd48f05195aae305aa3daa913f26b0f1ca72e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Same issue on woff2 than in some other packages such as lcdapi: see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509

Fixes:
 - http://autobuild.buildroot.net/results/6c97a08e6ca2e914d54fbb525b3f0bb90023ef07

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 07ce2885fd6f3cf1c9e72ec2b9a852971ce7c939)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
