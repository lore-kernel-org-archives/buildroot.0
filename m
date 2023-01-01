Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAC9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 14:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B76813D7;
	Sun,  1 Jan 2023 14:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55B76813D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ICzFNeHs8XXv; Sun,  1 Jan 2023 14:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ADEA8137A;
	Sun,  1 Jan 2023 14:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ADEA8137A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0B3A1BF33C
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4580410D4
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4580410D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnZNgBOl1F_a for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 14:32:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A95F0410B5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A95F0410B5
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 14:32:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso8457465wmq.1
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 06:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHg4L2vBBxiAuUgVn01w5H5E53av6pT66+evP4K/8Os=;
 b=JafqOx+7YmA+dMXgNfdgPnwexJ7W0BOyTGDAP4t8ahQ/lIPzcKnVeitYirksEYlft5
 n3d9xhN64679enVJwA7ozePJOutIZ2OQ8ZhHGB1nz8/KB4Xr33/jzjvW8H0NU06MK/Ht
 SPGHTTd2F35kMj/zlEbw/FIZZc18giLZhR/A/ocRIVL64/XItFyUFS0/P/TcJTGK1r7t
 reNvYorudW+6WIEDZGARd/ACRqVLVmJsTsxhxKgKxTF70r7PP0jtvM9gVMj/TUE7CMO4
 KCaZwX05sbEyJN/N38T0S5WQhm4zeJDH5fwCccehqjaU5Fr5Ry8vYEfF5pbvro4o0MPY
 zuFA==
X-Gm-Message-State: AFqh2koZ2ntcw4dzz1Oh9Ac9vQ9wLBIchdCQIfRjHHmkLOSsyLZXwLnk
 i1yHs1SMwDEh4FggvtB5K3fU0L4ufpc=
X-Google-Smtp-Source: AMrXdXsajt4avJ2PsAQ1arzyBUp5TMHWCx3UEcPOLbUoeyaXCaREeqn4xnF2qjp0fIs1GN4cx3WISA==
X-Received: by 2002:a05:600c:1d89:b0:3d3:58cb:f6a6 with SMTP id
 p9-20020a05600c1d8900b003d358cbf6a6mr26687403wms.41.1672583553746; 
 Sun, 01 Jan 2023 06:32:33 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:80ae:a953:659b:4560])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c2d0700b003c6c3fb3cf6sm33841586wmf.18.2023.01.01.06.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 06:32:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 15:32:32 +0100
Message-Id: <20230101143232.187601-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=kHg4L2vBBxiAuUgVn01w5H5E53av6pT66+evP4K/8Os=;
 b=ow3nJWjbkwXaVNNPNjiUzOjcaTcjW6YINmz8tmCa5U0jEmSTlOJ6SEZxoQbG++b6B4
 fTth9Geiu5zwz3s9JcbPrO65eMLGAEJZO5v5h4/kMJDem4juRs9HNNfZTO9D+TLWsPbo
 /ZScGkYA/PvhaQt79QSfdw4t78jSv0eTUveLXhdIWxNiuEmS4/NjvmgmHry54SSYf3Jt
 7Jpi4+J9OPFCWd9HssRGSSVAsCLBhy42ifYQxEWPfPk/1pcYXSroPhIAXd6x+Z+aq4z6
 p/Rr2ogQBteAKGEb6NjVtF7TzbZvh5ClkcXlOhftzNU9u+lJ4Gxzvt7E3d8dvZi5dC/e
 WwDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ow3nJWjb
Subject: [Buildroot] [PATCH] package/qemu: add option to install blobs
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Binary blobs are BIOS of some sorts for the various machines emulated
by QEMU. There is no option to individually install blobs; it's an
all-or-nothing option.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 11 +++++++++++
 package/qemu/qemu.mk   |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2bbc6a14c0..f1631059c7 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -58,6 +58,17 @@ config BR2_PACKAGE_QEMU_SYSTEM
 
 if BR2_PACKAGE_QEMU_SYSTEM
 
+config BR2_PACKAGE_QEMU_BLOBS
+	bool "Install binary blobs"
+	default y
+	help
+	  Say 'y' here (the default) to install binary blobs (such as
+	  BIOS or firmwares for the different machines simulated by
+	  QEMU). Say 'n' to not install those blobs.
+
+	  Note: Some machines may be unbootable without those blobs.
+	  If unsure, say 'y'.
+
 config BR2_PACKAGE_QEMU_SLIRP
 	bool "Enable user mode networking (SLIRP)"
 	select BR2_PACKAGE_SLIRP
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5c7a8d504c..b38dde4308 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -246,6 +246,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_BLOBS),y)
+QEMU_OPTS += --enable-install-blobs
+else
+QEMU_OPTS += --disable-install-blobs
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
