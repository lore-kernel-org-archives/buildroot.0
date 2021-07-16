Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AB1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:59:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7418E60EB9
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7418E60EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E31605EF;
	Tue,  3 Aug 2021 21:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIqmvBJPEXAU; Tue,  3 Aug 2021 21:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95828605BF;
	Tue,  3 Aug 2021 21:59:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 654CF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5DE4055E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMuwVkSzhi6k for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C6BE404EB
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6757286A84; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 23:18:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f2a3cd9ac4dbd15f2c667e35332c6e80a2c03c07
X-Git-Newrev: 9905fea69ee6682fdbb3c683efc9d9cdcd672ad9
X-Patchwork-Hint: ignore
Message-Id: <20210803211004.6757286A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: virtfs needs
 system
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9905fea69ee6682fdbb3c683efc9d9cdcd672ad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

build of qemu with virtfs but without system fails since bump to version
6.0.0 in commit	6b86c9335fc3ff381878156c6243454d4b688df9:

../meson.build:1077:6: ERROR: Problem encountered: virtio-9p (virtfs) needs system emulation support

Indeed virtfs needs system support since switch to meson in
https://gitlab.com/qemu-project/qemu/-/commit/69202b406e3a42621a063c3afe80f580d343f59e

Fixes:
 - http://autobuild.buildroot.org/results/ee4b2bbc08c58dc972d285eafa43b7ad6586f270

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 3163797067..2dcf5631e5 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -82,6 +82,7 @@ config BR2_PACKAGE_HOST_QEMU_VDE2
 
 config BR2_PACKAGE_HOST_QEMU_VIRTFS
 	bool "Virtual filesystem support"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	help
 	  Enables support for virtual filesystem in Qemu allowing
 	  shared filesystem between Qemu and its emulated target.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
