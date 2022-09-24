Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F952C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E47E360BD0;
	Sat, 24 Sep 2022 21:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47E360BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FpP4zSVY7jh3; Sat, 24 Sep 2022 21:06:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1849B607F7;
	Sat, 24 Sep 2022 21:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1849B607F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31FED1BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 177DD607F7
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 177DD607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ExPvbrdXMLV for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:06:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9485607C9
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9485607C9
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:06:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id n12so4817154wrx.9
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 14:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=8Uy2bpqByz/guex5ixtfK+25ebwfhC68F3R8hLCZsoU=;
 b=Xis7ZmCyb3LSZxQiAiC1eHkfDPIBNJ6FKnb4s8CxY9LY+2PSz71TwgfsgqHUNVUH61
 qiOg1cNFx+dJsGsFX3nQ4dATloTbeB77ls1slaR3yZC2Uy+etkZ3FgcOBjoI5z3JAW5c
 QGJ7Wl8VJRJyhumTGxavjMIH2+0CT1M2BbjoL6ddV1OffJPg7M3B7saUq1OEeJHQNNn6
 1cyi+q042L3QPpgpKiHBHwxA8/sk74OwJjgd1T9uAPHhPIx/OGPAdjrOq9KgaI4k4qCt
 HRsohRgC1dq0fadVDK7X6jUB3u8yPj8WhYW1YEqUIgGFuM5uhnQlM1jB5KvHjsK/rFZL
 wNRg==
X-Gm-Message-State: ACrzQf3JpX3sCZS236kLjKl0xGJhbbe8FyzQC/E5tNmXpjl4xzyBrmf1
 CD0AM8W+WJqyYg2CbeQYOvGZnxLz0No=
X-Google-Smtp-Source: AMsMyM6aWYmj5ClCW7MKjAlGbeuzVT9SysRYXJE3We+MWtlSfDxLCNo+VUKzPjLXnv450bY+hgh/rQ==
X-Received: by 2002:a5d:61c7:0:b0:22a:fa77:1cef with SMTP id
 q7-20020a5d61c7000000b0022afa771cefmr9601853wrv.50.1664053583723; 
 Sat, 24 Sep 2022 14:06:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bj1-20020a0560001e0100b0022b0214cfa6sm12797412wrb.45.2022.09.24.14.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 14:06:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 23:06:21 +0200
Message-Id: <20220924210621.106813-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=8Uy2bpqByz/guex5ixtfK+25ebwfhC68F3R8hLCZsoU=;
 b=YkSdpD5aqWWcGsqht12Cs7tssUifMzTKUbheJI8Oi9vq6CBjSy3kE3bwm8wm6lg6JK
 ue7D2Wyax5wej6kA0KpJ72cUyNMYCQF1raR/8qziwUTtESWMqa4nuYRXeUzPKKmsci50
 R4u3GrW9PuVa9gTtYVukEXreXy/Dwr4ima00CKnKBkC2GEMctNWsivWEciHKwKFP1yIF
 0uuWGn42QUXjcq98g2DuQUuheWxriS58OkHsJllDRFIy6mixUitlOx/36g68PzVZHEjD
 1TSBFmB4pp3F79lq7DQM9y5U8oprMhQzeMP3Yoj0aoXThHLwXn4Z/U5J7A+InRaHjdbS
 iUbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YkSdpD5a
Subject: [Buildroot] [PATCH 1/1] package/daq3: fix build without C++
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without C++ raised since bump to
version 3.0.9 in commit c05fe1d621c7c5147f687b39f61988918efec566 and
https://github.com/snort3/libdaq/commit/c2ae4668fb4c8f53523a47f93a120c62364f3d02:

libtool: compile:  no -DHAVE_CONFIG_H -I. -I.. -fvisibility=hidden -Wall -Wmissing-declarations -Wpointer-arith -Wcast-align -Wcast-qual -Wformat -Wformat-nonliteral -Wformat-security -Wundef -Wwrite-strings -Wextra -Wsign-compare -Wno-unused-parameter -fno-strict-aliasing -fdiagnostics-show-option -I../api -DBUILDING_SO -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -c gwlb/daq_gwlb.cc  -o gwlb/.libs/daq_gwlb_la-daq_gwlb.o
../libtool: line 1763: no: command not found

Fixes:
 - http://autobuild.buildroot.org/results/48b4673f46c9065e97e95872f9aa947c4f3fc21b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/daq3/daq3.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index 6ecd1134c7..bab957e052 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -13,6 +13,12 @@ DAQ3_DEPENDENCIES = host-pkgconf
 # From git
 DAQ3_AUTORECONF = YES
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+DAQ3_CONF_OPTS += --enable-gwlb-module
+else
+DAQ3_CONF_OPTS += --disable-gwlb-module
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 DAQ3_DEPENDENCIES += libnetfilter_queue
 DAQ3_CONF_OPTS += --enable-nfq-module
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
