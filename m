Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C47C0015E
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 07:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21BF818E6;
	Wed,  5 Jul 2023 07:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D21BF818E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1wqH1Lmx3FL; Wed,  5 Jul 2023 07:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B8581761;
	Wed,  5 Jul 2023 07:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B8581761
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A71541BF330
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 07:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DA1C4021C
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 07:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DA1C4021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-o7RuN73lfA for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 07:16:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E545E400D9
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E545E400D9
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 07:16:46 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-635de6776bdso45840436d6.2
 for <buildroot@buildroot.org>; Wed, 05 Jul 2023 00:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688541405; x=1691133405;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yzcyi8gRHB2cBFp7ZfL65I4TXheWB1DzIHKwASomNXo=;
 b=GhDm/jdZPteOivjgH3/oDgAZtYTA7CkfPf8a/fpNAu+rPvUlEB4j/qhrrZNUC9PfML
 iMskXMgDSTaVY9RWsAtAFITCkLG4VP7SwatyqJW9M763QUyCBaC1vwJ6anVlTMfcCaeb
 /mlu+cJYHiARO21oYNA13c9Xy9MCwUZtC/qy5127Iuet/Xdk2t+SA+EPgAuBNc/zXO5D
 MWdIp/sbXN/LW8ZC7ToPeDunsTsnQ+3WiT00AC0XnZhh9hOWuhRkXdXzxUqv4JgwCD/S
 dKMIBOLYtor0HfISlPbDpgEOIddvT2d7ImS+fMS8ocC1dzrvaAcuewblcWmOXQ35OLVF
 zZhQ==
X-Gm-Message-State: ABy/qLaIPcGUKwJ+ER+pfcIWqSflaScIhuhkbQhjyTpV5Olqafi02A4j
 t9sriq4BZu0wXUqF9MLrQbuZPlOVUQqHZ6dE3zAHJGXhBDk=
X-Google-Smtp-Source: APBJJlHXSkw2KeRtwksxtPujjh0GsxN0dKL8OW6cUDdnOOlSJoRAL553Bsk1k73DiTfyf5E0XcMDoDxQyfXY/eKWIxk=
X-Received: by 2002:a0c:efc8:0:b0:628:731d:7aad with SMTP id
 a8-20020a0cefc8000000b00628731d7aadmr16008030qvt.37.1688541405430; Wed, 05
 Jul 2023 00:16:45 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Wed, 5 Jul 2023 17:16:34 +1000
Message-ID: <CAEg67GmsMwVm0Hh23EjdR_SmRpbz_51MBGgjjn2WGkv3jjncXg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688541405; x=1691133405;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yzcyi8gRHB2cBFp7ZfL65I4TXheWB1DzIHKwASomNXo=;
 b=QIckBr4d0ZG42lJ8Yy3SDsducgHT2cAUfFsWIM892G2ZZGiVXoBVZ/jpd8PIulxu0R
 GQ5R9RwF4elv7XGtOuTsjxs+s6jFN7puSxYp8Eyfw3wMk0CdR3ANFPdnAUHOc7PJNBDi
 wvzTKqJWzjjnYRUAn1htXLKdFNehFslTlxoV73Bxh8Eadnh6eey9q3FT3YK7Xex8mFRF
 0MeSMf8f7qv3iJhikXO5qD5DhAnvNPt0533jhY1Km5MdmZhlDEVjqUbGKeXPVpkVaprj
 s5KagaIfLqxYlmMtL8YfbC2EauklsQkC1H4k7flXLuKDha1qq8HSv6VT9Ql/mxeR/8lb
 /mNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QIckBr4d
Subject: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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

This is duplicated from the U-Boot makefile & Kconfig.

Similarly to U-Boot custom boards sometimes need to adjust the U-Boot
devicetree. For example, the AM64x SDRAM controller supports inline ECC
which needs to be enabled in the R5 loader devicetree.

Please note that some versions of U-Boot have broken external devicetree
support and may require manual patching to build. See commit
3609e1dc5f4d4c238dcd23e045ba6223310feffa in the U-Boot tree.

Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
---
 boot/ti-k3-r5-loader/Config.in          | 10 ++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 2419babe70..580abf59ec 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -92,3 +92,13 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
  Path to the TI K3 R5 Loader configuration file.

 endif
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH
+ string "Device Tree Source file paths"
+ help
+ Space-separated list of paths to device tree source files
+ that will be copied to arch/ARCH/dts/ before starting the
+ build.
+
+ To use this device tree source file, the TI K3 R5 Loader
+ configuration file must refer to it.
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 8311e1b401..012f4ee52d 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -77,7 +77,12 @@ TI_K3_R5_LOADER_MAKE_OPTS +=
TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
 endif
 endif

+TI_K3_R5_LOADER_CUSTOM_DTS_PATH = $(call
qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH))
+
 define TI_K3_R5_LOADER_BUILD_CMDS
+ $(if $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH),
+ cp -f $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH) $(@D)/arch/arm/dts/
+ )
  $(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D)
$(TI_K3_R5_LOADER_MAKE_OPTS)
 endef

-- 
2.41.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
