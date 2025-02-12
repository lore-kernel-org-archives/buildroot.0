Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8209C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 22:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6042E417C3;
	Wed, 12 Feb 2025 22:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1q8bChXhSrYE; Wed, 12 Feb 2025 22:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 331C7417C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 331C7417C6;
	Wed, 12 Feb 2025 22:23:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8F88C2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B288460A99
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1xcu_-ONqk0 for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 22:23:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B9E2608C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B9E2608C1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B9E2608C1
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:22:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38f1e8efef5so107554f8f.1
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739398977; x=1740003777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0LPUnFLfrKFrMlHOxKa+Nk7kBjJZLF+hRGCH3Q5lX8E=;
 b=wqMK9td84EkhhGchKyKv1Y6j2fGFbQwtqxB9MVC6CXQWPhcboizNdyQHWIndXKJof6
 DBdMXUQGpozpiJbcqQcA4YS1W1p7xCZSr5DoRdsiE1XcyZEr4sVJFersxPxCVc/CgYbd
 GxOLLX9ra35Nmclmke051+6gsFqxay4EKkefWre5VJo60chJrbxeGN8fBtQxCfxqlkn1
 DMyeJdbCNooo1KUYDoJu4X0Rz+J2VB3R2RGvJu81nPgJImOyD8dL6cu9U968chb4UV5M
 sXejXMYsYF9Lar4UKkUf53gSVyKzo7qw8+WuO+IoONB3YqqE+ZriYUifDW0adOGcgm6L
 h5rw==
X-Gm-Message-State: AOJu0Yz3JSmBzHJed8LjEugiY6UBWjzts8cja6bplIfiHq4linUyyKqZ
 KVKxHSQkB8mTrzH32Y8T992AIDC3l4ojuGxXKRQdQ6jOm8eP2abkHNHzMcqJg90kB0qSLY/nJgU
 s
X-Gm-Gg: ASbGnctULI6WifkX67M+2VyrQlwBgQ2Dg3lygpHsv0pWfOiihXSqrDOKt8WF7nOCsNn
 vVRjBDFKJKdaFaRd9edPe46DkcgjxuPM/5ZykPVgkhPmFuYs5xxn7yKQvnagwiyGZJVleEOUTnb
 hwDQoXbX1J/Yg1dqZeQy6Rl38XGcd8rY9/K4+WzpqGZfJv5IlTpaK2JtGVcPRsdw95oB7NLuS2b
 PdnPHdlexfBGTBo898d0Y8OZ62DlC9x2M3xwW8wYwtmYo9awp5RzbwcPPGEveDxRCTqJosqLRDX
 cUOhBbNz7osnwNdkMoIkxJRY6xywUTuD7MQcYHEox9ckvEHK7hs3gt6RFdInsFMEvtyoHrxmelv
 0Idk706+l+Qrc
X-Google-Smtp-Source: AGHT+IH5qmFiTH9hDHBdC5dzcl3MytShxugdgFdo/o75P7fyvHp7i4gTligXoRcBuTDqW3jxFT7ZxA==
X-Received: by 2002:a05:6000:1f81:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38f24528db4mr741681f8f.46.1739398976659; 
 Wed, 12 Feb 2025 14:22:56 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f217sm31344185e9.1.2025.02.12.14.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 14:22:56 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 12 Feb 2025 23:22:52 +0100
Message-ID: <20250212222253.719983-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739398977; x=1740003777; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0LPUnFLfrKFrMlHOxKa+Nk7kBjJZLF+hRGCH3Q5lX8E=;
 b=UXs0Pitt9TleCUs/ckv7WyrE8idawhE5/g2leFPNdjQGl1mFtPkarbbArpELSwHMZ8
 Wad5CRvQLdZIWAxn8Aq9U+C8IDz4bsjXdNqGoFUMQgjb7dyJBFv+73rQWkV1tcgqhV/e
 OE5+bnby3fp9lrO3/EtdHUaszDOQiFOhkGR7Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=UXs0Pitt
Subject: [Buildroot] [RFC 1/2] support/download: curl: add --location
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

Without --location (-L), curl doesn't retry if the requested page has
moved to a different location:

  curl -q -v --retry 3 --connect-timeout 10 --output 'glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz' \
    'https://github.com/bminor/glibc/archive/2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163/glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz'

The generated archive doesn't match the expected hash since it was
not actually downloaded.

  curl -q -v --retry 3 --location --connect-timeout 10 --output 'glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz' \
    'https://github.com/bminor/glibc/archive/2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163/glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz'

With --location and -v, we can notice that curl actually uses another
url:

  * Issue another request to this URL: 'https://codeload.github.com/bminor/glibc/tar.gz/cb7f20653724029be89224ed3a35d627cc5b4163'

So the downloaded archive match the expected hash.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index a543091d4f..1e8025bf83 100644
--- a/Config.in
+++ b/Config.in
@@ -114,7 +114,7 @@ menu "Commands"
 
 config BR2_CURL
 	string "Curl command"
-	default "curl -q --ftp-pasv --retry 3 --connect-timeout 10"
+	default "curl -q --ftp-pasv --location --retry 3 --connect-timeout 10"
 
 config BR2_WGET
 	string "Wget command"
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
