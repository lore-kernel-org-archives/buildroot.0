Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB90BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 14:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F919817BA;
	Sun, 27 Nov 2022 14:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F919817BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFGFFaC2CMSv; Sun, 27 Nov 2022 14:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAAE58186B;
	Sun, 27 Nov 2022 14:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAAE58186B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2E201BF3C5
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 14:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B59668186B
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 14:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B59668186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqclp4a8m2tS for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 14:19:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A933817BA
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A933817BA
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 14:19:48 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-142306beb9aso10263975fac.11
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 06:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U75OGPIuItwXhMkaNTASJe0Vig12DFMgN6Q8cO+lwag=;
 b=69oF/+cbRe0U+LD+E2kx+Wgx+8sol4tuBLO88UwxRws25thkvVigilASUHabkSy5VR
 G9FaSN5yVSDudRwot9TZgt3SvW5lm/oZrbJe1QgmOiwUkZvg3mvc/2mkgIaIywwS7pPc
 ATiCZEDfANrbXSPe6Kmkl8q7LePHJUL+c7VEzVx/gJELMDDj1NKraYWbXmMNF4XkXbw4
 xYmpCXO9y1JD54tPCuqMBttk+XqSFOewlNJxZRlVhf/LWsqSUceB3iDGSKcAUUW3CHtS
 ssxApkpaMlRV87Wot7u5kUbO9ihyVSXPyZGez+AqGfWLFG9nPK4KJB+2g3m+hFo2VvGp
 /y/Q==
X-Gm-Message-State: ANoB5plHwekgZxhY2DOxS+nAvOtLNRr96DItz/bTeiB958V3zuHKbr8t
 JGuAtvkHWbxn70u76VdqJz/wamDZf94=
X-Google-Smtp-Source: AA0mqf5TKeuIksd3eXeUBDklhILbBpecIL85/SuiHqTZcEG5L2MmFCJKaWosfy9EyysKTe55KYUsng==
X-Received: by 2002:a05:6871:4217:b0:132:29c9:4353 with SMTP id
 li23-20020a056871421700b0013229c94353mr19025383oab.206.1669558787950; 
 Sun, 27 Nov 2022 06:19:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 64-20020a9d0346000000b0066c39c99ae5sm3767092otv.25.2022.11.27.06.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 06:19:46 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 11:19:26 -0300
Message-Id: <20221127141926.1976657-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U75OGPIuItwXhMkaNTASJe0Vig12DFMgN6Q8cO+lwag=;
 b=YXvc1KYDRvh3w7bjfrImCmF3Vz4EzpuarqUPVeNLCZaXQh4Zij+lj0m2n2dKhL5Y1t
 X6GJT8m1Cxqe9vFdAWLEuw/PbvChNjS4qgNm/sZuj+rWTzL1jNXSeHKN9mhtj1312jy3
 kmzioGlAoGYNsPJZT8zwH9yB/fG179J4kVLJOVyMgDOBPDQ/0T7VPNJOhH6wApLg9+8G
 7LeDeb+1wIo3VZMmEQcFvggQlDA+0/jNTNa1ze2uccpxGuiqbuQxcuiXHShAaIB9MsPP
 HrfAz57UDqRHUIAdrLpG9R2SmqTAoPqgrqgEUzhPyXIa3AK+LnC7nNY/SbDZswhdKkcQ
 2BWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YXvc1KYD
Subject: [Buildroot] [next] package/thermald: bump to 2.5.1
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

README.txt states only these changes:
- Static analysis fixes
- Missing init, which causes skipping of conditions in a Dell system

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test-pkg config 1:
BR2_PACKAGE_THERMALD=y
BR2_INIT_SYSTEMD=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/706238167
44 builds, 43 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

test-pkg config 2:
BR2_PACKAGE_THERMALD=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/706238254
44 builds, 39 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/thermald/thermald.hash | 2 +-
 package/thermald/thermald.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index eceff77d37..9693813ca9 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e6515678ce8ff37978a453e1617a087a40ba3a31809a42c1768b6f816e564cc9  thermald-2.5.tar.gz
+sha256  75c165df45b3d09c904d314c8c19789158e9538f46e3d2b606457dc631eb3af5  thermald-2.5.1.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 38f6b5a00f..fd0246745f 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 2.5
+THERMALD_VERSION = 2.5.1
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
