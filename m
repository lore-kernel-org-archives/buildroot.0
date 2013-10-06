From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 16:19:30 +0200
Subject: [Buildroot] [PATCHv2 20/21] toolchain-external: improve target
	library copy logic
In-Reply-To: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381069171-29748-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 toolchain/toolchain-external/helpers.mk | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/helpers.mk b/toolchain/toolchain-external/helpers.mk
index e7d38f2..775a9e4 100644
--- a/toolchain/toolchain-external/helpers.mk
+++ b/toolchain/toolchain-external/helpers.mk
@@ -59,21 +59,24 @@ copy_toolchain_lib_root = \
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
-- 
1.8.1.2
