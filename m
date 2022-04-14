Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87674C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 250F040B74;
	Thu, 14 Apr 2022 20:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASlQuQ1NhQTk; Thu, 14 Apr 2022 20:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2443840B67;
	Thu, 14 Apr 2022 20:25:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8231BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 598F083F85
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRx1goYjbv0B for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:25:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9482983EB9
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:25:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3D31F83D27; Thu, 14 Apr 2022 20:15:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:25:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7db306b4d341223bb856222a1edf57d96684592
X-Git-Newrev: 114487dfd2fbd6c54155a5d58d46aa52ad4869de
X-Patchwork-Hint: ignore
Message-Id: <20220414201547.3D31F83D27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: spi needs headers >= 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=114487dfd2fbd6c54155a5d58d46aa52ad4869de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SPI unconditionally uses GPIOHANDLE_SET_LINE_VALUES_IOCTL which is only
available since kernel 4.8 and
https://github.com/torvalds/linux/commit/d7c51b47ac11e66f547b55640405c1c474642d72
resulting in the following build failure since switch to upstream in
commit 03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a:

linuxspi.c: In function 'linuxspi_reset_mcu':
linuxspi.c:102:28: error: storage size of 'data' isn't known
     struct gpiohandle_data data;
                            ^~~~
linuxspi.c:110:32: error: 'GPIOHANDLE_SET_LINE_VALUES_IOCTL' undeclared (first use in this function)
     ret = ioctl(fd_linehandle, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/769021040e5e9293584734e4f461baeaa6dd91cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/avrdude/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 89558a5ff5..cbbd076667 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -20,10 +20,10 @@ if BR2_PACKAGE_AVRDUDE
 config BR2_PACKAGE_AVRDUDE_SPI
 	bool "SPI support"
 	default y # Backward compatibility
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 
-comment "SPI support needs a toolchain w/ linux headers >= 4.6"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+comment "SPI support needs a toolchain w/ linux headers >= 4.8"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
