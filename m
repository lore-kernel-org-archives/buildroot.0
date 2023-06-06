Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95EFC77B7A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 07:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287DF415FF;
	Tue,  6 Jun 2023 07:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 287DF415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18hyAgVx88sv; Tue,  6 Jun 2023 07:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E570F41558;
	Tue,  6 Jun 2023 07:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E570F41558
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61D721BF3AE
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 07:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4574D415A9
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 07:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4574D415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LCHbetDuVHeI for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 07:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06ECB415AB
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06ECB415AB
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 07:01:34 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b1a66e71f9so66804841fa.2
 for <buildroot@buildroot.org>; Tue, 06 Jun 2023 00:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686034892; x=1688626892;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M8EYtWpYb1SgtV7JTF1fhyGz3pet3mCfwazVjlyogWE=;
 b=jyzsZ/lBae6dFNkjJXlmfOwnm9JWoIKGlTpCppg2M09M2I3LLQCZJOYVw7TJORhLO4
 ZUt29PTzG31Sho0an50fTH4tVpa5SQltdFvkVX4unbgceTcZtVJmIrp6CRis5RUlOngO
 hE6bVhceFN500OUgwm49mEHatkOQ2E2AnG3zh0/1Y2Nz+3IAI0C+MnYp7liU8+XSqJ/v
 7vsRJ3axSqcoV80QNP/3PvGqIKcNzMpmju4pf/Ln3pywV04IJdTR3HNpqwedUypxnuOW
 x/Msa8qPKY6pXP6mQ/Rwpc88UZNFgW5AT/Cx0lXhUaG2VL7Z/aRSgJEgtEh28EVBg8nK
 wcQQ==
X-Gm-Message-State: AC+VfDw8QwDagmsP2K5fI8ffaB1g/ABNmv8Ii9V8cognHgk4P5UhyXbU
 e0cp7LJ9JuaLAYuT8/HXEYmyKqzgrEU=
X-Google-Smtp-Source: ACHHUZ4gDn/jLUPvxbRVY29SCVNiHMizv+l3Zah5MEKXCGsVokXv20TQNzl0pX8U3XsoTWp+429Etw==
X-Received: by 2002:a05:651c:223:b0:2ad:8c4c:4459 with SMTP id
 z3-20020a05651c022300b002ad8c4c4459mr755716ljn.50.1686034892507; 
 Tue, 06 Jun 2023 00:01:32 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a197604000000b004f608eb50d1sm1336684lff.299.2023.06.06.00.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 00:01:32 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Jun 2023 09:01:26 +0200
Message-Id: <20230606070126.165827-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606070126.165827-1-troglobit@gmail.com>
References: <20230606070126.165827-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686034892; x=1688626892;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=M8EYtWpYb1SgtV7JTF1fhyGz3pet3mCfwazVjlyogWE=;
 b=ZZZrn1xfx75T8HlhaNuf80OULp7gm+7JHKg5vcbBPt6a2U9jzsvlaq+pmdlKxkwo90
 P94aAHN5OWMl2VfGbW0Zbj6yZM+x5V9LFAghIQtdNrlzckGNue/PRo73kCenYrIN0qzB
 xVJUJYKN5safVhDA4YaBcAcYoem0yMLao1uvjiKDCLumIsww8QwoNE5gVL2zTIReY7nV
 Wx579L77IJkhHlQ1MbXiVxh5PB+0X4enrIWneKXNCYTk8JzOThcOKtg1ZEE61usaOecq
 6duR8DQ1nsk18lYhfzOHwtJ6sMp9YBwxilVDUuZellyYaQUo6elhU2O6+24dGLfOvvay
 vQug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZZZrn1xf
Subject: [Buildroot] [PATCH 2/2] package/inadyn: update description,
 how to enable HTTPS support
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index 3589823da4..1476e9cf84 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -4,9 +4,13 @@ config BR2_PACKAGE_INADYN
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_LIBCONFUSE
 	help
-	  INADYN is a free DynDNS client. It gives the possibility
-	  to have your own fixed hostname registered on the internet,
-	  although your IP might be changing.
+	  In-a-Dyn is Dynamic DNS (DDNS) client with HTTPS support used
+	  to automate the task of keeping your Internet name in sync with
+	  your public (DHCP/PPPoE) IP address.  It can also be used when
+	  you have backup connections to the Internet.
+
+	  For HTTPS support you need to select one of the libraries:
+	  OpenSSL, GnuTLS, or mbed TLS (PolarSSL).
 
 	  https://github.com/troglobit/inadyn
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
