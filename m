Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99372C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4B241EDB;
	Tue,  6 Feb 2024 22:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4R6TyqEar73p; Tue,  6 Feb 2024 22:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D55541EE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D55541EE4;
	Tue,  6 Feb 2024 22:17:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB611BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF37C41EE4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dhy9RTW0VYau for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:17:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4E2741EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4E2741EDB
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4E2741EDB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:17:26 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d911c2103aso249955ad.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 14:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707257845; x=1707862645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cc/fXbNyY/BJv0k2GRkyBJJqlmxbGWuuNiFP8P4surg=;
 b=bhulYwqvbhsXBXkIJULrFLLJp5GIidRES6b175r7miMSTu9epQniDFicQzHAXGCqop
 d5ilPwTmH7YbYLXvGeO53H12bP/oqc1sO2uxNQO+pTElyTzGhssKwClop2x2jFMlO3+O
 9n9NFHapFgTf9+oKdqhMScn3bOQHbmPRyUWv8pLivfHWaUfdCFWZW6jz8TlwB7Q2YAkM
 V6iA6d+Es0uzf+3+wM6dgfnTdpuFnF0usLROuuI2YArKTxgjPjhXvTAPn1WI8Eixh3ru
 b0cz/yvVBwIRJShRCSuunzExT0By8C8DGraFugvAzZmorO4LMaDU0Vo/ti9bNMpNypLc
 mL9Q==
X-Gm-Message-State: AOJu0YyESmE3mg1Lj6Xuk3m9hTWLdagWOgyr8hNXjdujgdQdwHVTV89n
 apmLKUdq/R1lj2qF3piWSsqx+GefBZjhyseIvhHdQuIWUSR3Rsa/iYBzm3eBebwQAd4hJzUpaN6
 t
X-Google-Smtp-Source: AGHT+IFfN6jLIkJo1Tisjx7kXH3AyxUJXmxU2H+UaToeJU/lwmwUBMIk2/f/JI9kXUIJanrz//apSw==
X-Received: by 2002:a17:902:bd8b:b0:1d5:f36c:8737 with SMTP id
 q11-20020a170902bd8b00b001d5f36c8737mr2820904pls.68.1707257845572; 
 Tue, 06 Feb 2024 14:17:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpmxtjTDP+AlNVjz63m5hdrn1ZMoDEvwBUL0eJYPqcuOu3Z/uzRC7CEf7kNoEdglUEvWtU/3DVH1vOfBy24wAKEOht5gv0jRy1WaHT/Cvy23SAXen9e3RCueSuZmaH7BfOINWvw+czvNx0jRmJWggC3oSCFRmGDu3kxoJgigLvVvxyXsjdbItU1IKZhp1QGhdy
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 v2-20020a170902d68200b001d97dae2fa3sm12488ply.185.2024.02.06.14.17.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Feb 2024 14:17:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 14:17:22 -0800
Message-ID: <20240206221722.33303-1-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1707257845; x=1707862645; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cc/fXbNyY/BJv0k2GRkyBJJqlmxbGWuuNiFP8P4surg=;
 b=NOeEzvR7Y0PE5nqRkuEH6HBoESHyxjtP4BUf+SoKItoU/SE9QuD1AROLxi72nYxNjs
 9It/1mSSv8RElQSgXgcCaWGH/23yB9ihdqgzFSOB+wwQoXSgnC0aOpbO/IgB1ZE+4VpG
 9td/I3aOAoMEBuOq+JVW9UJ+1nbCpipaVMasK1ZHvhI4RfkA59zg+2fH1fIwxcR4pDuh
 VgNuCBq1kx58+kdwxoJtzyp03WIKSClbg6kivqq7qnLG870cO+Z2jCw7ZctrBCb1g8rS
 OoOYCj14difUyvdklTI0YTofkFbvXPzYAWdB7Nv4fiTkHQW80RuQk6XdCj+5se4uz/wa
 rI8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=NOeEzvR7
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump version to go1.21.7
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.21.7 (released 2024-02-06) includes fixes to the compiler, the go command,
the runtime, and the crypto/x509 package.

https://go.dev/doc/devel/release#go1.21.7

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bee10089a7..d008019e94 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  124926a62e45f78daabbaedb9c011d97633186a33c238ffc1e25320c02046248  go1.21.6.src.tar.gz
+sha256  00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca49591959bff6  go1.21.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f9d31aacac..9efd4a3123 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.6
+GO_VERSION = 1.21.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
