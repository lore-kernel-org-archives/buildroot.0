From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:37:28 +0200
Subject: [Buildroot] [git commit] package/xen: Include linux/limits.h when
	building QEMU inside of Xen
Message-ID: <20170729133426.081AA816A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d9a57a200d3592a80d3e9d463ba905d3fa7c505
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If building Xen and not using glibc (using musl for example) the QEMU
project inside of Xen fails to build as it relys on the XATTR_SIZE_MAX
macro which is defined in <linux/limits.h>.

Glibc includes this header indirectly but as that is not part of the
POSIX standard other libraries don't neccessearily have this. To fix the
issue we explicitly include <linux/limits.h> to ensure the build works
for all libc libraries.

Fixes:
  http://autobuild.buildroot.net/results/bb1/bb1310eb1464d880a357ae5e491fd168361d25a0

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...include-linux-limits.h-for-XATTR_SIZE_MAX.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/xen/0002-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch b/package/xen/0002-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch
new file mode 100644
index 0000000..b681b94
--- /dev/null
+++ b/package/xen/0002-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch
@@ -0,0 +1,43 @@
+Message-Id: <07010a2ad79559c412949f0005dbe3cb03d8416e.1498504812.git.ps@pks.im>
+From: Patrick Steinhardt <ps@pks.im>
+Date: Mon, 26 Jun 2017 21:20:45 +0200
+Subject: [PATCH] 9pfs: include <linux/limits.h> for XATTR_SIZE_MAX
+
+The function `v9fs_xattrcreate` makes use of the define `XATTR_SIZE_MAX`
+to reject attempts of creating xattrs with an invalid size, which is
+defined in <linux/limits.h>. On glibc-based systems, this header is
+indirectly included via <limits.h>, <bits/posix1_lim.h>,
+<bitts/local_lim.h>, but on other platforms this is not guaranteed due
+to not being part of the POSIX standard. One examples are systems based
+on musl libc, which do not include the <linux/limits.h> indirectly,
+which leads to `XATTR_SIZE_MAX` being undefined.
+
+Fix this error by directly include <linux/limits.h>. As the 9P fs code
+is being Linux-based either way, we can simply do so without breaking
+other platforms. This enables building 9pfs on musl-based systems.
+
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+[ Changes by AF
+ - Apply to the QEMU tree inside of Xen
+]
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+Upstream Status: Pending review and acceptance
+
+ tools/qemu-xen/hw/9pfs/9p.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/qemu-xen/hw/9pfs/9p.c b/tools/qemu-xen/hw/9pfs/9p.c
+index 96d2683348..48cd558e96 100644
+--- a/tools/qemu-xen/hw/9pfs/9p.c
++++ b/tools/qemu-xen/hw/9pfs/9p.c
+@@ -13,6 +13,7 @@
+ 
+ #include "qemu/osdep.h"
+ #include <glib/gprintf.h>
++#include <linux/limits.h>
+ #include "hw/virtio/virtio.h"
+ #include "qapi/error.h"
+ #include "qemu/error-report.h"
+-- 
+2.13.2
