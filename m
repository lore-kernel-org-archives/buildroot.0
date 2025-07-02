Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D12C83F05
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 13:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C912641588;
	Wed,  2 Jul 2025 13:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7A6oQdP3TN2N; Wed,  2 Jul 2025 13:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F0541870
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F0541870;
	Wed,  2 Jul 2025 13:07:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F319196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 417498440A
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwzbH0mSolcx for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 13:07:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E003843A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E003843A4
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E003843A4
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:28 +0000 (UTC)
X-CSE-ConnectionGUID: HNxSgHzbQuOOevLMXbY/YQ==
X-CSE-MsgGUID: e5ydfqIFQLikdftKt7Ryvw==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:07:26 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jul 2025 15:07:26 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Wed, 2 Jul 2025 15:07:24 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 02 Jul 2025 15:07:24 +0200
X-CSE-ConnectionGUID: /fC+69BCQGW1Gi2YnxZH4g==
X-CSE-MsgGUID: AlY1VupcT/KGrQuWK2I3FQ==
X-IronPort-AV: E=Sophos;i="6.16,281,1744063200"; d="scan'208";a="304801095"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Wed, 2 Jul 2025 15:07:22 +0200
Message-ID: <45b9b1cc3eac6c9834c5bd9f06463694ffae638b.1751461630.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751461630.git.yann.morin@orange.com>
References: <cover.1751461630.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751461648; x=1782997648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6x7hBp1PC5j5mtSGE4oVMGayzbWnNXrcYaSqRgzXysg=;
 b=gftJAFrKctj5JKTUHUg+0BMP79+EX3TZbJDiVai4CV2v4ESIEc47UpgI
 B0vj760xDztQaFGfh3D9G86fOswx8tq6uDJwTYNcYz2cPHi/CNrEZnAB3
 efhjUccOpb4shb3CJbc01aan33Hqs2QLsyhrJnBiMb3qf+5j4v0ZFU98C
 lcOJ+3bfAEpzCHGIOdYY1FEmeUElgClD5hZ40FjCX6Z+u32ji10ju+QaH
 TnM5sA9YT/nAoyD8OTmI215c9Wiivyx8nS3yTUcaA1cezZECmi14GEZSL
 PRLd+rFuwyO/bZMlzqa6xXbqxr5E4/m7lPoaWX46rPb70OcB671F3vfSR
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=gftJAFrK
Subject: [Buildroot] [PATCH 2/2] package/cni-plugins: bump to version 1.7.1
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

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/cni-plugins/cni-plugins.hash | 2 +-
 package/cni-plugins/cni-plugins.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
index 5de05b8ba1..48d3ab214d 100644
--- a/package/cni-plugins/cni-plugins.hash
+++ b/package/cni-plugins/cni-plugins.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f9871b9f6ccb51d2b264532e96521e44f926928f91434b56ce135c95becf2901  cni-plugins-1.3.0-go2.tar.gz
+sha256  95b639f8ccbb714da98e331ef8813f790d447fce5417f2f8a575f3c62bfb1474  cni-plugins-1.7.1-go2.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index 6d6260fa7c..d682053e75 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CNI_PLUGINS_VERSION = 1.3.0
+CNI_PLUGINS_VERSION = 1.7.1
 CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
 CNI_PLUGINS_LICENSE = Apache-2.0
 CNI_PLUGINS_LICENSE_FILES = LICENSE
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
