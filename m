Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66604C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E62D83F84;
	Fri, 13 May 2022 22:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hhXjW-wDP28; Fri, 13 May 2022 22:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C0383F80;
	Fri, 13 May 2022 22:13:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45C621BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FEFD41499
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3AYaKBMrkw8 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F8EC4095F
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 27FE085E2B; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a191d391382557dc2fbf9306c3126cf2bddcf7e1
X-Git-Newrev: cf629c4e32a95977c1297b57fd636867eec5a063
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.27FE085E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: enable for ARM only
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf629c4e32a95977c1297b57fd636867eec5a063
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xradio driver is broken for kernel configurations with disabled
power management core functionality (CONFIG_PM). The xradio package
makefile attempts to enable all the required kernel configuration
options, including CONFIG_PM. However certain architectures have
no support for CONFIG_PM. Those are or1k, nios2, csky, and more.

One possible fix would be to exclude those architectures in the
package Config.in. On the other hand, the xradio driver is rarely
used: orangepi_zero is the only such board in Buildroot. So it
makes sense to keep it simple and enable xradio only for ARM.
Any new xradio users will be considered on a case by case basis.

Fixes:
- http://autobuild.buildroot.net/results/2ad11cd7a9ca6b694854730e46260a944e8c4bac/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xr819-xradio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.in
index 9d7fa4b0f1..3d2dedf29e 100644
--- a/package/xr819-xradio/Config.in
+++ b/package/xr819-xradio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XR819_XRADIO
 	bool "xr819-xradio"
 	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 	help
 	  Wireless driver for SDIO WiFi chip XR819
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
