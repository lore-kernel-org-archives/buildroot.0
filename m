Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D71C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 10:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB4F580AC4;
	Tue, 13 Aug 2024 10:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_NJLSQ7mnbS; Tue, 13 Aug 2024 10:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F4F80C4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F4F80C4C;
	Tue, 13 Aug 2024 10:04:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3C5F1BF35F
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 10:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADCE6403AF
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 10:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T78vaZxw92Xr for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 10:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2319640327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2319640327
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2319640327
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 10:04:34 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:04:33 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 12:04:34 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 12:04:31 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 13 Aug 2024 12:04:31 +0200
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; d="scan'208";a="178510881"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 13 Aug 2024 12:04:29 +0200
Message-ID: <0273851a98aad3af35b660c047ee64ddb1276271.1723543467.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723543467.git.yann.morin@orange.com>
References: <cover.1723543467.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX405.corporate.adroot.infra.ftgroup
 (10.115.27.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723543475; x=1755079475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vb7gG2Ml6mWEzoUbpKb/2ToIjRZhRU9PxiW1zIoaDY4=;
 b=i2tqOg7xpC+ntzlV5+ZwJc/be28j5YIOXhBX2uWgjUCqfQ8aCaLhNtdb
 VM1cgK6h2uIBl93iEcsKUnqXEaolc/7rn2nClXsNML0jqRQkt6yzR3xDL
 B5YhOKx2TKuDHqrA+0v6d3ioHhTY3jnEL4S0eqJje068/X+xAAGXmXIpT
 W/bAROsUHgunUXrrTNZg0+f3gf/nPLNxCm+7ORQeWxFwf8cbm1wqBrXvc
 yMTIUPphSbr4aDXbNE3fjPwssnjqggR8EZqgj+zYLr2efaPk7itBKKmcE
 nHtwS2SbwMWh37StCeT7xVPsdsPd5vh9Udc5lBl6jqynp9OSLCytWNCfC
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=i2tqOg7x
Subject: [Buildroot] [PATCH 1/3] toolchain/wrapper: check unsafe paths
 earlier
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

We currently check for unsafe paths right between adding our arguments,
and adding the one passed from the command line. This not very
consistent.

Unsafe paths can only come from the command line, as we are not adding
any of our own (hopefully, we know better!), so we can run the check as
early as possible.

Move the check very early, but not before we handle --help.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-wrapper.c | 44 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index e436889760..03977eb408 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -321,6 +321,28 @@ int main(int argc, char **argv)
 		}
 	}
 
+	/* Check for unsafe library and header paths */
+	for (i = 1; i < argc; i++) {
+		const struct str_len_s *opt;
+		for (opt=unsafe_opts; opt->str; opt++ ) {
+			/* Skip any non-unsafe option. */
+			if (strncmp(argv[i], opt->str, opt->len))
+				continue;
+
+			/* Handle both cases:
+			 *  - path is a separate argument,
+			 *  - path is concatenated with option.
+			 */
+			if (argv[i][opt->len] == '\0') {
+				i++;
+				if (i == argc)
+					break;
+				check_unsafe_path(argv[i-1], argv[i], 0);
+			} else
+				check_unsafe_path(argv[i], argv[i] + opt->len, 1);
+		}
+	}
+
 #ifdef BR_CCACHE
 	ret = snprintf(ccache_path, sizeof(ccache_path), "%s/bin/ccache", absbasedir);
 	if (ret >= sizeof(ccache_path)) {
@@ -474,28 +496,6 @@ int main(int argc, char **argv)
 #endif
 	}
 
-	/* Check for unsafe library and header paths */
-	for (i = 1; i < argc; i++) {
-		const struct str_len_s *opt;
-		for (opt=unsafe_opts; opt->str; opt++ ) {
-			/* Skip any non-unsafe option. */
-			if (strncmp(argv[i], opt->str, opt->len))
-				continue;
-
-			/* Handle both cases:
-			 *  - path is a separate argument,
-			 *  - path is concatenated with option.
-			 */
-			if (argv[i][opt->len] == '\0') {
-				i++;
-				if (i == argc)
-					break;
-				check_unsafe_path(argv[i-1], argv[i], 0);
-			} else
-				check_unsafe_path(argv[i], argv[i] + opt->len, 1);
-		}
-	}
-
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
