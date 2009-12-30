From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Dec 2009 13:48:02 +0100
Subject: [Buildroot] [git commit master] Makefile.autotools.in: fix libtool
	patching
Message-ID: <20091230125025.A18CD776B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=073af428efc21d7717c003e93a098d0767de3b0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes two issues with libtool patching:

- It seems like the default value for <package>_LIBTOOL_PATCH only gets
  set AFTER the ifdef check, so the conditional was never taken. Fix it
  by instead checking that it isn't explicitly set to not do the patching
  instead.
- The $i in the libtool patching for loop needed an extra level of escaping
  to work.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 09f44b4..f0f189f 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -140,12 +140,13 @@ define LIBTOOL_PATCH_HOOK
 	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" -a \
 	"$$($$(PKG)_AUTORECONF)" != "YES"; then \
 	for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
+		toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool.patch; \
 		done \
 	fi
 endef
 
-ifeq ($($(2)_LIBTOOL_PATCH),YES)
+# default values are not evaluated yet, so don't rely on this defaulting to YES
+ifneq ($($(2)_LIBTOOL_PATCH),NO)
 $(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 
-- 
1.6.3.3
