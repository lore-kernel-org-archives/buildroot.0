Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F557C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D052A40B4F;
	Thu, 24 Sep 2026 18:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1rtM37yU_MQ; Thu, 24 Sep 2026 18:57:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C438640B18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276223;
	b=cAYHYyuzWXf4oG2PXpStarqELvZjizSSmS3lrq/ugYaQbPoKmoMgpXiecuVJP78nriCe
	 7PdeyjksyYVZoLSOryc1kfZ3TOdnbR5v4mrjvKq6+A4TlEshg5C++3jQUbB8J/1J/H63m
	 sL/aM36AW06TSs5ChNfOiiOj659rEtjnk8lv6eEcBnDJTCAHHHE+jhHiOUBb5E+g/jMjq
	 vxxWXhnKvEiAaxJx8tKBAZVEKv5P1YxZCFhp4G/iTe4KDaIXqnEHxmFkDKr5SLODZu95g
	 EBk3LDdMnDztiJQNmCNRYGBSGkdJv59KzBdNkoQZJgobQXPEhWDMdIr6OO4Ugi0h85w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7s1rWbdUbH7uURDwzwP0/X4R1QEUB9QEFT8A3LyNppI=;
	b=OPTc5DnbovGGeNoyfArDAxSk3+AjOAwQ8kx1ftDktgobLnkOJD/c6xE1kYUNVgJn2vWH
	 bmvvQuioPjCs8pQP0zVuFLz2XxeAxsUGsyvr2kLCLg1sujQyR6E3dt0jDBc9UH5XxjLx3
	 sMJkZy+A5ScRjIYrWyXVVIT6RUD06M77tkJHg+j3h6svcijnOPlyhuww5LTqb0oRCCguU
	 zYOnH7Tg+skN80eTSN0rnJHIOHAi+Sz71BcdXcvWUvge1RNhV/lnyPPz4RhhiqsSjMtip
	 hqNfwg5gSt9ZFog56hbpbBP0kmrDK0pQJrj98KSTboyjWashTy+e60/gYKuqJxSFKBg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276223;
	bh=7s1rWbdUbH7uURDwzwP0/X4R1QEUB9QEFT8A3LyNppI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VGRjAbyw7eRgk/D+3JX1PqOK7Q15N6rNW5kh/NnDU25DNPAGqCiDXQYH89iysaVhQ
	 wiKk44nY8t4BWOzYYMDeFMCRceyz/R9ejKHXeBImpYkmhcka4S5VW4swA27KLcFOYH
	 glZ8JWgcCTghkHDsy9CFHj7GELJ5a/IKxjDj8/YWPZ7yxfqWiN4y/+Xw+Z0Doy8R7G
	 UHXiXt0X7aAHcZhz6otA1hUAQESx8zUOFiD6iUMwEkYDNtAK+sbARYYWkgsxMzqzrK
	 qQvBZZ6Xmh8F1y1YAdsJxWXnXoFPiJ60sOH3KNdH5GBvZVjqQLMeXY5r/vtoHwj0EU
	 MEloVpKoysfGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C438640B18;
	Thu, 24 Sep 2026 18:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED29417
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EFAC40AD5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcP6HbqFAz78 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 535B240ABB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=FOZ16jHwEslqW5LFgS4m8H4idR4mmL64+jW6+1Q3L5txg0x2EaPzpCBYslvwfl5wdXiN
 gvY48z4dvlbX8JkbP+6iphPqPWJqYtmVG2ykJcbPKuD5hlBQ42c5TKBVAoySxVoZ6sP95
 yG30sNoVDu9i/Md0SBYcUfy4DwRMe7JQJQ/tsdhKkD8gB6iWmAW/3R16tkBz28iD426dD
 /bMMOWeuqlJglSHVJIvSIJTMC1P0Pz4dbdq/DU9c0wUToIOkDzs+sQyNKu4TMtH/VFtZY
 7UWXgvQug7eKhe3wUOReYq4Jw1V9AvX8ODjPbaBZZ3UxjcpQth8tKvATludKTcxHqjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ACXwfB/X9HIyM/EVBn9hhgVKN9quTML8cIJ5y1b29TY=;
 b=po6z6nlLra8BYqeni4ri2Snl2xlqvKt1lR/vzGsYqEUONIfexcVqy6eYbnu4TVPi3IPe
 ASH+O0reuCFbrIC2C+qflUhZm3ITP0hh5gcIHcb5N73Nz2l6PiaTfNTPTTRNa3f07E32Q
 5phwodfgyme2X1WreT/ESazs2iJ/sCx+RIitEkkAEltoRjsOWdSc6agmEbZVVNUOtL2Ao
 Nk/DAg7BCgMmcKUL0LUO/TJo+kPS5rADKwc0Mw9MOrz5G1mkRjA+VXmIg+N14Y/tVIjcd
 4Gdlg5F95lWfgX8NsA+F2ZvR2wDJ8ENzxgnrRtFpYmdv2FRgslhdEzyrrpQvzB7TrYQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 535B240ABB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB75598383; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9d2c262030be7eb7d402a389fe8e81832754cab0
X-Git-Newrev: 74de5034238b8271dd9143f7894097f5f3e26c0f
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.EB75598383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/rpi-rgb-led-matrix: propagate BR2_PACKAGE_GRAPHICSMAGICK dependency
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6607184719732657645=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6607184719732657645==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74de5034238b8271dd9143f7894097f5f3e26c0f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER selects
BR2_PACKAGE_GRAPHICSMAGICK, but did not propagate its BR2_USE_MMU
dependency. This issue exists since the package was introduced in
commit e821078031e14df69e5142f23e9cb7b5a1ea0e77.

It fixes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GRAPHICSMAGICK
  Depends on [n]: BR2_USE_MMU [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER [=y] && BR2_PACKAGE_RPI_RGB_LED_MATRIX [=y]

which occurs when you configure an ARM noMMU FDPIC toolchain (because
we have noMMU, but shared libraries, so rpi-rgb-led-matrix can be
enabled).

Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e67b301f53ebe6838c92203856792e6953a19f1f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rpi-rgb-led-matrix/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
index ca945a92af..5088af3bf1 100644
--- a/package/rpi-rgb-led-matrix/Config.in
+++ b/package/rpi-rgb-led-matrix/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_RPI_RGB_LED_MATRIX
 
 config BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER
 	bool "Build led-image-viewer"
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_GRAPHICSMAGICK
 	help
 	  The image viewer reads all kinds of image formats,

--===============6607184719732657645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6607184719732657645==--
