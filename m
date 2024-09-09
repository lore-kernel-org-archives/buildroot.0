Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A985ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76B580C96;
	Mon,  9 Sep 2024 16:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRwmaNAxu_Gt; Mon,  9 Sep 2024 16:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD4D8810A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD4D8810A3;
	Mon,  9 Sep 2024 16:28:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10C0D1BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B747B80CA9
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaCsC2CR6mjb for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7555280E7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7555280E7E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7555280E7E
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so6001725e9.3
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899277; x=1726504077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/+WqqbNlLxJD7ctoobkqnJQuSj21IGbiDk6rqEL8oA=;
 b=EEwV1beWFmL4yDzBplwFSmwlLjo5wuevSzcyS2B5Bn6mhbnxgJkHsYLo7pabMv6cn1
 0R8IA4cEaYGkQIyngb1OO2UX6zciF8w0Mho+m/IbV0nQyGGhha2pU302ntMT2yILutKq
 TAJQsj3NoxK/uPogOhCuhh1EImL2RoaV6mLhtLyYUHDJT2gR3yYVKYQI966VyYQP6b0W
 AcK8y+yY6tB2avsL6FvgP1dGIc4seluH95G3VDAD3862RuOx458eFBC2NjUBjkIUEm/+
 le0NqKi41LNg0oOlTDwx3U63YZkY5JWSb686G3RZxdDvS4cP1XCWoNCQa2yqh7gf08pq
 3hWg==
X-Gm-Message-State: AOJu0YybZDkwVfqEjENyno560QNWaHZrMmWCfbUHaakKouAUsDqdwT2m
 peEMhPPtKIC7K7dF23U70IuH2/WicI91O9lg9GceDijiJ+lF1YZ569iJL/E1GiIQbF3Rk7mP1mQ
 h5w==
X-Google-Smtp-Source: AGHT+IFeTBMaOBmbuuTZKF1Cn6bE25Hs7CmJxvb5T141U2voSCkZrplzdPoQrBP+K6wRG86jeil5lA==
X-Received: by 2002:a05:600c:1d1e:b0:42c:b5f1:44ff with SMTP id
 5b1f17b1804b1-42cb5f147d5mr35253725e9.24.1725899277255; 
 Mon, 09 Sep 2024 09:27:57 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:56 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:52 +0200
Message-ID: <20240909162703.3439481-10-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899277; x=1726504077; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/+WqqbNlLxJD7ctoobkqnJQuSj21IGbiDk6rqEL8oA=;
 b=cAqbKc647GU+J81zFh8HrNwXDFvtR9JXpOZwrrT/7YAj2vGu/yzYhiBksAu2jTAYd0
 dgWx1LB7qxOEv9TJ1TfVl/cY5+ot5XyGG6O8r8zOCufsXA6AKqde9L2LRvYCKQFXOGGb
 qfqpqYMSyjf9n5imXk6ir0yMtf1GnGdsAb+/kyVvOJFQs+T9xecXYkHje1VEo5/hTG02
 AsYK4bXWhnn+gXgmVHzpUbHmeLY2l2dQ+eEqs1sZPhbyQmPsg+JYjTus6tru7Ay+A6kH
 Yvio8nH7+uKFHN6QpkKtXen12Up5P7RcaebmEcBu6JL2RpQYMIOzRk0GoBs/P8Dv/iC4
 52hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=cAqbKc64
Subject: [Buildroot] [PATCH 10/20] package/perl-mozilla-ca: bump to version
 20240730
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
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index c9bdd0524..8d1b8c68d 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  680e2107973ee6f461e3c0ab57066489  Mozilla-CA-20231213.tar.gz
-sha256  421a12ba7cef443bd368671cee9c9b46a8b55c2ccf7ac76c42f99e23a06115df  Mozilla-CA-20231213.tar.gz
+md5  5e1c97b65ef6fb4ecb07d0d01b3c655e  Mozilla-CA-20240730.tar.gz
+sha256  55bbee1875a905616e0c39457245f94f8173227fbe906f643673f5adadedf863  Mozilla-CA-20240730.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 92fb3cec6..9e8dabe28 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20231213
+PERL_MOZILLA_CA_VERSION = 20240730
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
