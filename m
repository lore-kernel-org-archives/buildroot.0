From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:25:10 +0200
Subject: [Buildroot] [git commit] package/qt5base: fix qmake parallel build
Message-ID: <20190422202033.9D1AD814A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1c175cc9ecc411305dc6f0979f0dd262f2c8d5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0b45c50a66..e73b8931aa 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -324,7 +324,7 @@ define QT5BASE_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
+		MAKEFLAGS="-j$(PARALLEL_JOBS) $(MAKEFLAGS)" \
 		./configure \
 		-v \
 		-prefix /usr \
