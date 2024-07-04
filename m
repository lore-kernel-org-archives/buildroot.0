Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B1C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 161C2409A5;
	Thu,  4 Jul 2024 12:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFEQ6D94wuID; Thu,  4 Jul 2024 12:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9894D40D57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9894D40D57;
	Thu,  4 Jul 2024 12:35:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0DA41BF321
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC7160816
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHrlK10V2Pph for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1EF3607E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1EF3607E9
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1EF3607E9
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:35:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a77c4309fc8so13254066b.3
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 05:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720096520; x=1720701320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKVsC5Ev7NfrnZ+kVGp/oE/H1SuDpKD7MX/XSdV6cSE=;
 b=IOWoRraoBYur0sUtmY6ngJxNhjhaBhx1rb3O58BDTfVKPgff89ZRgG17fCox3pliFb
 blrvzofWpTM97pq2q0jotgV2MFDzDZeyQ71i3qrwRR4+qGdKFIdrwIktYSXk9nSx69Zg
 wucTQq0nfAcEZxZt3HM2i12W5b0egMQzmQ7EdDWnLLyYUXJTm7rA57ZAPZ1549g2fynk
 fkuCXE56dgZFUyQBLeD5F7OBQLZnIJjpEnteuaN01zUmG7HpVfPZM/ae6+vTwRJlS6t+
 gmA3KCxmZvsmI+v+T5IUIVDvrJZrVgYyWPf16BCT757i7Y7ruHNkf7YhwZic0HcuJBIt
 dWSw==
X-Gm-Message-State: AOJu0Ywz7fTdG7la9ZlPWQVBxKkR5Lt4aa7xF6fyTLA1lgn/yRY1hxiX
 jSZnU59zMDzLMyjYU8+31COSGvfAL0hq2WaiCbWerYxZ4TmOFAhtqjCvKw==
X-Google-Smtp-Source: AGHT+IH18jjPiC0ki7eyd361BL2iUKDPnGjQoITtdgDyWfetsMBo8yi2DuxWZj5CuEJty1K/z6fd5g==
X-Received: by 2002:a17:906:adca:b0:a72:7bf4:694c with SMTP id
 a640c23a62f3a-a77ba4517e5mr103874066b.16.1720096520035; 
 Thu, 04 Jul 2024 05:35:20 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77bd30d04asm40845366b.143.2024.07.04.05.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 05:35:19 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Thu,  4 Jul 2024 14:34:52 +0200
Message-Id: <20240704123452.3535612-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704123452.3535612-1-heiko.thiery@gmail.com>
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720096520; x=1720701320; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKVsC5Ev7NfrnZ+kVGp/oE/H1SuDpKD7MX/XSdV6cSE=;
 b=gies3gSK0AhqPXag8W1OnxC+4GGLiatzlMpohRo7NZ/nbpf5Kxq7nX15/091Thj/TV
 JBkX7CO9uWECPiqfybDfQbNLzzzhGccMxdaiMkIudwi5r/tQZF1sDfDYf7dMFWxsSAWy
 w/eW+IhXKCXq8kJ2efBSJXhUStXN/wuOGLx8gyVGNOwqsajACDKl7UVmdle/Gauq/o0l
 0gvkqE6Gq5s5zCCU1jIfdOULRTVUmFKdEgo5TW/76F3T2YLEDMkws9FF4iy5qRteN8kT
 2Lfc5rYpAceFtA1iL39FcWsEMwTg93Hw5sK9EhQn1OIsZpKdlF/cZATYLwWJ/p7byIJt
 8b8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gies3gSK
Subject: [Buildroot] [PATCH v3 1/3] package/blake3: add new host package
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is used and required for ccache update.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2:
    - on change

v3:
    - fix BLAKE3_LICENSE_FILES and corresponding hash values


 DEVELOPERS                 |  1 +
 package/blake3/blake3.hash |  3 +++
 package/blake3/blake3.mk   | 20 ++++++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/blake3/blake3.hash
 create mode 100644 package/blake3/blake3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 90d1a111ab..46fe3cd2e1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1359,6 +1359,7 @@ F:	configs/kontron_bl_imx8mm_defconfig
 F:	configs/kontron_smarc_sal28_defconfig
 F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
+F:	package/blake3/
 F:	package/ipmitool/
 F:	package/libnetconf2/
 F:	package/libyang/
diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
new file mode 100644
index 0000000000..2a00d19b02
--- /dev/null
+++ b/package/blake3/blake3.hash
@@ -0,0 +1,3 @@
+# sha256 computed locally
+sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
+sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
new file mode 100644
index 0000000000..76e4e32e7a
--- /dev/null
+++ b/package/blake3/blake3.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# blake3
+#
+################################################################################
+
+BLAKE3_VERSION = 1.5.1
+BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,refs/tags/$(BLAKE3_VERSION))
+BLAKE3_SUBDIR = c
+BLAKE3_LICENSE = Apache-2.0, CC0-1.0
+BLAKE3_LICENSE_FILES = LICENSE
+
+# We may be a ccache dependency, so we can't use ccache; reset the
+# options set by the cmake infra.
+HOST_BLAKE3_CONF_OPTS += \
+	-DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
+	-UCMAKE_C_COMPILER_LAUNCHER \
+	-UCMAKE_CXX_COMPILER_LAUNCHER
+
+$(eval $(host-cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
