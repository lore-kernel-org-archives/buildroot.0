Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3B8D340AB
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714E3813B5;
	Tue, 27 Jan 2026 16:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrQdKv2TrjX7; Tue, 27 Jan 2026 16:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C9C5813CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769531738;
	bh=vCp3PEwHr1CC/lJQwXbWVPUOjfr1KbmhIKrHHTfmd00=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aoBU7L1e/gMalGge0cOBKUdjhrLRLRNY9HDpsS9ilfUi/Njqz3kTIVKd3K32VzvvI
	 k0JzK/1FTyRxZjAqBJodrxTDLeYeQlZTYPcEgeRSL1kVklEMk8BsvN22J8Q8yHIP5i
	 zoCyIkTkf12hpscDwaYh4jEiK/7Zd6He4DlOBl+yqPy7YChUGtsrWboc2pnUCr8Ket
	 w8v+e0lzJ4kD2fU4kTb5isiTtpZOnkUK8FKa2yMPe/w30D5V17RMfLcAJu/Qd/zT89
	 H2fhkJxigaOU30zsBIkmgSTArn1lzc2nhmN1JL7bWXqXwWJugHJD+7BS4j+TwY/d5W
	 y83s27p3AG9AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9C5813CF;
	Tue, 27 Jan 2026 16:35:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B168F33A
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 16:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 944AE405A7
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 16:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYFJEK1nxaco for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 16:35:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24E26405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24E26405A3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24E26405A3
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 16:35:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -390310308; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 27 Jan 2026 16:35:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vkm2L-00000001BjS-1mQ6;
 Tue, 27 Jan 2026 17:35:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jan 2026 17:35:25 +0100
Message-ID: <20260127163528.283380-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FToeJ8LviNgv4aZmFEJHM++4Iz835UYdkOJ84iw/Gjw83jA2bUhNRBs7Gdp/ejhTCSBT1EG1FuLoK9tO+9TfgNh4zR3kEvYGOV15JfblKa0zsNleSr3LM2OyQapDuruYL1T5e5WK00XJ4a2ir50ttMU8DAj9vWKPj4r+X2pn0uuxkFKgporAtNEbsZwKpiiXubXsR62xvXNvY4UE77wI9PklicT98xjVf4ZB0bcQqQmYWmS7eUGzCjTfDx99tEtlhocgXWuaHJidqE1pKp4463nJrfj1dMNr4crIHQS8ib2Zqyg/MNNv6wD75UndAWsk18iEEURZ6GXKyFjBKDHIPQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Y+8Tm+h5o24GcEaO0RGipoyYNd0m5FnMbmtGReulcqI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=FToeJ8Lv
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/2] system/Config.in: do not reference md5 for
 sha256 option
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

Commit bf3626002f ("system cfg: remove mkpasswd MD5 format option") dropped
the MD5 option, so stop referring to it from the sha256 one to limit
confusion.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 0652b94a3b..98bbd93092 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -67,7 +67,7 @@ choice
 config BR2_TARGET_GENERIC_PASSWD_SHA256
 	bool "sha-256"
 	help
-	  Use SHA256 to encode passwords which is stronger than MD5.
+	  Use SHA256 to encode passwords.
 
 config BR2_TARGET_GENERIC_PASSWD_SHA512
 	bool "sha-512"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
