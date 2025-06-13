Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC6AC71135
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 05:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9854B81067;
	Fri, 13 Jun 2025 05:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eM2Dad8DXkx5; Fri, 13 Jun 2025 05:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF7C810B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF7C810B6;
	Fri, 13 Jun 2025 05:44:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E8DD183
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69E6440868
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-bM98KETH7Y for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 05:44:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9169540837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9169540837
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9169540837
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:49 +0000 (UTC)
X-CSE-ConnectionGUID: soG2QQMZTpCxmZn+4mL2pA==
X-CSE-MsgGUID: e8hGEjmsTb6eWkiKaA3SkA==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:44:48 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jun 2025 07:44:47 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 13 Jun 2025 07:44:46 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 13 Jun 2025 07:44:45 +0200
X-CSE-ConnectionGUID: A7kl22b9S2aB4piTms4DmQ==
X-CSE-MsgGUID: QVkwwiLfRHyNhuyWSe0t1Q==
X-IronPort-AV: E=Sophos;i="6.16,232,1744063200"; d="scan'208";a="297035730"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 13 Jun 2025 07:44:43 +0200
Message-ID: <afdd2f197d464b9b5d2362c62bd7173f860e704a.1749793479.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749793479.git.yann.morin@orange.com>
References: <cover.1749793479.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX408.corporate.adroot.infra.ftgroup
 (10.115.27.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1749793490; x=1781329490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JZjRIP2+t9DiiPZFLk+3TgS8zLpGfDdE8HUrU4nBK2g=;
 b=QiPzrEvRIKr71RMfHlPkGR5B5DhesFrsQzqnsEEDcWYicHLvKLAhGqap
 nhkSliTP4YzKlcrHYZQpb/5N31DQwwEHGTqvyHNc3rg4Z3xyjeIwl7BlN
 8kzmJbI5AVDYbChTELCtdE4PJBqRf9pm0zo80IGlcRqv+aLH8jzCnstL5
 RWXyAwQAQ0VKsa/1t+knNMVgoJNJy9dJhxtrUcd4Wc/L+0+rHh/l6gk/y
 rVrFvsZbHgmAtX+1vQgOwvtY+9/kE7CMqpu/MHWkeEqIz20axg8jmXNui
 K/IwxLtvccfgaGen9niVy98aJqyGrPrxOYI3kLa6UMY67cn+WFxdPAkRs
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=QiPzrEvR
Subject: [Buildroot] [PATCH 2/3] package/docker-credential-acr-env: add
 LICENSE hash
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

The hash has for the license file been missing since the package was
introduced in commit e679cd4974a9 (package/docker-credential-acr-env:
new package)

Add it now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/docker-credential-acr-env/docker-credential-acr-env.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-credential-acr-env/docker-credential-acr-env.hash b/package/docker-credential-acr-env/docker-credential-acr-env.hash
index eb1fdebbf8..d0fba05b9a 100644
--- a/package/docker-credential-acr-env/docker-credential-acr-env.hash
+++ b/package/docker-credential-acr-env/docker-credential-acr-env.hash
@@ -1,2 +1,3 @@
 # Localy computed
 sha256  deff9d133fdd87b6cbe454e82e72eb7b124d1aea330c17236e804071a446b4ae  docker-credential-acr-env-0.7.0-git4-go2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
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
