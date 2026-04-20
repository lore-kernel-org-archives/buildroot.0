Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44F4F557F2
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 09:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB94A806E9;
	Mon, 20 Apr 2026 09:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcqqD-eBIr-z; Mon, 20 Apr 2026 09:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A2EA8069B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776678589;
	bh=CHICyc3OChBDnMixUR1UXJ0v0m6MIHF/ZDG3Ya33vlo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=A03nMBB4hgZNJ8I+OrlxBsJ33gkfDz7KMDl0jwQeo714u/b5CAEKGaIpsB7ORJaz2
	 z+hH6DREEg3WZxk8G42hLobxIf2hy9oLh1j7mEsGMf3NyKkUYCrQoS7qpZPq1jZzDJ
	 ytAyluKYkQcUFxqsy5FTokaYRMtj7o3PumSGeElRfbU8kCCnCLHN3RhzV49Wb5Pr03
	 1hGI85cn34RbDMbkQRxLjEHlJSrOe+c2QMac7194zpOpqxAdPHAY+fwU3R2fRd4yxc
	 1JQv0b64Y9TupoOApTzakoGGj05XRGL2cKAKUzF9AiuovM1V3TRa9c1sJtchtKg/On
	 r7TAYLx9Ao03g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A2EA8069B;
	Mon, 20 Apr 2026 09:49:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C494A24D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B67C940F42
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiQJjeWx2n3u for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 09:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BDAE40D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDAE40D31
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BDAE40D31
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:49:46 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so392559966b.2
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 02:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776678584; x=1777283384;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUBbAVCcME0cD9TAwgzm0BnQQH4r6j+J2yP4rNMiWw8=;
 b=EZeqQ7HVR0qQzBcM0Ev9Aq8swQbgniOrily0/w2eAwCLIv2dakiojv3nwizgBzp+aZ
 etgWi6PfPDfPH1VPjWyW06mAQG87NsHgpcMwIJo53X+Em42t4sVv5koQ4FW155GR6gA8
 sXdSNFRU2lX7+5VRzErG9lux4lDtOJasygvPMGNK33at00cJRMZj3Tr45LiLoOOw9xWU
 KAPR0sYr2QmBeJ1YpRoOA3OYhm36EILQhmD+DiugBSJDmlB2tDHrtbc0RgaAqBTY16NB
 ZH3gT0E9XdFapEbbJzuEgcLRDlEJrkDoivX8BYoGv5Ot/FgzBoh8nOqnYCz0/yjmqAhK
 5l2g==
X-Gm-Message-State: AOJu0YwW1HuR/6Px1m3Q9xy4YkfJmkfON/F6MI9TnAkF6+Fh0cTo6leG
 QquI2r0UrsaA0uWp0fxm/c5fsFGo43vZDzqwJGnbl/C8Adg7DVsVVIg/X1T3lg==
X-Gm-Gg: AeBDievRPn+5fKCg5E2xy0w+jpN88+LMuOou3LFOxBX+UYQMFJeaAi45PnQfd9rtXVg
 JJWoakgq6+OjkifUejHkfuXBgcKJeoCVAdLOqzJSy9mDeo5LkaW6FzCXopMQU4fu2eROVuhaGme
 zH4qQ9xuZrIRrlk2gl+akED79W74kYX7M8mrhBtZSOgAOrPSnD6zGdNezEM80YAzAQOsi9+83Pz
 Ygq8OncvUo55DfijXmfb8YauL/fC9fdBFjg/DyoYblVhRGTfFWUVR75k4pS7v+sA7S++ivGwqtU
 E5nPnwjU9RKaqRnd31FleQ3dmv8MtTPQ1z7nzS1H8AnH4gbVF3ZUvmAzQEaod8ok41bP01HY7k2
 ou+OsEFininLwiinI46ia8Yk5Rx55a6+02GhhUbQokPbx2eV8SAnPquTv0KWXvn8WR1Hn6z3Jsm
 21ukkIrgbpUHAEmSKe/kt7qDlRetiZZ3t9d/Hdq3tJ5tCCHhTP3Nmwfv8ozB9YOGrDoGu/HPkel
 DiR5xyriLx5yjhtvA==
X-Received: by 2002:a17:907:86a3:b0:ba8:8c8c:1c5d with SMTP id
 a640c23a62f3a-ba88c8c2648mr67230266b.47.1776678583409; 
 Mon, 20 Apr 2026 02:49:43 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba455046223sm330904966b.49.2026.04.20.02.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 02:49:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 11:49:31 +0200
