Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE994C0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44DE40E52;
	Sun, 26 Jan 2025 15:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRgQlteHKtgR; Sun, 26 Jan 2025 15:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BBB941127
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BBB941127;
	Sun, 26 Jan 2025 15:48:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3EFC941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E368F810DB
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntyRpP41lamx for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D311E81094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D311E81094
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D311E81094
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:53 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844ce213af6so99981639f.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906472; x=1738511272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8EAHSyDe6V6teMV+aTS5pqU9b/lwVtrxxsIO7ScdoHs=;
 b=Vy0q+5TPUsllbMc9o4CxnltXarorMb1IpSPYj7BmQHoJ8bGRnmCLW0LiXRqUNxgVvW
 3VEsqMjP4iYp5NErOGP4BbPIDA4y9kfBTqu0UVqDzcRSaR4HTAzJUAkaV62FObCuAdAE
 gH1xqVjxp4yGuFvzXI8ruxv8OHfbT2RJKa8fekdlCzNUcl4D4C60q2eL6CcOYam5ZxaS
 4QtyUlcohaRxPbpGsCRltb8d4fD7WpQaCeVfyMkz5aHhHzNyaXuNvh7R4XF8RDqX45pe
 /sWTJzAeAFje/2p05EkSpxUwyqSNhXA7DrkycAkCTLZnsZXl8mSD77o90zEllaAaDI1Z
 5p/w==
X-Gm-Message-State: AOJu0Yy5cXyNWPsOf2Rl3FGSvd5KxIUEF7zKLJgF79kZ8hI40EEhc4BA
 x8Px7xEzXyBcsQpW8NWmfU+4R7dOE9PGMaifzvRVEOhEe80r9kEDXLnCTETH
X-Gm-Gg: ASbGnctYftpo817edYoFP/9IgEJSHvAw7LwdSRXxuycbYfyRuuJTTIgfDUmpB6PzYAD
 CtqPYh2/B02nck+Nw5ynovpFLANPxoyACC/SCFG2PaVI4ThTVFqjxV4zSaiGiAGOJ2uQmP8Cczj
 rZZvN4vSltsrnGuCL2cfySuLF/kryEzXzwSWvP/ASjai9lvY+9kYgIfWlwz6LG+YojfyoxxvYLD
 brrjn+QexreNUJCTJOMQ47dWZ5tgBK/e21sxTFpEFi+S4I7bst/1t8JRvEu2hOCJPnDMGKusJeP
 yUdjZV/qW5CKPwN1ORb7bmO0U/grmq8sCEwKkeu59WvTmwWUWSrv9Mw=
X-Google-Smtp-Source: AGHT+IHa/Q+oWaRJrZPgvEOrbKEQz5fGNgjXAqEOIEfFre/ac1GglX4hZWY5zUBnixpGHD1S+PNWow==
X-Received: by 2002:a05:6e02:fc4:b0:3cf:c5c4:1e37 with SMTP id
 e9e14a558f8ab-3cfc5c41eb3mr69065945ab.4.1737906472569; 
 Sun, 26 Jan 2025 07:47:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:30 -0700
Message-Id: <20250126154732.405055-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126154732.405055-1-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906472; x=1738511272; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8EAHSyDe6V6teMV+aTS5pqU9b/lwVtrxxsIO7ScdoHs=;
 b=e8VzhrV6jzXRl9NbgD5fXSa63e+8AjkgL6iAkSzIVIEsqcK9VLI1bqcUV+8IRI6F4o
 SerMombnU7k0Ky/sK2HtJryOcEy5Ufn5fw8Pw9KZGOWDNUMrwGVmDIaPEyCp/u+U8eK5
 Nvxc3WFNvBipKLkdV4vNJ3+svSnOz9PQoYDjmetATP+WGyffVsRx9M/vzx+RZurM/CIT
 Kx43xvbSHgloeyrurPjeL7diDmzUinNiPmY5LFsLoPwK6d9CcfkwY8REh7B0XvV9LRx3
 Z62Epy2SIl8DXBE1/sUkxcNDg/g+DAgoujMG5CON2C7bzLr1Jq+BSm3AZzU2/bfx2Isz
 0aig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e8VzhrV6
Subject: [Buildroot] [PATCH v7 08/10] package/fft2d: new package
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

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

This package doesn't provide a conventional install mechanism so
we need to install it manually.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - add comment indicating library is header/source only
Changes v3 -> v4:
  - fix license
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/fft2d/Config.in  |  7 +++++++
 package/fft2d/fft2d.hash |  4 ++++
 package/fft2d/fft2d.mk   | 23 +++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/fft2d/Config.in
 create mode 100644 package/fft2d/fft2d.hash
 create mode 100644 package/fft2d/fft2d.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d87f483f7..05071e6b46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3035,6 +3035,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/fp16/
+F:	package/fft2d/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index 74cd3e9815..0f35409720 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2183,6 +2183,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
 	source "package/falcosecurity-libs/Config.in"
+	source "package/fft2d/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
diff --git a/package/fft2d/Config.in b/package/fft2d/Config.in
new file mode 100644
index 0000000000..38394f6170
--- /dev/null
+++ b/package/fft2d/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FFT2D
+	bool "fft2d"
+	help
+	  This is a package to calculate Discrete Fourier/Cosine/Sine
+	  Transforms of 2,3-dimensional sequences of length 2^N.
+
+	  http://www.kurims.kyoto-u.ac.jp/~ooura/fft.html
diff --git a/package/fft2d/fft2d.hash b/package/fft2d/fft2d.hash
new file mode 100644
index 0000000000..a1b1a326ae
--- /dev/null
+++ b/package/fft2d/fft2d.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ada7e99087c4ed477bfdf11413f2ba8db8a840ba9bbf8ac94f4f3972e2a7cec9  fft2d.tgz
+# License files, locally calculated
+sha256  0b2a2082537735a2a576dbec2e8f9c1a09812eac6df6a389502a6ba860072906  readme2d.txt
diff --git a/package/fft2d/fft2d.mk b/package/fft2d/fft2d.mk
new file mode 100644
index 0000000000..781b545e2e
--- /dev/null
+++ b/package/fft2d/fft2d.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fft2d
+#
+################################################################################
+
+FFT2D_VERSION = 2006.12.28
+FFT2D_SITE = https://www.kurims.kyoto-u.ac.jp/~ooura
+FFT2D_SOURCE = fft2d.tgz
+FFT2D_LICENSE = MIT-like
+FFT2D_LICENSE_FILES = readme2d.txt
+FFT2D_INSTALL_STAGING = YES
+# Only installs headers/sources
+FFT2D_INSTALL_TARGET = NO
+
+define FFT2D_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.c $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.f $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include/fft2d
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
