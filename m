From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 16:08:30 +0200
Subject: [Buildroot] [git commit] toolchain-external: improve target library
	copy logic
Message-ID: <20131009143431.BE4A09B99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccc82214f654f7b9925ec172b4db2a13195b5837
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The copy_toolchain_lib_root function is responsible for copying a
given library (and its symbolic link) to the target filesystem. To do
so, it looks for the library in various locations, and then iterates
over the symbolic link all the way to the library, copying them as
needed to the target filesystem.

However, the latest Linaro toolchains bring an interesting use case:
the lib/ directory in the toolchain is organized as follows:

 - ld-linux.so.3 -> arm-linux-gnueabi/ld-2.17...so
 - ld-linux-armhf.so.3 -> arm-linux-gnueabihf/ld-2.17...so
 - arm-linux-gnueabi/
   - all ARMv4T soft float libraries
 - arm-linux-gnueabihf/
   - all ARMv7 hard float libraries

In order to match what we do with all other toolchains, we want all
those libraries and symbolic links to be copied directly under
$(TARGET_DIR)/lib. This commit does that by adjusting the copy logic.

This is part of the fix for bug #6452 (eglibc from Linaro 2013.07 not
copied to target correctly).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index b6fe04c..95120cd 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -60,21 +60,24 @@ copy_toolchain_lib_root = \
 			break ; \
 		fi \
 	done ; \
+	mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 	for LIBPATH in $${LIBSPATH} ; do \
-		LIBNAME=`basename $${LIBPATH}`; \
-		LIBDIR=`dirname $${LIBPATH}` ; \
-		while test \! -z "$${LIBNAME}" ; do \
-			LIBPATH=$${LIBDIR}/$${LIBNAME} ; \
+		while true ; do \
+			LIBNAME=`basename $${LIBPATH}`; \
+			LIBDIR=`dirname $${LIBPATH}` ; \
+			LINKTARGET=`readlink $${LIBPATH}` ; \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
-			mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 			if test -h $${LIBPATH} ; then \
-				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/; \
+				ln -sf `basename $${LINKTARGET}` $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME} ; \
 			elif test -f $${LIBPATH}; then \
 				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			else \
 				exit -1; \
 			fi; \
-			LIBNAME="`readlink $${LIBPATH}`"; \
+			if test -z "$${LINKTARGET}" ; then \
+				break ; \
+			fi ; \
+			LIBPATH="`readlink -f $${LIBPATH}`"; \
 		done; \
 	done; \
  \
