Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7E1C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 13:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49F8660AEE;
	Thu,  8 Dec 2022 13:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49F8660AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rf5ENxR9cNbR; Thu,  8 Dec 2022 13:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B1960812;
	Thu,  8 Dec 2022 13:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B1960812
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 575691BF3EB
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 13:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BB2E40249
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 13:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB2E40249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47eJhyOYFnCT for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 13:39:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3523402BE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3523402BE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 13:39:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso3351011wme.5
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 05:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1eilbjUM2TdaSXw+ymNBwbH7Wxu7y8LYx2UHP51TmlQ=;
 b=T4fSVEtgg/15iCD9UceADJhy+OzKbCXuT/cn0qtgvvo1+q1qv6atWEcFdLViezp+3E
 b11/hAVCNiuavXINB2+shvraxCEkJp0lDDLUNI1Z/wnUXNlYxcTZGWDazDTzzyiROWJg
 ZGj4Px3aATeVYUGD2KyLcWQtEgGCzb85r28L92pmX+o16SiQmPKnA7kbcDGHNURgu6zv
 je4YZI2Lf0JvNYai0B4geWKRuZJt9CaRGJOrOFSmwYrdDnhfNMiD6jlSZ/BNCkNaVJLE
 SEjvRvYZQxTTAmY6YZEXkEj34crguZV8k72zAl9lkjv+Om+fqdBrkxv5DVU/Sk8fKbx6
 UQ0Q==
X-Gm-Message-State: ANoB5plkeEW54OwaL2XLp/CLh0hIn0XfZX3/B8a10NQZLdZIeEbiyN9V
 Dc+albeq4CgVWSMmlfy5ue30HDtYvFYinQ==
X-Google-Smtp-Source: AA0mqf6/pxHZVkGhes9AkoA+kisPvRnl4qr+WfYHIkGydmzauw9/Hezbok5Dq5Gy/wdHM6dx951j2w==
X-Received: by 2002:a05:600c:3501:b0:3c6:e63d:b898 with SMTP id
 h1-20020a05600c350100b003c6e63db898mr2055172wmq.7.1670506792246; 
 Thu, 08 Dec 2022 05:39:52 -0800 (PST)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b003b4fe03c881sm5695682wmg.48.2022.12.08.05.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 05:39:51 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 14:39:30 +0100
Message-Id: <20221208133928.303101-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221208133928.303101-1-heiko.thiery@gmail.com>
References: <20221208133928.303101-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eilbjUM2TdaSXw+ymNBwbH7Wxu7y8LYx2UHP51TmlQ=;
 b=kd8eFr/yCnWgahat7br9ki/Bh8edYL3+AX28bJQskxCM9ojWsBlEJrq0Zq7yv1+i0n
 7W+N/cGz2VMp3+EhHf1jaah0HEidIJi7baDBzgoVRJu31xHIIYx4pZ4f9gne6LeIYbuH
 BZPZ38QftUTvE6LxI1bhP3uVsXdv6fEQ1HtCNhHDGyspuKH7OwLQ09y/PxvL8C4z8elC
 c2CYotGLwiX4Iir0NryZ2z7toLWTRQoiMffXmkOu6YLNIeDoajxYTitRriswJGaW8QfB
 dY+6NdygrKakOw/MCIFvJmrE8pt98JYXpK/I9vy1SZsPEC9kq3T1vyWnSqv8HYReWHIV
 jK7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kd8eFr/y
Subject: [Buildroot] [PATCH v2 2/3] package/libqmi: bump version to 1.32.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2: change to stable version 1.32.2 (thanks to Aleksander)

 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index dee2a94d93..5036c1d3c0 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b2e0285690f94fe6d0cc3c422514117b187c8ddb90133c2900993e13343f5a5e  libqmi-1.30.8.tar.gz
+sha256  aec96bf2733a7b5ba27bb52346ce3a1ab54440800843f78001cc2a51213ce1b9  libqmi-1.32.2.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 6b7f45729e..c3db50a92c 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.8
+LIBQMI_VERSION = 1.32.2
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
