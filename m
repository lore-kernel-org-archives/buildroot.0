Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65B7C83F25
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 00:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B1BC4293F;
	Tue, 22 Jul 2025 00:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ma7QM9p8uOY3; Tue, 22 Jul 2025 00:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42E9242941
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E9242941;
	Tue, 22 Jul 2025 00:48:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA21E0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 00:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01C4661190
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 00:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnHXmN4Iln6C for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 00:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EA1C6108C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA1C6108C
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EA1C6108C
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 00:48:39 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-4ab3802455eso64923741cf.2
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 17:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753145318; x=1753750118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jLfNlpOUrn1cf7+3sSM111E7t8KyI7azDJFTwUj1qn8=;
 b=gMGpJ/SdkY8yB9OAsSZSHXA5spS850wyzELgU7/MRa0DmduYqMAB/22y3OrP1SeIRd
 tehzcLCjkwZmeRTWt8yWzWz5eIjtlZRB69G2SO1W8mUSyVvfLUfJlCn+JNy3EGZv+ohi
 sjEMxO9MclGLJMUJNPc1gEu5X9D3FmxHxEi77In1pVa/FSJaBy8F4azo1zRBOywh4P6N
 hwBhFzOvIPaiTASrTldDwmw2caRNVJnmy64sWOG8DebK3VjM/6K31cKvRW4pi3ni535c
 6R8IGsI5USESsyRGfYlrbiLnDqZvIsl+YP8aUu4oeKjxMdvF8hzyuNQwD1qhRmLsqjfc
 SPIA==
X-Gm-Message-State: AOJu0YwjQN9fwfBw/0rrRVza6Slv6A/vdFEPDOEKCXHYIzlmgMRgr/9A
 B3pkeNk0Bz2GNKERa94mWrgIC2ZDgjBUaxfHtPtzzexQwNbZBC4lysQWGbZZK8/SMP+VVmKMM0O
 06EIwYg==
X-Gm-Gg: ASbGncu6a+pSElqirLXoTHBE0I1/Mb2576/P6xFwQW3ypHGXC0+HZ+f7Y5FRjf5IbFL
 dfQQtD55z8Ka092NIIHN7k+WJi4+lnJsvFaJ12U/IjR+14aXY0YthWfRP+OClfspWjNGNOTCVCE
 4680Zte+VbpU7CwtEL9hJTOZLPBJca1mLwx/M2i7WN1REA55i91+hkDGp96WIfr58qcrLkytk5g
 8Vjs1DzF7DpvpIoHzQFi0EkZS8Vwa8lHe/zhrKqBegUWG0gYX9gKmVI22aFj3e8SbSsay32tNzv
 qMGHBY+dryCAO+bniTCnlb8ursAbbkmbLCw81DnShxuWHQ4np629e6fU5eys2kndhqxifUNxj3U
 Bfx3b1oOskPmSc0dDITA3MZNnrg6R0qyY7JMvE17RgJaHZElo0jjMlgvrnlTc3hJ9dR/Me/OeHR
 jYfkxwlQi2Pv42AjM=
X-Google-Smtp-Source: AGHT+IHrOb5YrVUSG7Im5Kx4wvUgV/vv859R+5tvMbrApxC9hExCARG1WrWUqPNGYUyFlbF0rHvhCQ==
X-Received: by 2002:ac8:7d12:0:b0:4ab:7125:99aa with SMTP id
 d75a77b69052e-4aba3e33f4bmr274020711cf.49.1753145318396; 
 Mon, 21 Jul 2025 17:48:38 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abce0bbfdfsm28988851cf.9.2025.07.21.17.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 17:48:37 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 168CBA88; Mon, 21 Jul 2025 17:48:36 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Mon, 21 Jul 2025 17:48:27 -0700
Message-ID: <20250722004829.1101836-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1753145318; x=1753750118; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jLfNlpOUrn1cf7+3sSM111E7t8KyI7azDJFTwUj1qn8=;
 b=K+bmPbbZ8+XtbuoQBVxrsHKvVpKNUNoWwwSgLZfpNTtdBunXRY+tNAXL7aSEX/4xPg
 1Qr6cSDK2v3F2cxadwuxTgBuxMblGL/RzVxy2FLBRTV3JvXKW8dEuSVCCLQAg8rUlGM+
 sjdN4Y0BD3Z/iOtVY8pn/rUIW3TXfu0UEFi/c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=K+bmPbbZ
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: fix indentation
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A recent commit introduced a few lines that were indented with spaces
rather than a tab. Rectify this.

Fixes: 00b30f887ac2 ("toolchain-wrapper.c: get rid of EXCLUSIVE_ARGS")
Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 toolchain/toolchain-wrapper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 9fb96a276a76..5b306190bbef 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -487,14 +487,14 @@ int main(int argc, char **argv)
 #endif
 	}
 
-        n_args = (cur - args);
-        if ((n_args + argc) > DEFAULT_MAX_ARGS) {
+	n_args = (cur - args);
+	if ((n_args + argc) > DEFAULT_MAX_ARGS) {
 		args = realloc(args, (n_args + argc) * sizeof(char *));
 		if (args == NULL) {
 			perror(__FILE__ ": realloc");
 			return 2;
 		}
-        }
+	}
 
 	/* append forward args and terminating NULL */
 	memcpy(&args[n_args], &argv[1], sizeof(char *) * argc);
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
