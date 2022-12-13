Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA84DC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 21:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397BA81EDC;
	Tue, 13 Dec 2022 21:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 397BA81EDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFD4cYPHdW_q; Tue, 13 Dec 2022 21:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59DC281E14;
	Tue, 13 Dec 2022 21:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DC281E14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 367831BF4E4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11F9D81E14
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F9D81E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYqkpOutSuiL for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 21:10:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3FF181E00
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3FF181E00
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 21:10:53 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id v2so2419469ioe.4
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 13:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VHHI/UR+1V/hVwmLt3o9qsDksyaZ7PlWmK+UNK3PgaU=;
 b=8OXeqwMD6SozBUI6jsIQfHX0IDk9HQRKp8B7SJJN1362j6F4BiiIKH7TIBzcwRWTVN
 3WNDuxQq75HfV+JASaGuV5coNsPyEvkxJozq83To/MzZngCLsnkvDEAXSp3LMtd64xXH
 UDTLCumzmK6V/AYC2GFyrEzOxSS4UkcOLs9pDqp2wWx+ucK1YBsQwxul+CiBdGtAUoUY
 VK2PoxmbpXImeGe8MCQe55wIBJlh7BRFcbJvQS/mrQfOkxh0IJ30ZeLXo+9lKB9O+EvF
 WRE6OEVKMf/rmR3iWlWKX0/EceGh+iG7hZslnihssU2RV/vxobN5nrxbVCFoLbpDs8/v
 04Ug==
X-Gm-Message-State: ANoB5plwLKZ26B9VHDpRp8AYfTnoV9mYLX1TdiIvpDX8mpPX+ywuRrI+
 haE8mzEbyABDzR3xsOD8RxY5N9+AkeXSJC0/
X-Google-Smtp-Source: AA0mqf5SdogIfoy4HoMoPoM6/O7xrfC7V6Tvfaghn9LWv6p+ZjlaqdtJLy888/QCnZr9H+464UNvvg==
X-Received: by 2002:a05:6602:12:b0:6e0:2427:ed2a with SMTP id
 b18-20020a056602001200b006e02427ed2amr12998187ioa.7.1670965852623; 
 Tue, 13 Dec 2022 13:10:52 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w14-20020a02968e000000b00389b36027a6sm1145011jai.92.2022.12.13.13.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:10:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 14:10:49 -0700
Message-Id: <20221213211049.2379857-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VHHI/UR+1V/hVwmLt3o9qsDksyaZ7PlWmK+UNK3PgaU=;
 b=Sx9GUPmN7qwKDdNZVxCVOt7y8zppW8d71opMmQeP3tAq/CCi1nXTNQQOcl/ueP/hfz
 cSIG/pCQZrqj45XClVIfgZwtv3QLNFepyr5x777VzFfw4tLQgjUqT5ouy+Z04RubNLiw
 GI3ngfCyAoNiVZ3ww9/9nfEOoN6o6CERmO3D/6EHgBEzCoLtUb7P9wa7S5TXmSPfCKqW
 dVLnTt9bcrK9PztEMifxlKV3lrdxZkaQ7Ub1iIMN+BWD6HcCkR00OTEpJXkh4GuNfcXR
 6Zpoqb9CxS9FCuUuzePjTfdWdvUTiFeOIGHQJUIwcfg20NaF7tqfz/O1AXcPY5R9lSN8
 A5Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Sx9GUPmN
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version 2022.12
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

Drop patch which is now upstream.

Update service files based on latest versions in:
https://github.com/sbabic/meta-swupdate/tree/master/recipes-support/swupdate/swupdate

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...der.c-fix-build-without-reallocarray.patch | 35 -------------------
 package/swupdate/swupdate-usb@.service        |  1 +
 package/swupdate/swupdate.hash                |  2 +-
 package/swupdate/swupdate.mk                  |  2 +-
 package/swupdate/swupdate.service             |  1 +
 5 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch

diff --git a/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch b/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch
deleted file mode 100644
index d90ae7906e..0000000000
--- a/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f30c4771e93cad7e77d7f2add94327865d226553 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 15 May 2022 14:53:35 +0200
-Subject: [PATCH] core/bootloader.c: fix build without reallocarray
-
-Use realloc instead of reallocarray to avoid the following build failure
-with uclibc raised since version 2022.05 and
-https://github.com/sbabic/swupdate/commit/b8897ed695e1cd954859142b14ec8546d2e7994a:
-
-microblaze-buildroot-linux-uclibc/bin/ld: core/built-in.o: in function `register_bootloader':
-(.text.register_bootloader+0x30): undefined reference to `reallocarray'
-
-Fixes:
- - http://autobuild.buildroot.org/results/7208e8189b4a6f35aaa4ed7777ecdd37421a7c7f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Backported from: f30c4771e93cad7e77d7f2add94327865d226553
-Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
----
- core/bootloader.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/core/bootloader.c b/core/bootloader.c
-index f34cb414..5694d43d 100644
---- a/core/bootloader.c
-+++ b/core/bootloader.c
-@@ -25,7 +25,7 @@ static unsigned int num_available = 0;
- 
- int register_bootloader(const char *name, bootloader *bl)
- {
--	entry *tmp = reallocarray(available, num_available + 1, sizeof(entry));
-+	entry *tmp = realloc(available, (num_available + 1) * sizeof(entry));
- 	if (!tmp) {
- 		return -ENOMEM;
- 	}
diff --git a/package/swupdate/swupdate-usb@.service b/package/swupdate/swupdate-usb@.service
index eda9d1539c..df1a408421 100644
--- a/package/swupdate/swupdate-usb@.service
+++ b/package/swupdate/swupdate-usb@.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=usb media swupdate service
+Requires=swupdate.service
 Requires=swupdate-progress.service
 
 [Service]
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 638b586e8a..1b26f9e5e2 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1e819f71b19626bde1a4906ced39d3406ca240b458d3c4a998bd9c7333eba260  swupdate-2022.05.tar.gz
+sha256  e6335e87812a98a87f1c55df03c9f4e4ef042789570002c5db120b09f64b0d86  swupdate-2022.12.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 1cd60d1b8f..8f05b83922 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2022.05
+SWUPDATE_VERSION = 2022.12
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
diff --git a/package/swupdate/swupdate.service b/package/swupdate/swupdate.service
index a3d8d1939e..94d4526acf 100644
--- a/package/swupdate/swupdate.service
+++ b/package/swupdate/swupdate.service
@@ -4,6 +4,7 @@ Documentation=https://github.com/sbabic/swupdate
 Documentation=https://sbabic.github.io/swupdate
 
 [Service]
+Type=notify
 ExecStart=/usr/lib/swupdate/swupdate.sh
 KillMode=mixed
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
