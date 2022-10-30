Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7324ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 13:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B2C5402EF;
	Sun, 30 Oct 2022 13:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B2C5402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vrg9OYz7ZPGA; Sun, 30 Oct 2022 13:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 465714030C;
	Sun, 30 Oct 2022 13:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 465714030C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41E561BF489
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 13:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1269081260
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 13:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1269081260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TxsvIN-hRwv for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 13:07:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8FF78125D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8FF78125D
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 13:07:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 5so5762432wmo.1
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 06:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2M7LpJ3p2NU2CNzVkl9E1iL8bNELuBAyyEiyiIL+F1M=;
 b=jITMBANE5Bk7ewJ157Ps3zHhJi36NGkMdKqmqEQ1UnyVw/pWX4v1/wfuN0uJ14ftBS
 BLh3aaoRw3zcerarDbvddg4SW9ImMZd/B5qzPgdRyHqb9VJ7TRZLHDgjA5oeGVi5yhZU
 1KqfVByL2SJBHdpd7bKUZ0Q6w/aYndhYxV4ddCryLdJAiGpp6m3rDPdIFLc7XCnOUILU
 i2C/60PP6I0hGT6utwPQwpA6jnzjDZX7VXGMnyZz1rLa1XcftEmSt9drVpVQhDwlzoGG
 SHwWRuYK+QSfXOUreLLEglX8CnUvNhp1VnlsErYNXetz4P64dYzuSopWyX2nEUIf2kIm
 ALug==
X-Gm-Message-State: ACrzQf3Qa09MsNjQ4yzdHdFRkg6VJhKFdTJq0IrUm4u94vFkcbdlF1Wl
 2BhfBAaGMNEXZzPHR3CyQWeFTUkCszE=
X-Google-Smtp-Source: AMsMyM62tVBbpdgNR6Q62DB7xqlexP5ZL2wR5XmkPBlIWdG70yO61sRRjhtoOzCkZJT55N24d8MKgg==
X-Received: by 2002:a05:600c:1989:b0:3c6:fabb:ea73 with SMTP id
 t9-20020a05600c198900b003c6fabbea73mr4884690wmq.19.1667135245236; 
 Sun, 30 Oct 2022 06:07:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b003b505d26776sm4959337wmo.5.2022.10.30.06.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 06:07:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 14:07:23 +0100
Message-Id: <20221030130723.408004-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2M7LpJ3p2NU2CNzVkl9E1iL8bNELuBAyyEiyiIL+F1M=;
 b=f2I7YW+k/9H/qEqARCjIJNRZz29XjumZ20T4kRfXrRZywsbffgs6s3/K/P9dfKVats
 mcLokhAfPrsnWhlDpHMqQn8GByryJpEnpb2aQsl7ftKgXvwDZ2/AJ+snxZQIEg9nu6hR
 uPsjjnaULfvZ96PHtA6ERee6/g1+AzvB51QdO12M0TdW7deUfdC/QIiEcoTR91LUODJf
 68/Cu1b83/s05caZeWTwuD8GUTuY5UYbCuV7yI1hx2TtsD8i2ipMU5a+cbw4PpXDD2FJ
 CyPOAFbGoJ6FeP71poIhr6E6tjI1npmiq/uwIvIeHr9dFziKTKXtxW6a0ueXdI6AAWeS
 MlIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f2I7YW+k
Subject: [Buildroot] [PATCH 1/1] package/matio: bump to version 1.5.23
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tbeu/matio/releases/tag/v1.5.23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matio/matio.hash | 4 ++--
 package/matio/matio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/matio/matio.hash b/package/matio/matio.hash
index 4634074ca0..94e0e48f69 100644
--- a/package/matio/matio.hash
+++ b/package/matio/matio.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/matio/files/matio/1.5.22/
-sha512  33fd3991413e94dfc9aba13ffd08b09ddcbdb9dfa579124d981449e195a8c61a3dc95b55e46bba360d48456c117cf36403af1c3448689c26b8aea5fa9cf38323  matio-1.5.22.tar.gz
+# From https://sourceforge.net/projects/matio/files/matio/1.5.23/
+sha512  e125278dcb25695affb7c576d0e2a86c0eff4225aa866b81536c9e4d7b2aea2c554f5389e96d534a8b559f5554b6cbecff4b44fe8915173cd64b2da6d1dc2629  matio-1.5.23.tar.gz
 # Locally computed
 sha256  3ed9a50d754fcc92d4accb8448e397eafeab686796b2a7445557ce782806e239  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index d282852d37..5e09f4e6ce 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MATIO_VERSION = 1.5.22
+MATIO_VERSION = 1.5.23
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
