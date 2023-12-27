Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493D0C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F31E141BAE;
	Wed, 27 Dec 2023 22:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F31E141BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsRuVU5Fxsd7; Wed, 27 Dec 2023 22:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 591A441B6C;
	Wed, 27 Dec 2023 22:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 591A441B6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 378DD1BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AE3B83A90
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE3B83A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qu1pQtxUVXNK for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:28:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EEEF83A80
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EEEF83A80
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE5D08374A; Wed, 27 Dec 2023 22:28:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 23:26:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09e61e40d27daaabd41ad180eca144dd498ec75d
X-Git-Newrev: 5020985e392907c05a66ab7d12b0406fd74ab023
X-Patchwork-Hint: ignore
Message-Id: <20231227222817.EE5D08374A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: use udev configure
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=5020985e392907c05a66ab7d12b0406fd74ab023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the udev configure option introduced with upstream commit [1] (since
version v0.1.0).

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=d314d3b98b86dec9a25ce7b829e72a790b7ead1b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/libcamera.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8b33b9e708..dd31d90e98 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -98,7 +98,10 @@ LIBCAMERA_DEPENDENCIES += tiff
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBCAMERA_CONF_OPTS += -Dudev=enabled
 LIBCAMERA_DEPENDENCIES += udev
+else
+LIBCAMERA_CONF_OPTS += -Dudev=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
