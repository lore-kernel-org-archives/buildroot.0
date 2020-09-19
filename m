From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:13:50 +0200
Subject: [Buildroot] [git commit] package/micropython: fix build with gcc 4.8
Message-ID: <20200919120439.145B08572F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50c66003673c6b84481db04ec2bda10093fd822b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

micropython uses -Wfloat-conversion since version 1.13 and
https://github.com/micropython/micropython/commit/30840ebc9925bb8ef025dbc2d5982b1bfeb75f1b

This will result in the following build failure with gcc 4.8:
arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wfloat-conversion'

To avoid this build failure, set CWARN to an empty value moreover, while
at it, move some duplicated variables under MICROPYTHON_MAKE_OPTS

Fixes:
 - http://autobuild.buildroot.org/results/6fe5a5ab91a5d235147e74461bb165ec2cfdc967

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/micropython/micropython.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 7c83b18b4e..a126b3eeae 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -23,22 +23,22 @@ endif
 
 # When building from a tarball we don't have some of the dependencies that are in
 # the git repository as submodules
-MICROPYTHON_MAKE_OPTS = MICROPY_PY_BTREE=0
-MICROPYTHON_MAKE_OPTS += MICROPY_PY_USSL=0
+MICROPYTHON_MAKE_OPTS += \
+	MICROPY_PY_BTREE=0 \
+	MICROPY_PY_USSL=0 \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
+	CWARN=
 
 define MICROPYTHON_BUILD_CMDS
 	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
 	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
-		$(MICROPYTHON_MAKE_OPTS) \
-		CROSS_COMPILE=$(TARGET_CROSS) \
-		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
+		$(MICROPYTHON_MAKE_OPTS)
 endef
 
 define MICROPYTHON_INSTALL_TARGET_CMDS
 	$(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
 		$(MICROPYTHON_MAKE_OPTS) \
-		CROSS_COMPILE=$(TARGET_CROSS) \
-		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
 		DESTDIR=$(TARGET_DIR) \
 		PREFIX=/usr \
 		install
