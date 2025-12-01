Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1858DD111A8
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 06:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E0940801;
	Mon,  1 Dec 2025 06:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojQIp08acrvT; Mon,  1 Dec 2025 06:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81073407E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81073407E1;
	Mon,  1 Dec 2025 06:57:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 829EDD3
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 06:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68E0240337
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 06:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWQhD7HVddKG for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 06:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02486400A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02486400A7
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02486400A7
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 06:57:32 +0000 (UTC)
X-CSE-ConnectionGUID: nd/1zzXwTseL/5KcU2Qo5A==
X-CSE-MsgGUID: s5EKuIYqQX2YpoJ3dm5QOw==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 01 Dec 2025 07:57:29 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Dec 2025 07:57:30 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Mon, 1 Dec 2025 07:57:28 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 01 Dec 2025 07:57:27 +0100
X-CSE-ConnectionGUID: JV4zJj+JTM6udF3xzMU+8Q==
X-CSE-MsgGUID: c0UBhr97Rka9Hg+DyUR0TQ==
X-IronPort-AV: E=Sophos;i="6.20,240,1758578400"; d="scan'208";a="363528536"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 1 Dec 2025 07:57:27 +0100
Message-ID: <91327a6c3076c7ac166f5b097c08e0e90e7cb438.1764572247.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1764572253; x=1796108253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2585XP308Nc+6prGhyR+6PJ4XS/+EN6LBhI+nUyiSMU=;
 b=DRa4KKPyolGDqdkkbVByaICnrVQqMryHe36TjAuLkdBNH9bJaQolIQjU
 UVsXEz3J2OH1Q5ryibL9NXFjt27W1O42jj9/2liQBV1JTZrvYZuPl6F3q
 7tv/dKrCywL1A6/uczI1sd3mLA380k/OTDlEvBjivnDKWw8ib2A7RvCUb
 hnO5kNMP95d1wwvVu/lthwaGxqLnqNFnA5bEXLh24An12rgbd0yxNPs7o
 ysFCGV/zlM2n8p36Lm+lh1/wq5UXeeLVWh8x+T/tRszn+mjdMF68YX6zO
 /aB/E4X9Dd4R9IxT7B0Ew1r39M7DDXTw35D8EQofetzKjCud/MolBL2yS
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=DRa4KKPy
Subject: [Buildroot] [PATCH] package/skopeo: needs NPTL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

So far, skopeo inherited the thread dependency from its runtime
dependencies. However, skopeo uses pthread_getattr_np(3), which
is only available with NPTL on uClibc. glibc and musl have had
it for ages (and only implement NPTL anyway).

Fixes: https://autobuild.buildroot.org/results/b9d123986c2a65427bfca32ee3ea792a988e6890/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
index 0de9b16047..b0229873d4 100644
--- a/package/skopeo/Config.in
+++ b/package/skopeo/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SKOPEO
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU  # btrfs-progs, libgpgme, lvm2
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
-	depends on BR2_TOOLCHAIN_HAS_THREADS  # btrfs-progs, lvm2
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS  # lvm2
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_BTRFS_PROGS
@@ -17,10 +17,10 @@ config BR2_PACKAGE_SKOPEO
 
 	  https://github.com/containers/skopeo
 
-comment "skopeo needs a toolchain w/ threads, sahred libs"
+comment "skopeo needs a toolchain w/ NPTL, sahred libs"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| BR2_STATIC_LIBS
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
