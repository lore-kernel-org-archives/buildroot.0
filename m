Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5308C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 18:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49F6340644;
	Sat, 30 Mar 2024 18:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNhA8fvTqhTA; Sat, 30 Mar 2024 18:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FC6F40648
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC6F40648;
	Sat, 30 Mar 2024 18:56:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E76411BF2F2
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 18:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4DA8802EE
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 18:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSDzRYwy6XrY for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 18:56:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E8D2802CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E8D2802CE
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E8D2802CE
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 18:56:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34339f01cd2so1268442f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 11:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711824985; x=1712429785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uiEmx/wP9XinBp+YaVZt34cVslCfOZW+58Jrcrn35Gc=;
 b=AgmKT5nKFKwrGbu6TfTdR/kRO0HwpGW7UCPw9AxGDNjrKkwfLrG3vS0VWYEUp1phG1
 BegySjaQT7BP6tJ63+xdCpZP9u2fKc9sONpX0dFkSuC7VaA8MaGARxWMIVvGwGYFeEVS
 ahMcY75CcgmMQQsynordIQCkSFCwIUyKuus1CTGZoodP63frl+Jle6aEtRpk4L1A/6Q9
 Ys1DzxYZIHJK+pJHIJq06GZcngJcmaCyt174CeFRE2NHjJb/6FcnjlenbU/L7T0mql00
 X2bXtXaC4h9El1n2r+9pe1TOvgEHIm8dngbRn7jPWcO2Ph8UKJMEIVmeLUZFf4D6xwtL
 1sJg==
X-Gm-Message-State: AOJu0YwIpNwjZdpiOpS56ZezQNU9VUtWveJVltujgS+qzPLLwRRxD7+b
 l3EJ43/ltkFCPhoko5Z5Uaga0mstrK8ZzjcuW7VkOvdlJ9w+Ty1ZdJQ+rDsE
X-Google-Smtp-Source: AGHT+IGS8c5o3wnap0hvkP4H/BJcb2WuVKC6r7jUL7eGI0BEM1fpPvQPsC8oIbXjlCh53xpqKPh0FA==
X-Received: by 2002:adf:f809:0:b0:343:41a6:a024 with SMTP id
 s9-20020adff809000000b0034341a6a024mr1199121wrp.59.1711824984434; 
 Sat, 30 Mar 2024 11:56:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u14-20020a056000038e00b003433e5cab4bsm3376713wrf.103.2024.03.30.11.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 11:56:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 19:56:20 +0100
Message-ID: <20240330185620.995961-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711824985; x=1712429785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uiEmx/wP9XinBp+YaVZt34cVslCfOZW+58Jrcrn35Gc=;
 b=kOkxfcMwqeD4ZKrDbJVT0yyUyR4hqNdE07N16ZEkM3h8VIrWicxV0+CBK7RzIBB5rx
 BdaoY64OanWsWfVcXOJ3lnJ3adxJSFJMbDbfCGX3C1IoYgtuO2r5v8UZcrYEiAzpy1Nr
 oCf56eqRz6b+guHLtlHlyFTwytuwB35J+2x6J8d13r36Ur2PLzC4zcwmGnscJrI/bMCn
 SZEW6h3rAQECrdC5a9rL3H+wKxpernI9rmCf5FS8BQCEbUSQnakGXQRLxPutOgmJpTIF
 v7LYa86T36rEHPFfp3+t/jUd/QJHl18qjpRSNDcZm1sHsG8Cwv4ljGXQdP99XsfTMwEN
 6NUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kOkxfcMw
Subject: [Buildroot] [PATCH 1/1] package/coreutils: drop gmp optional
 dependency
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

libgmp is included in coreutils (through bootstrap.conf) since bump to
version 9.0 in commit 2ee43bad85693d1c96e14f5b39ccb13a8982f50a and
https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=13046444888a7e96f48d28fdd5a6ffe03d4ab036:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-static, --enable-shared, --without-gmp

Fixes: 2ee43bad85693d1c96e14f5b39ccb13a8982f50a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/coreutils/coreutils.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index e9cb7b67cb..846d4fa567 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -75,12 +75,6 @@ ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 COREUTILS_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
 endif
 
-ifeq ($(BR2_PACKAGE_GMP),y)
-COREUTILS_DEPENDENCIES += gmp
-else
-COREUTILS_CONF_OPTS += --without-gmp
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 COREUTILS_DEPENDENCIES += libcap
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
