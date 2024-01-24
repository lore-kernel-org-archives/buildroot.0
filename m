Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE392C47DDF
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20DF61AD9;
	Wed, 24 Jan 2024 10:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20DF61AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHw7IFsugoWI; Wed, 24 Jan 2024 10:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5851617BA;
	Wed, 24 Jan 2024 10:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5851617BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 135D81BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C389C83EBC
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C389C83EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkmUfJ1tOGIE for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:13 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ECAD83F75
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ECAD83F75
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso63322055e9.0
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092511; x=1706697311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkVnE3uBf6ygqgXf6HmavAnBhT2v0dsj9pUFH3LkOqI=;
 b=RH9bUNy9J0cKy670JghICHjXA0AbWx++tI/XhNzyGYzkp75IvWavRtvwjARjck1h3p
 OBQOrALAWbpQsaVXgm8lP7fjDbiDNmcUtk3HMxQVo6IqC+jfVrpTw9ZDRoNyI5Uk8EgR
 A7kkYrAN9K0eLvnj08rRvHJGmm8keT+rlLQWA+tEn5RpLHWbqEMddIAqlEot49m0SFes
 eImGVQIsXZRMv5FOF9k4bIsAMb1RuQ0G6QdNhtspR4Vds0rqbhxavowSwNIUOHaeAtN2
 xLMHlixydZx4hbBpXUjDdlX+C9ZSjkg13Rnmu0SPSj2oNhnO7y/JkQ5zsMTBRD3b/Qmj
 rLQA==
X-Gm-Message-State: AOJu0Yz80NktmJoUmZANgJebZGInNZr0gjWRgX6vN6NNsMAKeNXVvvUZ
 pJbf/WswtUS1e+iJ3wSPAhxAs38HXNNqj1sde+ABTzqqYqsxmlvaXnQJwBlg
X-Google-Smtp-Source: AGHT+IHdBy9IWeTpBJoVnVoxpPozQXwX5nKd7gFDrJapsqgdeKiJupXeWt40Cwk86DbAb7L69gkprQ==
X-Received: by 2002:a05:600c:63d0:b0:40e:67e9:ae0 with SMTP id
 dx16-20020a05600c63d000b0040e67e90ae0mr828249wmb.235.1706092510984; 
 Wed, 24 Jan 2024 02:35:10 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:10 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:52 +0100
Message-Id: <20240124103453.623733-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092511; x=1706697311; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkVnE3uBf6ygqgXf6HmavAnBhT2v0dsj9pUFH3LkOqI=;
 b=Iyj2Qx/4dpTaYS7Ls+u6ZN6AJux7h5do4mFAPsvXWSlV0210bR9kgPj4yjM3aS/oFY
 f5QbafoAQRcMd/wJYf0mAhDOBJvEmR/v4gDdZMRvEiPArAA7ES7TGoiGTag9n0gbeL/+
 u6RgDyV71P8LdP3TFyj1Y5OgKTDbLYfyNaaiEdr7r2AYuKtRyIljtoEHzKnikDUM//59
 ZAaETMLTYNE7+Zsa3aVJW1nLHACHn8dimwKX+Prx1pEQZH4i82wC+5Pl8Pm3X1ZI9mcs
 PXKgTfpacJmNvpS4HsHfU74ox1C2wlC3hQCRiBSRRD/pump3M8FOoAMA+rPICt/3WAcU
 A/jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Iyj2Qx/4
Subject: [Buildroot] [PATCH 09/10] package/perl-plack: bump to version 1.0051
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
 package/perl-plack/perl-plack.hash | 4 ++--
 package/perl-plack/perl-plack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
index 84d65ec52..c9e2bb01f 100644
--- a/package/perl-plack/perl-plack.hash
+++ b/package/perl-plack/perl-plack.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  0856a900a981769e3d79f0a10ccc3e65  Plack-1.0050.tar.gz
-sha256  d2651ade82ebbff7abe0a3a189fc932dadc4779186ce89468e56d0189eaa6ed4  Plack-1.0050.tar.gz
+md5  0b3e573458b37ad69069fc8cb307b6b8  Plack-1.0051.tar.gz
+sha256  bebde91c42298ed6ec8e6c82b21433a1b49aa39412c247f3905b80f955acf77b  Plack-1.0051.tar.gz
 
 # computed by scancpan
 sha256  8a0c0ad4682691b5bc138e553636adfc8bb38f8885c4c44fd421ec8cc69c9a8f  LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index c39c3d8fd..2c591cc05 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PLACK_VERSION = 1.0050
+PERL_PLACK_VERSION = 1.0051
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
