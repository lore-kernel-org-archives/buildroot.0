From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:52:45 +0100
Subject: [Buildroot] [git commit branch/2018.08.x]
 board/zynqmp/post-image.sh: support dots in DTS file names
Message-ID: <20181113225055.B6FA282BB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b22b1bb38cbe8f4e977021ad306c695c7ca24347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Some ZynqMP device trees in the kernel have a dot in their name,
for example "zynqmp-zcu102-rev1.0". The post image script
left out the part after the dot and created an invalid symlink.

Signed-off-by: Francois Beerten <fbeerten.git@colabti.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4f56655b2b7dfe753a61a48b23ee3fe62f9d12fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index 2e7bcbaab6..b2b99fed01 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -5,7 +5,7 @@
 # devicetree listed in the config.
 
 FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]]*).*"$|\1|p' \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
                ${BR2_CONFIG})
 
 [ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
