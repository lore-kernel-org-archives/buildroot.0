Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC837C5DF85
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 16:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28D8C80D47;
	Wed, 19 Aug 2026 16:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z54z7nqc3Puk; Wed, 19 Aug 2026 16:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787156659;
	bh=tA6Mozp5PdwThNxMYkuKGtu68cpi71McxjjfC6SFnOs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dKN7XXzqnsWZY+PmwqyeH8P8FUVuDYGVfWvtgbJ8scoOOKDvZ52C6KPymlHUlxs4S
	 RTWokrvN3tSfRqH6Xn3oqemaLijuEwLu4G1ZsnaxLNeu5IknxUK3pCbtacYZvh6vKi
	 HJf+SrJWKLFEKmtE8MfwI9A8zPpNLtIjS4NtZTXE6yJBXxmMqV5gpVgCiiUvUsRJgA
	 Lkzcorf0uqKelfjEmwedMAIzdqdWsP1lgdTuwaC248YeKLDVZnCtME52v0uP1BRQnv
	 /vHWIRq5SbcBMXSEo6tRur/5XbOrtpyDTbQC3wPpca2bpPKR3637Nmvpmhue1YQ1/5
	 Z8khiufu0X6bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DB380C6E;
	Wed, 19 Aug 2026 16:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E4B539E
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 16:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37C81400A2
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 16:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ep7Nj1iUwGj for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 16:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38C1F4008B
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 16:24:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4996f1ee4a4so10848065e9.2
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787156655; x=1787761455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8eLWi1Evw051/FKt5kEURvN8NuYLK2Qsf1YsIY/jB4s=;
 b=i0OAG4eMsAGgMQ3nC4dBg0/Q2ZbvDNXC7Dfm7CFmdeOctG/GOrZZETxT0qw5i882mo
 vU1y5Wx1jZA+s9LzI+rd3VD8VwwwJ/qQspD3/FTF3fhWl7sNPbBsQLDM1h3hz+fVdjHE
 CFVxQrRX7u7AjxnLRaWhM/DcQw5iQHKN0U99RSBVk/Bucmw2l83KCQBZ5nUuOogsvVqQ
 dA1on2qjPfpDPDhc/tQK4EjpncTc7YlZJPY/OJixOBrM3fyxcseFX3Wi9jxn9RXb1YLt
 ptCuhzgJByzFxjWM53ud5SYE3q72RnVVyo1n1oqQnNT0FOtdaODSc4aaamLBdbzthNHW
 7KSw==
X-Gm-Message-State: AOJu0YymUTfOhQM56hjOEIWU75cxmo9oyZrbNxiraAu2Xj06SieaMDyE
 W8bo3Dvmtz+grxrFH1OWfavoOU8T0upT3VauNxnMqhBTijZiNsNj0RtylmcQl/INY+sSAL6IO1X
 ewaACBcg=
X-Gm-Gg: AR+sD13RgyDLODNQcr5rC9zaMk/0hplAqR5n433im0ML/d8RfBAnFEhcvuJrS+OY3Ht
 MfNQa8snEFNA9K0dQ2ER4mpqpIoxeoHoA1CU2JD28V5EW3SABSmhurmTdCDqHFqnuvy1Gys0mxH
 dxuVrKMl999iAIPDH86k+iAxjlSicibcRD3FJ1JH6QHNZ0m6bhssmVemk2clxGRuZwmlWlvPP2k
 m6Y1+uWTg55W1hO/Dyd+wqG9MLYeixFqpfjccByG5rq/HcKq9KNxOmbYiRsLhSjh2kCw15G7ZlH
 GMnsDRfVzKjFBPo+qNdDSCDpYmLVuzsu9215Z/PHxsegt8CO15/DSdiV+sqj+bTZdNPoLySyxgk
 8SIeoaR+BMHWm93GAt8Qqym8343lE38bzn7+dM0oCBoMys7h2bGV2bbcbxnq7Q/8BdvSpyFfTYL
 kLFOSEc3k2tlY7P8ZuUDzdRnoOxqkCAXAZNf92c9atlagMSQiWmmOTPa8rCVbd9nmtFIVd0l7qp
 QQspJms3Opl3WJ0lsXXwRKuNAN8fJVayhMMwgleRaPTdDLpZ4o=
X-Received: by 2002:a05:600c:3593:b0:499:841c:2016 with SMTP id
 5b1f17b1804b1-499aa0ff5a0mr131599465e9.0.1787156654708; 
 Wed, 19 Aug 2026 09:24:14 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aaef1665sm69388825e9.5.2026.08.19.09.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 09:24:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 19 Aug 2026 18:24:05 +0200
Message-ID: <20260819162406.1945796-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gdb: fix gdb default version
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to select one of the 3 gdb versions available when host-gdb is
not selected but the condition was removed while removing gdb 14.x
in commit [1], so gdb package fail to download the archive.

Select BR2_GDB_VERSION_16 when !BR2_PACKAGE_HOST_GDB.

[1] 6737c90bc6f89cf0c702707933207dd7c5e3398a

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219536 (TestGdbFullTarget)
https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219539 (TestGdbserverOnly)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 93f174db99..2e1eed6f50 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,6 +67,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "15.2"	   if BR2_GDB_VERSION_15
-	default "16.3"	   if BR2_GDB_VERSION_16
+	default "16.3"	   if BR2_GDB_VERSION_16 || !BR2_PACKAGE_HOST_GDB
 	default "17.1"	   if BR2_GDB_VERSION_17
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
