Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A936C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC20681E3A;
	Sat,  5 Nov 2022 22:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC20681E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HahWGYmexF2S; Sat,  5 Nov 2022 22:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C583181E30;
	Sat,  5 Nov 2022 22:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C583181E30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF46A1BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAA62606E6
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA62606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHpskfLA5tep for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:41:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B73DB60671
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B73DB60671
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:41:31 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e189so6359370iof.1
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 15:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tqibiwll3xrFdB2umbwkAJsBHeLMzlQ8N3agfew4zRs=;
 b=G7nXphpYG7srsETa2NYKIUaaNjsNsR+Tae35aEa2/4kUgqlLigJs4PjIkipgyzUrfY
 2S7qowwUM5elXnK95Np7XKQK7iaizNmMnvFNuSHyDvHFHlNUJDmaWifapR+2W0QD2Qw4
 jlbvjC5Kl8WopW2Qa08F0xvfVuOaVeUEEUJqHuEVPCrrcKD2GQSc5ck1Hjf2aAUxh0lb
 UpAKBID7KyATNqBBPweWuXvRkhERejaGmYDAXek9iIBzj3y5lo8NL77htluClDU9oxPD
 AC9av1ywKDXc2JssKMv+rLSv+lhAy3kUMbqOrurYqaj7GHqWMI5Ubb1TemiKoiw/a5Dz
 VIyg==
X-Gm-Message-State: ACrzQf3zcR81SdJGemc9J9x9fOh7CK4XNRhm/PMxWwNrc/A9VkfaXO4I
 fPV2Yzr9Kzbow7PzboFmh8Fa3hWiJo2PZw==
X-Google-Smtp-Source: AMsMyM7dQ2tLm39goHJUPYzvQvPdmGgXUastBn1ITyPFyXxZNug14o0Xa3dP4VLNbAV+wesLBu5mkg==
X-Received: by 2002:a02:7303:0:b0:375:afbb:f6f4 with SMTP id
 y3-20020a027303000000b00375afbbf6f4mr3912646jab.241.1667688090433; 
 Sat, 05 Nov 2022 15:41:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c12-20020a02330c000000b00374ff5df5ccsm1045791jae.167.2022.11.05.15.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 15:41:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 16:41:27 -0600
Message-Id: <20221105224127.4026011-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tqibiwll3xrFdB2umbwkAJsBHeLMzlQ8N3agfew4zRs=;
 b=euQyl/c7imbKJT6xycR6gYGAzq/CLLPkgGqaSZxVgsWWPTxuPs3xswZ6S4yKaBiUQ8
 DrufzGZRmTOIPpMvXGmTNq1Hv6TAdQL3vrFAB87/pUdgmiIg4d+GrzPtV6IV+04Ys/uU
 VlJVJSgXSKuzul3Y/C6yC2UyyyS05Xr29NKMMpVoROJ28Qd9vEAWtR3uj3jb/EZnA9yV
 4fwx1YtSdAXee6+eqGC/DyoARc7F4kDj7rG29p9i4862G4/m2tNb1hap/pDWwZ34Ei4q
 Kp40E0wPsziMDF3z+bMRuiVEFXlMIYQ+Jm+jggex4/ydCYeVH/jYDregJt/7rpTKY/FR
 I3Vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=euQyl/c7
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to version
 1.28
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 4717523dc2..8884babbc0 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-October/042466.html
-sha256  9046f10a425d4e2a00965a03acfb6b3fb575a56503ac72c2b86821c69653375c  wayland-protocols-1.27.tar.xz
-sha512  c0a49bc46c663c9f602998dfe2e184c09756790fbcc7acbc2bf9d9cf8f7d6dcdd00259b768222a30e5d134e6f97f7f4faf252947b544e8b32f53278b70da0390  wayland-protocols-1.27.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042490.html
+sha256  c7659fb6bf14905e68ef605f898de60d1c066bf66dbea92798573dddec1535b6  wayland-protocols-1.28.tar.xz
+sha512  092454c6a7e5cc47729de49e9061fb91dfdc5610859e17c495642806ca14dcfb3850a5d3a7459ddb70b2adb08d2590d4b0f92c3a97600e48598682d59adb102f  wayland-protocols-1.28.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 2510d7c04e..830136ce06 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.27
+WAYLAND_PROTOCOLS_VERSION = 1.28
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
