Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37470C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 19:12:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DABD86101C
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 19:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DABD86101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90ABE4020C;
	Thu, 26 Aug 2021 19:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d36ZCS1GZu33; Thu, 26 Aug 2021 19:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9945C401FA;
	Thu, 26 Aug 2021 19:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 067411BF2B7
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 19:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 032DC6146B
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 19:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvleVQJDY5ID for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 19:12:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E68C960670
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 19:12:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h13so6715093wrp.1
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cEzI0M1ZnwTLFimjOlO+SPizb18bJaL9IF1fZKJf7A4=;
 b=sOMotQEnRI2xPQxzH1f1EaFduWsiGUiaa523lisqMevArhZFRZbiJVRyXjQU1dZSNw
 OU7vYmXh4cfS8UO/lRkcAzAvjFvNl1l/7xM3DZ9+KvLthLAePjJOgpq5SBdaauobZYGg
 R9m0L317kqYPRp1uF1yBwxMF7j1IBIrevL822yEJBvgm9o8qEU/vG0PdWYIGmdRrKoe9
 cDmgT1l3wW4RAo06HlfRwGdT7rQN7kmOYIYRpehxwAPvY+4vjabKu+sH5wX6azvd3tO/
 YeIZlX8YzOfE8GMQP3+9MW3Yareu5D4PflVfdwicnO+1RqsRTYCLu2UgyUCNJK4cMuWw
 TSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cEzI0M1ZnwTLFimjOlO+SPizb18bJaL9IF1fZKJf7A4=;
 b=EZf8ti8Kvap3gAAymtFHZ/6P++oP9/5b0tjiCNU3br9gPQ3Fg074h9T5SR2B3Nj4pe
 IHz07kTYH7aejB9qk57FXuM1gv69HN2vg2LqWZ6JPLmKzA2CM50xRtlfK7QBaxoVwQ/N
 xat9ULVJlL7M1CEmm5a1rUEiZ4WaDDBM+DM9vcD3X+YrCdlDBEIhDAifkh3s+TR0nafW
 CEUx8ph6mjx2GLbyNs2/3Zxljs1Fe2KHbmkuRmvHRsEBh0N36vonBMgFZPtwHmh8bjIr
 jI0Z0CleuT7LudDDlnd8TQM4A9bNHEwDYyo5Wsbg8xgVMAUwgMLbT+qNxoXYh+QmftkT
 AYLg==
X-Gm-Message-State: AOAM531nnp3lCyMmqMUVJXqmpPsVHpGU/jZnOjhBXmOLar1J0OP9/4s3
 T/XQjC8MYr3Fa2ETlqTSPGut13adn0k=
X-Google-Smtp-Source: ABdhPJxcJek5kaHgC8HH2x8RyKcrZyB6cD/Jm8/ZVp2V+HPq1PiVOnW/GhAEB3nn92RaAFpxBMkyLg==
X-Received: by 2002:a5d:6909:: with SMTP id t9mr5622537wru.44.1630005131009;
 Thu, 26 Aug 2021 12:12:11 -0700 (PDT)
Received: from menoah.home ([2a01:cb19:190:c500:7cff:640b:3ac6:9786])
 by smtp.gmail.com with ESMTPSA id d9sm3855044wrm.21.2021.08.26.12.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:12:10 -0700 (PDT)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 21:11:58 +0200
Message-Id: <20210826191158.10975-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/1] package/stunnel: bump to version 5.60
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This release includes the following changes:

- New features
  - New 'sessionResume' service-level option to allow or disallow session resumption
  - Added support for the new SSL_set_options() values.
  - Download fresh ca-certs.pem for each new release.
- Bugfixes
  - Fixed 'redirect' with 'protocol'. This combination is not supported by 'smtp', 'pop3' and 'imap' protocols.
  - Enforced minimum WIN32 log window size.
  - Fixed support for password-protected private keys with OpenSSL 3.0 (thx to Dmitry Belyavskiy).
  - Added missing TLS options supported in OpenSSL 1.1.1k.

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 0ae20cb906..b8cc62be13 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.59.tar.gz.sha256
-sha256  137776df6be8f1701f1cd590b7779932e123479fb91e5192171c16798815ce9f  stunnel-5.59.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.60.tar.gz.sha256
+sha256  c45d765b1521861fea9b03b425b9dd7d48b3055128c0aec673bba5ef9b8f787d  stunnel-5.60.tar.gz
 # Locally calculated
 sha256  28b55d0157efd5ceb63640faeebb50fda13b1f49aec0b9c1240b9a3ea9f0eb4c  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index cf2e29cb9b..cc56eb39a8 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).59
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).60
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
