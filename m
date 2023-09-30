Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5325BE748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA83583122;
	Sat, 30 Sep 2023 22:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA83583122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FZD7teGOKXn; Sat, 30 Sep 2023 22:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E865827D8;
	Sat, 30 Sep 2023 22:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E865827D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 560B91BF471
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EE01827D8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EE01827D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K48NWme3bnNH for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:03:58 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14AF7820CF
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14AF7820CF
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-405361bba99so151452065e9.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696111435; x=1696716235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l8a5OcMCxuwBQxz6SOMQ5lmZlRakpf3cFwBiAtgf+wU=;
 b=ZjzzbbE5Ghz+1eg0i3lZSXfR9HTql5Jpg3xLdoxzzKwxWoch4aru+YVOCnYYKsbVYa
 cLvS3BhnQ3d7QoySa2SArlTI3GwXyGWPwu2LzMgVZ0mmRf03Lz0KDfEvZEgMFbPBwzTC
 mhqzSQbeWm4moLfA5A5XPuJWQuyvsnD4UXjurpPWFYB+6YZTKaMVfDQhU5mhV1w92wvA
 Q/VT9Dx82OS99+SBgq5Qdr3tUi6sqad3Cbbu08wQ4uKHlfJSCLTa7qz5F2GEef3Tgawc
 6Zeqs/vOrxl93AY5MOXu31hbQQMUftDbcbV+SyCMm5D27Dx5elixbDIprzbnxjwyyI8q
 Tx7w==
X-Gm-Message-State: AOJu0YwAQuDWuSjgnbbOsJbPhl2gh6bcOeRuKG8J21X+g6zscn4zJlMj
 llfUdnEzMLlj7h6VX0VeVajvX3WT3ts=
X-Google-Smtp-Source: AGHT+IH6m/CV8kVENebYGcg82WeI7ZwitmD7l9F+7mhrzlxX+ioEeGc0EAf9C3XIuUnrAISifqaHAQ==
X-Received: by 2002:a7b:c7d4:0:b0:405:3d04:5f52 with SMTP id
 z20-20020a7bc7d4000000b004053d045f52mr7375355wmk.24.1696111435343; 
 Sat, 30 Sep 2023 15:03:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y21-20020a7bcd95000000b00405c7591b09sm4160419wmj.35.2023.09.30.15.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:03:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:03:52 +0200
Message-Id: <20230930220352.227651-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696111435; x=1696716235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l8a5OcMCxuwBQxz6SOMQ5lmZlRakpf3cFwBiAtgf+wU=;
 b=XMPU3KHdwlYepY84YgPJirI4lEW5BtM+P5uspWD8mu+pIBj8QzLFvemzclO/Wch7e6
 D5kBrAqx7F2+uPozPi/Zr7pchgkfLN3LFsBA9dUqpjlvAm4vvPy0MB4w7G9Lh51YCf+Z
 2YJ1H7ZzkpK4mkiOZf8KLbnntv1PUh+j81q5jsqYUli6Js7YKGq+UeDgQwNMfckBgNMP
 IyIBXhlxghN0M/ObSRC8SEUgHleubPszn+PF6aqdwXMWf7g6EgSjRuUryxGteH0NXTZv
 uwJ5DCcmdvN911j8/17NcEoO+EG+4Vah48kHXHKhn3E2X20ssJK0IZ+jfb82ASQiwKa2
 VLWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XMPU3KHd
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump to version 6.5
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?id=849ab2644bb80af40493c55c7456ed27e483a315

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 905b47fb06..8d2bf58420 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  d9425f0a3df138734001fccc4175fe178c025f938460ac25c4ebc39960168822  ethtool-6.3.tar.xz
+sha256  814171ea4b8026b081c0741dbbf32e6968311483ecf64711232faec2ac70a14c  ethtool-6.5.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 9f1ef19e7b..94d14b123b 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.3
+ETHTOOL_VERSION = 6.5
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
