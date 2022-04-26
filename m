Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D25C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 16:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E0E640B63;
	Tue, 26 Apr 2022 16:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7SU2B5-qTB6; Tue, 26 Apr 2022 16:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6150740B55;
	Tue, 26 Apr 2022 16:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30E351BF94D
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FFAA82F9B
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9MHanalPJta for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 16:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40F0282F80
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 16:40:51 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id k23so37266169ejd.3
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rp2tMzIT+EOKj6L2pXXoJ3Etq13Jo1NqTJ3VgM5rXU0=;
 b=ml1yRVEuspvYJbE6aKYl5qe9U2nvxaWt6ZCiSGFf96iVgS2hxNwCddtg/qlqZjkKxF
 gSe4dp370Ohe5DyORgmd8YTQL90RKWIgnqSBoLbUYPgW3XCbSXtFv6JyNHC5K9sF35LN
 z2tJ6T4j5bmDDEc8DABU8g0oZ0vRi4xpokfEVu6zOdSlS1YB5FZ+YAJm3WtrKDf2Fmr2
 GcIKC3uYYzyqLI7AGDy3D0xuY1G8adJq6V2uU92KRzCow5RM7lUnVHJIKoY1ziyU1emX
 GD8hbHCl5LtLvWyoxrpUwbcCuCt37/1niDpworZeXRTsCwzFpa6ZJ0M8srqPNns1hkLs
 OPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rp2tMzIT+EOKj6L2pXXoJ3Etq13Jo1NqTJ3VgM5rXU0=;
 b=FzTFriHF6Cpi0w25RmZRDY1BajbCSBFmfbSciOQWNtlui8t36W/T1DC8DByl1i+OEv
 N052u519Q/Q5IExT7xOL7YYs/60NhJtj08XDmMqQCUrvqjx+/hvzoYSpzG5LljoLYQQL
 20saHm2NK8hm3fVnmMbRdDEinWzgd/aU1ls+YbUoBH5K74jNBP9HbEWzH/rhCc0Y/j3z
 YeEQGJzfPeX/bVA2gMonUXTYVCujgCa0SJWQejipyut8liKc7kvQgIiMS4P559A0286a
 lb9HvV7F3JytPc+kJhCmy8Sw8ccRpjsD6bf4kUZzbnp4eCLcSnBYvCyR5SNBLio7c6X5
 QE4A==
X-Gm-Message-State: AOAM531F10ivZQuKcR1sT4lJgTdgBaMKwhVnnlKP0JfuQ1bMSyTW2Ogl
 +jIbe3cFufvdcdL0j3YdQhMXFeDnfYg=
X-Google-Smtp-Source: ABdhPJyONLQ9UWQzJuKxShh13XMCm7Bj012C/6Htj/YI66Nd20x2VqS/hwauIN6h1Qqui1cnTq+3yw==
X-Received: by 2002:a17:906:3fd1:b0:6ef:606f:e5c5 with SMTP id
 k17-20020a1709063fd100b006ef606fe5c5mr22252375ejj.441.1650991249330; 
 Tue, 26 Apr 2022 09:40:49 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a17090665c700b006efb9a33ca5sm5152706ejn.164.2022.04.26.09.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:40:49 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 26 Apr 2022 13:38:21 +0200
Message-Id: <20220426113821.3544689-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libfribidi: bump to version 1.0.12
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
 package/libfribidi/libfribidi.hash | 2 +-
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index da25b2d24..7e5df9811 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30f93e9c63ee627d1a2cedcf59ac34d45bf30240982f99e44c6e015466b4e73d  fribidi-1.0.11.tar.xz
+sha256  0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495  fribidi-1.0.12.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index adbd786db..ec86f468a 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.11
+LIBFRIBIDI_VERSION = 1.0.12
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
