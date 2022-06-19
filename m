Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6853C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 21:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4460681C81;
	Sun, 19 Jun 2022 21:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4460681C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJvV2Yoxqbsp; Sun, 19 Jun 2022 21:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DB7381C40;
	Sun, 19 Jun 2022 21:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DB7381C40
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9522E1BF3A0
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 21:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E3E181C40
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 21:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3E181C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRorYLn4IQym for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 21:11:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 011C581C11
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 011C581C11
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 21:11:15 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 i81-20020a1c3b54000000b0039c76434147so6873323wma.1
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 14:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mx8Diro884Z6iiNiSBFODAxK9wMDCiF87d3F1J2grGw=;
 b=Wj93+ffCwycOsskS4rm784B0A1Lw4RWBxosq0QG/6iMk3j7EoXaifCOYL56wT59v3n
 2Ino5Nq1rcZiyeS/9X4RolbpBfGJ3C4xq0qhPgk36V4Et0z0p6ktngLul9K7zw2dQYrK
 S1iM9VBzyJqnDn60LCg39PdNCOuf2jqJufGyELfPA9GNoVHHy0MXvWwrw2Cphh8ufi/i
 lIwpHXWqqYsfO3heQGSqiB+GyCyV3F/4OTUZobF1WOF1kGwS06x7J7DtialsM+uGXPDj
 KEKjqp1JhpwcDkktSs9vDbp9rnuQw+alfwFP1Cr3huBLyM72MVxA1UVmHJM1sALfw+aQ
 W1cA==
X-Gm-Message-State: AOAM530exS4WWUUkwX3iYBzZCPj4MlDlx3XpwAEt/1cdQFn8CDJ0MYhM
 1BYnV6YyqiEGrs4uo9/69itrwhPjVv4=
X-Google-Smtp-Source: ABdhPJyQ98Je3RmM+DTDQRMudN5z3mEQWdNE2mn/RdhdcCM2ruc7cokiX+elvv8FV9LKE6J8LvOaJw==
X-Received: by 2002:a7b:c1c1:0:b0:39c:58c4:c701 with SMTP id
 a1-20020a7bc1c1000000b0039c58c4c701mr32745769wmj.117.1655673073977; 
 Sun, 19 Jun 2022 14:11:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adffe06000000b00213abce60e4sm10923209wrr.111.2022.06.19.14.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 14:11:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 23:08:31 +0200
Message-Id: <20220619210831.1047319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mx8Diro884Z6iiNiSBFODAxK9wMDCiF87d3F1J2grGw=;
 b=AMRd5fv5YNTATM48fOEOIf0BRmZfUzr2Kc88VDazpL7yfKdnCLKKHRDnraNJF6mPdV
 zf+8fP5yZVihCRGCd0QEOLZxGiyrSjnw8EsnOVEsJmHIr/hPieP5I2BNFMJ1FWDQjJfd
 xxJmwF+R4F7ZNy92HQiFQ3dNSCX2XBSuQKx0E9cqD+enNuVmijm7LiMwxws0czgpXnWi
 HrI+YwgrIUaM7lwjzYBqQsLn63kQp09wL97L/zsyAH6us5JzetSNL3hR5GZK66Miqtfp
 piXGyhMUAkME47ujvEBRlmi4rj4efM7C1YGUdca6iRPz3AokMIVIL5SdOukGJ4yVUDRW
 JlzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AMRd5fv5
Subject: [Buildroot] [PATCH 1/1] package/sudo: bump to version 1.9.11p2
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

License file renamed and year updated with
https://github.com/sudo-project/sudo/commit/0ed92e6165c3f35d5188d1d0db04754fea023bcb
https://github.com/sudo-project/sudo/commit/d02ba52fa41fcdfdd5b6500ed81419cd077cd79b

https://www.sudo.ws/releases/stable/#1.9.11p2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 1b494af69c..63c98e2c4e 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256  9e3b8b8da7def43b6e60c257abe80467205670fd0f7c081de1423c414b680f2d  sudo-1.9.8p2.tar.gz
+sha256  a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2  sudo-1.9.11p2.tar.gz
 # Locally calculated
-sha256  b678438594f04a7070a5fd125f7edffc871e13234baad318690b647bfc60705d  doc/LICENSE
+sha256  cf3a83366f9aabfd76d693ce03843106fcaaf6c76dfa97610f7c0b719a06e6bb  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a752217123..2b9ba76a51 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.8
+SUDO_VERSION_MAJOR = 1.9.11
 SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
-SUDO_LICENSE_FILES = doc/LICENSE
+SUDO_LICENSE_FILES = LICENSE.md
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
 SUDO_SELINUX_MODULES = sudo
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
