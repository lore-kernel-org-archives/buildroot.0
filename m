From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 21 Nov 2015 10:23:31 +0100
Subject: [Buildroot] [PATCH] jimtcl: fix compile problem for sparc64
Message-ID: <20151121092330.GA14832@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is general safe to use -fPIC for all architectures.
-fpic breaks sparc64 compile.

Runtime tested on Qemu ARM, MIPS and SPARC64.

Fixes:
http://autobuild.buildroot.net/results/98f391ad13f22828c022f185c0166daabdb4c1ad/

It also addresses a problem with the wrong symlink for the shared library
recognized while runtime testing.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
 package/jimtcl/jimtcl.mk |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index e79e0f6..79fa742 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -33,8 +33,8 @@ else
 JIMTCL_SHARED = --shared
 define JIMTCL_INSTALL_LIB
 	$(INSTALL) -m 0755 -D $(@D)/libjim.so.$(JIMTCL_VERSION) \
-		$(1)/usr/lib/libjim.$(JIMTCL_VERSION)
-	ln -s libjim.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so
+		$(1)/usr/lib/libjim.so.$(JIMTCL_VERSION)
+	ln -sf libjim.so.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so
 endef
 endif
 
@@ -47,6 +47,8 @@ define JIMTCL_CONFIGURE_CMDS
 endef
 
 define JIMTCL_BUILD_CMDS
+	SH_CFLAGS="-fPIC" \
+	SHOBJ_CFLAGS="-fPIC" \
 	$(MAKE) -C $(@D)
 endef
 
-- 
1.7.10.4
