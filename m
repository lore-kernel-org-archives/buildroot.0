Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D11C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F97842EB4;
	Sat, 28 Oct 2023 20:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F97842EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LTG-B-702jw; Sat, 28 Oct 2023 20:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D56DE42EB0;
	Sat, 28 Oct 2023 20:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D56DE42EB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52DBA1BF426
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 377CB4183D
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 377CB4183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6vV8thlOsoj for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:14:19 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D599F41817
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D599F41817
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507c5249d55so4678851e87.3
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 13:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698524056; x=1699128856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7kkiXlB1Qh1j+pAs/03rAdUTQrTSMLcfQWrhyea/Pc=;
 b=fCZ/EHtJdlbgBAiElHopa/sInivcII5ncyKNdzm+shy4Lrvxlt5owSGnBO9s7B2oBC
 uRTm13556HjB/nmb9ECyVa41vyGtp0qMSyyys1ojZyW01FZ+0glGJvB0qdVZZwvRMH75
 FkPtAFHIDcY0Tz7t1PE6mPecZLHpuu5cWMvZxGWTbNXGG7IG5qoVAbCreFvr4p+mkeWv
 SzA+m/6aBJM+ThYLYP6PI1+cGJ0WH5qkYKoHIFfDCIkl3kl+poi3VnHcSsuOiZnWwKDX
 P1+UeiotaO7ygJyuznOmtcBTNSLDA8VX5pd6mmD0TZTmzP0ZPF+qG9ZTdVQA+Bl4ykK3
 KCvQ==
X-Gm-Message-State: AOJu0Yw5CuOg2cDapMRf/n3kiSPTbu8Fyc6wQtlTOLTK3lDZ9aQwEiZP
 OhnjouLBDpUhjYbkrahHvw9oDcwQ6kk=
X-Google-Smtp-Source: AGHT+IFw7qRRGNQASyHiXXmgs5+CBfXv5/BTtBwvj4fzwAh7DAeFj+Go64r7ejt0CShcRTJ24eZ7wg==
X-Received: by 2002:a05:6512:4845:b0:500:acf1:b432 with SMTP id
 ep5-20020a056512484500b00500acf1b432mr4759969lfb.63.1698524056088; 
 Sat, 28 Oct 2023 13:14:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s4-20020adff804000000b0032dbf32bd56sm4523599wrp.37.2023.10.28.13.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 13:14:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:14:13 +0200
Message-ID: <20231028201413.1160957-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698524056; x=1699128856; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x7kkiXlB1Qh1j+pAs/03rAdUTQrTSMLcfQWrhyea/Pc=;
 b=ToBTwD9AIlQXxiPdps2lU9VlWP4lP6X6HOAKcd9PZfXmxdTDCLtNHF5rtX0JyvEDv6
 Wanrq64f1l9vP86ozLNCKXQ5zHVsOBNRB5VuAu/I9PF3n/aFdhAvpYxBEmuhtdwDQrX1
 HJOMy8bKm5JCUxLIYzBTQeh0l3Snz7s3MXCAD39d1ZHkvRqJBStfn90LlNibF9W53k2O
 SP5p4YGq+ASvhnLnxAhK9+dNkcKpzqS5NfjLD8JOykxkWuxS60Zj7zyKIq3G5TeNywvP
 +OdIQbVq1RERz011ogMaHXWAjWRdweuhbrfmft3ppy8jK7bD+I+vz6Ry4dsPYrj2hVTr
 pebA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ToBTwD9A
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: security bump to
 version 1.8.7
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

Fix CVE-2023-43785, CVE-2023-43786 and CVE-2023-43787

https://lists.x.org/archives/xorg-announce/2023-October/003424.html
https://lists.x.org/archives/xorg-announce/2023-October/003426.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index f443d947a4..56fecee9ff 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-June/003407.html
-sha256  59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9  libX11-1.8.6.tar.xz
-sha512  b94a578003078a42cea43d80fae2c54a3aaa30f706088bb3546331e9abfc180131cafb37887117abcc5b6116992e299974981eef96ecfcf883cc8a1aba4d1ade  libX11-1.8.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003426.html
+sha256  05f267468e3c851ae2b5c830bcf74251a90f63f04dd7c709ca94dc155b7e99ee  libX11-1.8.7.tar.xz
+sha512  d53bfc18f38d339a6a695b09835b2ae96b323881678bfe7ddca697605e3bdf4102ff49cc3078880a6c55b5977fcdd0aadaf5429086132de3a5bda302f79a2fa6  libX11-1.8.7.tar.xz
 # Locally computed
 sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 75199f1a3d..920a5d9aed 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.6
+XLIB_LIBX11_VERSION = 1.8.7
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
