Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89502D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B42741129;
	Thu, 11 Dec 2025 19:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIio_UQ8dbsE; Thu, 11 Dec 2025 19:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A2B241128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483130;
	bh=234q3kQCeyNZqBZrcGoQ6MsVdXgwZp2X0xn+VcMBJsw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OhK4sooDBtaDlF2rlr2sbbQ5vCZ7nWYRTY4QlXrIy2OIXPJ59CTOF7qIugZ4Um5IC
	 2sLlra2FahhS1ARSEAh5Smml2Td0kFjRH2GuQcq/FeKB0I4vGLIaLAt81X7kPFbUqd
	 ydSvSWMOOfHem+bJEhgG+3oI/lMO36y+l2LJkx5xhFKpvdJIKfWYzLQHyubUp6/6Fd
	 ECTMeAE6VpDR0J0T7EtV0GmcBJOSDigXRw1JVhbF91azNriQyatc7sr6Bo1pDc8tOR
	 +SobvGn5Z31Lw0z09Wx78MA/wtH8n4Q12qcjFI8XnmjO0L3dyFVHGTiISjuUCQPlj1
	 n3Rr8jL5w2SGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A2B241128;
	Thu, 11 Dec 2025 19:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E22CB2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C86FA40028
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8CFoHuDeDVZ for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC4BB40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC4BB40012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC4BB40012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4670AA4C391B;
 Thu, 11 Dec 2025 20:55:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-13NL;
 Thu, 11 Dec 2025 19:55:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:22 +0100
Message-ID: <20251211195527.3276900-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482938;
 bh=iCHKF+mv/jgMKXrCBUdfc5OZncoL3JRTrkU99I6RYjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jJ9Wr4NJ47M/qY0HQo6M4JYJ5TaGzF8QGKUtAKmRdQ9i5zKNwv7yH8DrrIgTHbCYJ
 piE37h+9U1/kiZKxfPJY8IZ0n3iw3PRxvvxOaHxEqbuLlZjZ1KraxzURnTlyFOBy1w
 i8on5mkSpiKBAdsfS4c5uVcfnCLUkTwRACkxzvYLl+zn+8ZBO7OyO9ZYMSxi0TSgqg
 PLjsWkIzyUuj1Gl1mSU8WCLZMquwvSfhGMra2aoq24VFhVvduCxtkKmzQe+V61q/pd
 e1JQAhltSeMYUiNN0K49bFBnhKeqZ+mM9OgpZK0OGiUJWTE8t46c+wC0S8eD/9lVEp
 t/yCj5QUnvL2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jJ9Wr4NJ
Subject: [Buildroot] [PATCH/next 16/21] package/python-google-auth: bump
 version to 2.43.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/googleapis/google-auth-library-python/blob/v2.43.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 37641a7a90..17ca9ddd61 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  cf398efdf51cd3885eef521198a202a5  google_auth-2.41.1.tar.gz
-sha256  b76b7b1f9e61f0cb7e88870d14f6a94aeef248959ef6992670efee37709cbfd2  google_auth-2.41.1.tar.gz
+md5  43aef15e30f2646226add26c54256302  google_auth-2.43.0.tar.gz
+sha256  88228eee5fc21b62a1b5fe773ca15e67778cb07dc8363adcb4a8827b52d81483  google_auth-2.43.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index e649569b37..53e5900856 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.41.1
+PYTHON_GOOGLE_AUTH_VERSION = 2.43.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/a8/af/5129ce5b2f9688d2fa49b463e544972a7c82b0fdb50980dafee92e121d9f
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ff/ef/66d14cf0e01b08d2d51ffc3c20410c4e134a1548fc246a6081eae585a4fe
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
