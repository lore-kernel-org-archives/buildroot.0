Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4204C47DDF
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 847586158B;
	Wed, 24 Jan 2024 10:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 847586158B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q72BT2sNXRne; Wed, 24 Jan 2024 10:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D9E61446;
	Wed, 24 Jan 2024 10:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D9E61446
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 095681BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7DF083F28
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7DF083F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQIT8VcmTrKD for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:11 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADAA483F18
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADAA483F18
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so57460185e9.3
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092509; x=1706697309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FnfW94EqbZPfDXQEO1DcEf51jlVhdmcN5jxhvgEllRs=;
 b=BILkcBPy7whKkbyuP7RbZatTdixdBcsftKixcT5nb10eiAPHRGvHaB9BAxWbo/VyRr
 Jc3f13C4J9No1YTBUmJGkloLn1sTjJs0jg7JuRLLZ1ndr0dYYX9aMg/9Fhy6FyYD7FvM
 ldqxaSVWd16LJ72/+pRGaI7vuuYHAPdHP+Dze7RuehH4CzL0uSkv51dgZZWkOpv9/X54
 YgVBYrS6l2Zm+IlHWr1QjeMRUDNJ6Rs84L+lw+q293LG3Ujz5FPZxgZ4XFCgNySDyRIl
 VCVrVHG8URYFGzq3wT+1A16yRieHlQiTCNtkoSdiViQN1INNguTQHeYbZ8CiCCfa/Oku
 notw==
X-Gm-Message-State: AOJu0Ywk6KCTG/kyb4ptMRgFIwrs5HspB6xiE6Gp96aAB5iMXyxguQXp
 wJaVmKybfLPT1vnP7PS/nXfefCXdQ/H70jj3muPqAcQUjAjIJHhXskvuZece
X-Google-Smtp-Source: AGHT+IHQySt6io1LUp13wBaceX02/wlgS45MVeZEn0qrgzMMCa7MHB7C3bBiALejI9xT9CK8wfUWZA==
X-Received: by 2002:a05:600c:5696:b0:40e:a38b:3296 with SMTP id
 jt22-20020a05600c569600b0040ea38b3296mr970366wmb.145.1706092508863; 
 Wed, 24 Jan 2024 02:35:08 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:08 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:49 +0100
Message-Id: <20240124103453.623733-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092509; x=1706697309; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnfW94EqbZPfDXQEO1DcEf51jlVhdmcN5jxhvgEllRs=;
 b=MdISg2M8p7Tm3EMjQmtpB5gUC8+xyVE6KF2Qc9iJ8omgDHyNao2R2x9VN8RrQy7BUz
 pf5n6HTLg+mr0bl4XsjRj3jKjuV3OoVkDVAxI+5CKAqYJWt7AuNrNlkORXcjQv2an/x4
 QA43ydtVtt7ypWuxEsUPGCBox8KtmcqfpZbbbKxWSArhgKThU+tOa8yEM4FQh4W1RrBt
 wKwGUVMbHvNFRJvjoRjfmwmLL/4Ngjd7/F+aWlAsfccj/lNdqXzI5pLUmy/xETHSSjQo
 iTrcrtDzE1+nHlnpoCLlY4JxP8zIeGSYwUpKl2l3iC2VRLMbLzpoShhGT2ZhDjRAFOYp
 1fpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MdISg2M8
Subject: [Buildroot] [PATCH 06/10] package/perl-mojolicious: bump to version
 9.35
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
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index ddf27a808..b1ff561f7 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  530e682c101eda6caa0b65438a0b704d  Mojolicious-9.34.tar.gz
-sha256  5069d68e4e2d8ad663db58859b4fec0ce79ab134d9e58055aaaf3f0f3a73a2c6  Mojolicious-9.34.tar.gz
+md5  8fba4deae54681d560c275c28803b48c  Mojolicious-9.35.tar.gz
+sha256  6a4a446ee07fca7c6db72f5d817540d6833009cb8de7cce4c6fb24a15ee7d46b  Mojolicious-9.35.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 040fbf08e..4657d2792 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.34
+PERL_MOJOLICIOUS_VERSION = 9.35
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
