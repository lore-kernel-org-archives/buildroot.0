Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF48C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 039BC81E12;
	Sat, 26 Nov 2022 18:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 039BC81E12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNAS_J5u3C81; Sat, 26 Nov 2022 18:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49AEC81E0D;
	Sat, 26 Nov 2022 18:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49AEC81E0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 902931BF356
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69C8B81E06
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C8B81E06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7G9wwwi-RWx for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:00:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86B3B81E0D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86B3B81E0D
 for <buildroot@busybox.net>; Sat, 26 Nov 2022 18:00:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o30so5671185wms.2
 for <buildroot@busybox.net>; Sat, 26 Nov 2022 10:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erztBVPvo0VbU7EdDkM385LIGkhDvJQdhxdu/bHfVGY=;
 b=twrLIWk+a68UcAPhDDGcM957zrjVEN8K8NDIRq3bUZZLV7boDc8P4kiYyuqSIHLiRh
 Mid99HCvVOVIfr9Z7Udxbn72hj5U3JJBuagq1kNlcOI2vjumAhCj/3UZ9ro7XTYMTmm6
 yl702wCeciJiPFfmoDySCDfjpo3Dhv8/aECi7pEFQ4H6OZ7xaZjsyb8YBrPkRVyUP/LX
 3/erxwdsYkLH4l6Q7b0hzhsEP/yWy35ShNiXelqk3Gs0iPti+4OobZ9R/0L9QzUmTNW1
 uA9e8Plv3MmPuhaFMfe1RW02AcMAG2mYDtt84tqCVOz3A0MNKgVVMCwiSe6zDL391fkW
 PVPQ==
X-Gm-Message-State: ANoB5pmma/cpvFIOrMPUNIzmEdVfShU6mb85+6Z2QOZmBOlF+TI21Ttp
 0eenadjya3oeb3KuphakliNXDjrZqT0=
X-Google-Smtp-Source: AA0mqf65RcK9C9GM4LvBqKUP7HGDuS5zLYcguJcmynROLg+Qp9qWSZQ4i4y6o/fKyCCkrSNiKgmVSA==
X-Received: by 2002:a05:600c:3d98:b0:3cf:e9a4:325f with SMTP id
 bi24-20020a05600c3d9800b003cfe9a4325fmr31919143wmb.98.1669485631719; 
 Sat, 26 Nov 2022 10:00:31 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d494c000000b00241b6d27ef1sm6360340wrs.104.2022.11.26.10.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 10:00:31 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 26 Nov 2022 19:00:16 +0100
Message-Id: <20221126180016.280061-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221126180016.280061-1-francois.perrad@gadz.org>
References: <20221126180016.280061-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erztBVPvo0VbU7EdDkM385LIGkhDvJQdhxdu/bHfVGY=;
 b=EvKviLrG/xsmKUJ2LkP711PW5hIRuqR4f5r7xqOPlgKBj3+xie5uiA4J6cK0rZbsQw
 6PDBHitUoQmuq4cqMg1Q3rPRW/CRIpz7SgmbBhHOmxMCaicE322r6trfKrufP9bv3JcK
 vbmmn6FBYWz/MMrqmZcMinYAyRHGw0ACPbDwSzH8Lmg48eR5+xRvn9PFL7TEoRdDf1rF
 pojyoncfNSQd0Eg1rr8+zwRkgPf9vad92wvZ84hqw3YjmjV8KsshPee2+LOfgCAL+R+H
 imCkwGfF7gxkEnKtV/tGtGcYbu3YWGJrGot6v/sgnsY7pxwbiJ7UCT+D5qSMGpeWLvEP
 8lDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EvKviLrG
Subject: [Buildroot] [PATCH 2/2] configs/olimex_stmp157: configure eth0 with
 DHCP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_stmp157_olinuxino_lime_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index 49670dbe4..60c34d7fa 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -8,6 +8,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="stmp1-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/olimex/stmp1_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
