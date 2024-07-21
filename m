Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C29CC3DA70
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 07:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3BF440247;
	Sun, 21 Jul 2024 07:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80LS1hUoy84y; Sun, 21 Jul 2024 07:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85ED64040A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85ED64040A;
	Sun, 21 Jul 2024 07:03:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1532C1BF342
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D2D04040A
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KM1EcwaebOu for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 07:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B4B240247
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B4B240247
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B4B240247
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 07:03:13 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ef1c12ae23so9811831fa.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 00:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721545391; x=1722150191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JAaibL3WmP9msfwIgCDOLLzZT8RSEJRb5NgJa2H9Zlk=;
 b=nhYRX2y66LvCueXuIGhPM0gkyr3bdpiN/GNCrGzfKAfTfZyhO0iyd3T3OjItWOm4D0
 bavZVP0hwS6fpbVWSorZPJU4/CAWavjICl4t8V4B4ojAT/0wJEN6rX1IKUNBZW5PSLDe
 Xhg4lUGv6KVRpaYuBUd8SfXfE4d1XRfmIG0N+ZI8KeRJTtimxA09a0zigUCytHHDvXIZ
 bZ4GvEtoZckawmB5ybad0z0p893Brrn63kQXWWjCBVIDSfWiX3kTkNAQkAqfoixKHKh3
 fHa8L3ezGTAj1sJFh7v1v5IuexW6TSMLu+dueqTtvO+N0iOSCzvZMSjdslpBwr8bOjpW
 ybyg==
X-Gm-Message-State: AOJu0Yxea2o8at73+3DXdnR2aSc+E3hnJsloAQ3zBsGvEM3VyRyYKmF8
 MVf6xHCpzVEVARIWHTTAoBB1H3D2dXbpQPxZ59sfzD2PxBQMcquFFaRa5Q==
X-Google-Smtp-Source: AGHT+IHkN76NWQ7AwxP4ULzh2hHvblIHjTULR4dCxMcSUpYTXmVThr/Nxe9RW0ODvxMjHajcsj7T8g==
X-Received: by 2002:a2e:84ca:0:b0:2ec:2d75:509c with SMTP id
 38308e7fff4ca-2ef168649f8mr29458101fa.46.1721545390455; 
 Sun, 21 Jul 2024 00:03:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ceda0sm5304635f8f.87.2024.07.21.00.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 00:03:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 09:01:47 +0200
Message-ID: <20240721070147.54855-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721545391; x=1722150191; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JAaibL3WmP9msfwIgCDOLLzZT8RSEJRb5NgJa2H9Zlk=;
 b=MB54GlW8TU35AyHb61cUH3TcANxsLb6B4fPXoOGbuVfqG9bk0etabe08XmLmS7ChlU
 MyVCwUjUFP2VlqzAfok61OS5UmHqR9pum8SgmQi0qEslrJu3L02ormqveCkHFgKUM3TS
 fJoKsw7ltLONMWF8S0mO8jraBo9Qcm0N3nE0oQgsE9w5LdgF1DDiez+XNvQW4cssQpJA
 v8VHbAUU79K4DZr6imAOzwYyHbuVDw2F/LR5bbf5TrDZQjz1vIRPW51/QTWb21nRkCgM
 0fpPPvkykb7cCJn93/yZfcoc3vNyN8kMFzaG+h7bgeFIXIEhOmtd5XfUP1rJ8IXYc7YA
 tlTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MB54GlW8
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.10
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with gcc >= 14 thanks to
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=53a89bfd86fff1a00cc77cabb8457a03eaa3bc7d:

../include/json_print.h: In function 'print_tv':
../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
   58 |                                                value);                  \
      |                                                ^~~~~
      |                                                |
      |                                                const struct timeval *

Fixes:
 - http://autobuild.buildroot.org/results/c47c1e13659e4bfcccd98ebd22949e9dd278079e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index a716bf75a1..0760183b9e 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  2f643d09ea11a4a2a043c92e2b469b5f73228cbf241ae806760296ed0ec413d0  iproute2-6.9.0.tar.xz
+sha256  91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce  iproute2-6.10.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 525101aff1..08b890b331 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.9.0
+IPROUTE2_VERSION = 6.10.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
