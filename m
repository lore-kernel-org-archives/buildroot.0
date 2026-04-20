Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD696F557FE
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 10:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747EB82681;
	Mon, 20 Apr 2026 10:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09HIjb8-uebA; Mon, 20 Apr 2026 10:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95209826AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776679826;
	bh=5Zk3nz0aceVoqhREcYaERK0hxrWOrP1vU1G05wNwVAE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=HZ1XfINTIqV6OnjQcBhyBT4HtYPOmJpaz8lYqdZ9DBKwEdqeFJtA39QZy/Jxa8Jr2
	 tUULtvV6hfCHAVG5G/9GwZb4GQWm8B0Kxg0Qq031z+lx8YpIq8FTpHgW0X7RqOv+Dg
	 75p2CfJIhmQN8u6zBht1gzZyhGm4jXusvniTUywlw5pFaWl36I9Y4mGstI+m9tuSjF
	 HCW16+EyoszB7qAln58uNPBf9iEwFJ+6aHMBYpCiJyR9mTF4xWRmxA/wjh85ySckg8
	 FSKzrX5yNQmlRNutE04NxyZ9np4u4vuBh87dDyYfI+hCuGTcJJVYc0uu8dEO01qanm
	 qz5widBMGWWYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95209826AA;
	Mon, 20 Apr 2026 10:10:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6403259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 10:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C3A61082
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 10:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfe_voS6_8Uw for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 10:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4D29606C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4D29606C6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4D29606C6
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 10:10:23 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6720c7968e4so5180358a12.0
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 03:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776679821; x=1777284621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZllNmgJYEYah+Zinw42nBTNuCv1rKgmzq5CAbqVTcU=;
 b=Ha2HLHOWt2/KZqgw/oxbbCoDaUT8QfkgwIQ6YWgumiYCsKce8hLvxNBQ+KtiScrrDM
 PCwyWROC6c+w0XDn6e4WbIWyHQWCkl+kXDVeuOjPTGnQQtfTJX+H7Mt94q+Rf+USqZXX
 74alOjaeGx22xyp4cgelHhF9vm51BOQ6QbHKaJtLsodXn2aMplApNyefeNWdWJiHczI+
 6tOkfpmb+WVvv/Pid3ESJBnxtL6ENEn14/VUV35wnqIETA43SA2pEwfiRlJKTGJ3pNEJ
 P6FnUPn0Kg3K2loIQZhaNACQKMpG+dSeQJT4GefABaabPWgM/u2f6ZKbz9FuMwJzbxAN
 6QEA==
X-Gm-Message-State: AOJu0Yw0Az0hNeAObMaUF7TmyuYDP7bjoQrXzzOz2j0xZv+EmG5eo0lj
 olK9dr2UqDPwh7RgTO+ygYn3s3hRsmmcI2TbP5cNHNnQrFMb5ChtJAKaO54kWg==
X-Gm-Gg: AeBDiethim2oqbZRichtUkg+yd9S5ivq51AySfb0DSD5TZCAfKTDDUGJ51f6CYZc/7s
 raPos0tePeUuVJNL6/DX7yZPjUOl8J/G6arZ9+28fxhT0xk5H1erNiC8C+EmFmxAzCDo4ii0fGW
 R+bm/0Idblb6rS1R3TFnD+OZ/QOluvkIPJxhQnv4sp4B0p8HjvbOPzelp7w0A9qBAcf5JG834hU
 p2427wgOzhdWnnuOqZw8g9TmQmhz1DYl5o4awFamteGYtDvTw4NMP/z0hwfHyRA2pr+MbW7IyuO
 RDdpbwyxvBtBViBSkDHBsqOH7N20aAl0cPYlniwr/XC5nx/KS3+6+zAIDL7bw/43hHIPhDOJinK
 9MbJKOHuCHKNaMLkM61LYgiFic565MKq2cHw7PgSr670zcetzzQ1e1GFIRJGnSrDYD6GLDLnf7y
 JlKPwbA+bdCcD0D1XDJdM0dizxLZIIhlCT0HzEdvudBFNQUZuqnNAvxvg6DYhWsqL8n3Cg3WR6W
 WvB+s55MSSHbebGE0Gt8RO3i3RQ
X-Received: by 2002:a05:6402:454b:b0:670:a28c:4604 with SMTP id
 4fb4d7f45d1cf-672c12b321cmr3433648a12.9.1776679820397; 
 Mon, 20 Apr 2026 03:10:20 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-672c4d4574fsm1854865a12.15.2026.04.20.03.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 03:10:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 12:10:12 +0200
Message-Id: <20260420101012.2705454-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1776679821; x=1777284621; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EZllNmgJYEYah+Zinw42nBTNuCv1rKgmzq5CAbqVTcU=;
 b=adh50vyT69lDBYECKaQi4Vkcn8Yx9L2RaDanhNxBG/4yYl1vbg2yYFQ52xiKspDglq
 NkJ/IMq5PTJqV/NhA7Bzb8p4MxX3g+Fcr6SKsugOOiBIJ8rvpdp5EDlnH5pH5UBQvaPQ
 izT1iG5UmZSO6YRPDq/SJijncYrZudZG85WfG4B29dvOIcqhXcN+H5uWi17DAzniboem
 gK9r8hwr59U4r3p6PjRpIa3CgZUTx5kp5UaYLAyfuNO8jjym6O06DZp6q/507aY4rcrC
 fvUSo0V9xFXNxL/YghWomy4gQqvrw+wS06+Hpw7e9EYun4LWMMSPD7akBbJgsgeV7UM1
 7yAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=adh50vyT
Subject: [Buildroot] [PATCH v2] package/libftdi1: bump to version
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
Changes v1 -> v2:
  - change LIBFTDI1_VERSION format to descriptive one

 package/libftdi1/libftdi1.hash | 6 +++---
 package/libftdi1/libftdi1.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index e110da6b5b..3740e5b454 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha256  e85f1161d19f60b570751f3c8be334d309c710e5f77ef9afdc0eaa2c4fa73c95  libftdi1-v1.5-62-g5e67403c4fb5536a2effe2e91181dd73a2cff91b-git4.tar.gz
+sha256  1b0f06a2f99c97b66fd89a00b7dad6bba21d53de7c5a5bc2c3ef4393b32d4228  libftdi1-v1.6rc1-2-g92d657bcb543a9622947d984d4a8e725fb680e8c-git4.tar.gz
 
 # Hash for license files:
-sha256  524f46428bf72bb8c6acfeca4909551fd2e0bdbb5305406d38382f4056095c56  LICENSE
+sha256  483d3d73b7cc56f3db406ec6e60d5e9fa737dd8794c36cfb7795a37030682d63  LICENSE
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
-sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING.LIB
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 4fac8d2e39..04ed3de562 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = v1.5-62-g5e67403c4fb5536a2effe2e91181dd73a2cff91b
+LIBFTDI1_VERSION = v1.6rc1-2-g92d657bcb543a9622947d984d4a8e725fb680e8c
 LIBFTDI1_SITE = git://developer.intra2net.com/libftdi
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
