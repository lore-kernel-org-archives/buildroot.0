Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C580FD9E07
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3336C606AA;
	Thu, 26 Feb 2026 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rk4ZgzOqJ-j; Thu, 26 Feb 2026 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3445F60703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772137213;
	bh=lBlNN5CdLoC8N1Y0KikxYcz8x3U85HtJNXlcmhfoD6U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HjI1t8O0SgR4zrfGXZb7eLwP0YwIA/8gepWZcXQ8EXEePLsYNrYS1JHn1B3MX20PU
	 T56bom6v7dz69vtgKVDnT5f1V6qf2sQPZRpASyRY06LWaEvR1hL51cWa8vHp/pFTR7
	 89aX6+b37w0FqfEp+yVuCBqo0GaJoXyWZLSV1VU+65n8MYrk4cM+ePzJ/o5srPWFW9
	 G/yfLtBCOedZUQ/arA61NDQ+x1wvwWix6iNFVMNYHNiR0AOEgaZL2KUa+FVE6Y9j6u
	 AgZN0kQZlbmOUwQcw/yS6JWa4Qy3MX2KBO3OlcMY3222ojKEUFatPxi7zCg08ngqkh
	 eQXoIONERopxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3445F60703;
	Thu, 26 Feb 2026 20:20:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CAB023D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DB5A400FC
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbPWngnY108A for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:20:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 116374008D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 116374008D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 116374008D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:20:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32F73A4C2E88;
 Thu, 26 Feb 2026 21:20:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45260)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvhqC-000000004xY-0avg;
 Thu, 26 Feb 2026 20:20:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
Date: Thu, 26 Feb 2026 21:20:07 +0100
Message-ID: <20260226202007.1873521-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772137208;
 bh=BrgaNw8SWxD0g9weszX0TEj5o0NYNWOvnRAMHlP0pio=;
 h=From:To:Cc:Subject:Date:From;
 b=TaBu9c799xSSuiRypNw5oZkw5t5YvRV5FYfrXna98HTVK+pC29YQk8Y+an2/gi+Nq
 qgok4k1GKym/7olceWx2/eVh/VKXPim7yK5z9k2UZnDs29NbdE9Y9nbZBtNIzhwhiP
 aqSGBtldKYZaDZsRmNFezyRbSP6AwKYH0bsX2U2fQzRMaVmGenbZEqk0tFwmXrnPdN
 BbtrBN/2y38MTkWuVLU1bI53klkjMwimVluRX71xI1CJKTQcz8siSXIjGRW9y5KWLa
 Chv7FoY6lkYHTQm/WprWuaEwHiymhabCem+AaVsmKDy79cDD12mhJjMQngdMTHyTBc
 dnPBtLq6m8LTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TaBu9c79
Subject: [Buildroot] [PATCH/next 1/1] package/libkrb5: bump version to 1.22.2
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

https://web.mit.edu/Kerberos/www/krb5-1.22/README-1.22.2.txt

Updated license hash due to copyright year bump:
https://github.com/krb5/krb5/commit/21a2231e9e906f2f5e84694ec211755bb1980624

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libkrb5/libkrb5.hash | 6 +++---
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 14fb45ef48..93b02362f6 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# from https://web.mit.edu/kerberos/dist/krb5/1.22/krb5-1.22.1.tar.gz.asc
+# from https://web.mit.edu/kerberos/dist/krb5/1.22/krb5-1.22.2.tar.gz.asc
 # with key C4493CB739F4A89F9852CBC20CBA08575F8372DF
-sha256  1a8832b8cad923ebbf1394f67e2efcf41e3a49f460285a66e35adec8fa0053af  krb5-1.22.1.tar.gz
+sha256  3243ffbc8ea4d4ac22ddc7dd2a1dc54c57874c40648b60ff97009763554eaf13  krb5-1.22.2.tar.gz
 
 # Hash for license file:
-sha256  83914195f655de4f4970014a26f38b16bf4c5ff357ea51645ca2aea3a92764eb  NOTICE
+sha256  d37fcb886de2ad1c602f61c99c6893bcbd9a1949f54d9a6bb40d191204eb605e  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index ede0b8afd3..6bf08a2516 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.22
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
