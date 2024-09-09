Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A362ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E9080C9C;
	Mon,  9 Sep 2024 16:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TITWFLjh6gL; Mon,  9 Sep 2024 16:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 867B98113C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867B98113C;
	Mon,  9 Sep 2024 16:29:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C60F1BF947
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6633480EB6
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tXkrqZzYv5v for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E767280EB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E767280EB5
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E767280EB5
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-374d29ad8a7so2967152f8f.2
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899280; x=1726504080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VNXVREBwBGDljCrVI7WjQi6djxpDfjMvFLVnIam93YA=;
 b=m3OIffLaoh1LNgfjuLfuywmGgOhLtWIHiWjZC9ts6nXypygHk9CgicvPDBO4AyaWqh
 ZXTJ6l4jcK6uujO1NHIFWDc2poSyWMIRfeNomrhZ+iUe+kOjaEZlT2rgCJdVf9qFbpOv
 YMasLhmQokdG7pkHeiPlH5h2HAZg7T+6s+7LWM75TanDza6ox0KUYXfmCbxIse4kje/b
 TSKH92rETzhqp6pA5De4OnXwHypGYdtX8KE+LjwEuVLOXFi7Wz/bHt3OcfVOsdYVloi3
 WVtWtnWqyf8/cEuWENuNbHwj9IrcCiSYcCknltoCnGZqXyLfdNeTzF6RiYLgzxr8aTv1
 KOKg==
X-Gm-Message-State: AOJu0YwzwuHxNO19s6OE3dWevuFw5smFaFjNA49CgVJM5YWR4lQrU9gd
 Imx6457bg6Bc1xQ+aU4QCRL16g7x+bHIn9yqQxePAlut2XtRO/C+UZn6NmEhWi6yyV9mqCOfSeS
 gdA==
X-Google-Smtp-Source: AGHT+IEf+HZtAUm/He702sH7OLQ+ZIyek8z1arAU/lxteosD5qnK338lhtfggPAv6AaJGu1vM+LwMA==
X-Received: by 2002:adf:a457:0:b0:374:c0f8:1910 with SMTP id
 ffacd0b85a97d-3788960b63emr7381814f8f.31.1725899279768; 
 Mon, 09 Sep 2024 09:27:59 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:59 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:56 +0200
Message-ID: <20240909162703.3439481-14-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899280; x=1726504080; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNXVREBwBGDljCrVI7WjQi6djxpDfjMvFLVnIam93YA=;
 b=limR3YGJXUls3f2gwWGqkIU/SoScKQBY2fgWLQ0JtdnF9SXRmN5yV1e+R1APpbtkTb
 j4R4XZxgXqniFxJL0y2xGtibzW4+YclVUpgpo/Efthhh9zt/HunwT38OSqXc1vVkoWoU
 J274VdebHGlfRtMgaL6gYNEc5DXPBO/noGU0QxCZaq0yaQndYe7YXx0X0REwS9y1G3yg
 PFMMe3HoQ5SeNmcS47A971dPXuzKEr5vzzlNjmllsJR32jnbOOwYpWCNtpMomcJtIvOs
 oWKOz9pZsqjYE15J3wnFtQM9F7U0d2lvq4mV9iXPm1TCeaAb+MASv0JssZYUXXWz5itK
 8XCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=limR3YGJ
Subject: [Buildroot] [PATCH 14/20] package/perl-extutils-config: bump to
 version 0.010
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
    see https://metacpan.org/release/LEONT/ExtUtils-Config-0.010/diff/LEONT/ExtUtils-Config-0.008#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-extutils-config/perl-extutils-config.hash | 8 ++++----
 package/perl-extutils-config/perl-extutils-config.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-extutils-config/perl-extutils-config.hash b/package/perl-extutils-config/perl-extutils-config.hash
index f4a4b18fc..92ee0b63a 100644
--- a/package/perl-extutils-config/perl-extutils-config.hash
+++ b/package/perl-extutils-config/perl-extutils-config.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  565a7b09c7cac5907a25bbe2c959a717  ExtUtils-Config-0.008.tar.gz
-sha256  ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c  ExtUtils-Config-0.008.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  f455b5743db7b73c80e88133effa3551  ExtUtils-Config-0.010.tar.gz
+sha256  82e7e4e90cbe380e152f5de6e3e403746982d502dd30197a123652e46610c66d  ExtUtils-Config-0.010.tar.gz
 
 # computed by scancpan
-sha256  33b39fda54675d4d681764049e27b537cac12213aa6650667abea43662264ddc  LICENSE
+sha256  bb85b6b9104be3c7b17a4ab7d7dacce239ce640312bc4cd1e78a51780128009e  LICENSE
diff --git a/package/perl-extutils-config/perl-extutils-config.mk b/package/perl-extutils-config/perl-extutils-config.mk
index f46ca3e6f..fe41fbcdd 100644
--- a/package/perl-extutils-config/perl-extutils-config.mk
+++ b/package/perl-extutils-config/perl-extutils-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_CONFIG_VERSION = 0.008
+PERL_EXTUTILS_CONFIG_VERSION = 0.010
 PERL_EXTUTILS_CONFIG_SOURCE = ExtUtils-Config-$(PERL_EXTUTILS_CONFIG_VERSION).tar.gz
 PERL_EXTUTILS_CONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_EXTUTILS_CONFIG_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
