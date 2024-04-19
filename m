Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2E8C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D11CE41AE7;
	Fri, 19 Apr 2024 21:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m509sWtY1GwV; Fri, 19 Apr 2024 21:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F2AB41AD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F2AB41AD3;
	Fri, 19 Apr 2024 21:18:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58EDF1BF302
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45E8680D44
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sZwccDaZxZs for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CE3C80C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE3C80C53
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CE3C80C53
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:18:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-518b9527c60so2828533e87.0
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713561524; x=1714166324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+485J7px480Ml4KOYEQCmWXtbNNnzHzupDZv59BhYqY=;
 b=ftEQ/pLigLQgBGXV/I1jyENfZYe2WP9yucMdGOIBY4kARa33SspLugal9CReU8UnHM
 nQ4X/92D/hS4a40tUJxrCXSvxonxaqYS11AbjZefqk6Hp2vE/heR6XpwA9R4WuKZcLaZ
 WH0MxpLO1WVeBeoF2JFs1Sd+hHTmigfeseDdITk3LTO7EaPK3zwFChJJuxFIKT6kdHyl
 bs67eJ2HfAyOdUriF/WeWEp2NRoS01/TbPQwjW0s5corcO3ZilzdDz8MS+itXImOmvpT
 fFntBjlUKgKoTOgco/pxcxmdxMEi4jZdD57ARcSSETiZeIs1JWSQnuk1rmTGlcdXI7i6
 b67g==
X-Gm-Message-State: AOJu0YwQHgAKDhl2KoVy7CBHaSwtZJ7XpOAUhCcC/XoJHdT5J5v2ECq9
 4IVgTNMgOVrpYgEnIDzTUrnR57CMy6jwzHlj+aF90oKfJ+8n0G9Zap+wBA==
X-Google-Smtp-Source: AGHT+IFdFkE2ZCK3fHmzLMzFDHfzvAjx42OtTwgG3EcOecoKnp3Tdj3DuII69gZcYrxdYVbRwltnmQ==
X-Received: by 2002:ac2:522f:0:b0:51a:c6c0:9dfa with SMTP id
 i15-20020ac2522f000000b0051ac6c09dfamr1947618lfl.18.1713561523940; 
 Fri, 19 Apr 2024 14:18:43 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a170907271700b00a556f2f18d6sm2556934ejk.57.2024.04.19.14.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:18:42 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:18:33 +0200
Message-Id: <20240419211833.498273-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419211833.498273-1-angelo.compagnucci@gmail.com>
References: <20240419211833.498273-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713561524; x=1714166324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+485J7px480Ml4KOYEQCmWXtbNNnzHzupDZv59BhYqY=;
 b=MjqtlrAdmdVICKz/IULFKNU1d1ziUW2eCxUC/7nHpuXYzPtrv6ZZFu7l8eKa6U5EAz
 7Fpf2Xe2UYTGH4nljMUD8OCeST4LJefUTRMeySI7EIuQhkT+/WRRBbNXUjNY1rAERETr
 ONn+D0WBRGa1sJT+6fo0ZU2PzOQUGmfEeGU89Hk70/9jv2LK3p1IPZKlzcBOs24A61Co
 mEp3brEzXmeP4D4gSzWVH1dLx/l8VtgKR107Dm3cE7uPvRpnQ/SDIIMp5LhdYWgw80Dd
 +T0I5pae4EzpyIQXqRXUFIPIOVfcpQNnQRR0VpRKfZCE4YEuT8+iXnR9wZNZ+1ff3tVR
 9/Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MjqtlrAd
Subject: [Buildroot] [PATCH 2/2] package/pkg-python: fix pep517 data files
 installation
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Angelo Compagnucci <angelo@amarulasolutions.com>

When installing a wheel in pep517 compatibility mode, the pyinstaller.py is
invoked with the --data parameter which point to the directory in which data
files should be installed.
Actually the --data parameter points to the /usr subdirectory which is indeed
wrong cause it shall point to the root directory where the wheel will be
installed.
This fixes the problem of having configuration files installed in /usr/etc
instead of /etc.

Fixes:
http://autobuild.buildroot.net/results/36ac5278d19195a21c3d02d087965e08f49228ef

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/pkg-python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 839f728e2f..4f9bee4b90 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -70,7 +70,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
 	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
-	--data=$(TARGET_DIR)/usr
+	--data=$(TARGET_DIR)
 
 PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
 	$(TOPDIR)/support/scripts/pyinstaller.py \
@@ -79,7 +79,7 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
 	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(STAGING_DIR)/usr/bin \
-	--data=$(STAGING_DIR)/usr
+	--data=$(STAGING_DIR)
 
 PKG_PYTHON_PEP517_DEPENDENCIES = \
 	host-python-pypa-build \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
