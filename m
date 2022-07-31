Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DD8C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33517417B3;
	Sun, 31 Jul 2022 19:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33517417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zc01eOuvHNhK; Sun, 31 Jul 2022 19:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F96414E6;
	Sun, 31 Jul 2022 19:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F96414E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2E491BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBDF9414E6
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBDF9414E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SO9d1mosRq7p for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0AC414E4
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA0AC414E4
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:09 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id x184so1748528vka.11
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8GhCteqj7ssn86LDST0PXBbD2y9827o3MTyeENMnid4=;
 b=aztrID9D4myHu+coXhxlj+mVqkRIVVQOqUBhn3gFae2VqraxbbV+bh+vU+0xoQSYzf
 7bM/1GoUCGw4v31Qym4RPe5q+Up/CdLYewHQqGlpaCFKyMfl5yIlkap3ESdWpcEUMRNt
 4TQz2IbbwA6m8Q5rxEprx0FUlapYmelXWrXskWQfKrr/l0ZDId078qlZuXWilaO3Hh7o
 BQ/OdRxc8QVK2QwyB6teFdEFvZJJckGAXxiSk3qHQk3d0RYDa1GRr9mGYLpSA4FoX+dV
 ohhCCymFwSiPCv7MGsml8fVkRqLIwX8pMKu0W/C21/wOd4l7D5Dju6v/lEndHGU8bNo2
 w9cA==
X-Gm-Message-State: AJIora/OdZN5ShvVmXKPDjiZFnzVNIkFc616a7mK7XsbXAGjaKZfQZky
 iGdjLAthBi0UKw3kuY79vRdiiCtu7m0=
X-Google-Smtp-Source: AGRyM1vxb3YTtMEhgX2nfX7OMnzZTl5ev4PxqP2Z5bdmzmVlCKSNHtW3vLdnIkwYeR6cUWeM66NmxQ==
X-Received: by 2002:a1f:ae03:0:b0:377:99f:b6a6 with SMTP id
 x3-20020a1fae03000000b00377099fb6a6mr4245518vke.4.1659296168773; 
 Sun, 31 Jul 2022 12:36:08 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:07 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:15 -0300
Message-Id: <20220731193521.1217825-9-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8GhCteqj7ssn86LDST0PXBbD2y9827o3MTyeENMnid4=;
 b=faf6fD6Ohi2GDeuCMepNHEJLEC6gY276M12vfkblQ+bdtYpI/+gEb0LL8uUp7lB71K
 pbNBQq++ikXQ607ofJD///0D29pxG5AuqAeXguKyCAQCVpQCxkhPSem2hooiKj9yNFRU
 Y5jj1KX2tR33JO3g1m7Fiklxzphl0zX2X+UHumwaB/B3qU/yR9JgmYwZvExlDNWezNcB
 35Nk7axSNURNhC1C8i3qRHKtD5HOG8+8CDMJ5z221wwF8oQqJK1oMipJCZEVXFLwa/Hx
 y2dO4C2K9Ovd+k3NlRZWcof0+IJmaaEF12PbDgmDGEaZ2U8UZAoCIOA/IKRovkrQsDuI
 VReg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=faf6fD6O
Subject: [Buildroot] [PATCH v2 08/14] utils/check-package: check files in
 utils/
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - none

NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ utils/docker-run make .checkpackageignore
---
 .checkpackageignore | 4 ++++
 utils/check-package | 1 +
 2 files changed, 5 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index a527254464..615fe22e52 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -203,3 +203,7 @@ package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch Sob
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
 package/xl2tp/xl2tpd TrailingSpace
+utils/brmake Shellcheck
+utils/config Shellcheck
+utils/docker-run Shellcheck
+utils/test-pkg Shellcheck
diff --git a/utils/check-package b/utils/check-package
index 732f1cf112..094b7b9c07 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -107,6 +107,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
     r"package/",
     r"system/",
     r"toolchain/",
+    r"utils/",
     ]))
 DO_NOT_CHECK_INTREE = re.compile(r"|".join([
     r"boot/barebox/barebox\.mk$",
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
