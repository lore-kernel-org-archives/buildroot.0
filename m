Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8B4C61DA3
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 11:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D1060FCF;
	Fri, 24 Feb 2023 11:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D1060FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JohgYAPEvtzY; Fri, 24 Feb 2023 11:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5539060FD2;
	Fri, 24 Feb 2023 11:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5539060FD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 181B51BF36B
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6A0A81FB5
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A0A81FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsE8-8D1Xuze for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 11:15:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A7081FA4
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92A7081FA4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 11:15:20 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t15so13645289wrz.7
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 03:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pndoObDs60jdvkW70d4FUP2PDQVPqA3KQR+emeoHNLE=;
 b=roVbnz8rQlfilecaDMS6kxWOBLY/epwyG0Vwamnx92gwPr6z87iakGrPPrgerbLSTv
 ynPvUa+NWBONUCPhlLqHVgZt0j/4kHvcMnWszsNSpvbCED4xftSx3qi8Q85QiyqrSDk7
 Y/T4tG2V5xcGgg9GGQxHQUdYsdyD8JPpGa+sqKsscXuept0JvafjMwt+sssDLbR1fhV0
 apnDzzzEo/mEfPbYC5DES/0IeBXVTQ+lcfNuHiO4kx2yX5YmTyAfBFSha+5WQRB673tv
 fkmqI3j8PM0o28UofWGUgiTbPMkgn44ka0pbzjY6DOOwnxV4osuLBeghTVNmg448BsAE
 Nweg==
X-Gm-Message-State: AO0yUKV4kIXRPmYXLE2tnBwFxNfZWGiZoDvyKUVgDKKMv/5v3OC68IzK
 1RT7ehSj1sKtWMHUrqZ8EiuWQWrMX2RvRb+N
X-Google-Smtp-Source: AK7set/Ciw7MCAT9GMlhaaNpmGD2mpGZMcfovG3hJPB1syG5KCMNLDAdtwJFZbM1D1HFXqgz597oRw==
X-Received: by 2002:adf:fc46:0:b0:2c7:dec:77a8 with SMTP id
 e6-20020adffc46000000b002c70dec77a8mr6088602wrs.57.1677237318526; 
 Fri, 24 Feb 2023 03:15:18 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d6991000000b002c54911f50bsm13537960wru.84.2023.02.24.03.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:15:18 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 12:15:08 +0100
Message-Id: <20230224111509.2434694-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224111509.2434694-1-thomas.devoogdt@barco.com>
References: <20230224111509.2434694-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pndoObDs60jdvkW70d4FUP2PDQVPqA3KQR+emeoHNLE=;
 b=AJAujmWmF1a4nkjRZhYf0qgIp1bjbfSId/o81PyWteNma0z32fyYy/Vn4UkeD8GDLW
 PL90ULlZpFr5ApHtaHYMO5VOKr+NuRJ4Nkv3bteeZKoxAU6A3yCGEk5QrnWzO3F8D+Fr
 I7oZIc9Vs+81Ai2c4hJepEnfLZoGxg31fno+LmQb/dTA4mbbFCwXVcFIXe+bTjxwjYT7
 LOEHbmbOMpFlrMcDAlbFE7pjxK/is4cziiZDpYcrsvrfj7svQX7g3PNRCSl33isTzYd1
 Rk4N2VFU7xbxv3tyU6afXtsMPPPLJkoA/83zaPx7V4EGjep7WpWvGXFwtlpu3EXwJK8w
 anWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AJAujmWm
Subject: [Buildroot] [PATCH v1 2/3] package/webkitgtk: use the CMAKE_NINJA
 flag
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replaces:

commit 16e5c92ff5fd2b44a1126bd7d7538c68ce838213
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Thu Feb 9 18:07:05 2023 +0100

    package/webkitgtk: Build with ninja

    Webkitgtk needs cmake >= 3.20 when building with the make backend since
    webkitgtk 3.8.0.

    Cmake 3.20 is above our minimal version in
    support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
    with cmake >= 3.18 < 3.20 - So use the ninja backend instead.

    https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/webkitgtk.mk | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 3263f7fea0..b43f97f0ca 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -13,6 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
+WEBKITGTK_CMAKE_NINJA = YES
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
@@ -139,23 +140,4 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
-# webkitgtk needs cmake >= 3.20 when not building with ninja, which is
-# above our minimal version in
-# support/dependencies/check-host-cmake.mk, so use the ninja backend:
-# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
-WEBKITGTK_CONF_OPTS += -GNinja
-WEBKITGTK_DEPENDENCIES += host-ninja
-
-define WEBKITGTK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
-endef
-
-define WEBKITGTK_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
-endef
-
-define WEBKITGTK_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
