Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7B5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8067661039
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8067661039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D0F82E1A;
	Sun, 10 Oct 2021 09:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNPvCExFwDuI; Sun, 10 Oct 2021 09:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F55782E14;
	Sun, 10 Oct 2021 09:42:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7A331BF476
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C65BB404F4
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWQmFKJjrVBH for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 09:42:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B97D9404F1
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:42:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y3so12047259wrl.1
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 02:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0glCTHNVjwbd1lRIq7PZbKn8jSRxufAQ8ftLowjZka8=;
 b=lV0xQv6I/iFHlecHyia6rBlLLPeoEeVh6WfGTLxpIySS9551B+aPOo3ESmlT7GfugQ
 yXyUVHx0ga6VfiMGhi6fud0r/kUeJfDBa/KQLNqXhztKW5tcPkNaEwXmNDS1ZbPiGTQn
 r5aM5ocFk+ky3feCvRLZwTaFme+RhAvNa2D9GCTIMX76L42F/uqTc8iO2pdgNeNOHDMt
 rdPnd2ZV2SOc2Tk2r+EQUUSQKX/yo+iX+hFM7/5QSClqOzygdz302gWE3ImBixDcInqS
 6CLwzT4zPIUXWTq4fsVLnpkID2blN8ENZMu7I9cFPgM4y5U+XbCUoEhuwI51IPPFxb/0
 VwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0glCTHNVjwbd1lRIq7PZbKn8jSRxufAQ8ftLowjZka8=;
 b=1oVECt2xIo5QSoq3U8a/SEDaVKXAynyfkRjVDAyZJNd2/jsixR/aOmBiElQTibnB+g
 HfxyN707KRvHKQeprIoRp67fm5u/sssYSRQSOnqon3+4/l77L1OuxYXh1bFD00OOQSQo
 0Ob9YXZdM+iUQByB6qltWYwEg95IaCPyWe/xOTmNlrFVSNthBrUkaCP3q/jabf/KqIjF
 wove8/RoXJgwjGDnb6FlxJ+1dFiiasl80stYbpWS3yR0rjd8ffxPN5d334Ys0hv3b6os
 i5jTBRNcX/tATptcJ2yZYE/OQbg05rrgPk8hR2NLol2uatQMTAlBNoB+/U1ZY7yKi254
 uFPQ==
X-Gm-Message-State: AOAM530StzXPCWE5R7RKKOikDw4pgwaWtkQ934lem+nQAMc+kEaS+ivi
 OvCP+iyMfk/aOdDYsce+86yzo8NOtqI=
X-Google-Smtp-Source: ABdhPJzdTzXZrzNjHbz7F63rlw44lbBs1y5PBhp7gbfBy3sbMhZuJgdq/0Rbg+FHn4ut9ZtYM6+iog==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr3748964wmj.160.1633858952744; 
 Sun, 10 Oct 2021 02:42:32 -0700 (PDT)
Received: from localhost.localdomain (138.23.87.79.rev.sfr.net. [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id z6sm258939wro.25.2021.10.10.02.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 02:42:32 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 11:42:24 +0200
Message-Id: <20211010094224.109154-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211010094224.109154-1-gilles.talis@gmail.com>
References: <20211010094224.109154-1-gilles.talis@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libeXosip2: bump to version 5.2.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch as it is present upstream

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 ...eXtls_dtls.c-fix-build-with-libressl.patch | 34 -------------------
 package/libeXosip2/libeXosip2.hash            |  2 +-
 package/libeXosip2/libeXosip2.mk              |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch

diff --git a/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch b/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch
deleted file mode 100644
index b153eee65c..0000000000
--- a/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 178632fa5530a72f50376a60d59be2a07e65c28b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 6 Mar 2021 15:20:51 +0100
-Subject: [PATCH] src/eXtls_dtls.c: fix build with libressl
-
-Build with libressl is broken since
-https://git.savannah.nongnu.org/cgit/exosip.git/commit/?id=d7488b7bbf59870192372384ef338a44be23e888
-because libressl does not define SSL_set0_rbio
-
-Fixes:
- - http://autobuild.buildroot.org/results/89d8d4ba99d6dcc1618cf6b5302c124a92d75be9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to amoizard@antisip.com]
----
- src/eXtl_dtls.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/eXtl_dtls.c b/src/eXtl_dtls.c
-index 40fa658..8ac3a13 100644
---- a/src/eXtl_dtls.c
-+++ b/src/eXtl_dtls.c
-@@ -70,7 +70,7 @@
- #define RANDOM  "random.pem"
- #define DHFILE "dh1024.pem"
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
- 
- static void
- SSL_set0_rbio (SSL * s, BIO * rbio)
--- 
-2.30.0
-
diff --git a/package/libeXosip2/libeXosip2.hash b/package/libeXosip2/libeXosip2.hash
index 53e27e929c..b88a5b4c21 100644
--- a/package/libeXosip2/libeXosip2.hash
+++ b/package/libeXosip2/libeXosip2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3ae88df8573c9e08dbc24fe6195a118845e845109a8e291c91ecd6a2a3b7225  libexosip2-5.2.0.tar.gz
+sha256  87256b45a406f3c038e1e75e31372d526820366527c2af3bb89329bafd87ec42  libexosip2-5.2.1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 3ed637a3d4..b550e293ae 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEXOSIP2_VERSION = 5.2.0
+LIBEXOSIP2_VERSION = 5.2.1
 # Since version 5.0, letter 'X' in library's name is in lower case
 LIBEXOSIP2_SOURCE = libexosip2-$(LIBEXOSIP2_VERSION).tar.gz
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
