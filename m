Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0448CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 12:34:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6308C61076
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 12:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6308C61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B2B5402AF;
	Wed,  3 Nov 2021 12:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsSac_6YZdja; Wed,  3 Nov 2021 12:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5906D4037A;
	Wed,  3 Nov 2021 12:34:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B54101BF364
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 12:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A30CD80EA2
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 12:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPEFq4WF0HFt for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 12:34:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E85180E9C
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 12:34:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i3so4860876lfu.4
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ATm3fXSZLa1O97Qj0DbjmKRyoYQpEToXoM8B9cvEns=;
 b=EXqk2KGOiXGi/KhfSAG+0HyfEnOwhd2UTb1ECA9Gz/xrEvvzQAtN0BPDidq4m/Nv9R
 toEs3VKyTrbB2UQfnAXyGWfPkyW5nnSkrKoOil010wnKVX2V+6oJ4FniB38VGm3zeelW
 DAvpOiEBVS1TWyiz0EyQvTKZwgWRrADF4JVqHCJvURHYTHLdOpGZLJWZnQvau/UmX/uF
 DT77Q2ab+woCXjDRQCG3a1k2633gD27tIfQN6yjxZcGee8D+yJ2VITAOzURxy9KCD8AY
 xPwFHo0OD+Z2citjlVPQVxszBHEnYDuseKHjf3v7ydjFCf4z/rnYzusTL971rD669GEM
 b6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ATm3fXSZLa1O97Qj0DbjmKRyoYQpEToXoM8B9cvEns=;
 b=GACKqNwylozZFiWM65sU8VHEpAv/+clXcVjLVNP70ZW9uk5NN3e3vjOXlRZVfrLDHc
 OzP/jCqi1Xj8qqAeEmYOZXfRAS+AoY9c+SuXT+hgtz0G05ImpfF9NMFBPNA0wg9t9Bbk
 ZQ5C1GqIcetzwFyUvcIC+QLT5kUx0JS9iQaMEtlIBI4qhmZvf0cuQNMaUh39gxz51M9H
 DARTKv1GNIiH4Zv4u4TggbSYBuvRuQ6CXCd8D0nlrd7V7bb2N9vajqJpd3xSlS2QPhNW
 ExWOsktOJt0W5gPjZwQpb+/xM4cFpemRrobEOqtPI3Owxp2e46WbGPFOuH5BqlaxURWC
 uQdw==
X-Gm-Message-State: AOAM532ItPsKNhXnxPvVuWZ4aU4xHgV1Fkd9cCmnQUbJ4uL2E1PdyIn9
 edXBi8pTVW1c1guUBU0hiJcSDL/xTtg=
X-Google-Smtp-Source: ABdhPJz2ADzNofaryCGz+b1Lkd8z1zYSYfovPaExRVLRum0ln1LrntfeWIzSmw5LagcQYVme2AWzHw==
X-Received: by 2002:a05:6512:31c9:: with SMTP id
 j9mr39540429lfe.395.1635942868881; 
 Wed, 03 Nov 2021 05:34:28 -0700 (PDT)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id s11sm181827ljp.60.2021.11.03.05.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 05:34:28 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 13:34:09 +0100
Message-Id: <20211103123411.3116067-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103123411.3116067-1-troglobit@gmail.com>
References: <20211103123411.3116067-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/mrouted: bump version to v4.4
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
 - Upstream has dropped RSRR support, drop config support

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/Config.in    | 13 -------------
 package/mrouted/mrouted.hash |  5 ++---
 package/mrouted/mrouted.mk   |  8 +-------
 3 files changed, 3 insertions(+), 23 deletions(-)

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
