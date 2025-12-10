Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C62FD3E77D
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E8361BB9;
	Wed, 10 Dec 2025 20:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taAhSkQ88BzB; Wed, 10 Dec 2025 20:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 289CD61BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765400125;
	bh=BfKDHn7aabUiVf0+Q4MxVk68jKfqNOhOuvGMNkOWFxI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VHNMOw6Q6ITXY80tZvTQYrhkclBTcvAsowqw93/GArSRaoOggKKcsbzLDiIR9BZa9
	 a7FmFnf1U/PPAjpyTF08JnljIN4zSS9+1kQGdDNAUe7Ip3H3FWii+V0Wtcut23uC0u
	 yOXJzCBwO8G3KRl91wSc4Qt/5rVwyRdiAFqiC3UM2BSCcikApIoj4x8CB03mjxltl/
	 CnMkfY+0s2bgBtRpV9ouxB0BvjMM+Iu41KXG8vBE2TcbPszYCSnHIPStzuDfy46Dzf
	 u5qk7johOieqpf6gwauNTBepEGbkt2+OtBcC2PPZXKoJXj5GNZ+8ogiIzSaZca9Hzg
	 bc5+IvrRZ1WqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 289CD61BC4;
	Wed, 10 Dec 2025 20:55:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 426DB2C0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B7740BF4
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKy8TmHhPXTz for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 20:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E61A4065B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E61A4065B
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 20:55:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59B3786A05; Wed, 10 Dec 2025 20:55:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Dec 2025 21:33:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4debc99097b6da64cf64ca5009b595ebc95e135
X-Git-Newrev: d655b6e4f1acda1e76f9c7deb5e0bdfd888d62cb
X-Patchwork-Hint: ignore
Message-Id: <20251210205523.59B3786A05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: fix build failure due
 to sha256_init() conflict
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d655b6e4f1acda1e76f9c7deb5e0bdfd888d62cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2025-12-10 on branch v5.2.2.4 to fix build failure due
to sha256_init() conflict with Kernel >= 6.18 introduced in Buildroot
commit [1].

Fixes:
https://autobuild.buildroot.org/results/12d0a01d3d3ea17bc99ee9aca5b50d20be83a5f4/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Julien: add comment about Kernel 6.18]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index a32f9344cc..74f12fef29 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a19791716fecbbc353632c5fd1a84bf0565f7af1ae327f0afca7328227e06df  rtl8188eu-967dbaa7dc0641042b0f103e7679cd83f9bab131.tar.gz
+sha256  bed53ce2ce2b947795f795538d823a8ecdf3845f2f7571d54ba351ddf4ddb243  rtl8188eu-2ef2819d2d3ef7701a739c66525bca4731c6abbf.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 4f767a9a02..5efa5aefec 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 967dbaa7dc0641042b0f103e7679cd83f9bab131
+RTL8188EU_VERSION = 2ef2819d2d3ef7701a739c66525bca4731c6abbf
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
