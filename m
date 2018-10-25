From: francois.beerten at colabti.org <francois.beerten@colabti.org>
Date: Thu, 25 Oct 2018 12:05:28 +0200
Subject: [Buildroot] [PATCH] zynqmp/post-image.sh: support dots in DTS file
 names
Message-ID: <20181025100528.23093-1-francois.beerten@colabti.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Beerten <fbeerten.git@colabti.org>

Some ZynqMP device trees in the kernel have a dot in their name,
for example "zynqmp-zcu102-rev1.0". The post image script
left out the part after the dot and created an invalid symlink.

Signed-off-by: Francois Beerten <fbeerten.git@colabti.org>
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
-- 
2.11.0
