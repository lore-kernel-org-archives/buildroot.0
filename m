Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA3AC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624A04EDAE;
	Mon, 20 Feb 2023 22:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624A04EDAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ss0hl-4bULQ; Mon, 20 Feb 2023 22:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E7E04F2E5;
	Mon, 20 Feb 2023 22:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E7E04F2E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62BC21BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77AB46107C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77AB46107C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pldgMBGmniCU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81FE9611C8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FE9611C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CF378648F; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:32:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e7c20ad548818fad6924f19e31ef2defdc418875
X-Git-Newrev: 22bdfbdfc72681f552ae346a110d81b98ec477e3
X-Patchwork-Hint: ignore
Message-Id: <20230220205207.7CF378648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tealdeer: exclude
 unsupported targets
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

commit: https://git.buildroot.net/buildroot/commit/?id=22bdfbdfc72681f552ae346a110d81b98ec477e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Not all target architectures are supported by the "ring" dependency:
  - mips:    https://github.com/briansmith/ring/issues/562
  - PowerPC: https://github.com/briansmith/ring/issues/389
  - Sparc:   https://github.com/briansmith/ring/issues/1512
  - s390x:   https://github.com/briansmith/ring/commit/4d2e1a8fb80398f7c3c0137ea8fdd512f82d37a0

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tealdeer/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tealdeer/Config.in b/package/tealdeer/Config.in
index 96ed81614b..662a937ce1 100644
--- a/package/tealdeer/Config.in
+++ b/package/tealdeer/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_TEALDEER
 	bool "tealdeer"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# Crypto dependency (ring) not available for mips, PowerPC, Sparc, s390x
+	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
+	depends on !(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)
+	depends on !(BR2_sparc || BR2_sparc64)
+	depends on !BR2_s390x
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  A fast and full-featured tldr client. tldr pages are
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
