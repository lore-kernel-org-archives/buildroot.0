From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Sep 2019 20:53:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: fix build with gcc 4.9
Message-ID: <20190928185325.21443-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bf3b6f9f6ef39b99842b3c92495b7bf359c68158

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-mmc_cmds.c-fix-build-with-gcc-4.9.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/mmc-utils/0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch

diff --git a/package/mmc-utils/0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch b/package/mmc-utils/0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch
new file mode 100644
index 0000000000..7725f9ca5e
--- /dev/null
+++ b/package/mmc-utils/0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch
@@ -0,0 +1,37 @@
+From 6208cc78f6efd1fafc4f5bc6a487247a383df80f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 28 Sep 2019 20:44:52 +0200
+Subject: [PATCH] mmc_cmds.c: fix build with gcc 4.9
+
+Fix following error with gcc 4.9:
+
+mmc_cmds.c:1918:9: error: missing braces around initializer [-Werror=missing-braces]
+  struct rpmb_frame frame_status = {0};
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bf3b6f9f6ef39b99842b3c92495b7bf359c68158
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to linux-mmc at vger.kernel.org]
+---
+ mmc_cmds.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/mmc_cmds.c b/mmc_cmds.c
+index fb37189..6b09f26 100644
+--- a/mmc_cmds.c
++++ b/mmc_cmds.c
+@@ -1915,7 +1915,9 @@ static int do_rpmb_op(int fd,
+ 	u_int16_t rpmb_type;
+ 	struct mmc_ioc_multi_cmd *mioc;
+ 	struct mmc_ioc_cmd *ioc;
+-	struct rpmb_frame frame_status = {0};
++	struct rpmb_frame frame_status;
++
++	memset(&frame_status, 0, sizeof(frame_status));
+ 
+ 	if (!frame_in || !frame_out || !out_cnt)
+ 		return -EINVAL;
+-- 
+2.23.0
+
-- 
2.23.0
