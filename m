Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:34:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB48361073
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB48361073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56CC14051B;
	Wed,  3 Nov 2021 21:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mm079yJsqm6i; Wed,  3 Nov 2021 21:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A745040517;
	Wed,  3 Nov 2021 21:34:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69C891BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55054403A2
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb5kjpBfzGvT for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:34:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 004EE40398
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:34:24 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id i26so6125204ljg.7
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 14:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LArxnPJm2bdVeJj64Cy3S04j2SO/L+xrUhMwJ2JlP7k=;
 b=HMUjflN4NiGuOE7G1KLy4NLEIeJ5rbZ35kumXxYKprhfdisVSwksA+qrzcuTjCfpaz
 d6TDewoWIVEO0/4v4S16FjC/TAicOaoW/Alck/T4vRN8XPUyZLs0CYQxPO9vovhnM8/u
 rdEo3Mh5QueINsrsJMqLImtTzzX1fnWOU+qIAiWwUZXNNyEzNe8dQFpVEo45qs+kQaed
 T+7rTwHeSSNA+pR4PTBCabCSlAXf3rCd7WMyLMMkKr4+K64Fm+X+zw2jhzpZqr02z/9Y
 4qORz7tjNs2Ia9qWc9pV+pM4YoGlDQsLTT/7Lwth7pVzMAeeatkX1EG5OFH31BW/Eh0x
 9nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LArxnPJm2bdVeJj64Cy3S04j2SO/L+xrUhMwJ2JlP7k=;
 b=3c5GlAn79CI3jWQe9sxzAWTp90JhwFy5ZzGgc2KV/0jTSadVKtFoefHoVE/YenS4no
 s4sf4MYExzWR49B2VqzcBFDQB7TvhnDr5l2LvFaHPOiUGH+p0elKxDkUOhPSNTgDgl+E
 Ph4FBZL7phzbMxIiU8O3nCmjxAdT0AAv/XoUMmHAInFmJdJ+/897hoVwfDV4FF7HDd89
 FikfBwslxuEPfpVxjX7zx4XptToRxAo79lt95yX3iEVo3GG3fLabsvSysQcRlcVrsDql
 g8axsWwIPMQAC5bRU5DO4sJeKrvtFCa6/zEfPdE4qOM0dltY5N6EDGGqWR+tvJssBnOW
 XTqA==
X-Gm-Message-State: AOAM533wxYzz2I4NLxgJt69uZ+OPwPBftxjKFYLjx3sYwH2PRQDtfIrj
 I++DXr9beh/9aeum0imD/ALhvFFi1eI=
X-Google-Smtp-Source: ABdhPJzST6LsMI2jLl+M2lZ7/eYR6nF2J+39Np9fZgVBsR6UptpM9iYPjuKO4sgDACkqo/hbwNtXNg==
X-Received: by 2002:a2e:8290:: with SMTP id y16mr35375360ljg.161.1635975262658; 
 Wed, 03 Nov 2021 14:34:22 -0700 (PDT)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id d18sm279055lfs.61.2021.11.03.14.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 14:34:22 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 22:34:16 +0100
Message-Id: <20211103213416.3223626-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/mrouted: bump version to v4.4
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Upstream has .sha256 checksums now, drop redundant .md5
 - Upstream has dropped RSRR support, drop Config.in support
 - Add BR2_PACKAGE_MROUTED_RSRR to Config.in.legacy

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 Config.in.legacy             |  8 ++++++++
 package/mrouted/Config.in    | 13 -------------
 package/mrouted/mrouted.hash |  5 ++---
 package/mrouted/mrouted.mk   |  8 +-------
 4 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 23c3ee29ee..008acd1d83 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -165,6 +165,14 @@ config BR2_PACKAGE_CANFESTIVAL
 	  This package has been removed as it is unmaintained since
 	  November 2017.
 
+config BR2_PACKAGE_MROUTED_RSRR
+	bool "RSRR for RSVP removed in mrouted v4.4"
+	help
+	  The RSRR configure option and feature was dropped in upstream
+	  mrouted as of v4.4.  This feature was marked as experimental
+	  since its inception well before v4.0 and was never deployed
+	  in the field outside of academia.
+
 config BR2_PACKAGE_NMAP_NDIFF
 	bool "The ndiff utility has been removed"
 	select BR2_LEGACY
diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index f8dd173c4a..95b4fb3825 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -11,16 +11,3 @@ config BR2_PACKAGE_MROUTED
 	  Note: at least two interfaces with MULTICAST flag is requried.
 
 	  http://github.com/troglobit/mrouted
-
-if BR2_PACKAGE_MROUTED
-
-config BR2_PACKAGE_MROUTED_RSRR
-	bool "enable RSRR for RSVP"
-	help
-	  Routing Support for Resource Reservation, currently used by
-	  RSVP. This is an EXPERIMENTAL feature.
-
-	  For details, see:
-	    http://tools.ietf.org/html/draft-ietf-rsvp-routing-02
-
-endif
diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index 188293025f..affb323b4b 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,6 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.2/mrouted-4.2.tar.gz.md5
-md5  b921f9e152e039efdac745438ef8362c  mrouted-4.2.tar.gz
+# From https://github.com/troglobit/mrouted/releases/download/4.4/mrouted-4.4.tar.gz.sha256
+sha256  095439e544d69c91ed64fa87db7e35bc2155eef48b7f268281d80946d2c6b953  mrouted-4.4.tar.gz
 
 # Locally calculated
-sha256  689541334ea951286054b771640e9d0f26b6a3242ff7f3894a3ef1b680811b34  mrouted-4.2.tar.gz
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 95da0c622c..4014b8f896 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.2
+MROUTED_VERSION = 4.4
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
@@ -12,12 +12,6 @@ MROUTED_LICENSE = BSD-3-Clause
 MROUTED_LICENSE_FILES = LICENSE
 MROUTED_CPE_ID_VENDOR = troglobit
 
-ifeq ($(BR2_PACKAGE_MROUTED_RSRR),y)
-MROUTED_CONF_OPTS += --enable-rsrr
-else
-MROUTED_CONF_OPTS += --disable-rsrr
-endif
-
 define MROUTED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/mrouted/S41mrouted \
 		$(TARGET_DIR)/etc/init.d/S41mrouted
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
