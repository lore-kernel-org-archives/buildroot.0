Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7F2C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557EA829EE;
	Tue,  8 Feb 2022 21:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cXl8Pgdo07B; Tue,  8 Feb 2022 21:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B85B829FE;
	Tue,  8 Feb 2022 21:06:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB6171BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB119408DE
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpXwmj3szU05 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:06:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89A4F408DA
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:06:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c192so138248wma.4
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 13:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aESDOKpzpZWJbwS9kxagplEHhLIRlmSZDRLtaegCGfI=;
 b=GVoyBTTSgXFcgCgUNQ+MyzoumJmDunusYTbYWJWGVgVxNEgXxWvCv8mAIx8q89cT7T
 XHVs9hyZMpzVieZyQ1DGJ5Hh2J7rBJxg6S508ia1072bUFc7bwH0jkqrhd771MLCkkfK
 VuHoXq2sNYId1RqsOrSDtUOfn2nq9EwM+TrfDnwLx0sCX6AGXzjj3vBV3CG1BG2HMbEU
 PQGt6d9sH7Cu84OpZP2gCTVp0gTjBON83hz3xB+GprpbpMAVryHW/58sM4Z55BVKlrU/
 udpNlnoE21EP7HNatPP6eAtxX+af/o9lZNHx0qCfPSNjvZ/f4UfxaTBbpQiOx+guoF3K
 35PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aESDOKpzpZWJbwS9kxagplEHhLIRlmSZDRLtaegCGfI=;
 b=8DIwR5n5nYFUcTCJj5uO0JXnynCm/g/Gz/JgFJ5DWr2/5bqNq4yGOS1kzYuIE1uGll
 ZEZSgEpQpE2H41Hv9sK5TgbomNZRGodUTC4QM5TktRyWB6d7mIlxDso9Z+LIIjVz0vbe
 S8lktdcinncWa+PeBd6lDnB6zQPUnmTuJwS1+ugMO9wc5OS2PSRTsJRbjQgal9nxtTZk
 AUCVQiOzlNevl2bE381ozNqrTlxlPk8C47CeEKY2sblHpagSlA2GqBjHwNQGB6Sr8hRq
 onESsP70ctw5HqMAldK/nr0KEWHx4kSIgbNsCkJ9f2Yj5Y+EU3RBxwL/1WffmRgd0IKM
 isSA==
X-Gm-Message-State: AOAM530Xznp4T/ctkeOCr+xLLDa59u6AiTu2/EgVP0w0AgFPxocrIums
 N3sZmHbyjNBX44NHrI4yBRgmy44BSBA=
X-Google-Smtp-Source: ABdhPJwurugUAZdVcxvQuQ6zdl5GUHhQneSfEFt0IlIxMEaJqSDOsT0MOi82X+Ke+AhaGtQjc8AJow==
X-Received: by 2002:a7b:c085:: with SMTP id r5mr2615159wmh.97.1644354370481;
 Tue, 08 Feb 2022 13:06:10 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g14sm795501wmq.3.2022.02.08.13.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:06:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:06:44 +0100
Message-Id: <20220208210644.16926-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: depends on gcc >= 4.9
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a dependency on gcc >= 4.9 to avoid the following build failure
with gcc 4.8.3 raised since bump to version 3.14.1 in commit
61797c52f5deef2cb67e60cf075ca243078c8855 and
https://github.com/zhaojh329/libuhttpd/commit/ffdf7de3a4a1f5a62aa3814ac96e889958a30840:

/home/peko/autobuild/instance-1/output-1/build/libuhttpd-3.14.1/src/cgi.c:41:5: error: initializer element is not a constant expression [-Werror]
     {"accept", strlen("accept"), "HTTP_ACCEPT"},
     ^

It should be noted that upstream rejected a patch to remove -Werror:
https://github.com/zhaojh329/libuhttpd/pull/12

Fixes:
 - http://autobuild.buildroot.org/results/a3a970a6398dcb0e4e03f4277f1a50c6b5eff7bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuhttpd/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 52bbd313bc..97fc984ea0 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUHTTPD
 	bool "libuhttpd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
 	help
@@ -8,3 +9,7 @@ config BR2_PACKAGE_LIBUHTTPD
 	  library based on libev
 
 	  https://github.com/zhaojh329/libuhttpd
+
+comment "libuhttpd needs a toolchain w/ gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
