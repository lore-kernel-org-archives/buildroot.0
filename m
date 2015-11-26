From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:33:18 +0100
Subject: [Buildroot] [git commit] jimtcl: fix sparc64 compile
Message-ID: <20151126213423.591967FC43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0885724fbeea6728b3503139d53b013394da7ed1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: tweak comment as suggested by Thomas]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jimtcl/jimtcl.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 4afb217..fe35223 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -46,7 +46,11 @@ define JIMTCL_CONFIGURE_CMDS
 	)
 endef
 
+# -fPIC is mandatory to build shared libraries on certain architectures
+# (e.g. SPARC) and causes no harm or drawbacks on other architectures
 define JIMTCL_BUILD_CMDS
+	SH_CFLAGS="-fPIC" \
+	SHOBJ_CFLAGS="-fPIC" \
 	$(MAKE) -C $(@D)
 endef
 
