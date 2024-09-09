Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A4DECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B8B80EC2;
	Mon,  9 Sep 2024 16:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQ3DsbbS0pyh; Mon,  9 Sep 2024 16:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135A780EB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135A780EB6;
	Mon,  9 Sep 2024 16:28:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 122BA1BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CEBF80CEE
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCZtXDk5qsTm for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56CFF80D8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56CFF80D8D
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56CFF80D8D
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42bbffe38e6so34133955e9.0
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899276; x=1726504076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOkZ1N6YV8ORoiHxC0GC1+b1VRrQnj8VB5DF6b8eFv8=;
 b=Kzt84mgvdpydR/930uimvNg1McMEcWfAGe6UqPIINAVmDXpDSEhMSJxcU8lXWEY1ho
 B42/DOI6zQcKTSXwfwYvQYrU8hYmZbE83C5WwZi8hyc4j/ZHTtG2nm6GaB7K7VgSWMSI
 D6hW8pGqA2Zn692NXtFIlZb/118WHcPdqPCiaocJpRzSNuAA4xShP4PYq/pMJbuhTHhZ
 h31AyDmcROMibvpm+MVlOsv2FYYiXrVuv2gYy2iSvEJ7LMn24Auyoas7gMPxhuxOJZW3
 /eZtx2zGIM8HMrhPVDs6W3Hx1uJ4UDsxQfHvFpfBQE8vdNgmvQMhhc88zj3KN0WRWSxN
 Tx1A==
X-Gm-Message-State: AOJu0YwTvWeiJIvY0cLHeF0uc06Cp2Apm6tlTy91TLxAasQiUXekWQLL
 Nfsx8kYYRovsgoNgcyxMXP5doV4l7qRw1fxZSIGX1/KVx1nLvqitTT+OHV9uM8oK0MJsmdFfTIK
 S6g==
X-Google-Smtp-Source: AGHT+IFvNJFL24QrIELpxuQ3maV9BcU80VOIYkNTGLKq/PtmHQgEpUHkSIdS0xkSWJLtcVtQ/k6cpQ==
X-Received: by 2002:a05:600c:1550:b0:427:abed:3602 with SMTP id
 5b1f17b1804b1-42cad87efd3mr60332235e9.24.1725899276135; 
 Mon, 09 Sep 2024 09:27:56 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:55 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:50 +0200
Message-ID: <20240909162703.3439481-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899276; x=1726504076; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOkZ1N6YV8ORoiHxC0GC1+b1VRrQnj8VB5DF6b8eFv8=;
 b=mmrXjk0f34gCqwQfEnm6nCs4p5wzvq9EddGczaB99psmYnkfQjVOtXPjmIQX19MJ0A
 WUJfMwrHoqeNQTqb00wvak5yM5j/1yBE6OtAYJCH5eruuP0Ltxfcks1UX/4JOIeIgRyW
 gu5skO1aOiGINzJF8h8t7rxZmuefSd25o/iww6HjKOhN4N/XeHIJRKCU5x+099+USPvx
 j0fhLK0X/MB8QsfaJYFOm2c2ALBp1er5AkB6ao4yda95JDa1FRwpeh3moks6S6w4MOfW
 ejJCvBID3228zdNLdxAtKDYEfB8c9N2IlANo8yFdE7zgaucJnWdt03i94Pu+V7vMXxD8
 v2pQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=mmrXjk0f
Subject: [Buildroot] [PATCH 08/20] package/perl-module-build-tiny: bump to
 version 0.051
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
 package/perl-module-build-tiny/perl-module-build-tiny.hash | 4 ++--
 package/perl-module-build-tiny/perl-module-build-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 7b503ff06..6b467c3ec 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  de9814b3c22825837438fc70adad58ac  Module-Build-Tiny-0.047.tar.gz
-sha256  71260e9421b93c33dd1b3e7d0cf15f759c0ca7c753fa840279ec3be70f8f8c9d  Module-Build-Tiny-0.047.tar.gz
+md5  15b4434617b61e70315c0838c020a48e  Module-Build-Tiny-0.051.tar.gz
+sha256  74fdce35e8cd4d787bc2d4fc1d43a291b7bbced4e94dc5fc592bd81ca93a98e9  Module-Build-Tiny-0.051.tar.gz
 
 # computed by scancpan
 sha256  1ce3282467869416f29b0c5f7773d1b80181fb9e08bef64e3829e8c53e19b64e  LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index e2e3d83e7..ca2fddeeb 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_TINY_VERSION = 0.047
+PERL_MODULE_BUILD_TINY_VERSION = 0.051
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
