From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 23 Nov 2015 17:48:53 +0100
Subject: [Buildroot] [PATCH] jimtcl: fix sparc64 compile
Message-ID: <20151123164853.GA29207@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is general safe to use -fPIC for all architectures.
-fpic breaks sparc64 compile.

Generally gcc just optimize position independent code
for m68k, powerpc and sparc with -fpic.
The size differences are minimal, f.e. for powerpc:
   text    data     bss     dec     hex filename
 235983    5336     684  242003   3b153 output/target/usr/lib/libjim.0.75
 236255    8456     684  245395   3be93 output/target/usr/lib/libjim.so.0.75

So instead of keeping special settings for sparc64 it would be better
to always use -fPIC in general.

Runtime tested on Qemu ARM, MIPS, PPC and SPARC64.
Fixes:
http://autobuild.buildroot.net/results/98f391ad13f22828c022f185c0166daabdb4c1ad/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/jimtcl/jimtcl.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 4afb217..50078e7 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -46,7 +46,10 @@ define JIMTCL_CONFIGURE_CMDS
 	)
 endef
 
+# -fPIC works for any architecture
 define JIMTCL_BUILD_CMDS
+	SH_CFLAGS="-fPIC" \
+	SHOBJ_CFLAGS="-fPIC" \
 	$(MAKE) -C $(@D)
 endef
 
-- 
1.7.10.4
