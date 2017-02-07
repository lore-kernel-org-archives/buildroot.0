From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  7 Feb 2017 22:56:47 +0100
Subject: [Buildroot] [PATCHv3 10/12] toolchain: copy_toolchain_lib_root:
	clarify logic
In-Reply-To: <20170207215649.364-1-patrickdepinguin@gmail.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
Message-ID: <20170207215649.364-11-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

copy_toolchain_lib_root has slightly different logic depending on the type
of library object: file or link. All actions related to links are not
relevant in case you are working with a file. Hence, try to increase clarity
by not executing unnecessary lines in the 'file' case.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v3: no changes
v2: new patch

 toolchain/helpers.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6b32a25..87733be 100644
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
 
-- 
2.10.2
