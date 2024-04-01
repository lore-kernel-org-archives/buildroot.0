Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B4FCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10E08404EC;
	Mon,  1 Apr 2024 13:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79Kjs5o1nrdM; Mon,  1 Apr 2024 13:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B3A340B5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B3A340B5C;
	Mon,  1 Apr 2024 13:13:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C3DE1BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B353381EB7
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPDPiVMYDxHX for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:13:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCE2881E5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE2881E5F
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCE2881E5F
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 13:13:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so498758066b.3
 for <buildroot@busybox.net>; Mon, 01 Apr 2024 06:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711977193; x=1712581993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0CvW2T0kQ3UQlemAxR99wSdQOCy7UVI7PVONZ9v4ANk=;
 b=nCoupq4AbM5uUqGVQH1XtFeGNcbXRqbX9GEbaeby4NzFfCjVjKt2N+ahe2QBCdAyej
 OgYgbAd3A4wpk1VHzJmMa80DzdG2k+Y1ZsvNIgJN3iA0utKdGinwjEdji5cP7YpBxVtN
 cSDnVMak8jzDpvPVT7bEM2/gMDhn+Ow/NiGIzHDOsUWV7hc3ZhDCsKUoeXKzz2qhh25j
 EV4iNCAbPTIjG9kEN42PZWpxpOt/d62SnqVSKt46sNX0OTD2JUK/s6gUFpCSO8QcZ/bs
 /KQqGd3cD1JX5psDAdqQGbNfR+JS86lewOwI8dhXs3s14kkfCkPeLIRnxzVAdehCyxRX
 6+eA==
X-Gm-Message-State: AOJu0YxnyBC/Jtl/F4zUzEZJdz/B8XvS9m1ImGNQaPFwGtVScQFvOPsN
 MIlsY45txiyaucYDZHZ3BiwtX836ByxzNrBZrj2Lv8n9FudwmDaBmxu9BF7c
X-Google-Smtp-Source: AGHT+IGe9f7K2gaGv70AnV7CsC1MK4SHRA8i9gKge4HCRzUyjvSXIxIxE0BGPtA3deiE98+Gv5Y4lg==
X-Received: by 2002:a17:906:6a20:b0:a47:4bec:a211 with SMTP id
 qw32-20020a1709066a2000b00a474beca211mr9492635ejc.40.1711977192852; 
 Mon, 01 Apr 2024 06:13:12 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 p6-20020a170906a00600b00a46d04b6117sm5308984ejy.64.2024.04.01.06.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 06:13:12 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  1 Apr 2024 15:12:58 +0200
Message-Id: <20240401131300.511245-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401131300.511245-1-francois.perrad@gadz.org>
References: <20240401131300.511245-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711977193; x=1712581993; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0CvW2T0kQ3UQlemAxR99wSdQOCy7UVI7PVONZ9v4ANk=;
 b=Wgi5jClThB4Nq+LyP/pRWdbuY0jex27Pu468deSzcJjSXSnTaORJVhCfeAqqP58E1g
 RW31hx9WdC0Fvl0IthYIzH9rWWPEMLpdxijkehvcPLvoArUZAK+zwKltFPAnkO3sw5KE
 Nl5IB/D18sF/tklJa0ippxd3RSOiuCXf/X+B09q5TaKlADJvLtyzIMyfLr6GcLbDgFNg
 A3tYO5FU+1OB3iG986ZjwvLxzD6r808Dog1EZoTKVzbauBUbAFD0EwoH8rV5unkA16NW
 L39wYfOMLwkpK215i1l1IOmG2aYS9QOGgEoP57O46W/VMDIKhQic+nhMLJmxz8Jx7DAg
 Uzww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wgi5jClT
Subject: [Buildroot] [PATCH 3/5] package/libksba: bump to version 1.6.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 3ac36e19c..e74cde2cc 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  0ada15ac00baa7df677a05bcb517621708f9c2f2  libksba-1.6.5.tar.bz2
-sha256  a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16  libksba-1.6.5.tar.bz2
+sha1  1db4222e052656700021a30d517f5aa2f882da4a  libksba-1.6.6.tar.bz2
+sha256  5dec033d211559338838c0c4957c73dfdc3ee86f73977d6279640c9cd08ce6a4  libksba-1.6.6.tar.bz2
 
 # Hash for license files:
 sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 52ad5fbee..b87efda22 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.5
+LIBKSBA_VERSION = 1.6.6
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
