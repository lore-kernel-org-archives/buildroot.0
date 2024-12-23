Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD149E7718E
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 07:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8516380E95;
	Mon, 23 Dec 2024 07:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PFWf-KaL53I; Mon, 23 Dec 2024 07:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B74B80E74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B74B80E74;
	Mon, 23 Dec 2024 07:27:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 684905E
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4835B4160A
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWPGYOM2Qkzi for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 07:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 037D8415F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 037D8415F0
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 037D8415F0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:27 +0000 (UTC)
X-CSE-ConnectionGUID: upKIdr5ySyGSgdbB+h2XKw==
X-CSE-MsgGUID: pYxKpSlBQsi3HCqnaCO8Gg==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 08:27:26 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Dec 2024 08:27:25 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 23 Dec 2024 08:27:23 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Dec 2024 08:27:23 +0100
X-CSE-ConnectionGUID: aRor5B3STdCAtJ2eZYGuQA==
X-CSE-MsgGUID: pPEC18UcRbiJ7kcSIoEfKA==
X-IronPort-AV: E=Sophos;i="6.12,256,1728943200"; d="scan'208";a="237596657"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 23 Dec 2024 08:27:18 +0100
Message-ID: <4668d7a62590995bc5d3ac5f6f3de278aaec5b6c.1734938835.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734938835.git.yann.morin@orange.com>
References: <cover.1734938835.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX402.corporate.adroot.infra.ftgroup
 (10.115.26.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734938849; x=1766474849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UVOPyT+zUXO3qYUcw6t7LSsnUQ0gF2TXr51fBvC0b8Y=;
 b=BaQ8cAGjgfrGmXAfnxtFCi2+2I2jipmKPoKTmCpeSy+4TifGvhFg+WxF
 zM2Fz/kDe0n7EvfHK8n7hd7k6T3EqCwogqL6O3meoadfsCJlshijldkHq
 S9TnHOhDbZiyn+esSxApW+lggIjbablGcie97tcMPEUSCyfmPcAa+AsDQ
 uLT5g7qXSWNwbvqsKGsc9iZgb+cDub5g3Oz12sRPGyRfQAhphrVdHbCes
 gT7sPRdYFnQlnl4r+OfWak/fGzWgey0XAcBpQPp/2+/lfIm52gOCZ9sET
 KSCT1kv7ojwDEigefuz9sBZeCRZQq9X5SPScpLgKEi9+2Qs+JU9yJ8n1Y
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=BaQ8cAGj
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

It is very common that get-developers be used with its stdin a pipe from
git-show:
    git show |./utils-get-developers -

In this case, the '-' is superfluous: we can very easily deduce that the
user wants to read stdin as the patch.

So, if no other action was requested, and stdin is not a tty, use it as
the source of the patch, and thus '-' is then no longer required.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

---
Changes v2 -> v2:
  - fix typoes in commit log
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
