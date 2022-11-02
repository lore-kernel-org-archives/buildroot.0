Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99DDC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 482AF40268;
	Wed,  2 Nov 2022 20:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 482AF40268
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MFLDjchOrCp; Wed,  2 Nov 2022 20:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31FDF4009F;
	Wed,  2 Nov 2022 20:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31FDF4009F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 107041BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E008A81E8E
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E008A81E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41RWM5K0PTOb for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:28:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0462E81E69
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0462E81E69
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:28:14 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id o65so16023839iof.4
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pqzpiTp2+dY7O61JKwyBlt1d0AeQN79YfhF6gIrKndQ=;
 b=GPmUMfpwBuEIxb64qT0MIcrOr2rU4YcNtEubXoXXKAe7YL3WFMhhuM1m6dQafwztZW
 MPQBEPpW+hFAsac/irBENBAnvO/tOfSxyzjiKlQ9YqbVA/ntMHfFSD1C80bZj3jklj1l
 TR+R4nFaw6HX1QhQl1U+tozYQ/7aj4WY+I9htH5TxB+19/WTadYKpnnlVIYr7o0EGDvn
 azqYFfCzqdR+D3ZaQDS8torG2EI/qT226WdvcnbT52Iv89Vow0VZKd9Vt5PUmITMFaFI
 nj1YZ9ci8LhBctcGYXTJg3AbaBAW3Vrc8rhxRWUzorzLuncfUidB/jb4Z1tcO0Rw9v9A
 aVNA==
X-Gm-Message-State: ACrzQf0vV3qCA5rDfa6MVUVvT83YaKVN7iys4UTWC3g7atSexfY+SQgZ
 fBnJfBLYChd+v+DYv4lBKmeEIZ878qOtRA==
X-Google-Smtp-Source: AMsMyM5ZZFEURUR0tKrs4BEZuh5ZzNHrlJwYjtste4bSanZnFh8cddEcvIKUJWYje2tLZ4sltr3HDQ==
X-Received: by 2002:a05:6602:2bec:b0:6c0:e5d2:b924 with SMTP id
 d12-20020a0566022bec00b006c0e5d2b924mr7914679ioy.143.1667420893798; 
 Wed, 02 Nov 2022 13:28:13 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056638214e00b00363aec42c13sm5201102jaj.65.2022.11.02.13.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:28:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:28:11 -0600
Message-Id: <20221102202811.3216819-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pqzpiTp2+dY7O61JKwyBlt1d0AeQN79YfhF6gIrKndQ=;
 b=oR3ZF5FnUnN4grnJjw/yA0EZpl33kqBgu929vejX2cDSEZF7Q/NnGNBdaxCxs4W42x
 P8uWwILHBQkxg03g7+xlzZwpMRvMcSXNrxt7nolFHVJMTc/WsfDPwD4coEM0U8al243e
 bFGRTcsY2lOH4j2JYM06nuyIHonTg/W7YJf6rSB5NBCFxlcDt4qCDQ4MwtkQRO4zzsdr
 fGVp/EvrPM0lXRb1CECo13Z5aMog5zJy44Yy/p9Ev/vSkbCSDJlHVaFkbhOe36y1r7FL
 U76Bx8HPz3g9ldUDgm0aApev+fIKxH1dC7cKOS7i7No8/JWlPLMcZcDXvF7Y95VXQpq9
 JVHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oR3ZF5Fn
Subject: [Buildroot] [PATCH 1/1] package/python-entrypoints: bump to version
 0.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to flit package infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-entrypoints/python-entrypoints.hash | 4 ++--
 package/python-entrypoints/python-entrypoints.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-entrypoints/python-entrypoints.hash b/package/python-entrypoints/python-entrypoints.hash
index 95c092e5e0..a8deb85614 100644
--- a/package/python-entrypoints/python-entrypoints.hash
+++ b/package/python-entrypoints/python-entrypoints.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/entrypoints/json
-md5  c5c61ea2e46a0c50ea08f4af7955a0b1  entrypoints-0.3.tar.gz
-sha256  c70dd71abe5a8c85e55e12c19bd91ccfeec11a6e99044204511f9ed547d48451  entrypoints-0.3.tar.gz
+md5  3acd8b72119a8fb1eac7030c24ac6b49  entrypoints-0.4.tar.gz
+sha256  b706eddaa9218a19ebcd67b56818f05bb27589b1ca9e8d797b74affad4ccacd4  entrypoints-0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  de5fcd7349cdf399b0707a2a024833c4704743650133c72d6f0ff7561a03a848  LICENSE
diff --git a/package/python-entrypoints/python-entrypoints.mk b/package/python-entrypoints/python-entrypoints.mk
index 7ab1b4d64a..287b83605d 100644
--- a/package/python-entrypoints/python-entrypoints.mk
+++ b/package/python-entrypoints/python-entrypoints.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_ENTRYPOINTS_VERSION = 0.3
+PYTHON_ENTRYPOINTS_VERSION = 0.4
 PYTHON_ENTRYPOINTS_SOURCE = entrypoints-$(PYTHON_ENTRYPOINTS_VERSION).tar.gz
-PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/b4/ef/063484f1f9ba3081e920ec9972c96664e2edb9fdc3d8669b0e3b8fc0ad7c
-PYTHON_ENTRYPOINTS_SETUP_TYPE = distutils
+PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/ea/8d/a7121ffe5f402dc015277d2d31eb82d2187334503a011c18f2e78ecbb9b2
+PYTHON_ENTRYPOINTS_SETUP_TYPE = flit
 PYTHON_ENTRYPOINTS_LICENSE = MIT
 PYTHON_ENTRYPOINTS_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
