From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:47:30 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/qt5base: fix
 qmake parallel build
Message-ID: <20190426130223.6D7527F9E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2800c4e7a1b07bd44ff7a2daf3a600097cd0a5f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

When configuring qt5base, qmake is built, but it's not built in parallel
mode. This is due to MAKEFLAGS having 2 dashes on its tail, so this:
MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)"
expands in this(i.e. 5 njobs):
MAKEFLAGS="--no-print-directory -- -j5"
and -j5 gets ignored due to "--" preceeding -j5.
Double dashes are part of $(MAKEFLAGS) only when evaluated by shell.

Swap $(MAKEFLAGS) and -j$(PARALLEL_JOBS) to avoid having "--" before
-j$(PARALLEL_JOBS), this way -j$(PARALLEL_JOBS) won't be ignored by
./configure.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a1c175cc9ecc411305dc6f0979f0dd262f2c8d5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e7f6e658f1..1c20b67e4b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -318,7 +318,7 @@ define QT5BASE_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
+		MAKEFLAGS="-j$(PARALLEL_JOBS) $(MAKEFLAGS)" \
 		./configure \
 		-v \
 		-prefix /usr \
