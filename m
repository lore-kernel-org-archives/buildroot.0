Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457C9CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 18:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F220360AD5;
	Sun, 17 Sep 2023 18:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F220360AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ey9a3-BqQj5W; Sun, 17 Sep 2023 18:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E846160B1E;
	Sun, 17 Sep 2023 18:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E846160B1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF3DA1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8BCD81BE3
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8BCD81BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Md13xC3FDG1N for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 18:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 603D581BD6
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 18:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 603D581BD6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A66587176; Sun, 17 Sep 2023 18:10:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 20:09:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7af8dee3a8a0559c2685237ec24f817f37669efc
X-Git-Newrev: ab91ddd8a8ebdc10fa26a6d9541cf5e50e297973
X-Patchwork-Hint: ignore
Message-Id: <20230917181011.4A66587176@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: fix HOST_PROG_SHUTDOWN
 value
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab91ddd8a8ebdc10fa26a6d9541cf5e50e297973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HOST_PROG_SHUTDOWN currently references a file that doesn't exist. Fix
by setting it to /usr/libexec/petitboot/bb-kexec-reboot, which this
package already installs but doesn't use.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/petitboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 8b4c14207e..8d220f88f4 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -21,7 +21,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
-	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
+	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
 # package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
