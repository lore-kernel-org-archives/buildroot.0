Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE757C4332F
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39971400E2;
	Mon, 11 Dec 2023 20:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39971400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0aD0NSCptHA6; Mon, 11 Dec 2023 20:59:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 259C3400F6;
	Mon, 11 Dec 2023 20:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 259C3400F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C54761BF41C
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 20:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D988822FE
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 20:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D988822FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14lVKDy4s7kv for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 20:58:57 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 416F3822B7
 for <buildroot@busybox.net>; Mon, 11 Dec 2023 20:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 416F3822B7
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bf4f97752so6346111e87.1
 for <buildroot@busybox.net>; Mon, 11 Dec 2023 12:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702328335; x=1702933135;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jqArRHgGN1uQdPY7teE/2rFUx5fRYkbmZkvHYmPAE1Q=;
 b=UdB2VOM/5qeW5PnJG62PFuz9XJMz15bClr7i3MaKK5f0GaUT5Lb46+IX1Xk2UYXvaA
 QYgq6mLTi1YgfeF0XiKY3ZiwXhuXEeflD1GVT1TUvnI7qx2oMHYipxV6Su6vEqj36H20
 xOJntCy8EnzM9CUeihn52AEry3Dn/CXp29CIp9Q7XGp72QWtfwmRfftdUEKZlB3W0ung
 JVon5CyPWUFxye5SDPUYxTZr7GN2HFfcP0di3uAHX8LASSjIccvjePNqxci7jZgacqDk
 RelXkAixwsKPISO4zT6UVpiOwlv9/VvZBYWclh/Ay7IqOIlxIHD5iiC5vAHNkpCK1COm
 2BtQ==
X-Gm-Message-State: AOJu0Yx8RqjFkicVi7ZUIx402y2oiMh1gMXqTZ8jTEkQ0Nufe7RTvLsc
 OOGeLaixkwIqqy+N4Qfp0lj+TVaVt9I=
X-Google-Smtp-Source: AGHT+IHsruZbCamy6a3qNoFnQOgsHDuyuphdKR4HCxhucNLqetcBTOXbE4CNWtJDZXRn0vvAXGhJIg==
X-Received: by 2002:ac2:505b:0:b0:50c:e98:1de9 with SMTP id
 a27-20020ac2505b000000b0050c0e981de9mr2253365lfm.132.1702328334705; 
 Mon, 11 Dec 2023 12:58:54 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 ts4-20020a170907c5c400b00a1cc1be1158sm5303777ejc.165.2023.12.11.12.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 12:58:54 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 11 Dec 2023 21:58:50 +0100
Message-Id: <20231211205850.19936-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702328335; x=1702933135; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jqArRHgGN1uQdPY7teE/2rFUx5fRYkbmZkvHYmPAE1Q=;
 b=X62MfwLJ9a142sLZ0Rwl8aGQDaUXXHMM2OOPjAx4drB+K9/2KG1KSiBKknzCNdcuRQ
 hX0KgYvBreB59kkFfjVNwS/uC7o34G7jr+z5kd0M0ZaN29DFGD2bP0H5So4v1zMub3pK
 PVUlkIFJDWP3P1bMYZryPPcRvUJoSse9mNL5Y2nyZn35XanQ/i+9RJemDmpAZW1BbNQx
 EHRgaQJBcaoh0eD5Yui8KmzsUrNmz968kSieQ6efqKUvgpkP2OhMjYykWdqG5ibo8FLv
 6yqmA+gOhsK4HUyY7KYNw9ZfhkeIrkTCNiyJTCH1JCG5jslYdhG6L5CXh8xWSHkVapyI
 3ZGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X62MfwLJ
Subject: [Buildroot] [PATCH] package/quickjs: bump to version 2023-12-09
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
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index b6f160800..916fb6e3a 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a45bface4c3379538dea8533878d694e289330488ea7028b105f72572fe7fe1a  quickjs-2021-03-27.tar.xz
+sha256  e8afe386f875d0e52310ea91aa48e2b0e04182e821f19147794e3e272f4c8d8c  quickjs-2023-12-09.tar.xz
 sha256  f41baf09eef895d468d18c23055d74f711e4b8b2641cef279b5d71285c07bfe8  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index ff3920910..091862635 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2021-03-27
+QUICKJS_VERSION = 2023-12-09
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
