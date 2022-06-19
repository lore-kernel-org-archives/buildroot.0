Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA9DC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 19:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7EA415D7;
	Sun, 19 Jun 2022 19:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7EA415D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lk-pAeehyL2b; Sun, 19 Jun 2022 19:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D2D6415AF;
	Sun, 19 Jun 2022 19:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D2D6415AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E185D1BF328
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 19:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA356818A1
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 19:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA356818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXrc_O_Yq_OM for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 19:34:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A251A8187F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A251A8187F
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 19:34:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q9so11964721wrd.8
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyaESw43McE25Z8zYgEMHY5gM+XG2BeiJTaFRB33Rlw=;
 b=bHWEGInLB4I4OCJXZpRYHucLGLnrMi+l8dvd1bPkX2gi1lvrts72XxRWLleokA3Sjz
 XMH8VEUek5+5XU6lRO7YsrQkd96WlhkSvPCPhSPEaP7CCGHM9wxT3a4DEFkC996Z8249
 +V0gjJJ7WWsu5SSBkCWpOSnCrjUEs/TFTfKRQdKWaYrsRWNFWIm92kuqPpvtpUvF1Xcr
 2cpCWu2GKX+Fg332G7YlRZG2qXJH7TdD47HueEjEqqgA2rkUZrgUGwreEQX1zH7qp/yI
 SzSU6MD3NRqPpUwOie+ugfXSm7x6OORFbdlpmuJDbxhTSLpGGP/PY0rzs+hTIir/lunQ
 lrHg==
X-Gm-Message-State: AJIora8V8uRwZFyPUwfA7pc5OaDuuPzr1AZUj6YyHsvXTKbfnOjlfHVt
 cUckhEHN6yEbaea7BBEep++Qm7SX8MU=
X-Google-Smtp-Source: AGRyM1t63MTY4O6kwTAe22+8o+um3htK3BvZDcK229lIViaauCu8DuTCC5wWAAvV40oxnOEp0iAWfQ==
X-Received: by 2002:a5d:4848:0:b0:21b:8cda:5747 with SMTP id
 n8-20020a5d4848000000b0021b8cda5747mr3238901wrs.483.1655667278572; 
 Sun, 19 Jun 2022 12:34:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a056000104900b002185631adf0sm3539339wrx.23.2022.06.19.12.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 12:34:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 21:31:12 +0200
Message-Id: <20220619193112.837042-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyaESw43McE25Z8zYgEMHY5gM+XG2BeiJTaFRB33Rlw=;
 b=CCVRzJ/cL1wnfsJFPqReTY1gNu/XyfPjkcnEWNsPynZYs6YRzv/mxbt9M7e24wvt7q
 cv0PtvBSJDnyjoCBvfT3ZW9zIQeb2OdJvrBcUknPCdk0tG2b69GTLXoA7bd7ZlwsN/16
 zOxJkQoyXo7iykOlHgcjeTfk7UxeR88zZKxPv98MxQBGPvS5Gchhd7ScEGWVXVY4rqDf
 uE3PyzHqfSvptVfBm8MtnHJ2KgmSpDDYKxjPbrUSiQ7h+r7YUzECJootAlPIEiw8LnPp
 d6FkmamwWVfwj1Vby8CL6XYjdZYjb65RRfq9oufZwwq1LK2HUf3AwAKiToQgQ+cqSZKd
 kRrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CCVRzJ/c
Subject: [Buildroot] [PATCH 1/1] package/uuu: use official tarball
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
Cc: Dario Binacchi <dario.binacchi@amarula.solutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use official tarball and so drop UUU_SET_VERSION

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 10efff0337..245c38879c 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  4fda8db488c4d3a98c2480c47b41907ad26b714c6400dd0a202baab4c17b0a9b  uuu-1.4.193.tar.gz
+sha256  a9b8b74e32e6718d591c66951b8b52276df7862db80ee943e046947f7313e57f  uuu_source-1.4.193.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  77b90738ae98b7958d34d9f96caf2671210a133427f8f6b784914b54f406c29b  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index d8c480034a..d1d7824018 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -5,15 +5,10 @@
 ################################################################################
 
 UUU_VERSION = 1.4.193
-UUU_SITE = $(call github,NXPmicro,mfgtools,uuu_$(UUU_VERSION))
+UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
+UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
 HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
 
-define UUU_SET_VERSION
-	echo $(UUU_VERSION) > $(@D)/.tarball-version
-endef
-
-HOST_UUU_POST_EXTRACT_HOOKS += UUU_SET_VERSION
-
 $(eval $(host-cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
