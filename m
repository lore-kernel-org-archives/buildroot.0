From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 21:33:04 +0200
Subject: [Buildroot] [git commit] toolchain: copy_toolchain_lib_root:
	clarify logic
Message-ID: <20170405195202.75ACD804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d34e02a6578baa5c5ebe1a9f08654bdf3d079fdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

copy_toolchain_lib_root has slightly different logic depending on the type
of library object: file or link. All actions related to links are not
relevant in case you are working with a file. Hence, try to increase clarity
by not executing unnecessary lines in the 'file' case.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 319fbd4..0ec9da4 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -17,19 +17,17 @@ copy_toolchain_lib_root = \
 		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 		while true ; do \
 			LIBNAME=`basename $${LIBPATH}`; \
-			LINKTARGET=`readlink $${LIBPATH}` ; \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			if test -h $${LIBPATH} ; then \
+				LINKTARGET=`readlink $${LIBPATH}` ; \
 				ln -sf `basename $${LINKTARGET}` $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME} ; \
+				LIBPATH="`readlink -f $${LIBPATH}`"; \
 			elif test -f $${LIBPATH}; then \
 				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
+				break ; \
 			else \
 				exit -1; \
 			fi; \
-			if test -z "$${LINKTARGET}" ; then \
-				break ; \
-			fi ; \
-			LIBPATH="`readlink -f $${LIBPATH}`"; \
 		done; \
 	done
 
