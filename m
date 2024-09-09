Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C35ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A92B80EBF;
	Mon,  9 Sep 2024 16:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gCwqrSZggD1; Mon,  9 Sep 2024 16:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD5B881120
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD5B881120;
	Mon,  9 Sep 2024 16:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10ABD1BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D357680EA7
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XayquFQcFyA for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6836380F8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6836380F8B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6836380F8B
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cbc38a997so2858005e9.1
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899282; x=1726504082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bvraT8LXvzpazm825vAOxKm/GKWdHQo1PdkfH1W14k=;
 b=sZvlpKbSJEDwlgP6D64KfrlznNvZ7fakceguPBMg+nHOFBFkIr0DYLHCv7XLr0cTe+
 fM9FFU9umELBVqYED8Ub+HFHy7MD6BXdo4GOEW9WChXBGh6FMf18EYbBcv7/t0dn8Y85
 Sn98m9xLUF8mHvzykUMNpjG7jMIcvyscvmCy/XrJi/985fSUHBrH3noPuvqXy05ZwXaS
 VK9M0LKaMGk+VBnbvlQuB0VCWU+1K9yy12JdGkaCn6kmhLK8NiiRgRYUMP7h+cGt71nX
 TTCLWy36GvLAyhus7RK4nXlp8UTpdY4t7j62K60jxJcT4a3NBBPmFGV4T1+28HIfsu8u
 lovw==
X-Gm-Message-State: AOJu0YxRILfuowqskB6AK4YQ2Gjnq82042LthzWvpjlf8YR3ccjdOStV
 0CmTGbHJne9wrF8VTtnHeTTA4W8FwHIVTXTsYB9KrEdhmFGXXs4HvgUqBacyXVAWulaAp2EE7P8
 2/g==
X-Google-Smtp-Source: AGHT+IH++iRtDnj6bWt5Or3GtIFrPjK3F8tCNip6zNpBuPwWSQzWW+rgzwMsWtrhM0R57VfGPE0CFA==
X-Received: by 2002:a05:600c:3b1f:b0:426:63bc:f031 with SMTP id
 5b1f17b1804b1-42cbddbd7a2mr1411185e9.1.1725899282197; 
 Mon, 09 Sep 2024 09:28:02 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:28:01 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:27:00 +0200
Message-ID: <20240909162703.3439481-18-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899282; x=1726504082; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bvraT8LXvzpazm825vAOxKm/GKWdHQo1PdkfH1W14k=;
 b=MN4FT/Ro1s6KNnlHOZMIqV3MTX8Fe9aDBh+QWgFfo0xzrFeuXbahwXhDR29K46s+Ry
 HkNuwu3UeWpzP4Qj7kNccCbGIrZgbe9n8x8gRl/eihaxbHs3vA788XmBdihlaqcBtUwz
 dbTyrwCtNPqvD/Wl4pqaZB7mteTdCaHZzuzNYb74w8MY+WUgvhtK+um0J6+X9z8jRSCE
 +K11LIbfH5wAhizVipFHtvxm951McUXrd//NxG4+XKGn1uVWA/WhoCPxjMomOgpCqrUd
 UcXFR781P490uqbKqs9mqn3V7hzwtLXQ9M/OMFuRARmmfmcPJx1/fiYrCm3vATy48AwW
 Fx3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=MN4FT/Ro
Subject: [Buildroot] [PATCH 18/20] package/perl-http-cookies: bump to
 version 6.11
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

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/OALDERS/HTTP-Cookies-6.11/diff/OALDERS/HTTP-Cookies-6.10#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-cookies/perl-http-cookies.hash | 8 ++++----
 package/perl-http-cookies/perl-http-cookies.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
index 15d9e7a86..d5aefaf83 100644
--- a/package/perl-http-cookies/perl-http-cookies.hash
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  b4d7804231b1dfd10999d42283e0cf06  HTTP-Cookies-6.10.tar.gz
-sha256  e36f36633c5ce6b5e4b876ffcf74787cc5efe0736dd7f487bdd73c14f0bd7007  HTTP-Cookies-6.10.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  80017e7e56bdc8ba16dea75789748829  HTTP-Cookies-6.11.tar.gz
+sha256  8c9a541a4a39f6c0c7e3d0b700b05dfdb830bd490a1b1942a7dedd1b50d9a8c8  HTTP-Cookies-6.11.tar.gz
 
 # computed by scancpan
-sha256  82902ce20c8ed71d7f4e7a6a5b2b26e43a7e2e90c78098fb49aa49e03ac808e0  LICENSE
+sha256  d864d8998d1ce086dc35e5644fbfcf1b46dfd08b0ce8d76d3e32bf86e6953ac3  LICENSE
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 745fd10a7..6d87bde2b 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_COOKIES_VERSION = 6.10
+PERL_HTTP_COOKIES_VERSION = 6.11
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
