From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:43:27 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] vboot-utils: disable
	static futility
Message-ID: <20171017090326.552F07FDC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3066e68a772f05b5b11425b1e5db9a5dbe8e08b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Possibly fixes
http://autobuild.buildroot.net/results/fbe/fbe7892539cc1bf18f89d18c6609a5aa747647d0/
http://autobuild.buildroot.net/results/4bc/4bc388618ff02dde26ae09db021434a936c8cc1b/
and similar errors.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3c10ba4b1eba589096447cce9b77191dc2d8388d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../vboot-utils/0004-Disable-static-futility.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/vboot-utils/0004-Disable-static-futility.patch b/package/vboot-utils/0004-Disable-static-futility.patch
new file mode 100644
index 0000000..649d316
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
