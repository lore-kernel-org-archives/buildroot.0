Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10730ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A493F80C7D;
	Mon,  9 Sep 2024 16:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pocaaeV3WXhU; Mon,  9 Sep 2024 16:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49E4780EA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49E4780EA4;
	Mon,  9 Sep 2024 16:28:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 332231BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 526F880D8D
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdBUVyaL5CRf for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DACB80CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DACB80CA8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DACB80CA8
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42ca4e0299eso22540925e9.2
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899274; x=1726504074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LiQh7qU78CO5LYhW5s5j1J7I051BJOPeSWo3A/yPCIU=;
 b=AdUICvyFxmK3z9lakuqW5Iuyfn0aCjlnKLbHrCaV4chTwxFbniyBb6HOrzB87LOcsw
 JtstDLx7YjoXp+LDlLZWwEWYALpRi/qwBeLa958ZP3nQaRdAAROdWBT5R8456pF5vbyr
 aFDzns5dIRTiSgRK6faWMKmdvnD06CjAzOLp38MSaaFY7d5ZTSX/cd9Le4GdrcOVOhOK
 ibD3tLyE4Ygguy01jmlxOGTv0EcpPjm6Q4CZpw5rABLkmJUr+ZZrVFC0UkbmJeRirkve
 qy8p9Q8L2Pw3ho5ipisNAquNrtCjVrLDZzS67PBKUBEn0RH5FtUa7mGtvwWL/PAWU6Gb
 6qvA==
X-Gm-Message-State: AOJu0YyFGqKjXpJFOraGxaqhh/2WrHWfqL7/NMFABQGemTdiuEmuYmy8
 x4qInNtdSMxRzE+yybkslBqJHsGSrMvmJW39+dQeSb639elwwFzaue0VQPhyHGtdhGXMDqR+uW8
 3KQ==
X-Google-Smtp-Source: AGHT+IGvUvgViUX2da95SBp24l+J3K3cSlbowalXkJxbQh4GgjjAmdpg8qaczEN4s32juylEw2RdXQ==
X-Received: by 2002:a5d:6892:0:b0:374:c79b:ca5f with SMTP id
 ffacd0b85a97d-37892703f43mr4952007f8f.46.1725899273778; 
 Mon, 09 Sep 2024 09:27:53 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:53 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:47 +0200
Message-ID: <20240909162703.3439481-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899274; x=1726504074; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiQh7qU78CO5LYhW5s5j1J7I051BJOPeSWo3A/yPCIU=;
 b=m5te/3gtBjNuH28IQgYKUdaxY3SCuwH8LjXxrQsZvrIYln3m56U2BWTEuGdr1EMAwH
 U1e1+uLjKdUWvQaBBqx3QMJodygNQxXIJDfcVnvNSgCjHT15ssPmRd9U8qHxSVarlA5h
 hVTcfHu1OoAbJZfbSESJ+joV7N7upVomDyUszf3oX1ipJDCJsYD6x+lROUXvyLE0Cjcb
 Nzevr473QeVlUbZAPhiSRmUummKHxPLa44P5OFDMA4pe/67LDPJ6sPvXIc4sSJI4o5SL
 4erRKszkt5m96kIXw8IBnmxx3JICGiKLADdEy4pHFxdYduwFwXAgKBuRP62mFMPWS6dV
 vtrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=m5te/3gt
Subject: [Buildroot] [PATCH 05/20] package/perl-http-message: bump to
 version 6.46
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
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index b33e00e33..f42d1432a 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  86c386bcc85a63c8908e6ae9967b34ee  HTTP-Message-6.45.tar.gz
-sha256  01cb8406612a3f738842d1e97313ae4d874870d1b8d6d66331f16000943d4cbe  HTTP-Message-6.45.tar.gz
+md5  12a4bf7d993ba7b231df9a24f8bf3ec5  HTTP-Message-6.46.tar.gz
+sha256  e27443434150d2d1259bb1e5c964429f61559b0ae34b5713090481994936e2a5  HTTP-Message-6.46.tar.gz
 
 # computed by scancpan
 sha256  553ecefc0ed6d4152809da8516960b9a12352c1c0d7d289ac4ab06d0bd0e67bb  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 7fdba0b29..2870c0c71 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.45
+PERL_HTTP_MESSAGE_VERSION = 6.46
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
