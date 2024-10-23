Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F43CFA448
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D206088F;
	Wed, 23 Oct 2024 16:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SObKbFnLHnzk; Wed, 23 Oct 2024 16:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 946E5608A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 946E5608A0;
	Wed, 23 Oct 2024 16:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A33C2072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBDA8810EA
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBg3FaiK84J8 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E444E810EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E444E810EF
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E444E810EF
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 16:00:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d43a9bc03so4917418f8f.2
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 09:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729699225; x=1730304025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmIe0p6xCtAlZV2prr8tdQhjJVmNj/qW3Raj1xqwcHI=;
 b=mHMUPh9o6nbe4Dsu4/8ZvSoH8BloSa2XgJ8MTMY1hAACrxtg70M7h1dR87M5ngfG0G
 9V80a8jHfnA74dn3pQ82bM/OuIsLD6b3s4nXfQ29kwx9Lh8Znd9UDe4fT4cpbX1raVhN
 yIvR26uAQYuxbT9szAxHWAnCFXNygfTgA76jguE7GXFvZbKLbM+okv4C2iz4YNijCghe
 QRMbw6PyVsYkkFOqzED4xYvPfC+TRqSumWYbXk/3vJPfRBCauqk5be5u/d86C36IZLIt
 oW8MRANcuYfPKKFYx46p4xtzHTrK/cDunSJx7Nr98MBeFo9Qj1A0+770/YACtQctvb9o
 ovPA==
X-Gm-Message-State: AOJu0YxtAH1LACrbbc6EMKjllFSH5Q9ve5Am+LKB5X0e6AMnrWjHqMZr
 JuLzAf8BoEWuwseDbX/ZMhcIcKCGTQiGvtx0drNqXiIMfHh8P5wuV+UWgI3yA9f3Oh4CuJQY3zO
 jIg==
X-Google-Smtp-Source: AGHT+IGwfkOMt19SMuKRB4gaVMZvkc22s82WBAA/vBoLJYqK+EyzOBJPJCGbRXp4u+KcWWHXnJ987g==
X-Received: by 2002:adf:f7ca:0:b0:37d:501f:483f with SMTP id
 ffacd0b85a97d-37efcf84385mr2034085f8f.44.1729699224765; 
 Wed, 23 Oct 2024 09:00:24 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b94356sm9214111f8f.67.2024.10.23.09.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:00:24 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Oct 2024 18:00:10 +0200
Message-ID: <20241023160014.568872-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023160014.568872-1-francois.perrad@gadz.org>
References: <20241023160014.568872-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729699225; x=1730304025; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmIe0p6xCtAlZV2prr8tdQhjJVmNj/qW3Raj1xqwcHI=;
 b=kTvkbMz1s6MVLLJ1h4ltFXp6cUpWjAYu8rFdXWWqE4rDgUbX0gXdwQeaZzf4FDviYx
 QEmHwM5J+eigjekJGgB9YoxR85Y/xMVxW77LtSLEAHQdkxSa4cKwUjN/rAZhKYv61+39
 TdKmJcVaSASL/J8T57YlYH+wjk5s2deAy8r0f4rNlcHxkH8HnbFzyfNdv34Zh+6a+H7S
 oCKAYGHO4Xz9F2zfuptKeiKlwg8ag0MlzPc897W/GtwhjaE4excIzRNmLi3LrNgMq6f4
 UlCZo1ufQ8kDq4nmPRASoQQrE66kjTil4Eu5qWgqpmbB3WJUzhQSgfEZdRxccIEFqu8O
 YwWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=kTvkbMz1
Subject: [Buildroot] [PATCH 3/7] package/perl-http-message: bump to version
 7.00
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index f42d1432a..f733a5c91 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  12a4bf7d993ba7b231df9a24f8bf3ec5  HTTP-Message-6.46.tar.gz
-sha256  e27443434150d2d1259bb1e5c964429f61559b0ae34b5713090481994936e2a5  HTTP-Message-6.46.tar.gz
+md5  01b29ce55d79a774420bc768bb905354  HTTP-Message-7.00.tar.gz
+sha256  5afa95eb6ed1c632e81656201a2738e2c1bc6cbfae2f6d82728e2bb0b519c1dc  HTTP-Message-7.00.tar.gz
 
 # computed by scancpan
 sha256  553ecefc0ed6d4152809da8516960b9a12352c1c0d7d289ac4ab06d0bd0e67bb  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 2870c0c71..6dfe61edf 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.46
+PERL_HTTP_MESSAGE_VERSION = 7.00
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
