Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189B7CA0EDC
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E58C980D4A;
	Wed, 20 Aug 2025 16:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9maMrcYboaH; Wed, 20 Aug 2025 16:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC4D880CF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC4D880CF6;
	Wed, 20 Aug 2025 16:39:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1392BDE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE35780CD2
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdNJDEiaYvRj for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D32C880CD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D32C880CD3
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D32C880CD3
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1b0becf5so394835e9.2
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 09:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755707965; x=1756312765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MX17wYDcPatTiFeor9xof5OWAYkFXYDq8W1W+EMNIvw=;
 b=acgUPKQCiQXeAFo3lPa7q+2i69IVXL3HXmXi8UlvClw9cxWt1TQ9mkYaaRtgf2s3so
 WnL6PiRvIPwFbL26KIQ55RVkp00kxVOKXq8yP4x7JiP1t3nnlPkCVWdzvM+YBf9FtoCm
 d0Gaoh2UwE8A1KTgylYCYb1j2iqUGPStc67lhu2e4ERBTd2RMux/wfhr2usw0tuzrfmw
 iaOCZI7+eUKiK137LCqsjNZCNAwtLdouRA01U7punOqxALrZKOb7Z1QlLWgeDMcxpJuc
 9+lOiYUeKd46pgcPq9fDr8V3EBOfWzajfJLWn20D7utLR1aGwlpuY+fAL584TpgdwVlt
 gbcg==
X-Gm-Message-State: AOJu0Yw0Ji6Ys6vJs94Em5EpC09t8VYGjHC9dYzK2K/8Z9Ah9mN1JHa+
 gcWRM3S4SR1FFgoPKXWpaUAAnx1wk9cvwYirQWrowvxswU3g/hMLrqSyWqXlmsqH
X-Gm-Gg: ASbGnctSoHJIU7oVyP4MX8EA3sXAfdiIf8ATwCv8XyoQ1J98QuJM1vpfOq+uVxfgGMi
 nT37TmHzw1w3AWO/3rCyviJh9FaBStIdwmiEgPz+eEecldFc5VGDGRlrG3y9tCR52gfZ81uA+iV
 enNb1c7oGBH+DNWZMHQUQey/seWs14V8eeFkxiv5eenpROn8T8hF8DlK08eFokERe4kS7g02l3y
 YWxWFS1qWjiAJxJlVC2q3ng65oYEuDoqAQARc0qd2kL/hceD7te3cO9Ek/KdaDsuOXi9ZA3HOPq
 tWict1gUEfiUFpADDtoArsSaaDci2wk4bbZQnd8fMEpDEQyfpePwPSQd9Chq6DggkhJwuRuWGCK
 iRugSkdVc4/so/nlyFOzvgOgnmsaTXh2zRTSsl/6BMDX0JT5uZE1bil51
X-Google-Smtp-Source: AGHT+IGm2w59HW7YEvnzho/ARaTTRJLSe9rHmT4kXJn9fg6Ymh6NRyiuIBSYguFdTFe/0H3fst/48A==
X-Received: by 2002:a05:600c:3549:b0:459:dbb5:399d with SMTP id
 5b1f17b1804b1-45b479f7d6bmr23686585e9.19.1755707965483; 
 Wed, 20 Aug 2025 09:39:25 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b47c6d857sm37412195e9.26.2025.08.20.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 09:39:25 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 18:39:18 +0200
Message-Id: <20250820163921.1968030-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755707965; x=1756312765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MX17wYDcPatTiFeor9xof5OWAYkFXYDq8W1W+EMNIvw=;
 b=W2aTLQxBFztDAggG6IH853AkJ3bkEY5ADCqFy7Dg6ZC1Oq/RqAxD1mdsg6Jw8N5VPl
 Vp2J7o9IdxdQghTCm/ldnG8xYZsmBPLQgdPn3K/5NcCS0tJMrAxTcONamQFsZg1k6z7C
 o+XnrYeaiHheSD+Nno5b345ZrjcpyHIHj6VtNfyxDrU2c2VoJVsQp8aT6gz8kC0VjdaM
 9PvgRJR5/J+wDnkcyVQHqArrE+xIWTJ90otjllGSk5q2Yh7Wtv34s38srX85fgnpxXAp
 p9wXcoSF05RV579hSsf+QYCtnNR02W2u2FYkoDDZoJgJlVp+AWQxhaUqZVKboUU7ayFA
 +NpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W2aTLQxB
Subject: [Buildroot] [PATCH 1/4 v2] package/qpdf: bump to version 12.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Changelog:
https://qpdf.readthedocs.io/en/stable/release-notes.html

Updating source URL (Github) and updating build system to cmake.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS             |  1 +
 package/qpdf/qpdf.hash |  4 ++--
 package/qpdf/qpdf.mk   | 26 ++++++++++----------------
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3efad36d70..875406610e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -233,6 +233,7 @@ F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-spidev/
 F:	package/python-web2py/
+F:	package/qpdf/
 F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 08a048f2ed..89391dd1d8 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/10.5.0/qpdf-10.5.0.sha256/download
-sha256  88257d36a44fd5c50b2879488324dd9cafc11686ae49d8c4922a4872203ce006  qpdf-10.5.0.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/12.2.0/qpdf-12.2.0.sha256/download
+sha256  b3d1575b2218badc3549d6977524bb0f8c468c6528eebc8967bbe3078cf2cace  qpdf-12.2.0.tar.gz
 # Locally computed:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index d479515789..2a4e7f3386 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,36 +4,30 @@
 #
 ################################################################################
 
-QPDF_VERSION = 10.5.0
-QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
+QPDF_VERSION = 12.2.0
+QPDF_SITE = https://github.com/qpdf/qpdf/releases/download/v$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
 QPDF_CPE_ID_VALID = YES
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
+QPDF_SUPPORTS_IN_SOURCE_BUILD = NO
 
-QPDF_CONF_OPTS = --with-random=/dev/urandom
-
-ifeq ($(BR2_USE_WCHAR),)
-QPDF_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DQPDF_NO_WCHAR_T"
-endif
+QPDF_CONF_OPTS = -DSKIP_OS_SECURE_RANDOM=ON \
+	-DUSE_IMPLICIT_CRYPTO=OFF -DREQUIRE_CRYPTO_NATIVE=ON
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-QPDF_CONF_OPTS += --enable-crypto-gnutls
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=ON
 QPDF_DEPENDENCIES += gnutls
 else
-QPDF_CONF_OPTS += --disable-crypto-gnutls
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_GNUTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-QPDF_CONF_OPTS += --enable-crypto-openssl
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_OPENSSL=ON
 QPDF_DEPENDENCIES += openssl
 else
-QPDF_CONF_OPTS += --disable-crypto-openssl
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-QPDF_CONF_ENV += LIBS=-latomic
+QPDF_CONF_OPTS += -DREQUIRE_CRYPTO_OPENSSL=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.34.1

To: buildroot@buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
