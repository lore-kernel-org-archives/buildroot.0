From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat,  4 Feb 2017 14:42:10 +0100
Subject: [Buildroot] [PATCHv2 06/10] toolchain-external: simplify
	previously-broken symbolic links
In-Reply-To: <20170204134214.20592-1-patrickdepinguin@gmail.com>
References: <20170204134214.20592-1-patrickdepinguin@gmail.com>
Message-ID: <20170204134214.20592-7-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

A previous commit rewrote broken symbolic links in staging, caused by a
non-singular ARCH_LIB_DIR. In this case, the symbolic links are typically
using one or more intermediate directory symlinks, which can be simplified
using the newly introduced simplify_symlink helper.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: new patch

 toolchain/helpers.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 0acbb52..611aaab 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -63,6 +63,8 @@ copy_toolchain_lib_root = \
 # components, as links to the current directory are always fine.
 # We need to fix the broken links by removing the right amount of ../
 # dots from the link destination.
+# Once the link destination is valid again, it can be simplified to
+# remove the dependency on intermediate directory symlinks.
 #
 # It is possible that ARCH_LIB_DIR does not contain the dynamic loader
 # (ld*.so or similar) because it (or the main symlink to it) normally
@@ -126,6 +128,7 @@ copy_toolchain_sysroot = \
 			LINKTARGET=`readlink $$i` ; \
 			NEWLINKTARGET=$${LINKTARGET\#$$relpath} ; \
 			ln -sf $${NEWLINKTARGET} $$i ; \
+			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
 	if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so ]; then \
-- 
2.10.2
