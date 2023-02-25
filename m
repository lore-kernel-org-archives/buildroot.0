Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F559C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 23:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D70402C2;
	Sat, 25 Feb 2023 23:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D70402C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rkn-Jv4zjTwf; Sat, 25 Feb 2023 23:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93507402C5;
	Sat, 25 Feb 2023 23:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93507402C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7816F1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 23:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517C860AC4
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 23:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 517C860AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2-oBFXFdZIq for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 23:14:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CFCC60A91
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CFCC60A91
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 23:14:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id 6so2653477wrb.11
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 15:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dhfiFpowX22M81Soe5s1oVX1KayJ6QOjLIrY5TxIaPg=;
 b=21LnaqwP770ZXEz5gubEySev96ketDrirCK/3iWLfC4bC6H1aMmTw5B3nKqgAOvEUX
 6qLatig4n3odeJQWPugjkKi3jevKAcrYqNGd1s1NZ8rwdFd6MKziktRoPYCzddcVL9ol
 niYHPbvll46ldF9TNto9gaCcJAsWnkmY3TqkDE3yOn9orCxR+tv6DAB9OmX3OTe27pda
 TK+13zobLGc1qkmacGCGc0ildb5avg73WyYtwwr+f7O7nFbvTVIVTwMZG4VcucXS9ng6
 YMi/KUCL7wh2JPaEjOvNvS4rHCkz3KqeaezSnv6/VmLBnKE6gWh54k2tlfMiCsEWaQ8L
 rrCQ==
X-Gm-Message-State: AO0yUKX4bZFL0+cl1BK1PItintSJQlmuL2mMcgI8QE7slkfHzNEFJf8B
 I+Mh71WOugvTQUdNi6QE6C0sqqNBC14=
X-Google-Smtp-Source: AK7set+cA7z1F4pO88GYrPTx8rIQ/S1VnVMPYXCJC4iGOiXCQUKGkvT/iPYdYUjzdjzL4hC5+cp9Bg==
X-Received: by 2002:a5d:51c9:0:b0:2c5:5fe2:bcee with SMTP id
 n9-20020a5d51c9000000b002c55fe2bceemr16338411wrv.8.1677366864851; 
 Sat, 25 Feb 2023 15:14:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j12-20020a5d464c000000b002c71a32394dsm2902656wrs.64.2023.02.25.15.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 15:14:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 00:14:19 +0100
Message-Id: <20230225231419.22342-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dhfiFpowX22M81Soe5s1oVX1KayJ6QOjLIrY5TxIaPg=;
 b=NeK2inCepF+ZA/AZTjzvYUzYaFyMMbdMitiItrmtnVw7Fq5qW1ORyI9NqYbt0TaQH2
 fxAeOPDJS86jCEuy+H71/QQpdNB3LC2k/iVjA25NAXpMNhdh8ehng/z5dQ4k973iqmJ1
 U6pVILryHLyBlbREviqECPEVoKYWOJhqN80Ma81/mFDTrHDu/fdUu6VS0/gy9U04UQBV
 F8dZhjJvwilL13tZb6Adh/DYscDvqDGNO5qGJXDMK4r+nqzthU9PHvEVea2ne6rzzjh8
 Hj6KctIxIXkx2zjUb4GQ8+j+POeN6gVXdZ07LspaVvSTyHeCPgCsReIFwFXe/1In0YHX
 nmpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NeK2inCe
Subject: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: fix build without any
 bootstream
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

Fix the following build failure raised since the addition of the package
in commit 2a636d15217cd326b4546e7017538c7a9e9d399c:

sed -i 's,[^ *]power_prep.*;,\tpower_prep="/home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/power_prep/power_prep";,' /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/
sed: couldn't edit /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/: not a regular file

Fixes:
 - http://autobuild.buildroot.org/results/b4b26f6b02fd1991f46eba5db240e5050b96d333

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/mxs-bootlets/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index b3e392afa8..8f9334b610 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -1,6 +1,8 @@
 config BR2_TARGET_MXS_BOOTLETS
 	bool "mxs-bootlets"
 	depends on BR2_arm
+	depends on BR2_TARGET_BAREBOX || BR2_LINUX_KERNEL || \
+		BR2_TARGET_UBOOT
 	help
 	  Stage1 bootloaders for Freescale iMX23/iMX28 SoCs
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
