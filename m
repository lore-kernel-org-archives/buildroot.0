Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B7EC4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92FC741ABD;
	Fri, 19 Apr 2024 21:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eheXtJlO9aU; Fri, 19 Apr 2024 21:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 859FC41AE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 859FC41AE7;
	Fri, 19 Apr 2024 21:28:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DE121BF977
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 679C141E56
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKvtytoIVetT for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 182F441E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 182F441E55
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 182F441E55
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:27:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-419c82338abso4999185e9.0
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713562073; x=1714166873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o1WzB2TIEBruWcQnvWk2YtUVqLTvYEsx2EUmw6zhepo=;
 b=eLJgcmXM+SMphHP/e6nGF2sCgExve7dYVlBGO4jhd6bRWV+CpJ32gmp/EMqPl5vQc6
 j+EYPj1WRmpgAv3Mr5unF9UNc4LvS45B/K8DbCfhl7ekWWLvUZl3CoqlFADRmwZQc/Za
 C5CPVNkXhk8r5GG7qyImg9PMMVblHl1mojxhtmLyzAXwaBu3w0u53VQmeR32t9xNxJXo
 zQbX1HvvjhEfa6TwGke/NnEP3YOPpnPAOxVaGjwCyrHgQ2xt902SYO5lUu8T7jAnSAEr
 1ptbLgbuAAFTEfHZXIfyAWVUDNOi1mfxcp6McQ/7tzExImkCTYJueDi48sG7Y9a+OTdW
 AO2A==
X-Gm-Message-State: AOJu0Yy1EvhZadhNX8e+sIlC25/hn/k1PyHPHJIdTTVw3QN1CAhq3OPw
 BykD4spwVaKmk8P/EqcEDa//OXrMk0OkaHRS2zujbY+ulgkhlefKS4zhmw==
X-Google-Smtp-Source: AGHT+IFAAK/5lqYLZOPgFr5WPsz1V/CGZyEKanTv+M9SPLC8+RHXb08+P9rhRHwAC8Ag6/f2eT+mYA==
X-Received: by 2002:adf:ec82:0:b0:34a:4eac:2e44 with SMTP id
 z2-20020adfec82000000b0034a4eac2e44mr2764887wrn.41.1713562073503; 
 Fri, 19 Apr 2024 14:27:53 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a4e24d259edsm2596766ejj.167.2024.04.19.14.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:27:51 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:27:45 +0200
Message-Id: <20240419212745.512436-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419212745.512436-1-angelo.compagnucci@gmail.com>
References: <20240419212745.512436-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713562073; x=1714166873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o1WzB2TIEBruWcQnvWk2YtUVqLTvYEsx2EUmw6zhepo=;
 b=nI8edAo6FG/sTGlpQh4ttvfIfPaPHr0YVJBgQZ+ms3XV1idBM2XNTeJhzYO8NRqmlp
 c+FMJL7O4dqHzY7YO+Fr/Aokmo6tdAq3UjDC3LJ5Dr7D1qc0/cKV3ND6AuVh+VvcqH6A
 HHra7NiOn6KcQiUNnvBu75/SEmknlpL8q+SltU68baUEHYEz26CqzAqUKpup8bKxkbC9
 Z6tHTfL+duCt7T6Jtz5ov08e0/JCe6pGVyp7DoVyD95/UP+jaJkIEKu8y8TjxT1m/WWh
 i+9TPuPHPdMFqJwBXtIo4qJ/oW2dsyVJt09hp/0znf3IUOwpAAd0AuKEn0a1jGHvD10J
 Ao5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nI8edAo6
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

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
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
