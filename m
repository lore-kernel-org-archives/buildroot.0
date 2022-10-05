Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C4BC433FE
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ABFA405BE;
	Wed,  5 Oct 2022 21:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ABFA405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPtUU0zIuziH; Wed,  5 Oct 2022 21:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D82B405E9;
	Wed,  5 Oct 2022 21:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D82B405E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 688E01BF301
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 21:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4334D83145
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 21:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4334D83145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXc7XeHu6AsQ for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 21:21:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C36F82B1B
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C36F82B1B
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 21:21:58 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d24so16585296pls.4
 for <buildroot@buildroot.org>; Wed, 05 Oct 2022 14:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3BR0fU8Ru0yqieYxnMzFIJedfG4MJwxOTnzHQ3bqGw=;
 b=D+5ZnzYi4NWmltvcLNtcTlaemMxQb9IMpxzIdQRu1lCAmyCMchzLzsURU+DZscEvwY
 2105eP6AHyIVARFZIsHLIpX5OuMSnkiiihC6fGdVLAlersdyPxz3hxLUY3we7mQUA2oP
 v4gglLHe4soVK9HZgiMzZ0upQrjextkWUOnDELwJtEUMq8SDeX6UAZmwI6nAbptFb9yj
 JLv2C4TiTD1aextE9Z7mmFzpg1F6on2kCfcDnJphxiFMPY0OXYZRD/0Qe2Obctv/nnAM
 JFeXcWaYYNNvXUtSY+NteTpn/vm1CQKJOnFrKTnFt93ZFmlZoxoWkTq/Ny9f4eW0hwoW
 k4kw==
X-Gm-Message-State: ACrzQf3TYilCCkE4+Mp9JvEYimpelvKxGtBmO4AEsTJ0mNclvNTOJv5P
 P7Xalill2EmbaGuDhjQvQjGJD0yQfuG43w==
X-Google-Smtp-Source: AMsMyM77e8OMdP2SbKiIXGUk9k54TU1Q97WpZfQkYu7fE7agHb+70V2PevyTAZDeHqlbEClxBfQ/gQ==
X-Received: by 2002:a17:90b:4d05:b0:202:ec78:9d73 with SMTP id
 mw5-20020a17090b4d0500b00202ec789d73mr1684322pjb.103.1665004917415; 
 Wed, 05 Oct 2022 14:21:57 -0700 (PDT)
Received: from adam-workstation.. ([47.153.94.144])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a170903018c00b00172e19c2fa9sm11003033plg.9.2022.10.05.14.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 14:21:56 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 14:21:47 -0700
Message-Id: <20221005212150.1384370-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z3BR0fU8Ru0yqieYxnMzFIJedfG4MJwxOTnzHQ3bqGw=;
 b=gJ54+7N25LeiWQCh08/tdD0/j4D+N7n2QKlkNev3fDwwMaYfc4UIhiGa6w3xHkgpIM
 YwZitA9goHk11j/XZPtJicfs7ly9azu3JPl/I7xG8egHCZgetUWV0b+fKlQyHU/eSqDa
 CcXpkrv378ZgzL9rhJZbIcgzVZ8hXo+D/P2Gb1RQAIp9TLaUQLiSuLQfGHUs5qR7kWIi
 uItEGgt29Y7McADOjDxmap2SvDW/MY7DXsqGnXXUywXCbhQyBkT547jWpstANC1dt/yG
 oVESlavHU4UmLgIy0uMWu1M58iZ3NxtUzYyCo/p/Cd2A3qVWuuoYoittP3iO5iW8gqLh
 zfQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gJ54+7N2
Subject: [Buildroot] [PATCH 1/4] package/mender: bump version to 3.4.0
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
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated vendor/github.com/mendersoftware/mender-artifact/LICENSE hash due to a
year change.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/mender.hash | 6 +++---
 package/mender/mender.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 7fee01cf1a..d563dc534b 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,12 +1,12 @@
 # Locally computed:
-sha256  9d8b2438e358dacde58c3692bd038ed9938392f1a526c49d919f73a2dff77eee  mender-3.3.0.tar.gz
+sha256  8a149b11b990beb7620b372023eec28df63cee6a1aa4132e88ecef554f080f72  mender-3.4.0.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
 sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
-sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  vendor/github.com/mendersoftware/mender-artifact/LICENSE
 sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
@@ -42,4 +42,4 @@ sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256  e6d8321e71be932e08b8923fe9e24e06a95c7e74a6b86e6f73696436ae0ea54f  LIC_FILES_CHKSUM.sha256
+sha256  93d9db9b43097b174e362ac8f398aa9a37fcdde2974d0567b62bd6d1e0d22037  LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 5c3c593da6..724295f784 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 3.3.0
+MENDER_VERSION = 3.4.0
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
