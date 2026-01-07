Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59715D0D16E
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2623840A17;
	Wed,  7 Jan 2026 20:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l440LSWo4ZOK; Wed,  7 Jan 2026 20:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C8C40A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816032;
	bh=/B3fmCouWY7stbTGyGnwOewn9kQz8/2XLutfM1scDlc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=TisSWvbOXzXJI/jOjGo3cJ1cdQK3bl9s4ogKHjlwmuUdVCy7AtEyEeP23QdPkOwBm
	 BUG9lCKGs6Va0Fo6/lv0mQ6IE/Qgg13hs+j9I+Xy4uKplJKoaUudZ9RJdoaqebOLGJ
	 zmw0bay0ldVTmEHbDKFFCgMAo7oayCGC0L82oHAK5j5NkA22+K6Y3MpHrCipAPsDmF
	 ar/BHrNX6sc/P9/LgabMBd7XSOEquN2eA34NhxYt5z09yPzZ5wtH/EGMs/2y2TG1XP
	 O4fBRvgaK6rTtq+PncwBoPWGzknWkGKRtB1b9gxFRRNxKakVxDSPBlIjFlqevPEhEW
	 DIYJHWPBLWISA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49C8C40A43;
	Wed,  7 Jan 2026 20:00:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F9209ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B74E822E9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wV0UDP25e0_L for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43D588226E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D588226E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43D588226E
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477632b0621so15456205e9.2
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816024; x=1768420824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9TBgqhsgvsyRuIYelRkMFJa8HWkqrQS/rR2VggIlzp4=;
 b=u5AOqLP0ESn056ygLXPTCDliyzU+dfI0n0xagHj78owfJXuD0KwbEzhTyLZIwchQFz
 KJ0xs+/3GvWaJv2gTDVBJS+3F3Aw5rCWeu6bx06KeiuYY+Y5B+bJYgh70tuzg5NzcwaP
 3EWQH8DgksRJ/oiXVnH/U7iLOPTZfYO/fXZMUxJU8bGdhNn08m4893ysC7QN7f/ZmbVL
 PzyENP5SumoJJfUlCLrLkX5loPiM4fc/nnxKO1Gd/EOgHkOngT7GUMIlpOMLxfWEyWi7
 Jtt6X8P+BIVxHNAVLAO+ZoDucXb4xlMz0S6WvTCGUzb8yht3grOW4OpeplqVgDcilann
 Lpag==
X-Gm-Message-State: AOJu0YyUGZAIOG5cExvdc4eqSji7SR84xF+cAh89GaMOZjs0n4lNkrBr
 3m5Z4/C2bFRsrZSzK6mTS3NeugqaSTpGkzI5/2wgAUxVOAZPXDfEljbLjPBTf/2OJ+6zsY/qgCj
 5hLWP4g==
X-Gm-Gg: AY/fxX6Ic3OByNS36Ol9g2S95vBsqiS18HOvaPvLpOQyWRNoQJCK0P8Kfyc8HTHVsG9
 jlxkMr8TVP2+izaWnexi6hGrjUmAvyJ/H+Kkr3Wp4jTCA764JpqBRjj4F/eMJguvWZ+sxyG1BnC
 hFioJti0gvYyZCh83/TWN2L5okUE3fl0xVtWJ2lO/lgT28125GfGxbxdZCgkABqJSfUCx/8GFK/
 TAFA8et0zdIQvXPMCxpzPyqQHRHexIh0g7LoXnBQVDahLF5ys+J/IT8hPXW7mfIrA2+ITnhCe9h
 6llKLeFxtRWsI9ZGzNQ4LM/szNH+FjaLHSjYv7JbHsgyo4+TjMCYPy3uYaFQn0O/y7XVNisBWVB
 obFKoh8ds7MJdGQWbqwhDtGeQOVsG9mYZ+cJtjVeDGw0zE9K1lDseBJPgSr2uSa2f6OgWJoiozC
 txjtm+iIJFh/nrU1AmxdPF+IoUJ0TUKGjpCkk=
X-Google-Smtp-Source: AGHT+IEjHUX6tej2JW1Xv6wZqgGLz+1P2w5aYLAvMo5ECjP7YXAXXnpNYuSehXj82GYHuYU4ppVV3A==
X-Received: by 2002:a05:600c:4e0e:b0:477:abea:9023 with SMTP id
 5b1f17b1804b1-47d84b18e0dmr51360085e9.9.1767816023850; 
 Wed, 07 Jan 2026 12:00:23 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:23 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:55 +0100
Message-ID: <20260107200004.665611-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816024; x=1768420824; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9TBgqhsgvsyRuIYelRkMFJa8HWkqrQS/rR2VggIlzp4=;
 b=eXKnkJ0SidsGC4KQGnwv4iRNCVEIiBG/zGmApu6o+Bl0KUJLifYKnqyow/FuX9PL8q
 GpfgLCKpW5plQA3Gom9bpoogClTM4bvGjpyOHLBOmoYHmlafvmEIZhIVw1tYW8KGEJQJ
 d1UIMs3bQBlxLTwMK27XIyQB659x8qlBm9MFtHQYg10oORNmneBgatLr/H0hIIDJrJ9H
 7jsaNDWqMshmiMcsltu9FmJm2l+BxXJLw0IKvM2ydvIwcTwEZyV+YBNzUZBXvc2i441t
 eZmHsmM1TxCJO3iQ6EI40ZQ+i1Rj3wDAZImQfMNCJQshmnt3EUI+KyqB0stbkoVZVLHN
 WyfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=eXKnkJ0S
Subject: [Buildroot] [PATCH 08/16] package/perl-uri: bump to version 5.34
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index b53479803..c1548bda3 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  56aa2bc3efb180eceb4c143378ab4327  URI-5.32.tar.gz
-sha256  9632067d34e14e0dae2da94631c4f25a387fcc48d06fa29330e8b3c04c4e913d  URI-5.32.tar.gz
+md5  3736f3d6efe1710176a753a7029b7606  URI-5.34.tar.gz
+sha256  de64c779a212ff1821896c5ca2bb69e74767d2674cee411e777deea7a22604a8  URI-5.34.tar.gz
 
 # computed by scancpan
 sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 671d1f5a0..aab2b484c 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.32
+PERL_URI_VERSION = 5.34
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
