Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D454EC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 15:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67A9C400F9;
	Tue, 26 Dec 2023 15:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67A9C400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ja8hJsVZJLm4; Tue, 26 Dec 2023 15:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45F5D40289;
	Tue, 26 Dec 2023 15:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F5D40289
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DAAB1BF34D
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 037D08139E
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037D08139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mX0PTZoAgHt7 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 15:25:42 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE07181394
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 15:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE07181394
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d4ebcc207so31843355e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 07:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703604339; x=1704209139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSxiKaul+jF01n4E3OmVoWr1QTXAW0Pi0ZROaK1ily4=;
 b=beFVi/YRsY2YMCt5bjyQ7uiljezzvOUFfiwAaGbQUW7aNkhdJ8g2ByuWzkh6mIqgAz
 hVQUONuv42jlJSvJ6xtbpRsBLiCum6Ybh13GbfoRo11n3PyTyq8mdaBvfzEmcgH8u9fA
 UXhapn8v+zz0/Mp7s+6lk1wwKV5Z2/WLyQre6TBDYn5u64PhOOax5aWD8Uyxy/9tW9Bk
 /0iDVBXWyqm0M7+ZJgYaS0eZGvloc2+LJayonNmrK9HIy0iRO0r1r9xh8/pRUGgKoM+S
 NTRDmU3UEAilgT15f+kYyLKMNMgmh4jgWGJejTXgOMuDttyoOXIMZnep7VZoFtAUo3As
 MvhQ==
X-Gm-Message-State: AOJu0Ywm157lTDse0bPhbuSHw/kBpC1vylinKWwgTZVtAnltHFKjFUt7
 JMERoBFODFlMgLRv3GgdUcKtHxAftY0=
X-Google-Smtp-Source: AGHT+IGzuxtwZOVmy7vRxdrqN+T7MglrdF8PlNgF0AqZXa4s4LhOfS10fZEhUYZnjqwfgvncE98DYg==
X-Received: by 2002:a05:600c:34c9:b0:40d:598f:351f with SMTP id
 d9-20020a05600c34c900b0040d598f351fmr722010wmq.170.1703604338669; 
 Tue, 26 Dec 2023 07:25:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hn34-20020a05600ca3a200b0040d1bd0e716sm20720387wmb.9.2023.12.26.07.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 07:25:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 16:25:35 +0100
Message-ID: <20231226152535.519193-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703604339; x=1704209139; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uSxiKaul+jF01n4E3OmVoWr1QTXAW0Pi0ZROaK1ily4=;
 b=cnagYoWmZJYeUhX8ylw7BuNzSIa6nSjUQirtBtJu17IKNpOQSbUqqJIq9eBoldbId+
 hs3KpcF9QWfzTeaPWacbMXS479yBZIpYuFcdLw3rk9cW6KHO6dxJ3c9Q2bBzrQvwnXoM
 zDxesPO8uxBnSZoJKDV3NjsL5iv41YQ1SOK0fg0fI+I/ryqNa1g6z4RLSv5EZmNBoZEn
 ASq2lGZVpYoEbfo1w2tFR57TQR7ho6zVv1XwboNxG5kvrny8SRb18LJCpHI8MsqByLz1
 nE5yx9wxdfiE/eYkZGMistkY7jTkgJxf1opcLj+4Q+7XeJeoNUhU9zHIQkxGnxNfkFaI
 hFpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cnagYoWm
Subject: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.13
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A vulnerability in charon-tkm related to processing DH public values was
discovered in strongSwan that can result in a buffer overflow and
potentially remote code execution. All versions since 5.3.0 are
affected.

https://www.strongswan.org/blog/2023/11/20/strongswan-vulnerability-(cve-2023-41913).html
https://github.com/strongswan/strongswan/blob/5.9.13/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index de8f18747a..ed8cf0ae31 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.11.tar.bz2.md5
-md5  673e194cd256af77b46928179f2c81ad  strongswan-5.9.11.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.13.tar.bz2.md5
+md5  9ada6be0c89846fb7ded1787a17cfbb2  strongswan-5.9.13.tar.bz2
 # Calculated based on the hash above
-sha256  ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d  strongswan-5.9.11.tar.bz2
+sha256  56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55  strongswan-5.9.13.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 6058631696..36cb72f6be 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.11
+STRONGSWAN_VERSION = 5.9.13
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
