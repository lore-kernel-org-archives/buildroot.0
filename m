Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A5EC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 10:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC4181E1B;
	Mon, 27 Feb 2023 10:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC4181E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qq-yodQ9lx5l; Mon, 27 Feb 2023 10:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7421881E17;
	Mon, 27 Feb 2023 10:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7421881E17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA941BF25F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18076410B1
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18076410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gT87yBFC5mh for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 10:40:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6DBE40977
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6DBE40977
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 10:40:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id az36so3931508wmb.1
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 02:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pndoObDs60jdvkW70d4FUP2PDQVPqA3KQR+emeoHNLE=;
 b=kmUEWe9Z8vIEg6rDXXokU54WAvbPX7m9/bTYhrgoNT7Esla4UzyXpRqvpXZeEYhiQ1
 umtDfgCoriVivZ7+GZDzTKctoc2AeVV3obajKvWLsKw0SI+BXabidR6ulmcL2FQBtXKb
 AtxqeJuthdR73hFGflJiG65Dm9NNoKWL/G7aq6Bw43qBwE23JeYz6Xy3V3zxmdKpYQF6
 XpPAr09CqPf6ropGAC3riUsIz6XAF8S1++HETrtYSZLUFRYPuRD8Pa+n2I5mnKxKg/4B
 U2C1m1BpYbwxyAYrFroY0fnn0tx/k8nkVPjy9FXo1Q0HGKg/lXTEX5vspwEKSXUgc9G/
 Y8Vw==
X-Gm-Message-State: AO0yUKV6CBitww6yY2vFzc6izdIHOHwJ1jcyEgdESK9Wu5GZV0vRnGzc
 o4KEaajQECM1GbasYER/c6xQ6UDEen49gw+d
X-Google-Smtp-Source: AK7set8qllJXgfo91Igve2fiv9Mo/UIFRHTh7fnR3tAZZ/Fncw3AyKihOOs7AEtbt8o6QzBpM7C8HA==
X-Received: by 2002:a1c:4c14:0:b0:3de:1d31:1042 with SMTP id
 z20-20020a1c4c14000000b003de1d311042mr20746865wmf.23.1677494406118; 
 Mon, 27 Feb 2023 02:40:06 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 fm26-20020a05600c0c1a00b003e6dcd562a6sm8964937wmb.28.2023.02.27.02.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:40:05 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 11:39:55 +0100
Message-Id: <20230227103956.128236-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227103956.128236-1-thomas.devoogdt@barco.com>
References: <20230224111509.2434694-3-thomas.devoogdt@barco.com>
 <20230227103956.128236-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pndoObDs60jdvkW70d4FUP2PDQVPqA3KQR+emeoHNLE=;
 b=inbu0x8lo3/mYqHM12nsS6g2RfTZGPuLa1Zrab/g7O5qqlJU1ItBnIYTkqLQ4bCBI4
 WWwceCSaH/37GXE2dcMPEQuEXwEvK7At3KvNCGQkU9fDt6qWq2pOFNCXipFWzxcDk9Oa
 JHFdP7UXK7FLGpy+L3MuaHSjk8OII+4RypJTvXiMUFg+1S4PcvW3/iBW1Thpd54/dfOo
 LqSYC6g3lQdzd8whGQXvCKrLwX5IaHad2kk9vYUqpiDq8oziQwL7aDu2u8V276aRoAtS
 U8e5BNfCW7zFsXGvRQo57OVYvCEysGj8PHjPiX59o6yG3s6kAVOagIJABE1AGynslh76
 HgMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=inbu0x8l
Subject: [Buildroot] [PATCH v2 2/3] package/webkitgtk: use the CMAKE_NINJA
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
