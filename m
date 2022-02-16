Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B70060B6A;
	Wed, 16 Feb 2022 20:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8CLh6NbJ50Mo; Wed, 16 Feb 2022 20:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A162B60B00;
	Wed, 16 Feb 2022 20:56:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EEC11BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CB8E83DFD
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qz5urQ49U_oX for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:56:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 572FD83DF9
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 979A383612; Wed, 16 Feb 2022 20:49:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:56:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bb2db8cb1ec1ad4580ccd939dfa62bd84fa3011
X-Git-Newrev: d06737b27b4f01ecb69b69ef3dcc44ca4fd7eec6
X-Patchwork-Hint: ignore
Message-Id: <20220216204910.979A383612@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusb: fix maybe-uninitialized
 error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1393560041364576283=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1393560041364576283==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d06737b27b4f01ecb69b69ef3dcc44ca4fd7eec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Initialize active_config to an invalid value to avoid the following
compilation error:

os/linux_usbfs.c: In function ‘op_get_configuration’:
os/linux_usbfs.c:1452:12: error: ‘active_config’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
 1452 |  *config = (uint8_t)active_config;

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...linux_usbfs-fix-maybe-uninitialized-error.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch b/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch
new file mode 100644
index 0000000000..e6020f466e
--- /dev/null
+++ b/package/libusb/0002-linux_usbfs-fix-maybe-uninitialized-error.patch
@@ -0,0 +1,37 @@
+From bea5891591402f14940a607eafbdcd169ff8827f Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sun, 6 Feb 2022 07:12:14 +0100
+Subject: [PATCH 2/2] linux_usbfs: fix maybe-uninitialized error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Initialize active_config to an invalid value to avoid the following
+compilation error:
+
+os/linux_usbfs.c: In function ‘op_get_configuration’:
+os/linux_usbfs.c:1452:12: error: ‘active_config’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ 1452 |  *config = (uint8_t)active_config;
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Upstream: https://github.com/libusb/libusb/pull/1062
+---
+ libusb/os/linux_usbfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libusb/os/linux_usbfs.c b/libusb/os/linux_usbfs.c
+index c300675..285d9ca 100644
+--- a/libusb/os/linux_usbfs.c
++++ b/libusb/os/linux_usbfs.c
+@@ -1429,7 +1429,7 @@ static int op_get_configuration(struct libusb_device_handle *handle,
+ 	uint8_t *config)
+ {
+ 	struct linux_device_priv *priv = usbi_get_device_priv(handle->dev);
+-	int active_config;
++	int active_config = -1; /* to please compiler */
+ 	int r;
+ 
+ 	if (priv->sysfs_dir) {
+-- 
+2.17.0
+

--===============1393560041364576283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1393560041364576283==--
