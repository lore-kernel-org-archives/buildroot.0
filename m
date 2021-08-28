Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BD1C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:58:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58A1D60E77
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58A1D60E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14FA660720;
	Sat, 28 Aug 2021 10:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uL-Tsdf6fDXr; Sat, 28 Aug 2021 10:58:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19EBE60724;
	Sat, 28 Aug 2021 10:58:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0973B1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D0783F2E
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLSUEHQ_VofB for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 10:58:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0959883F2B
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:58:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i6so14488104wrv.2
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 03:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wICzGWnVKk/V4BStBo7fCcE5UWl1x+cBMXoo5H4+vn0=;
 b=ml/hJ7T5m7IWGtss2LddvxPT1i39YoPExT48oqaaWRIOG7752avWd34RX0tsaW/7OI
 mETAOrqiB/I5odNrUnOzABA/Wjq8hbh7sYu38WOsTvuM4RGedbWX2S/OHhMb0QK7kUKe
 XA6miipEpvY8MFDZmf/QgXojDvpjNOaYWtrzSjSNtZpb9yT00cX4l/hxcjN4vae8UarW
 aQSC3srGL2ZmdI6depYy/NIOl5knFnzjkURgFCw8wXoCUjh+6rroYItacPzya/vfZit/
 xuYbODXIeJXPeB21Cucc0XFxlhLzB+w6vWUaLSt+anqm9ihtZRpr/N7v/h8Wudeca+Gf
 iE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wICzGWnVKk/V4BStBo7fCcE5UWl1x+cBMXoo5H4+vn0=;
 b=Fjfeb2FSpi2PA/1upJRHvZFJih+IIv29Z59aVtcFW6K1FmsBR2p/nTVjX9zSP5kwlO
 KeogWvpogwW+PssTz/ps/rkQpCMFrBdDF1AkqxPbVZEM3IgGZeWl7qHWX0FtSSVLDgWZ
 7AItPqoQCO0/6PzPvTxI49pVCnrryUefHvAhDAaW2zR9xfcuaSs4GnojJ0e7GHWKcXUW
 VdnPQusb/2xTgy4yKqkokkPJxAUeoHqdEbpFfv+QutZYpqn3XWd1ceAf6rBMixZnvVc9
 A2uX5HPkjigbf4NHm6bQ23SpbOL5mAxMmr6jDNJpz1SaotiP2fKWND+rPco3Kpv9RkOI
 NTWg==
X-Gm-Message-State: AOAM533XK3ZWnJWZYDcCRZ3zKW+WnX/SKjArveoG5I2yp1BOTWCh3fJW
 c34BsqltNLuG6YDcaMDZZhu5HPRNuV6h6w==
X-Google-Smtp-Source: ABdhPJwgTXUiNXfnPxnfe3+nmK+9RisK+HT3xVTjK7Y0rD1Jm8yWGdGewVyN2S8QSf4VBfdqyszxVQ==
X-Received: by 2002:adf:f889:: with SMTP id u9mr15326637wrp.67.1630148296959; 
 Sat, 28 Aug 2021 03:58:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id q11sm13790463wmc.41.2021.08.28.03.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 03:58:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 12:58:07 +0200
Message-Id: <20210828105807.781836-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/boost: fix sparc build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure on sparc raised since bump to version
1.77.0 in commit d39d8f7cee9b4634e6f490020204f63fae419e8e:

./boost/predef/architecture/sparc.h:37:38: error: missing ')' in expression
   37 | #   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__)
      |                                      ^

Fixes:
 - http://autobuild.buildroot.org/results/c1f15e3a0cefb7e65e5288fb4564d59a3b06a0bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../boost/0001-added-missing-brackets.patch   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/boost/0001-added-missing-brackets.patch

diff --git a/package/boost/0001-added-missing-brackets.patch b/package/boost/0001-added-missing-brackets.patch
new file mode 100644
index 0000000000..1a2d5e67ec
--- /dev/null
+++ b/package/boost/0001-added-missing-brackets.patch
@@ -0,0 +1,29 @@
+From 1be0e4a2d8db15a405f64a6f65507b87c1be7e1a Mon Sep 17 00:00:00 2001
+From: tkoecker <tkoecker@gmx.net>
+Date: Fri, 21 May 2021 16:31:11 +0200
+Subject: [PATCH] added missing brackets (#118)
+
+[Retrieved from:
+https://github.com/boostorg/predef/commit/1be0e4a2d8db15a405f64a6f65507b87c1be7e1a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/boost/predef/architecture/sparc.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/boost/predef/architecture/sparc.h b/boost/predef/architecture/sparc.h
+index d7b94f0..d01605e 100644
+--- a/boost/predef/architecture/sparc.h
++++ b//boost/predef/architecture/sparc.h
+@@ -34,10 +34,10 @@ Distributed under the Boost Software License, Version 1.0.
+ 
+ #if defined(__sparc__) || defined(__sparc)
+ #   undef BOOST_ARCH_SPARC
+-#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__)
++#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__))
+ #       define BOOST_ARCH_SPARC BOOST_VERSION_NUMBER(9,0,0)
+ #   endif
+-#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv8) || defined(__sparc_v8__)
++#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv8) || defined(__sparc_v8__))
+ #       define BOOST_ARCH_SPARC BOOST_VERSION_NUMBER(8,0,0)
+ #   endif
+ #   if !defined(BOOST_ARCH_SPARC)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
