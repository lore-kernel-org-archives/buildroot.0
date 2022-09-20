Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE3DC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 19:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02ED760FA7;
	Tue, 20 Sep 2022 19:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02ED760FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SHK9PzRHccO; Tue, 20 Sep 2022 19:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2286460F9E;
	Tue, 20 Sep 2022 19:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2286460F9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11141BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CE5381427
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CE5381427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5ObtBBlgpz2 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 19:03:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5728E81416
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5728E81416
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 19:03:52 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u9so8507870ejy.5
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 12:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=yd82GmMZEfwcKRwj95qGZZqT3MkPbZkMKe7jYLqPXd8=;
 b=UBFk57OIgVDkayvr4yjQ2LXqeFVPSW9lVOk3gDpuH/MWjdXK203FYF6PdoX+Jst0nA
 lxWCW+wSE+7dwMbKIasoET7k9sSwH0hbQ01xosEF3dVLpcF4dYRX+bhNUb2SLxqyT53h
 bjAchNRL4wXlMewBHuV9SrAzIJVWCQJyW/xe96uzlNHVA4GpKLiAyBslzZt3SxMzxxRp
 26VrpJKN5pj2R2/6ENOPnri9CwN9pe280120mSpKLBUaORiMpeAJ8MJZPl1LLOW2h5dY
 FwF0uPbOo0oU6qQU8V5RvM6ylMTm4QLRmPhkD3Vnfdm0t8G2i5K7o5eSuKFiam5rg3bo
 daCQ==
X-Gm-Message-State: ACrzQf36EtP0OnSwBXY8RbdzWeHXqI/Pj0/GuhDqe04BERhGRCXoPQuJ
 p+S5gAWFrKvxuFCI/ZxbQmPJvSNfcUk=
X-Google-Smtp-Source: AMsMyM7FEdqFLEhG/0Y8hKX4hpORAiZo8pO8MtFgzZ4bYgjD0yf9PniRxQT0QlGAQa7X6MVWTkcuOg==
X-Received: by 2002:a17:906:8a5a:b0:781:6a01:5ccc with SMTP id
 gx26-20020a1709068a5a00b007816a015cccmr7307080ejc.118.1663700630493; 
 Tue, 20 Sep 2022 12:03:50 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a1709061dd700b0073923a68974sm229789ejh.206.2022.09.20.12.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:03:50 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 20 Sep 2022 21:03:45 +0200
Message-Id: <20220920190345.3688752-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=yd82GmMZEfwcKRwj95qGZZqT3MkPbZkMKe7jYLqPXd8=;
 b=IDg4r0/BE2eT77cP1s2x0xDFhx92Cmhu80lYTCte1hq6C1kvwuAwczogL+piGE+G0G
 DzMn+vTDlaIS9nmD+RRgZjfxTOWeYQUYjLmG4y4OtAwmfzBoNbQYdoV4mSavtTXMrDZQ
 YXXZ3OVtd5ZBUnNDTKzPYXqQvRf6uuJrE/chiD8cYIRxJyvAVpHGEWFTwTQh3kes6Lk+
 +GrxpyPrYc+YhVyGo5zweDgVrgXWwQ3RHhvKw5isW30juPfd0WXtXYSLaFcwZwxhPXSE
 D+zTD0PiMRQIog5eXN3JJCqEyHA6Z9BucGk54GnrxIn5dAPcJIFbea1Ff2rFZA0gVnlu
 yOhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IDg4r0/B
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 48d7f4d5a..cbd391db2 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.9.sha256sum
-sha256  1b636aabf905130d806372136f5e137b6a27f26d47defd9240bf444f6a4fe610  pango-1.50.9.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.10.sha256sum
+sha256  7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966  pango-1.50.10.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 348759092..649f3398c 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).9
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).10
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
