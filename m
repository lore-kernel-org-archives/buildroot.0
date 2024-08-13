Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA3CC52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 10:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9B4480C83;
	Tue, 13 Aug 2024 10:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eiY9iXL8vKc; Tue, 13 Aug 2024 10:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C0880CC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C0880CC7;
	Tue, 13 Aug 2024 10:04:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5841BF35F
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 10:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79D99403AF
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 10:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkmCcplDhQKb for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 10:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03B6A40327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03B6A40327
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03B6A40327
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 10:04:37 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:04:35 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 12:04:35 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 12:04:33 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 13 Aug 2024 12:04:33 +0200
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; d="scan'208";a="178820188"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 13 Aug 2024 12:04:30 +0200
Message-ID: <e4024c6c1e1825bd52ab14faafbc7655d3074eb3.1723543467.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723543467.git.yann.morin@orange.com>
References: <cover.1723543467.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX304.corporate.adroot.infra.ftgroup
 (10.115.26.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723543478; x=1755079478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IzwiRKOSnQU0zVLmvHf1iUtZQq7BmS4AdDoEwz+2r+k=;
 b=CiGtYZx3qwRwgVnn9uvs4PI91ofCMvoAmqSn5lxABCLuFmrnIndx107l
 J0DA/YdgMD+0LA1wdHsh/EKvucUEuclVoi4Nhxz9uudjiWSKuVYEv+olX
 DcxdpnGPXztXRfwZXO22L+bjcQFes2fAz81popGa7AIdUSkJlC+ves0bI
 ud+TsGrpUpN+7qLKVmOD9qzqHv8luWY9YSV2v3t6hVu8kuOdsVG2a+OFw
 Rrn12+a51uHmHYkB/hAmRy5ImRj8V//8rg/MRp6H9nDxGIe8IoARnc++c
 WhO0aq8U7fN3vUw8X3wO8xmKOyQGUmzcvtWcNPMUzctkt/oQErX8++Hiu
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=CiGtYZx3
Subject: [Buildroot] [PATCH 2/3] toolchain/wrapper: check we did not add
 more args than expected
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
Cc: Romain Naour <romain.naour@gmail.com>, yann.morin@orange.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

We have a hard-coded constant that defines how many expected args we may
conditionally add at most, but it is very easy to miss updating that
when adding new conditional args.

Add a check that we did not overshoot the allowance.

Ideally, we would have a nice way to add to, and extend the *args array
dynamically, but this would be quite costly, while the wrapper is a hot
path to the compiler. So, this test is a better solution in the end: it
is simple and cheap.

Note that this would only trigger at runtime when all conditional args
are added, which can only happen in special conditions, so local testing
might not always catch it.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-wrapper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 03977eb408..7647a1a12d 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -240,7 +240,7 @@ bool parse_source_date_epoch_from_env(void)
 
 int main(int argc, char **argv)
 {
-	char **args, **cur, **exec_args;
+	char **args, **cur, **exec_args, **cond_args;
 	char *relbasedir, *absbasedir;
 	char *progpath = argv[0];
 	char *basename;
@@ -365,7 +365,7 @@ int main(int argc, char **argv)
 
 	/* start with predefined args */
 	memcpy(cur, predef_args, sizeof(predef_args));
-	cur += sizeof(predef_args) / sizeof(predef_args[0]);
+	cond_args = cur += sizeof(predef_args) / sizeof(predef_args[0]);
 
 #ifdef BR_FLOAT_ABI
 	/* add float abi if not overridden in args */
@@ -496,6 +496,13 @@ int main(int argc, char **argv)
 #endif
 	}
 
+	/* Check that we did not add more conditional args than we expected */
+	if ((cur-cond_args) > EXCLUSIVE_ARGS) {
+		errno = E2BIG;
+		perror(__FILE__ ": Not enough EXCLUSIVE_ARGS");
+		return 3;
+	}
+
 	/* append forward args */
 	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
 	cur += argc - 1;
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
