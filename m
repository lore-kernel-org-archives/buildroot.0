Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF0CC433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 21:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F333B8127F;
	Sun,  9 Oct 2022 21:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F333B8127F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id diVV8UnlYH8p; Sun,  9 Oct 2022 21:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 312A080850;
	Sun,  9 Oct 2022 21:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 312A080850
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BF891BF376
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30BCB403D6
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30BCB403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TeIgnEveD2Jt for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 21:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D6F403AA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08D6F403AA
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 21:58:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j7so14557216wrr.3
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 14:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x1bEurBppDIckUA7z2owEgllKuFXzobbgwF4pprh/Fo=;
 b=du90cxO+BbXF++3B9aa4oMJzUutckh4hDi0PAZ2DaV6ixYzJkSou6AU1lYk3MauH1c
 Ugq7mYvmotjebxS/fRai+USmjDW6bX+HiYi195SyMBWYOUnApC5f/FV954wKgXypn2Pe
 d6xGHeEXlmNjVdc0+XkkHs4BP7El73zJ6NpGvEywkl1yixUVaOxe6IKVyKduqR46w7VY
 5dxsPTECHqa2aBvA8FAL+obNu/EVwVYgmp6CLQfDzjKlSFnDWK5w5QG6QeDefd1/QnIc
 d0PbcwRd0tGJdiVXz8PK1Gb0oBMYnnx+DnbzZuOBArlsN8eKzWgGr5GwWQuBTdCffOUq
 TuYA==
X-Gm-Message-State: ACrzQf3AAlYUbSvGPpfQHu1xyxI028GnDY0ld2+WZZeZYWARKbs3oOwI
 0KCV/VboFCc4sM88scfqyS8sc9XOKMs=
X-Google-Smtp-Source: AMsMyM4BTa9l9tzVbs4jFugzzo2eHN/n7sbB7CoWrhOedwH45Y+6cqq4U63NGLd+cMnp1invMLffWQ==
X-Received: by 2002:adf:fac7:0:b0:22e:4773:23a9 with SMTP id
 a7-20020adffac7000000b0022e477323a9mr9786358wrs.537.1665352683807; 
 Sun, 09 Oct 2022 14:58:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g10-20020a5d46ca000000b0022eafed36ebsm6763396wrs.73.2022.10.09.14.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 14:58:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 23:58:01 +0200
Message-Id: <20221009215801.227838-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x1bEurBppDIckUA7z2owEgllKuFXzobbgwF4pprh/Fo=;
 b=Dm/ZDEeqk3IWnRb+IRh1ffdxVjxAs4LNDoFdixUn2v5tBRlWjjqiaD1JZonHntjMLf
 5Ef+043rZ+bo17fRzxuwKCvAWrhwSRM53vilKwcILePTDT+drlWn/sijtcJy3Yd5vFzi
 ErIW+xk8E5uQpjY0O60+bmFuhlRwEnBbew1K9Tg9AIfPHNCAXEIkmzAqveKRomkRREjV
 ILzsMeOfBuOdvwLIN0iW0d8HkcWfS5bQ6GYUtKBlDg5AwgvWGxwWlppH9kIAmuu5i7S9
 Mf789VA95Gqm2PR177GO/fb7TFiHWwnILD9W/VmJHHQj2iCvmsokUGlpVCAiXTougEct
 YdVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Dm/ZDEeq
Subject: [Buildroot] [PATCH 1/1] package/gmrender-resurrect: bump to version
 0.1
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
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gmrender-resurrect uses threads since
https://github.com/hzeller/gmrender-resurrect/commit/8871dfd2490f04e319ce6465fd2a7a8b2c78a6de

https://github.com/hzeller/gmrender-resurrect/compare/v0.0.9...v0.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gmrender-resurrect/Config.in               | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.hash | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
index db655ad7f4..de52410a73 100644
--- a/package/gmrender-resurrect/Config.in
+++ b/package/gmrender-resurrect/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GMRENDER_RESURRECT
 	bool "gmrender-resurrect"
 	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2, libupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only
diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
index 526b2b6c34..f14abffc3b 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.hash
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3a9c80c7058a9a1f32175da25a564fb3021a7055c2df3941e8da8860a509009  gmrender-resurrect-0.0.9.tar.gz
+sha256  550b07bc6a073176ad7de0efd603663c9875311dfb81ae1075263e3fd6974335  gmrender-resurrect-0.1.tar.gz
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 4a7efd71ab..77ac83ca41 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMRENDER_RESURRECT_VERSION = 0.0.9
+GMRENDER_RESURRECT_VERSION = 0.1
 GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,v$(GMRENDER_RESURRECT_VERSION))
 # Original distribution does not have default configure,
 # so we need to autoreconf:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
