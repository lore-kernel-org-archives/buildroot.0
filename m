From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  7 Feb 2017 22:56:49 +0100
Subject: [Buildroot] [PATCHv3 12/12] toolchain: copy_toolchain_lib_root:
	copy symlinks instead of recreating them
In-Reply-To: <20170207215649.364-1-patrickdepinguin@gmail.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
Message-ID: <20170207215649.364-13-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

copy_toolchain_lib_root handles symlinks by recreating them, disregarding
the original destination and assuming the destination is in the same
directory as the link itself.
When a library link points to the real library file in another directory,
for example:
    usr/lib/octeon2/libcrypt.so -> ../../../lib32/octeon2/libcrypt.so.1
then the link created by copy_toolchain_lib_root is broken.

It is more robust to copy the symlink to keep the destination intact. The
destination path should be present, possibly through other symbolic links.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v3: no changes
v2: new patch

 toolchain/helpers.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 95505aa..f97b060 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -19,8 +19,7 @@ copy_toolchain_lib_root = \
 			LIBNAME=`basename $${LIBPATH}`; \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			if test -h $${LIBPATH} ; then \
-				LINKTARGET=`readlink $${LIBPATH}` ; \
-				ln -sf `basename $${LINKTARGET}` $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME} ; \
+				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 				LIBPATH="`readlink -f $${LIBPATH}`"; \
 			elif test -f $${LIBPATH}; then \
 				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
-- 
2.10.2
