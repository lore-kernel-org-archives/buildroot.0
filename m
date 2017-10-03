From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 3 Oct 2017 11:37:37 +0300
Subject: [Buildroot] [PATCH] vboot-utils: disable static futility
Message-ID: <20171003083737.GA3986@latitude.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Possibly fixes
http://autobuild.buildroot.net/results/fbe/fbe7892539cc1bf18f89d18c6609a5aa747647d0/
http://autobuild.buildroot.net/results/4bc/4bc388618ff02dde26ae09db021434a936c8cc1b/
and similar errors.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
Please note this is a blind fix. I cannot reproduce the build errors,
which all happen on the same build node, and I cannot verify that
the patch does in fact fix them. 

It's probably still a good idea to avoid unnecessary static linking
in a host package.

 .../vboot-utils/0004-Disable-static-futility.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/vboot-utils/0004-Disable-static-futility.patch

diff --git a/package/vboot-utils/0004-Disable-static-futility.patch b/package/vboot-utils/0004-Disable-static-futility.patch
new file mode 100644
index 0000000000..574476d340
--- /dev/null
+++ b/package/vboot-utils/0004-Disable-static-futility.patch
@@ -0,0 +1,30 @@
+The package attempts to build a statically-linked host binary, futility_s,
+which is not used anywhere in buildroot but may be causing build failures
+if the build host lacks static libc.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/Makefile
++++ b/Makefile
+@@ -1079,7 +1079,7 @@
+ # new Firmware Utility
+ 
+ .PHONY: futil
+-futil: ${FUTIL_STATIC_BIN} ${FUTIL_BIN}
++futil: ${FUTIL_BIN}
+ 
+ ${FUTIL_STATIC_BIN}: ${FUTIL_STATIC_OBJS} ${UTILLIB}
+ 	@${PRINTF} "    LD            $(subst ${BUILD}/,,$@)\n"
+@@ -1091,10 +1091,10 @@
+ 	${Q}${LD} -o $@ ${CFLAGS} ${LDFLAGS} $^ ${LDLIBS}
+ 
+ .PHONY: futil_install
+-futil_install: ${FUTIL_BIN} ${FUTIL_STATIC_BIN}
++futil_install: ${FUTIL_BIN}
+ 	@${PRINTF} "    INSTALL       futility\n"
+ 	${Q}mkdir -p ${UB_DIR}
+-	${Q}${INSTALL} -t ${UB_DIR} ${FUTIL_BIN} ${FUTIL_STATIC_BIN}
++	${Q}${INSTALL} -t ${UB_DIR} ${FUTIL_BIN}
+ 	${Q}for prog in ${FUTIL_SYMLINKS}; do \
+ 		ln -sf futility "${UB_DIR}/$$prog"; done
+ 
-- 
2.14.1
