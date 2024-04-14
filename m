Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0869C04FF9
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 13:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C72D60805;
	Sun, 14 Apr 2024 13:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVuXg9TyX2TT; Sun, 14 Apr 2024 13:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17FB0607D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17FB0607D3;
	Sun, 14 Apr 2024 13:05:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC0F1BF379
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 13:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AC7860753
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 13:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqTPDG9ayRPb for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 13:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C7D160725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C7D160725
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C7D160725
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 13:05:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-346b146199eso1660147f8f.0
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 06:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713099927; x=1713704727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCwDhyTUuTG8730F6JwnyKIklpR85X2JLoN8tpdzZj8=;
 b=ugMN9lGrHFFx26cItP+8NmRtto5oEydSdfTjSk0d8R2B8asd9X5cb+AHC/MWQZpsuA
 5OmItVhnK4LFp9mdaX3v2m9v+0gm8myttaBPa614RA+W9anF/JV/gBDKls4talBESrDq
 rdac1fmXQ2upe9K0R5USo5OQFHQu+v5AT4p+Uu1KkDhUFIg8dRHR+36GPFZQRd9e4a0T
 A5QC9lQ36vmZSw7qLNB69cb1kTfxStQnaIUbndbhMzKedfBewyFqw2tTeyNi0C9E9G3x
 76UqXeIjbaEnnWHV2FQKWKyuubm5qUsAdz7B3s/NzJv3vzMh349UddERGTusYyKAmBNy
 9m2A==
X-Gm-Message-State: AOJu0Yx0NggKhoAUbP/8op10tj+s5hQPLitaOqtXqFZjk1LxC9tqLrX3
 CM6QDNh17a9VFubqSizB2qW7Xy/2ToftgwT3wn9z1svmWQpgY+xO3Kxs6hlINVx0gtGKZnzqfcl
 2Cb0=
X-Google-Smtp-Source: AGHT+IH9HUNBZqarNs96Y6YerVLsSb1y2U3JC7o8ki0qsWxOHcYTgsp2m9Szn/MSPrUJw0cUly77Uw==
X-Received: by 2002:a5d:4c51:0:b0:33e:34b7:895f with SMTP id
 n17-20020a5d4c51000000b0033e34b7895fmr4174915wrt.24.1713099926877; 
 Sun, 14 Apr 2024 06:05:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([176.201.31.28])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adffc0a000000b003456c693fa4sm9083686wrr.93.2024.04.14.06.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 06:05:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 14 Apr 2024 15:05:20 +0200
Message-ID: <20240414130520.3647875-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
References: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713099927; x=1713704727;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCwDhyTUuTG8730F6JwnyKIklpR85X2JLoN8tpdzZj8=;
 b=WnAf4vrQNRDGz+qKaoZH5eCmHTU+v86+tDr/mnppu1fm0xwZ+dtX2jJlpohWTo5Fpr
 2ZlioQF7Wr/LkokCRdShRNR/q1bSnRifOTWWgwj/9gs7W9cZ6dJP2QbFPtutahJ1sT38
 Tz8ZNqIOc+fEvvFjuf3LKzHl5fRh9lGoAFLek=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WnAf4vrQ
Subject: [Buildroot] [PATCH v2 3/3] package/bmap-tools: bump to version 3.8.0
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that, although not explicitly specified in the changelog, version
3.7 renamed the file COPYING to LICENSE, requiring corresponding changes
in Bildroot related to the license file (specifically, the name and hash).

Release notes:

- bmap-tools 3.7:
  * Use GitHub Actions for CI (#109)
  * Add `poetry` for dependency management and `black` for code
    formatting (#104)
  * Add functionality for copying from standard input (#99)
  * Switch from gpg to gpgme module (#103)

- bmaptool 3.8.0:
  * use 'df -P' for POSIX portable output
  * bmaptool has new maintainers
  * bmaptool has a new home
  * bmaptool is now only called 'bmaptool' and not one of a dozen such
    variations
  * switch to use an X.Y.Z versioning number scheme

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- Refactored based on the changes applied to version 2 of the previous patch:
  v2-0002-package-bmap-tools-rename-Kconfig-prompt-to-bmapt.patch

 package/bmap-tools/bmap-tools.hash | 4 ++--
 package/bmap-tools/bmap-tools.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
index 82a570ecacdb..28a68e8b8ebb 100644
--- a/package/bmap-tools/bmap-tools.hash
+++ b/package/bmap-tools/bmap-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7  bmap-tools-3.6.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  3c741ccdd5049b5cb6983bc186f7be8040a132ed7e9c2afda4d9e7390888163c  bmap-tools-3.8.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 69a22c4745ab..3455063e218c 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-BMAP_TOOLS_VERSION = 3.6
+BMAP_TOOLS_VERSION = 3.8.0
 BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
-BMAP_TOOLS_LICENSE_FILES = COPYING
+BMAP_TOOLS_LICENSE_FILES = LICENSE
 BMAP_TOOLS_SETUP_TYPE = setuptools
+BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
+HOST_BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