Message-Id: <20260420094931.2669516-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1776678584; x=1777283384; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AUBbAVCcME0cD9TAwgzm0BnQQH4r6j+J2yP4rNMiWw8=;
 b=DhLh/FdhKni1SSqhRM4XLTNFteI61rvTKSfNPiEZVxclU9jcgzV2vFHJe6Ia4xvCdh
 SInc7QFWtrPVq/mqRBar8a6HhDyB7q/EWk2Cq7h01v6CpCWh1zPI1IVtqkR7EUf8bFXP
 9+xKFvJo2YaXepI6i9ZnPw2wyWUiRlfifo37AICEE+g6mjR1W/c5U4vn74oZlJKPs/LH
 J5l/sNyBbQvriZ4hoyybuHsxYZQ/xW1yrXqArIGuttPt8aqYZisGHioOQOdBW5HlZNTE
 SXn7uPfxScNKGtJ8qB33iBT1TRr2f/euOoSjnN6y84JY84uVw8o4Ctwn51b3XgR/zv3G
 +8Gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DhLh/Fdh
Subject: [Buildroot] [PATCH] package/libftdi1: bump to version
 v1.6rc1-2-g92d657b
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Daniel Sangue <daniel.sangue@sangue.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

libftdi1's commit 2a992306c0acf938b29fa0cd5fbc160e24424209 introduced
support for independent static/shared library building. But the proper
building of the ftid_eeprom tool was introduced later in commit
eaf42c00bfab5d6bbd8106b11a697ff4f2d7659f. So let's update to the latest
commit that also includes other fixes:

92d657bcb543a9622947d984d4a8e725fb680e8c ChangeLog: Add license clarifications
06fa7fa342a6976a3745894b46babfa5fde841f7 ftdipp: Add wrapper for ftdi_set_module_detach_mode()
120c3495ba82ae9c35a7518248b2e45dfbc36ea7 Merge branch 'prepare-release'
c4b7675a43dcd8fa7c1c42708d5665a2a02e86e4 Set version number to 1.6rc1
c0c8c923829e1c391d7ca951e12b50092d6435f1 Prepare changelog for 1.6rc1
9341a7e8efc07c213c872ced62fc03c03a270b44 Increase copyright year to 2026
f9301536f4004d42cec4dd36f2505679459aae4e Update AUTHORS with contributors since v1.5
ed9d31e41a6ec695fd610e4d718ccc8bb6aefa4b Merge branch 'clarify-license'
84497180578f481758042c73eee9ec0eb60bace3 COPYING.LIB: Update to LGPL v2.1
4ec5bc584c27c333f74eca524de5a0839c983935 LICENSE: Clarify the main ftdi lib is LGPL v2.1 only
61ad454af3e0a886a665659b73729872cfb564a0 LICENSE: Clarify ftdi_eeprom is GPL v2 only
630a27f240fd784c7c3f5d75e7c880eca3a66cf8 Replace tabs in fall-through comments
4f600d690ee0dcbecef4b02edb5700fe84c4a9b3 Modernize Boost detection for CMake 3.30+
f7ed9dd371f9387ed5b715a4f316eea9f85de48d python/CMakeLists.txt: rework Python development files detection
eaf42c00bfab5d6bbd8106b11a697ff4f2d7659f ftdi_eeprom: fix static build
f554d7cd432d3056b1ca62bf09cc4003bf307912 Ignore JetBrains IDE files
019f48462836c9f3a0a1f113a351395ddcf99640 CMake: auto-format all CMake files

Licence files changed due to copyright year change as also some licence
clarifications described in patches:

84497180578f481758042c73eee9ec0eb60bace3
4ec5bc584c27c333f74eca524de5a0839c983935
61ad454af3e0a886a665659b73729872cfb564a0

Fixes:

  https://autobuild.buildroot.org/results/8e1299b9ce28df2a848310c5bfb968f59cd8794c/
---
 package/libftdi1/libftdi1.hash | 6 +++---
 package/libftdi1/libftdi1.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index e110da6b5b..d855076324 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha256  e85f1161d19f60b570751f3c8be334d309c710e5f77ef9afdc0eaa2c4fa73c95  libftdi1-v1.5-62-g5e67403c4fb5536a2effe2e91181dd73a2cff91b-git4.tar.gz
+sha256  ac78a308fe3c031dd820c97b37d920345814cafbc056cbcbc108a861f32b6694  libftdi1-92d657bcb543a9622947d984d4a8e725fb680e8c-git4.tar.gz
 
 # Hash for license files:
-sha256  524f46428bf72bb8c6acfeca4909551fd2e0bdbb5305406d38382f4056095c56  LICENSE
+sha256  483d3d73b7cc56f3db406ec6e60d5e9fa737dd8794c36cfb7795a37030682d63  LICENSE
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
-sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING.LIB
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 4fac8d2e39..e72eae878c 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = v1.5-62-g5e67403c4fb5536a2effe2e91181dd73a2cff91b
+LIBFTDI1_VERSION = 92d657bcb543a9622947d984d4a8e725fb680e8c
 LIBFTDI1_SITE = git://developer.intra2net.com/libftdi
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
