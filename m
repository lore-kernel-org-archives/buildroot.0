Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F33EC6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C818B61121;
	Tue, 25 Apr 2023 17:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C818B61121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etcvrZil5v8g; Tue, 25 Apr 2023 17:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C43F6145E;
	Tue, 25 Apr 2023 17:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C43F6145E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D04CD1BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9AFA6145E
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9AFA6145E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 292ZG1jykhMb for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9AA761458
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9AA761458
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:08 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso37015042b3a.1
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442908; x=1685034908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=amwC7ThPMf+c2gfxunXE5rDbvjDH2nBygBc+yHndyq4=;
 b=N8o82Mddb376gou5Nf2rlVvedsT4iOCR83ldqiRf3rWtLyeSN/LGCl9ZLht1fVsLPE
 BpujhkDTRfERGW9UpzZlX4ROCKc7i5jUbZYV+T3aoVR8En3iYxq3PRElCSkjecVtOJug
 7pXPVbHAROas4x338lOrUGtHoF4oCQDaV/1M5Eh4h/xsshVPPEjeH8hO4/ZHdwPzxZue
 n5G26cCtO8Km1U+GxPft0sXh79l0zsFJ5n+KshDDrFwSoVT53ZZcQTwi4jX3wnFKrCVI
 K7ztOvatEsKQLKiwU2zT+Nl1MUcJRgY3dAiVf4BRJybdhLsDrxYCh+YOoEj9/pCbdkQR
 VUnA==
X-Gm-Message-State: AAQBX9fDgdVSbBISEV2jFE52C+G+NJKFQrjpm/437A8LkSd9JHcVDFFL
 +v1POPSZD8auj8g4xtdpDt6xIVTPnA8xAA==
X-Google-Smtp-Source: AKy350ZW53VNpinXtfMxZ46Rc2mquRBVWl6HTx895vFlZwPfUWd1obla7r/wzLB/h+HU08ywoS4iRg==
X-Received: by 2002:a05:6a20:938a:b0:f2:1141:9d20 with SMTP id
 x10-20020a056a20938a00b000f211419d20mr21320231pzh.24.1682442907745; 
 Tue, 25 Apr 2023 10:15:07 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:07 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:49 -0700
Message-Id: <20230425171454.48802-9-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442908; x=1685034908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amwC7ThPMf+c2gfxunXE5rDbvjDH2nBygBc+yHndyq4=;
 b=anIJtHkYrFT+Sx5MXHanrwUZCWKQDfs4XNj07opBAhIA+JQQqozJczxsovP0H3+oah
 /r2K7n8TG3lkHpc1WjDsBRv/RJsLQucMgy9xZVPv0XU2zXkm4fZauN6xBnYq3jkucUZj
 SPF6zjNsbD4PjsxBOqeZodt8Gld/h+BW051FCfPBX85MpriwrYI5PGgZCTEJwLkiqGDR
 8lD2t4TBy9iiR91Pav/7pMnR3YW4bZxMC7zqwG0Qz+LcRAvm/A0/Dq4JHoLCT1R3qvuY
 thvaxXshRAMkyDHT8ky4R9oSXmtMx5V6NPlKJZ3FIZPU0ybdbBFqw0778inrc/L/4S7E
 T2aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=anIJtHkY
Subject: [Buildroot] [PATCH v2 08/13] package/restorecond: bump to version
 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/restorecond/restorecond.hash | 4 ++--
 package/restorecond/restorecond.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index b38c6dcf14..215c9192f4 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  218c3d8873f31764e3c82d53ac713c0c9faaa07caf42ed7184e93ca2b27d8f27  restorecond-3.3.tar.gz
+sha256  f00d8caddb6aba2793c65e69154d04671b52f3d37e081b0e96c1b443fe23c2fe  restorecond-3.5.tar.gz
 
 # Hash for license file
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 7d6ed86f08..cd40905230 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.3
+RESTORECOND_VERSION = 3.5
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
-RESTORECOND_LICENSE_FILES = COPYING
+RESTORECOND_LICENSE_FILES = LICENSE
 
 RESTORECOND_DEPENDENCIES = libglib2 libsepol libselinux dbus-glib
 
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
