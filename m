Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6E0E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 13:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27BC83BBC;
	Fri, 20 Dec 2024 13:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQKdsoxLTc-a; Fri, 20 Dec 2024 13:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 549E283BC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 549E283BC2;
	Fri, 20 Dec 2024 13:31:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DAFCC920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C89FC413BF
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wXaV00xN6bv for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 13:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 756F1409FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 756F1409FB
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 756F1409FB
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:08 +0000 (UTC)
X-CSE-ConnectionGUID: r9q1Mt+nRzuSTjZCWhgBlw==
X-CSE-MsgGUID: /LvDBkOfSn6LvulKxFjqSQ==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:31:05 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:31:05 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Dec 2024 14:31:04 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Dec 2024 14:31:03 +0100
X-CSE-ConnectionGUID: +8t82uibQi2b6vZTxMHvyw==
X-CSE-MsgGUID: /nF4H2EkQUewxtJPKFnH1Q==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; d="scan'208";a="231589901"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 20 Dec 2024 14:30:59 +0100
Message-ID: <810ecf35a63d244332fd67ee09837ceb1b5bd982.1734701459.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734701459.git.yann.morin@orange.com>
References: <cover.1734701459.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734701468; x=1766237468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dSQulYif5t13JYZNmag9SrHLR6vNuzQahdMPZ7scEJE=;
 b=WHq7I5GgWK8ecSQ0aBqSVb2jQ00DpuwCmjsF9ESgDGY4hXiK/b7+aHYc
 mfei4YOvOBhhop+EwoAc7xaIYmPXshknKmugugLTkRJ5b2TawOtQwWzPN
 lk2XIOhDKIk8PNShk2mpsZdXWGWOuhCx9A9wOEJYwX8Ee5FtNDuyzW+XI
 igbQC2ImRmqW3sWBnOYXtf8FGemWx4pC6/uege+9ITaFXGZGH/Q6q753z
 5qcAOGOvKAhsbQ9a0S9Yl68UdoWWMT34AGGwxpRKpPwOwvZZCLqlXwweG
 Cdv3RJdqu41OTLBD6AIKI5gMJk6SLrSQ1L79gW81TFEUFQpz9O7UCq/g/
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=WHq7I5Gg
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
if at all; it even is restrictive: indeed, we can't user parser.error()
to report errrors and thus have to resort to a canned print+return
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
