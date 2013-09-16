From: Greg Beresford <greg.beresford@zbdsolutions.com>
Date: Mon, 16 Sep 2013 18:39:15 +0100
Subject: [Buildroot] [PATCH] Add support for eglibc-2.17 multiarch layout,
	from Linaro 2013.07+
Message-ID: <1379353155-26459-1-git-send-email-greg.beresford@zbdsolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Henry Luis <henry@echelon.com>

Arch-specific libraries, including libc.so.6, are expected to be in a
subdirectory of /lib (e.g. /lib/arm-linux-gnueabihf). This patch
changes copy_toolchain_lib_root() in helper.mk to preserve the
toolchain sysroot's lib directory structure, except for SUPPORT_LIB_DIR
which are still copied directly under DESTDIR.

Signed-off-by: Greg Beresford <greg.beresford@zbdsolutions.com>
---
I've copied and reformatted Henry Luis' patch from the attachment to
https://bugs.busybox.net/show_bug.cgi?id=6452. I've given it a test
with Linaro ARM 2013.08 and CodeSourcery ARM 2013.05 toolchains and
it seems to work ok. It does result in a non-hf ld-linux.so being
copied in addition to the correct one on the linaro toolchain, but
the target still works. (I think that this is because buildroot checks
for both versions, and copies everything it successfully finds.)

Also, this is my first submission to anything using git. I've tried to
follow the instructions in the manual, so I hope everything is in order!

Regards
Greg

 toolchain/helpers.mk | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 0e270ee..b2b1b2f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -50,11 +50,12 @@ copy_toolchain_lib_root = \
 	LIB="$(strip $4)"; \
 	DESTDIR="$(strip $5)" ; \
  \
+	pushd $${ARCH_SYSROOT_DIR} > /dev/null; \
 	for dir in \
-		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
-		$${ARCH_SYSROOT_DIR}/usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
-		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} \
-		$${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
+		./$${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
+		./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
+		./$${ARCH_LIB_DIR} \
+		./usr/$${ARCH_LIB_DIR} \
 		$${SUPPORT_LIB_DIR} ; do \
 		LIBSPATH=`find $${dir} -maxdepth 1 -name "$${LIB}.*" 2>/dev/null` ; \
 		if test -n "$${LIBSPATH}" ; then \
@@ -66,18 +67,25 @@ copy_toolchain_lib_root = \
 		LIBDIR=`dirname $${LIBPATH}` ; \
 		while test \! -z "$${LIBNAME}" ; do \
 			LIBPATH=$${LIBDIR}/$${LIBNAME} ; \
-			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
-			mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
+			if [ "$${dir}" = "$${SUPPORT_LIB_DIR}" ]; then \
+				DDIR=$${DESTDIR} ; \
+			else \
+				DDIR=$${LIBDIR} ; \
+			fi; \
+			rm -fr $(TARGET_DIR)/$${DDIR}/$${LIBNAME}; \
+			mkdir -p $(TARGET_DIR)/$${DDIR}; \
 			if test -h $${LIBPATH} ; then \
-				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/; \
+				cp -d $${LIBPATH} $(TARGET_DIR)/$${DDIR}/; \
 			elif test -f $${LIBPATH}; then \
-				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
+				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DDIR}/$${LIBNAME}; \
 			else \
+				popd > /dev/null; \
 				exit -1; \
 			fi; \
 			LIBNAME="`readlink $${LIBPATH}`"; \
 		done; \
 	done; \
+	popd > /dev/null; \
  \
 	echo -n
 
-- 
1.8.4


 
Disclaimer: This email contains proprietary information some or all of which may be legally privileged and/or is confidential. It is for the intended recipient only. If an addressing or transmission error has misdirected this email, please notify the author by replying to this email. If you are not the intended recipient, you must not use, disclose, distribute, copy or print this email. Any views expressed in this message are those of the individual sender, except where the message states otherwise. ZBD Displays accepts no responsibility for any computer virus which might be transferred by way of this email. We may monitor all email communication through our networks. If you contact us by email, we may store your name and address to facilitate communication. ZBD Displays Ltd is registered in England and Wales, company registration number: 03929602. Registered Office: Malvern Hills Science Park, Geraldine Road, Malvern,  Worcestershire, WR14 3SZ, UK

______________________________________________________________________
This email has been scanned by the Symantec Email Security.cloud service.
For more information please visit http://www.symanteccloud.com
______________________________________________________________________
