Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF430E7718D
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 13:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7386183BE0;
	Fri, 20 Dec 2024 13:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3OlnG685nEx; Fri, 20 Dec 2024 13:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D5FA83D57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D5FA83D57;
	Fri, 20 Dec 2024 13:31:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0013920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81259424DF
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8coXl7DxMWE for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 13:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D8BB424E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D8BB424E0
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D8BB424E0
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:09 +0000 (UTC)
X-CSE-ConnectionGUID: bsTn2KkpQTOM50tp4wIVkw==
X-CSE-MsgGUID: RzNHrGT+TIOhIPIbCKiROQ==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:31:08 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:31:07 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Dec 2024 14:31:05 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Dec 2024 14:31:05 +0100
X-CSE-ConnectionGUID: 2OPqKOa0QwivqAOY2+z9Dw==
X-CSE-MsgGUID: ZXa8pw1BRCWdaMFLQGn/aA==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; d="scan'208";a="231208064"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 20 Dec 2024 14:31:00 +0100
Message-ID: <66affdb182eb8f587dea7762cee43f0c203a7ba0.1734701459.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734701459.git.yann.morin@orange.com>
References: <cover.1734701459.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX108.corporate.adroot.infra.ftgroup (10.115.27.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734701470; x=1766237470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVi+00O69TYNK/wSCsNnXo8JseOhj9dJsRDfvmnp6rs=;
 b=n6I3StLz5+UI6gFU7R7gDioehDuM3zmpFgJcPOD7iSYebOoI2fQ9KkJD
 g0aCM+WvnRBBw13vKiVMFpsc6orwsEbsQE5zdlyJnL0XZGANxsjX3MDVj
 SqUuY4G8Ekt3gp6aaQYsJpI2rsuiejFo1k+q8ivr6f3fjqztpNzBOLdX2
 2B3n/ZFdMr7/EPXe9nc+qm7/evnNB1XFboVEd3HoeVYRDa/AuMBCIOI7f
 YCthx1YlIy5+qmJVYRd6pWQNWM35u1x0qjQXixR2PVlLO1rxJhIkDPtSu
 Yci/qNcTPgfBCLI70/yfQGJPCeDj8HNSrR/Lo3R9EU/Li/nmSUiHUnQL7
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=n6I3StLz
Subject: [Buildroot] [PATCH 2/5] utils/get-developers: use parser.error
 rather than canned print+return
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
---
 utils/get-developers | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 33980366d6..8e5796beaf 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -40,11 +40,9 @@ def __main__():
     if len(args.patches) != 0:
         action += 1
     if action > 1:
-        print("Cannot do more than one action")
-        return
+        parser.error("Cannot do more than one action")
     if action == 0:
-        print("No action specified")
-        return
+        parser.error("No action specified")
 
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
