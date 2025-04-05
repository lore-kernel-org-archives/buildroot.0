Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A933C36010
	for <buildroot@archiver.kernel.org>; Sat,  5 Apr 2025 19:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00ACB60B56;
	Sat,  5 Apr 2025 19:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKxhBrv3yXt0; Sat,  5 Apr 2025 19:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA30608C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA30608C3;
	Sat,  5 Apr 2025 19:45:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42B1E5E
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 19:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34CAC40A0C
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 19:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6FkEWLkD7Pk for <buildroot@buildroot.org>;
 Sat,  5 Apr 2025 19:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AEF840579
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AEF840579
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 19:45:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47F9983B84; Sat,  5 Apr 2025 19:45:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Apr 2025 21:32:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4430578aeb6ca460813f4ff7d833cdd839a3249
X-Git-Newrev: e22b828db6622e3c4263086c70cd7d84756b653e
X-Patchwork-Hint: ignore
Message-Id: <20250405194520.47F9983B84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: fix build failure with
 Linux 6.13.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e22b828db6622e3c4263086c70cd7d84756b653e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream to fix renaming of spi_alloc_master() into
spi_alloc_host() during Linux version 6.13.0.

Fixes:
https://autobuild.buildroot.org/results/68ce3721475d259a0db42b7ab84ef08ed7fba00c/
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/esp-hosted/0001-Fix-Linux-6.13.patch | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/esp-hosted/0001-Fix-Linux-6.13.patch b/package/esp-hosted/0001-Fix-Linux-6.13.patch
new file mode 100644
index 0000000000..98f86e8a8f
--- /dev/null
+++ b/package/esp-hosted/0001-Fix-Linux-6.13.patch
@@ -0,0 +1,35 @@
+From f41f4a55e7787c9517ca6ac72f83dc244b4011e4 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 5 Apr 2025 00:35:23 +0200
+Subject: [PATCH] Fix Linux 6.13
+
+With Linux commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0809a9ccac4a2ffdfd1561bb551aec6099775545
+spi_alloc_master() has been renamed to spi_alloc_host() so let's rename it
+accordingly checking for Linux version 6.13.0.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/589
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/spi/esp_spi.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/esp_hosted_ng/host/spi/esp_spi.c b/esp_hosted_ng/host/spi/esp_spi.c
+index 51df26d8d7..fc63487821 100644
+--- a/esp_hosted_ng/host/spi/esp_spi.c
++++ b/esp_hosted_ng/host/spi/esp_spi.c
+@@ -394,7 +394,11 @@ static struct spi_controller *spi_busnum_to_master(u16 bus_num)
+ 	pdev->num_resources = 0;
+ 	platform_device_add(pdev);
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
++	master = spi_alloc_host(&pdev->dev, sizeof(void *));
++#else
+ 	master = spi_alloc_master(&pdev->dev, sizeof(void *));
++#endif
+ 	if (!master) {
+ 		pr_err("Error: failed to allocate SPI master device\n");
+ 		platform_device_del(pdev);
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
