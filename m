Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49D1EEB57B
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 04:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 244F540382;
	Sun, 10 Sep 2023 04:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 244F540382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEkf7qkXDNsn; Sun, 10 Sep 2023 04:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57DAB40167;
	Sun, 10 Sep 2023 04:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57DAB40167
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 253361BF280
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 04:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BCFC81A1C
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 04:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCFC81A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldpoVZNfvnWx for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 04:10:11 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFFBD81A16
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 04:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFFBD81A16
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so123376139f.0
 for <buildroot@buildroot.org>; Sat, 09 Sep 2023 21:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694319009; x=1694923809;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DCyHEruPm+g0PQuabr3haW6YirK9dxjz/azkG54QF6w=;
 b=o2o2Js97KL+iQGnMSNT+k1x9F0T98OTHbDbTDBzspV8dQwgoNntC0+k86+M/J68Xxk
 aTeWPPm3Kb2oFSX3/PmwLwQM2PbJe3qsZUQlw9Zf79+zLP2xB+Ho7E8Ut/+TRH/FFdL0
 0mpf/cu5aa3gsF4WvF/T4dY6CI/6p0civeLZHEB/3Si8+8eORJZPKoEL5Et4jBj+hvFU
 E3t8vix7K+UGU9FGO66Viq/JdcQd8HYUf6CggETPmw6annsanN85Rvb6aywiXVaFMZbY
 qr0EbRokBVojCQ2HasHrECVW04Q6ClaaFQZ6C/4R4KVrJtHDtSqonKxMwWpMthPZ50n1
 LxJQ==
X-Gm-Message-State: AOJu0YzmaW1oB1i/RdWGZLf4RChIrgwQ+hYqEH/NFTN+LzWQWMDvDHeL
 UHVfDoHHbcPikCB1o3BbCon7sybOfOo=
X-Google-Smtp-Source: AGHT+IGE8EW0US+Aam3HHEFFEd88TuNozGcavjDZuowvPU/SlQcru3RrwDOYvEgPOtB7gp5iCwwPMQ==
X-Received: by 2002:a6b:e505:0:b0:787:34d:f223 with SMTP id
 y5-20020a6be505000000b00787034df223mr8176969ioc.11.1694319009414; 
 Sat, 09 Sep 2023 21:10:09 -0700 (PDT)
Received: from james-x399.localdomain (97-118-182-107.hlrn.qwest.net.
 [97.118.182.107]) by smtp.gmail.com with ESMTPSA id
 r22-20020a02c856000000b004302370a169sm1382734jao.157.2023.09.09.21.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 21:10:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Sep 2023 22:10:01 -0600
Message-Id: <20230910041001.1356119-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694319009; x=1694923809; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DCyHEruPm+g0PQuabr3haW6YirK9dxjz/azkG54QF6w=;
 b=b9JmCBJHGWTcjXvOqbqTD213eBE1850AFNxXoNsxq6+CRULFq8iZS0t5wNcBUZOers
 ZJZSUZUR9B2SiKODY13cx8j8nwWX/I8WGeFNvilUEcYBjssSDiYI/JIvPo7B3hwRhuW0
 F6YE/78SsAc2Uqb+GYmeklr7HHtqhCP/bg8D7HbLttRgIC7+DgidsS+7yolM23+clyDg
 RdvISPiFKF9sLnhOZtophvJlPGfxwcE28U19gIix6eHjX8vOH9t3YqoYkA0wK1VBV+1I
 ODSjSQJwGcbCWTkptKuStNARbcL3AmWubZxtYWVaSzc73mvD78tcuZkixIP71NGC5gvm
 oBeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=b9JmCBJH
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version 2023.05
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ISC license hash changed due to text update:
https://github.com/sbabic/swupdate/commit/d217a9b10e7b25296db4899beabc2de2b379c921

Set new HAVE_LIBEBGENV and HAVE_LIBUBOOTENV env variables.

Apply latest updates to swupdate-usb@.service from:
https://github.com/sbabic/meta-swupdate/commit/d5f84e74aada1212ed877509bdc546dca468451b
https://github.com/sbabic/meta-swupdate/commit/dac7b2d10ec84b2b6de9afadc12419398ea73615

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate-usb@.service | 10 ++++++----
 package/swupdate/swupdate.hash         |  4 ++--
 package/swupdate/swupdate.mk           |  8 +++++++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/package/swupdate/swupdate-usb@.service b/package/swupdate/swupdate-usb@.service
index df1a408421..28d805f8ec 100644
--- a/package/swupdate/swupdate-usb@.service
+++ b/package/swupdate/swupdate-usb@.service
@@ -1,9 +1,11 @@
 [Unit]
 Description=usb media swupdate service
 Requires=swupdate.service
-Requires=swupdate-progress.service
+Wants=swupdate-progress.service
 
 [Service]
-ExecStartPre=/bin/mount /dev/%I /mnt
-ExecStart=/bin/sh -c "swupdate-client -v /mnt/*.swu"
-ExecStopPost=/bin/umount /mnt
+ExecStartPre=/bin/mkdir -p /tmp/%I
+ExecStartPre=/bin/mount /dev/%I /tmp/%I
+ExecStart=/bin/sh -c "swupdate-client -v /tmp/%I/*.swu"
+ExecStopPost=/bin/umount /tmp/%I
+ExecStopPost=/bin/rmdir /tmp/%I
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 1b26f9e5e2..72b71ce12d 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,12 +1,12 @@
 # Locally calculated
-sha256  e6335e87812a98a87f1c55df03c9f4e4ef042789570002c5db120b09f64b0d86  swupdate-2022.12.tar.gz
+sha256  888df5050035e4fbe14e3a964885646fa3163e727f78c423c3d24c28f7a50b66  swupdate-2023.05.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  cde7883b9050a1104f4ac19a1572aafd6e5d7323b68351aaf51fbf4beba54966  LICENSES/CC-BY-SA-4.0.txt
 sha256  5d51b52a40391a26cbb2accf5dc5d1c165de49a022d9d5efb50b22204d2682ec  LICENSES/GPL-2.0-only.txt
 sha256  43fd695e9b198a9a4997cc2d02e10d26cae937e2c4930b9eff9c6d349c85cd32  LICENSES/GPL-2.0-or-later.txt
-sha256  492e801f1b0632185431472f148885a4fe8e990b10da57b4986a8bcf140a5374  LICENSES/ISC.txt
+sha256  f8f41f38133176a6db6c1bd8d7bd1a9c910e3563f1cb7bbe32b05e8b8d3a9c61  LICENSES/ISC.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
 sha256  8f2368a292194be10b1223a8875815240a9208bb30785cb13d8849eb6a750fe9  LICENSES/OFL-1.1.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 84905d2e0a..ea4a5a62e5 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2022.12
+SWUPDATE_VERSION = 2023.05
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
@@ -24,6 +24,9 @@ SWUPDATE_INSTALL_STAGING = YES
 # TARGET_CC is used for both.
 SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
 
+# we don't package EFI Boot Guard/libebgenv
+SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=n
+
 # swupdate bundles its own version of mongoose (version 6.16)
 
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
@@ -84,6 +87,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
 SWUPDATE_DEPENDENCIES += libubootenv
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
 endif
 
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
