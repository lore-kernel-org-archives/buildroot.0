Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CDDE7718B
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 13:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA7C424DF;
	Fri, 20 Dec 2024 13:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0I_BOFsQADnx; Fri, 20 Dec 2024 13:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 231EC424E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 231EC424E0;
	Fri, 20 Dec 2024 13:31:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6683920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2E65409FB
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBogIPAra0xk for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 13:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6677140A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6677140A82
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6677140A82
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:09 +0000 (UTC)
X-CSE-ConnectionGUID: vw3tC5RGR/OQt+O4IimG/g==
X-CSE-MsgGUID: eIPKOh3MTbiKXdDWp6mmew==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:31:08 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:31:08 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Dec 2024 14:31:07 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Dec 2024 14:31:06 +0100
X-CSE-ConnectionGUID: +lFMhbU8RIGDKnOyEf50Ug==
X-CSE-MsgGUID: DJYzQdM+Qri+78ygtORd6g==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; d="scan'208";a="231590012"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 20 Dec 2024 14:31:01 +0100
Message-ID: <d4046a8cba40f184e97f878ed96676d44af9c04a.1734701459.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734701459.git.yann.morin@orange.com>
References: <cover.1734701459.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734701469; x=1766237469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qZolSWnS/k9Dv00GK5/FNvMmElwVbKtq23c/92KSq2k=;
 b=QI2bbFX5nTjzSEazrBDCrzaZQmCDvzzpRp/VufuEfZuCMciWa5SmzSmd
 ISrfr/T5MZPNWMSd+yuky989Eam7mfn1lxVA+OLeSrJjoDT1ctJU1Qovy
 QCbxndUf7zP3TqE4BcyGpcY7dJzo0YpGQMmuINGu+hM22EBFlsue9uOSA
 XeD4K+ZGyfaGSmh5O4g4ApE6cFipKwS+/6KvJ1cpcxWuAQusdu2ou00qv
 LsHLsu26mWogSH343Fvk1YwV1I6Vuy/6IdAAkgXDk5kcHxdFcSbOV/4S7
 Co85BY1usWPG8bN7tqBS3BEE6+cZnq6rvPsLJ0UWokscbM26a7MFzdL2V
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=QI2bbFX5
Subject: [Buildroot] [PATCH 3/5] utils/get-developers: read patch from stdin
 when it's not a tty
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

It is very common that gt-developers be used with its stdin a pipe from
git-show:
    git show |./utils-get-developers -

In this case, the '-' is superfluous: we can very easilit deduce that
the user wants to read stdin as the patch.

So, ifno otehr action was requested, and stdin is not a tty, use it as
the source of the patch, and thus '-' is then no longer required.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 utils/get-developers | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/get-developers b/utils/get-developers
index 8e5796beaf..b45e617bff 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -42,7 +42,9 @@ def __main__():
     if action > 1:
         parser.error("Cannot do more than one action")
     if action == 0:
-        parser.error("No action specified")
+        if sys.stdin.isatty():
+            parser.error("No action specified")
+        args.patches.append(sys.stdin)
 
     devs = getdeveloperlib.parse_developers(args.filename)
     if devs is None:
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
