Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D14C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E6B3813C2;
	Sun, 11 Dec 2022 16:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E6B3813C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knjLuR29EWjF; Sun, 11 Dec 2022 16:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 931CC813C3;
	Sun, 11 Dec 2022 16:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 931CC813C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C84B71BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A38D34026A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A38D34026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2sGvkEMNiuf8 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:36:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E89B640241
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E89B640241
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D54E686488; Sun, 11 Dec 2022 16:36:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:32:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7c20ad548818fad6924f19e31ef2defdc418875
X-Git-Newrev: 22bdfbdfc72681f552ae346a110d81b98ec477e3
X-Patchwork-Hint: ignore
Message-Id: <20221211163647.D54E686488@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tealdeer: exclude unsupported
 targets
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
