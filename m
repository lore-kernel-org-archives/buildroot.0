Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCCFE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 07:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 366956087B;
	Mon, 23 Dec 2024 07:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuNyLsDYqSfR; Mon, 23 Dec 2024 07:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FE5060888
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE5060888;
	Mon, 23 Dec 2024 07:27:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19F8E5E
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07E29415F6
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fhypyHZP3I9 for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 07:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9278415F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9278415F0
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9278415F0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:24 +0000 (UTC)
X-CSE-ConnectionGUID: dfLH1ZbpRiWGBQqOZfF3uQ==
X-CSE-MsgGUID: aWkMOH+uRHqNaS6foQQ8yQ==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 08:27:22 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Dec 2024 08:27:21 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 23 Dec 2024 08:27:20 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Dec 2024 08:27:20 +0100
X-CSE-ConnectionGUID: MToT+lkcRc+BIFtg4c9Myw==
X-CSE-MsgGUID: lu1cfKcfTAGxeyU7KgPk+g==
X-IronPort-AV: E=Sophos;i="6.12,256,1728943200"; d="scan'208";a="237508152"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 23 Dec 2024 08:27:16 +0100
Message-ID: <05938c936119392a3e652cbb27b55b7da436e36c.1734938835.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734938835.git.yann.morin@orange.com>
References: <cover.1734938835.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734938845; x=1766474845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g0JZOA1HC6UQlwoCED8eHiuqGm6KqtI2bWdot2McWE8=;
 b=E2VBEtQE4BpmCwzkP9l8XUZHS58ty3vZrvLLTq34bXaSy73iuI1pRp4T
 sXXFju/ynEafgCQP50LsAT3MIGjPeF31KSl7t2k0h7xqw2CDlK53c+Swy
 w3rcJ06iwZeaWfdQheBsksMbg5RiUkg6etj7K8LkEsrLen6Kcd1/X5CsX
 YTMFW7J/GNuVEMd4Fr5YL2YkZ/veLX6AQlRuoDuD5dOqcmJnZ8oumFLMe
 S7JGxZr7Y4p6aNLE1KlqN162hzIevg1esxxgOBUBDH1Svzjs/ySYBbrVp
 nnPMeKHAnuLnIdgBiqrgaTU22EbQiZnz1nnwU9y/ZllIy/LcuA0S4n8pT
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=E2VBEtQE
Subject: [Buildroot] [PATCH 1/5] utils/get-developers: don't offload
 parse_args()
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

Offloading parser.parse_args() to a helper function does not bring much,
if at all; it even is restrictive: indeed, we can't use parser.error()
to report errors and thus have to resort to a canned print+return
sequence...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 utils/get-developers | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 9ab5c4503f..33980366d6 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -5,7 +5,7 @@ import getdeveloperlib
 import sys
 
 
-def parse_args():
+def __main__():
     parser = argparse.ArgumentParser()
     parser.add_argument('patches', metavar='P', type=argparse.FileType('r'), nargs='*',
                         help='list of patches (use - to read patches from stdin)')
@@ -23,11 +23,7 @@ def parse_args():
                         const=True, help='validate syntax of DEVELOPERS file')
     parser.add_argument('-d', dest='filename', action='store', default=None,
                         help='override the default DEVELOPERS file (for debug)')
-    return parser.parse_args()
-
-
-def __main__():
-    args = parse_args()
+    args = parser.parse_args()
 
     # Check that only one action is given
     action = 0
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
