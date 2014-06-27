From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 26 Jun 2014 22:24:53 -0700
Subject: [Buildroot] [PATCH v2 10/11] imx-vpu: fix IOSystemInit failure
In-Reply-To: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403846694-21974-11-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buffer address can be < 0 when using a 3G/1G split which makes
IOSystemInit fail. Fix the test by checking against -1 instead.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 ...-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch

diff --git a/package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch b/package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch
new file mode 100644
index 0000000..d8d2a69
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch
@@ -0,0 +1,24 @@
+[PATCH] vpu-io: fix IOSystemInit failure
+
+buffer address can be < 0 when using a 3G/1G split which makes
+IOSystemInit fail. Fix the test by checking against -1 instead.
+
+Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
+---
+ vpu/vpu_io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/vpu/vpu_io.c b/vpu/vpu_io.c
+index 8cbb571..14759da 100644
+--- a/vpu/vpu_io.c
++++ b/vpu/vpu_io.c
+@@ -265,7 +265,7 @@ int IOSystemInit(void *callback)
+ 		goto err;
+ 	}
+ 
+-	if (IOGetVirtMem(&bit_work_addr) <= 0)
++	if (IOGetVirtMem(&bit_work_addr) == -1)
+ 		goto err;
+ #endif
+ 	UnlockVpu(vpu_semap);
+
-- 
2.0.0
