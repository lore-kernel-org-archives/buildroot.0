From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 21:17:42 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: prevent selecting
 libffi on nds32
Message-ID: <20190417191349.8183B8E8BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e1f98d9509d869352080331e168abe5f1452e1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libffi does not have support for the nds32 architecture, so let's
disallow libffi on this CPU architecture for the moment.

Fixes:

  http://autobuild.buildroot.net/results/12803a705586e82fdfb49013da2eb3b9879ccd45/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6cb1bed214..5f3fe23260 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -264,6 +264,9 @@ def fixup_config(configfile):
     if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and \
        'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
+    if 'BR2_nds32=y\n' in configlines and \
+       'BR2_PACKAGE_LIBFFI=y\n' in configlines:
+        return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
