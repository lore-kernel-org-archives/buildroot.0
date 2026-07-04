Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA2C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 07:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B038110D;
	Sat,  4 Jul 2026 07:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRheMKLRMsGx; Sat,  4 Jul 2026 07:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DD79810F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783151931;
	bh=3Clni/ZvkrIi2ONPO7X7tCt1vkICkB8JzkTF7weeyHw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qi9fPH4niquqJjBqwd8AOvMBYaFOyqSSzu6SSNVYevdJsZShNErgCYrAIXGKjjYL1
	 QvGWItVs4pKSkYXuT79MPOnyD+QpXtcjf6Mr1BHcRmfCEPSvMp8/fvGquUDCpsn0KU
	 /bu2a9ctNJCIdmDNhEd7TdNn+0eGNUZ+Vt5DoZt9Haiesic6RYq5VNLTOImUqT7uBn
	 Zqp/XBXoTWt05xXoXxz23pP9IY0TADc7UjSUnLYikJiydmmQvSal/YCb7vaMEaFPGP
	 d5fACtjm/1YOP4BkozF17qpK/VVDuCqkuG2ydR4pV6eeoiZjxUo/lU9BzVdJ8MetUO
	 AWWMlQKGqPK7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DD79810F2;
	Sat,  4 Jul 2026 07:58:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2F2B316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 07:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A93A7810F0
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 07:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wD5J3WNjNP_2 for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 07:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0901E810F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0901E810F2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0901E810F2
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 07:58:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75235A4C07F5;
 Sat,  4 Jul 2026 09:58:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49848)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfvGt-000000000d1-1IQC;
 Sat, 04 Jul 2026 07:58:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Sat,  4 Jul 2026 09:58:43 +0200
Message-ID: <20260704075843.1758771-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783151924;
 bh=VpYQrMfgF9HmK6paCY0vxThdnpTEmSm4EVhizhJcmTs=;
 h=From:To:Cc:Subject:Date:From;
 b=MRsM5RytvMAepaGYmIDkTz8jnGBKk6kELV/YqEKcN3XVDZY84oK4F8THM+aeZbMaK
 JlHFPWBl5knP3b/j8oYVaLwBxPXp0LO8WgQRWCMGYGkmry40ABCLgQXLIAD+47xvXt
 jhLbD+ZoeJ3tldSHvKoPURoF1UAP3aJOky3L16+q6RD65FWkAd0DzQQLmVzOui5HHa
 9NZ0g2HERXC5ez8QGwIj99WzA9/dGOtptn20eBFli2AU3m+OXmWhtU0piq/DnPdRcI
 +zSUnKVg5yk3i6QOMc1klMDplOadZf8O5k62hlI1xBwRyQj3g5fIclUm2FkgWAY7wl
 muPRAQwcEYWlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MRsM5Ryt
Subject: [Buildroot] [PATCH 1/1] package/smcroute: bump version to 2.6.0
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

https://github.com/troglobit/smcroute/blob/2.6.0/ChangeLog.md

Used sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/efea758b6f7d3caf9ead9ac5fc571049156942ec

 package/smcroute/smcroute.hash | 4 ++--
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index d51745c076..03739f0463 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,4 +1,4 @@
-# Hash from https://github.com/troglobit/smcroute/releases/ generated by GitHub
-sha256  7d2c83e11908fe37844fa9b49ae50924555c4e1bb440fb059a95c94e442ea8a5  smcroute-2.5.7.tar.gz
+# From https://github.com/troglobit/smcroute/releases/download/2.6.0/smcroute-2.6.0.tar.gz.sha256
+sha256  b92b291279819af1cabe1d319e9f3c9b34f309a7371f93eda5fe337999651b8e  smcroute-2.6.0.tar.gz
 # Locally generated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index f8866f6672..63593e6f3a 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.7
+SMCROUTE_VERSION = 2.6.0
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
