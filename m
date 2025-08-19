Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2432CA0EED
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BAD640C05;
	Tue, 19 Aug 2025 15:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnWFlExZNM1u; Tue, 19 Aug 2025 15:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F6D40C30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F6D40C30;
	Tue, 19 Aug 2025 15:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38761DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F1B880FAD
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wl2b_2XOdCjv for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2611F80F7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2611F80F7D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2611F80F7D
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so26817845e9.3
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755616124; x=1756220924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=niJbzbLMRi9xt+qjl4s883NDjwdxJd4qwNY+Y6I1kSc=;
 b=uuRpBteEiTfRtZPBlFiC58a9Bb8vYbLNct+O+DQkfAh8PQLQxLin+8PqwmRch/HuXY
 8dUWyGzDvDhbf1r7TL+YlJwU2EUavQSUJt/iQdWw1vgK/zLcljtV0RwJ8qfoE7wHMv/F
 w4egBtlEkAECp+IEaJ2wiyTm3V90erZw4Mo4H9riJdRPnCkV/+iezVfiDU9PUztdtuc0
 M48hq6PTZnEFxSF/mr8Dcc/7X7hcXH/LymYeuJF+YqPXoo3FJkrysFsoGD5QcD+MoFkY
 Ecrt1DpNJg4+yiI5Rx7CxYsvFzYe2679Y7bAnlHNDFg3qvRmPjJgD7C6FSWJb5c5u8XO
 fk/Q==
X-Gm-Message-State: AOJu0Yz8fQb6h4qGcfrwTaOHrCRlJ4cS8ixnFQH57RsYcHxGpODgh0TG
 zguHHC8RO0mbqNnCIQBPKQybHUSLno3mdcPMG4vRgFhAkUX77h9d6VOUflXOawUl
X-Gm-Gg: ASbGncsSMRd2SaRh+iBxNLRAmLLHHrSx2T/GIzY9R1f8kv7IbLwRz8im41HRAd1NAFT
 QW1qX4xTdLpuP2Z0aVCOS+IsHmbGAGkA0qb8J3xzprg0FiGG5bLI+3w/m0F16z/VTf21yKpmtya
 caiwKVZYfxaNPadWJ6ZBeuR4Lo/jWOBg5H8dnAoH7VyyWyxtnlgeWdNGAPhjnya4fQM+MVgQah6
 TuhjkkJHth28OebZE74En7oNgvOGR5F5YXiH5XtFPsTB0inRoRp+D3Ljbn23G3ZluxtT7YK9MoK
 SwpKVMvybfGkBmN2GUdRDK9oEvLd8gNzBmphDSdkbyCB3QPaC40AG5ePNbaCvlecMPXoezzO8g3
 suI8OcmmlcvIoZAGOpsQLLZVEibZOggKVlHiokWrmx8AKRw==
X-Google-Smtp-Source: AGHT+IH6JfuaBvXx7nHYUKq2H64KEeeOWaH4+RslOpFqhU9Rij9N0abosYbtTeAM26PZNHDBRa3yTA==
X-Received: by 2002:a05:600c:4711:b0:459:d616:25c5 with SMTP id
 5b1f17b1804b1-45b43dc6a3fmr28722065e9.12.1755616123666; 
 Tue, 19 Aug 2025 08:08:43 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c61a66esm216675995e9.0.2025.08.19.08.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 08:08:43 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Aug 2025 17:08:32 +0200
Message-Id: <20250819150834.1651775-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
References: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755616124; x=1756220924; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niJbzbLMRi9xt+qjl4s883NDjwdxJd4qwNY+Y6I1kSc=;
 b=YEhWJyB4kGDwAkrKsuSeGvZffhyOL5bapjk/CAE+QmzZ/4pozbdgkNSwvWiRhnt08U
 JcbvFtwqnU/q4cH+gTRfHzPBzVfQIqIltPRAWu+JGPi8R5N0wsItMioAst5MjDRHY5aX
 StKj0teUkcOU2hTSs7pwvJcbxTMtKQDKioU1izwzp3CPHWCO8jwhO2dNjCA3NrvdWf53
 q3fOEW222dX3y5/iQ0w1FJEDDgfTUGHL9l7prhwwu9pD3t19gzHsdkzRF8WvQsjr2i8c
 N5thfaTzGy5DARpBdz9HDakzJjZjZQg580fOnnjaqlXe2Olrm/8b/uix1V58F71XcMbu
 SN8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YEhWJyB4
Subject: [Buildroot] [PATCH 3/5] package/qpdf: bump to version 12.2.0
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
index 03576dce50..25d68f43a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -235,6 +235,7 @@ F:	package/python-pillow/
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
