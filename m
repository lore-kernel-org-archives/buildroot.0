Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7421C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6767161409;
	Wed, 24 Jan 2024 10:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6767161409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kxKQf61fchLg; Wed, 24 Jan 2024 10:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3C62614AD;
	Wed, 24 Jan 2024 10:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C62614AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 161F91BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED65E83F49
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED65E83F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVLNHUkWk9EC for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:11 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85C3A83EC4
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85C3A83EC4
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e7e2e04f0so58006825e9.1
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092509; x=1706697309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ypl5ohcW/qKbiu4P3TYIAyWBnIC+K6ONGThmyplNEU=;
 b=l6pxZshih0gdB5ZiEOxW36fVBYz4I+pmOgMcBD/yhK7ErS0N9+9mkpZGk2z/Q2gGuW
 hgPy65cfzIc7/pG9+eUqU7W7Ve+ATUSmKTsmwVvHJlPF7j1uJKa4jq+S8iVvMxKZ82UC
 pom56gMiE6sUdRYg2k2daJWxw5S0bOILFgxd7JJ0DFGa2GJBk/OD320+kmOKqcas75iH
 RLGxNmk9BbnznFZJFIAAL+zODEDultQ/Cmqo0/KbvJo4C4l1ioa0G14SgOr6gINkQ+NL
 GZgJIgz0oF+zItm7BNHNnM8tnotJpbGYCqtsHRlTyFbl6fyC6wBgUbNV5n93i5rgkmvb
 I2YQ==
X-Gm-Message-State: AOJu0YxHWVbttKs2+srx/CZDug8jKheaw5ErcZziCoLy28/ufjoGNaz5
 BLgdBAiOO7qNGP5MTzmhiLw2osnh6QTL0m3vA2YtzZXkadspjNoD75fRhSlN
X-Google-Smtp-Source: AGHT+IHPf18diEz0EcJbqqwhlhD1+abaIhExSweRiWzRsugT5f5xKxaMB8feTy0vAhkPG/qxk6eJfg==
X-Received: by 2002:a05:600c:2d0c:b0:40e:7701:5d20 with SMTP id
 x12-20020a05600c2d0c00b0040e77015d20mr1299943wmf.64.1706092509501; 
 Wed, 24 Jan 2024 02:35:09 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:09 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:50 +0100
Message-Id: <20240124103453.623733-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092509; x=1706697309; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ypl5ohcW/qKbiu4P3TYIAyWBnIC+K6ONGThmyplNEU=;
 b=ZmZgkpD1EGGEI+eIqhorVuEHkKZeFMeE7c9QTS6UUrloH0jJsa/8nQS1vkyqOhAHt9
 dWu7GhEqR1HtDVQxKHQ6bWiOyKgBSU1VoeGzPv3XclgDlFmRb4f3KEpmFa0jaIl9djHN
 Q24KEdXtjYLYN2YF7Vq28xCw8AeiZR6fuWNox5Y1UOycLPjiXyhUltRCji3ZWrlBnZO/
 sJzHdsXjjTeTcHstyWcM6jmB/lewwD0K4VSQeePpd2fO3MmzTvoANyJqdj58sS8Ya7AX
 uBZC0NCxav0zBOlXevQ8K4QfxDgVBSBd6l/spOiWtaf2MZBU4gvZG3TfUEQ/rysWxRAZ
 7M6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZmZgkpD1
Subject: [Buildroot] [PATCH 07/10] package/perl-mozilla-ca: bump to version
 20231213
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
index 33465ca31..c9bdd0524 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  a9b7b700e651cd74130edf7432f8657f  Mozilla-CA-20230821.tar.gz
-sha256  32e1d0045299004045b9c4d16c2daae453a216208873deea2440f71260a7cda1  Mozilla-CA-20230821.tar.gz
+md5  680e2107973ee6f461e3c0ab57066489  Mozilla-CA-20231213.tar.gz
+sha256  421a12ba7cef443bd368671cee9c9b46a8b55c2ccf7ac76c42f99e23a06115df  Mozilla-CA-20231213.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index b122798a2..92fb3cec6 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20230821
+PERL_MOZILLA_CA_VERSION = 20231213
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
