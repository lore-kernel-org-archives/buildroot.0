Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32CBC433FE
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 813868299E;
	Sun, 22 May 2022 10:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92HyIIsGVtr9; Sun, 22 May 2022 10:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A81A382951;
	Sun, 22 May 2022 10:22:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29FD81BF963
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18C064152B
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wH1CsBK9Uvo7 for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 247D24152D
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8429585FD5; Sun, 22 May 2022 10:10:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:07:24 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f56e0361c5493cf0b3d0c02fe570ac609c372841
X-Git-Newrev: 7deb822467aa93c87b0e2803d9bc91483954a414
X-Patchwork-Hint: ignore
Message-Id: <20220522101055.8429585FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/avrdude: spi
 needs headers >= 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=7deb822467aa93c87b0e2803d9bc91483954a414
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 114487dfd2fbd6c54155a5d58d46aa52ad4869de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
