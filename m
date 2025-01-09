Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CD2E77188
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 01:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF0ED60596;
	Thu,  9 Jan 2025 01:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15Bu0sd9VQMp; Thu,  9 Jan 2025 01:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80992608B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80992608B1;
	Thu,  9 Jan 2025 01:15:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD59B7AA
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A831B40595
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0B7hfWnRoKj for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 01:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66B7A40586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B7A40586
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66B7A40586
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:15:26 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-21619108a6bso5062135ad.3
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 17:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736385325; x=1736990125;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZvqhny60bNnpRw/iH3SeMxFYcQoEnAyONDX2eLZBvY=;
 b=tDc7wyqhI6yHiMNin/bmAfmu+4crnYVP5ymTZi132H4j0aHr+4cu6OWxporRvC4fX6
 XwbTlWEZxmTZNXhhBZT7Pc4eFuMb4X6iqjyKA2UsrJ29070UBxlSCH37U9DsoinvAAqd
 2piR3CdeY9+NBkJmMBJz4crJf6lzV1z8BXh/+4ECoJSLo/zixp3XjkahjhlyryoXHQMd
 T7/+SDFSl3EQzGdsv4kP9RhLp6/piZyBWihahbb352i0rfSwJAS1ty30K7Ns/aUxLEoY
 xMtMvbQH0ffpIyKYs31CBdUc389+1Z2L3eLhaEUNMF/LMiepC6X13um7bmBrGl3r3r9P
 SW2w==
X-Gm-Message-State: AOJu0YzcVLMR2Y+OE0M3/SGaucTLDN/8BUQDeLq9UA+qbsrEon1Q0EZK
 u+NmyfA/gTOr6ReO2Fd3yMPnRjO+VNr13Cu3jEAmu/VQw/CeT/B/RmEILQ==
X-Gm-Gg: ASbGncsKCS1CP9/ogwK/y+mP6O4z+KDF5UbI16Iijq81W5LycXgZTWfmfAHVvMaiTAP
 ZcYmQAZ0rayknG6fqt1ANqHroUqMWwGA2sDEEgJkqK4iTY5neN1+nMPDFzN13sd6er9sn+OKe8/
 B2aC7ddi/e0T6ExUScbMYqto26Nd3TZgR+TjJysTEVD0N80ZoqXf86/s0ekpeVLrOdmKyaRGSGr
 W9S9E7Zqwi1SnlP2AYcNFTb9K8YlDhoMbF9jXhFMm1ZvTIaWSYmMP4IMM7chcuaGcc8dsppoxb1
 tfS+2Fd+YImJKT2Pp3135Xsf6WYjHhltzEKOsASH
X-Google-Smtp-Source: AGHT+IGBbLYdIhnhUp3ddHYH8O6C5GY9DOEqCLjrdPUsrmhrhzFGYO2YVAY3CeTrCrgoWiWyjpiRaA==
X-Received: by 2002:a05:6a21:a24b:b0:1d9:6c9c:75ea with SMTP id
 adf61e73a8af0-1e88d0df9efmr7886081637.5.1736385325002; 
 Wed, 08 Jan 2025 17:15:25 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad83616asm35936774b3a.76.2025.01.08.17.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 17:15:24 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed,  8 Jan 2025 17:15:20 -0800
Message-Id: <20250109011520.27360-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736385325; x=1736990125; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZvqhny60bNnpRw/iH3SeMxFYcQoEnAyONDX2eLZBvY=;
 b=YGN4HAvnMINCRdBuvu2+goq060P26Y+o+5NoGuZZHQk6faoRPi15bRbxaKJQUSf2vw
 yr838sXPz4BfDaDEndmGogSbMQgf/Fd35x4BK3tE6jVOcQJ/nLFcmSDOj/6IGf6xPjRL
 Cqqd3OyqRJkV+c8B7kT7YYGWYO8d/h404aupw3YSZHFp8yehXcnw9ZGsI+vKhobe+ESE
 WDvVeh/NVRfdO/hnlt0BoQ68vH9SPOw0MQN5RK93OZ2LGj0xVQ4/m5iMWtMQO4Wc+tXw
 CARqAtzFmGFKXpJVHDm+Lsxzwfvl0pgKPxpFM63al7a+VEAtQQLqyxXPxlK7bB/jv40j
 3JeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YGN4HAvn
Subject: [Buildroot] [PATCH 1/1] package/libgsasl: bump version to 2.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Release notes:
https://lists.gnu.org/archive/html/help-gsasl/2024-01/msg00003.html

Updates:
- COPYING.LIB renamed to COPYING.LESSER.
  https://gitlab.com/gsasl/gsasl/-/commit/2492403b4e6d65a3c2d6dd7eee9ddedbc733275b
- Upstream tarball no longer includes the lib prefix.
- COPYING hash changed due to copyright URL update.
  https://gitlab.com/gsasl/gsasl/-/commit/89c4c35d7b0204dc3d6ecbccadab47d76640f0be
- README hash changed due to multiple revisions.
  https://gitlab.com/gsasl/gsasl/-/commits/master/README.md?ref_type=heads
- Tarball's sha256sum mentioned in the release notes was base64-encoded. It was decoded with the following command:
  echo "1FtWLhO9E7n8ILNy9LUyaXQM9iefg28JzhG50yvO4HU=" | base64 -d | xxd -c 32 -p

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/libgsasl/libgsasl.hash | 14 +++++++-------
 package/libgsasl/libgsasl.mk   |  5 +++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index 75e5a317fa..81907f8875 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,11 +1,11 @@
-# From https://lists.gnu.org/archive/html/help-gsasl/2021-01/msg00007.html
-sha1  a16ff428bbf28fcfa681c7edd2cd2bb087bcc4e7  libgsasl-1.10.0.tar.gz
-sha224  20b37757fccb6a0f8b4c6fcb28f51a3b4b8a4b1fdb4736da07707a0b  libgsasl-1.10.0.tar.gz
+# From https://lists.gnu.org/archive/html/help-gsasl/2024-01/msg00003.html
+sha1  c238b3af05af3804808cbf734f049a06840d787c  gsasl-2.2.1.tar.gz
+sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
 
 # Locally calculated after checking pgp signature
-sha256  f1b553384dedbd87478449775546a358d6f5140c15cccc8fb574136fdc77329f  libgsasl-1.10.0.tar.gz
+sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
 
 # Hash for license files:
-sha256  26e99818ca6ce79d8b2c461fabc72dc6e03483e6b0fd9692dcb07ab1b09bbac7  README
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8908e3d66e17102a3b921e1f7f80be5dc9c905ad15561579d46a7074387e311b  README
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index b1981dea3b..b8570058a4 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBGSASL_VERSION = 1.10.0
+LIBGSASL_VERSION = 2.2.1
+LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
-LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
+LIBGSASL_LICENSE_FILES = README COPYING.LESSER COPYING
 LIBGSASL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
