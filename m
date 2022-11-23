Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F230DC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4587641975;
	Wed, 23 Nov 2022 19:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4587641975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAD6XTkUpD1H; Wed, 23 Nov 2022 19:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A3224196D;
	Wed, 23 Nov 2022 19:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A3224196D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 340441BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C1B381FB4
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C1B381FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SF9OYWWt5VYz for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:51:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E2481FAE
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09E2481FAE
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:50:59 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id t10so22623300ljj.0
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hJv4c4y0EUM9LJqyP6vNKBouqqj2Ho03cokW1aGBMw=;
 b=SU1NKwpKtn7SDa1IeFUJtZnrRTSyOMQg/WuDOGPFgILwh0X/iHlfVV+dXaFKc3qWDn
 Rk+QyhKcaa0k18ggNJyygpVuST0HdYs1gc+Aq8Yr9eapwh77nJLWmdJvXYyJh/35QR4T
 LWwbe5HrWHbryAJMGja3pFpXE+Tgxun9QPh1J1juxya3J472fijW80UaEWaaI04+rdmz
 kdSoWo0/pwHNzBB4+DLXpr9TMNLj05iN8N9IEqaQdQeqD4vr6s5IK6/kIcI3VH5y/Haj
 RTTHZQn5m/YpoAOYuIh878XVB3qp5Sh6PlgFls4WP2XSEy4PiZ+oPlWQsS/qKHdcJ3sx
 ap5Q==
X-Gm-Message-State: ANoB5pnEMS7mNIQ+pXH0RpuhPHB06LQgTLoMicWtgJoSKJv4pOLmAP5l
 SD1mtmmxajhNOxxCN6mvyvlJmCsyNQM3VQ==
X-Google-Smtp-Source: AA0mqf5j1y4wFg9x6LaaFhaqGhr4oMGVdASOrtN9g8yCyqO7CvlzE70Y3YLIyQzLD5jm+STwCwdFrg==
X-Received: by 2002:a2e:9194:0:b0:279:7ffa:15aa with SMTP id
 f20-20020a2e9194000000b002797ffa15aamr568901ljg.307.1669233057433; 
 Wed, 23 Nov 2022 11:50:57 -0800 (PST)
Received: from luthien.. ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 be30-20020a056512251e00b0049944ab6895sm2980549lfb.260.2022.11.23.11.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:50:57 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 20:50:44 +0100
Message-Id: <20221123195045.2956125-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/hJv4c4y0EUM9LJqyP6vNKBouqqj2Ho03cokW1aGBMw=;
 b=K8cwTpHDy5dB1u489l2pdMx8jk+N+AUevpCWsxgUtiv47eOk4opD290CIdg+FKbeGN
 0DoRHTrNN8+PywuEGLXax1Js72z6/wHJ5FrTTlTO25dkaNPuB4BrJmnnaum+yioj798E
 hesHjiqcnDewOOgfvwnUoUe0C1lJmnCFpifCjC8wrvt2VaQZTU06i11im13v9OVz3r2D
 KJ3+N+DlLau48+2IWYLQMpxHN92DrnkIl+n0O/huWrEYlhtDIlSDs8osdjvXN88/tXJ9
 LY1RZw0zgnqMZswaG2z98u/8BB9GLfyzgwPqtwVcyTz9sQ6tTcLG/rwL1tf+cBtROf4g
 uS8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K8cwTpHD
Subject: [Buildroot] [PATCH next 1/1] package/inadyn: bump to v2.10.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Highligts include support for MbedTLS and a serious memory leak fix to
the GnuTLS backend.

Changes:
 - Add support for MbedTLS
 - Add support for per-provider interface to bind to
 - Use HTTP-only for api.ipify.org, default (fallback) checkip service

Fixes:
 - serious memory leak in GnuTLS backend
 - ca-trust-file has no effect for GnuTLS
 - handle easyDNS "no update required" as OK status
 - use configured server:port, don't force port 443 for HTTPS

(From https://github.com/troglobit/inadyn/releases/tag/v2.10.0)

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 98af30e9fc..2c0995babf 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  7370eb7ad5d33a9cf2e7e4a6a86c09587fbf9592cd357c6f472c33f575bac26d  inadyn-2.9.1.tar.gz
+sha256  1727b6aae6727f99eba584e46950369d7b259d2ef09e5bc02566e9c3c1d6daf6  inadyn-2.10.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 041d1eff57..5a24c1eced 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.9.1
+INADYN_VERSION = 2.10.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
@@ -15,6 +15,8 @@ INADYN_CONF_OPTS += --enable-openssl
 INADYN_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 INADYN_DEPENDENCIES += gnutls
+else ifeq ($BR2_PACKAGE_MBEDTLS, y)
+INADYN_DEPENDENCIES += mbedtls
 else
 INADYN_CONF_OPTS += --disable-ssl
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
