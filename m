Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E379CC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 18:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D40441A0F;
	Tue, 28 Jun 2022 18:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D40441A0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bq2wmZ8VZ8vl; Tue, 28 Jun 2022 18:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BDCE4194E;
	Tue, 28 Jun 2022 18:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDCE4194E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 772261BF5DB
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 18:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 516154054B
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 18:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 516154054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aeF0l49luMVV for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 18:35:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03AAD401A1
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03AAD401A1
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 18:35:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i25so13440252wrc.13
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 11:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JFQyPJQm0ofvyHrzOERlGId53uLu01uaJZAPvPbVbD4=;
 b=bfZUccRFgyLI64d7f8mNzKks9m2uaN/exYfjoEA/gDF1+4YVBWIFk/2PWKU7dfmBtX
 6VUcoM0i3qbLxglQQ9q7zXwnGr/ThII0u2/+xDPSsuk39pwK1pExqPOuF/A3oB2sfNUo
 OK9gY23xkZ0L9NwHm4S3DfkciVbW2meBwnwM1GcSoJ8IUn7iLY1JWEZV/MM9lMIlvzgE
 SB9ECAO5Xke5dSAkuuoEA4ekyr8STy8fkD/tJ6xXFWvL/mmq2+U9e+gRWiWJWyuM9oAS
 w+IIS48acuF4r5X93PZvsEvA8dqIvBuAKBBL6jNUlFLpOJOALEpA/v6Tb7IlKpNOFmM6
 /QfQ==
X-Gm-Message-State: AJIora9dYnhwRfVMKLVXGUvXm7L2gN+tkS0Gk/2woA1bKXFss4i6ejPH
 DpTvvOnddwJ9Xx2sAhrPt5kCQKDLF34=
X-Google-Smtp-Source: AGRyM1v2/JtO708VycwdQJoVu3qKSnuVxenxYT1IRt3FD7tSqCMLbpQ5QroZ5Kt7+PzlWBuYLhelAA==
X-Received: by 2002:a5d:6c62:0:b0:21d:2204:1338 with SMTP id
 r2-20020a5d6c62000000b0021d22041338mr2719092wrz.533.1656441355941; 
 Tue, 28 Jun 2022 11:35:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1c4c15000000b0039c871d3191sm426509wmf.3.2022.06.28.11.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:35:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 20:32:12 +0200
Message-Id: <20220628183213.2838372-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628183213.2838372-1-fontaine.fabrice@gmail.com>
References: <20220628183213.2838372-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JFQyPJQm0ofvyHrzOERlGId53uLu01uaJZAPvPbVbD4=;
 b=FeKk3UjSuTrnxMTv1cub7sGS7qOzF+WBN2Ao6lT5lEvFT9WGIVreAYlJxuK5zJmymd
 egvQetF+3D1Xyg0AQQj3SjWk8f9+wwV/d/jqicf0uMaeh2PD4cRA81QYIyLoYUyPyywq
 xmG+fwEK4GniQTO3v556BUSvYmTftScNPAJhuMYoERR7siMekGaVMyAjSPLaT4+Z74fr
 NLn7T89XoHh7u5+qJ+rT5ycBmULjnWAeoOoo1LhEyFZ4rwdYLvAOQbXtOG04DW3WW8VK
 ro9yPmUNKB6Hr0Q3KkBL7MX83h4Ep8o4LsnDIk2UQ5DBOiOiI2cW3S0LU8WmgwLVHidI
 JMOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FeKk3UjS
Subject: [Buildroot] [PATCH 2/3] package/libsamplerate: disable sndfile
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libsndfile is only used for examples and tests so disable it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsamplerate/libsamplerate.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 9d6b6a5ca5..584f61f02a 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -8,7 +8,10 @@ LIBSAMPLERATE_VERSION = 0.1.9
 LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
-LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
+LIBSAMPLERATE_CONF_OPTS = \
+	--disable-fftw \
+	--disable-sndfile \
+	--program-transform-name=''
 LIBSAMPLERATE_LICENSE = BSD-2-Clause
 LIBSAMPLERATE_LICENSE_FILES = COPYING
 LIBSAMPLERATE_CPE_ID_VENDOR = libsamplerate_project
@@ -20,8 +23,4 @@ else
 LIBSAMPLERATE_CONF_OPTS += --disable-alsa
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-LIBSAMPLERATE_DEPENDENCIES += libsndfile
-endif
-
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
