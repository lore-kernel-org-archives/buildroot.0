Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93054C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 346ED61760;
	Wed, 22 Feb 2023 22:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 346ED61760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6IZu3UJgASZ; Wed, 22 Feb 2023 22:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64CDC613B6;
	Wed, 22 Feb 2023 22:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64CDC613B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 866E01BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60E2761381
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E2761381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Va9DbF0fLQjp for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:31:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DCE5612DC
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DCE5612DC
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:31:06 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id ne1so9895420qvb.9
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EoSxMmCs7qU8PeYW+nJGy3b/049yB0iwMTUOv5Qglo=;
 b=4aRtpXP0bzkQtozzRFcZ6wXiToQOuI8ZW9yzzwgSmm1LrzjjKm67bsFqmUmfPCt8zB
 nFRspdYAdEg2POMTTtvMOh62T/X8P0zUHJ0mLlqypi9yQ2ti4vfCa+m5gNnrVJjVo/1v
 4xGVIzFmL0IZvhzBoVkxX4B1jVBkCB612ZIhLwxDfyFtBUJ1MkQuScE1cdq1chKsD1OZ
 5W1qWe+9Y33qJYRfP187aD1Nc1hZkDo9jn+8AJORnGge40gztLnwHki8Boon9LHJOWjs
 dfs0viaOjnXEclHRW5z1pRGkwlB9iCut5oMYbd50zBb2DtFSxg7b6cwghmnO7IHK4xUp
 EcNw==
X-Gm-Message-State: AO0yUKVWZi5glTQMqLlM2X/oSDVr+een19ZJ/YQ5KCbVi6gbD6M5ivHt
 mx93vXH6CoB1nFyOBehhc+8I4rwCfIY=
X-Google-Smtp-Source: AK7set98GVCHPDMlG6pmx7pXkPhkHte51+78RUCp4nyLkcdzIAxD2XEb+Tn5O9ax/PkIAWXjj/UH2w==
X-Received: by 2002:a05:6214:2a86:b0:56e:f4e0:a4e9 with SMTP id
 jr6-20020a0562142a8600b0056ef4e0a4e9mr16320327qvb.29.1677105064903; 
 Wed, 22 Feb 2023 14:31:04 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a3768c8000000b0073b4d8cb4a5sm3538837qkc.60.2023.02.22.14.31.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Feb 2023 14:31:04 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 14:30:52 -0800
Message-Id: <70c8c0b4e34438c96257697086ff8b62fb6f2cd7.1677104777.git.ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1677104777.git.ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
 <cover.1677104777.git.ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EoSxMmCs7qU8PeYW+nJGy3b/049yB0iwMTUOv5Qglo=;
 b=ki+5jgZMF6OTxy5gLzSSgNhzNTxvjN+vvVIbpBakOs3gASXcLPXajWRPvfanRDg20N
 U4f0k1hxr5VU1NlNNHVJnrVQEvFCSQMwLvSRjEU1FVJiIwg6Wan/37TrSr/Yi22mcT0S
 9YTxmrFrq54cEqTyS0/KjOqhVZHcK40fJ2etHm+d6F4gdVKc4G/q1/xj0SC8NAZEe2aj
 lZhTLZgpkWdiPES22gy9oRso9envAY7lTHw6THOmDaYwE7il5reA/1PAfezYhImmHHC2
 IChV79IVPDCEPMA7Vm2OiiyXkY8Uk2O5MCQsoPd48wVIV64N2OcTYwL1aUXpgkitcuyi
 u7LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ki+5jgZM
Subject: [Buildroot] [PATCH v2 2/3] boot/uboot: add a scmversion rsync hook
 when overriding srcdir
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During development the override srcdir is often used with a local
git repo and branch. To help track the builds used in those flows
it is useful to have the scm version available as part of the info.
With this hook, the auto generated version include will include the
example.

    #define PLAIN_VERSION "2018.03-01358-gbda75d6a8b"
    #define U_BOOT_VERSION "U-Boot " PLAIN_VERSION

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 boot/uboot/uboot.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..edb6c646c7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -28,18 +28,30 @@ UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
+UBOOT_SCMVERSION = YES
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = hg
+UBOOT_SCMVERSION = YES
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_SVN),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = svn
+UBOOT_SCMVERSION = YES
 else
 # Handle stable official U-Boot versions
 UBOOT_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
+ifneq ($(UBOOT_OVERRIDE_SRCDIR),)
+define UBOOT_SCMVERSION_HOOK
+	$(TOPDIR)/support/download/scmversion \
+		$(abspath $(UBOOT_OVERRIDE_SRCDIR)) $(@D)/.scmversion
+endef
+
+UBOOT_POST_RSYNC_HOOKS += UBOOT_SCMVERSION_HOOK
+endif
+
 ifeq ($(BR2_TARGET_UBOOT)$(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
