Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFDBC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 19:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7A21408E5;
	Mon, 25 Jul 2022 19:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7A21408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ELFms9oB7us; Mon, 25 Jul 2022 19:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D67A4046A;
	Mon, 25 Jul 2022 19:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D67A4046A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 076B81BF2A1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4E9A831CB
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E9A831CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCr6ajDIsZix for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 19:11:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22CBD82FA2
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22CBD82FA2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 19:11:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h8so17319397wrw.1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QkNcErAGGqAD8e2Qul6zZpEm3KOMK2NvJxIzDkJceGQ=;
 b=ilvG+Iz5i4KXoJVW8doFpVbLb34iI2gKnaY40fJuM1ymYw3EMqS+sjwX+EdiZBzIxh
 eAxFkBAv856rg6TlFLtwsjXEYMC9Wj9+dg7oP7z2sqhQhrQYcOo0zaQEEsUL0zCoNHzw
 f7/vvsnCrDE4qY1TeH0qxgXgh8CGZWmr8uuCx/VOXv6KdtdU2/EuyBsZ+DxvlNJC8mWw
 w92cyBewjOOoO4S3OPlvp7bftQL3RVqHupXTrjN1tjIdhTTBKKmQ3gEceG0G1SdqIGwq
 XRAN3ll7u7GyJa+5Y3+UEMwqZXmAuZ00uJIt1VpoX3pvsT7h4hI/KNhq2cqLoFUqTvrv
 l5dg==
X-Gm-Message-State: AJIora8g9WleGxigwO2s9e3trYklLZAAgRMlSrUAy2f9ZwHNj1xtnovU
 xfTTaFyViQ+O1lElo96wxg9+4tUhXAM=
X-Google-Smtp-Source: AGRyM1vAMA5Gyepb/HiV3EY2KceMFxlMis5ADlm0F/rikLdofckDQzQebngbJvyZr9VvbQlQLkM2uw==
X-Received: by 2002:a5d:588d:0:b0:21d:a5cf:c6f with SMTP id
 n13-20020a5d588d000000b0021da5cf0c6fmr9022710wrf.716.1658776289842; 
 Mon, 25 Jul 2022 12:11:29 -0700 (PDT)
Received: from kali.home (2a01cb0120169d0bf78f966f9fb21656.ipv6.abo.wanadoo.fr.
 [2a01:cb01:2016:9d0b:f78f:966f:9fb2:1656])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adff306000000b0021e849bc729sm4872666wro.55.2022.07.25.12.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 12:11:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 21:11:25 +0200
Message-Id: <20220725191125.16277-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QkNcErAGGqAD8e2Qul6zZpEm3KOMK2NvJxIzDkJceGQ=;
 b=U+k81tOV59YUstNdAvueg40F8hSfE10mfQsiE6OWhDanYauD364SDanmYM/dhFANEM
 7yIAiHPwp36UNan0xxniMKDSPVv1sy5MNDwJms7lBeQUc3yu+IDsu3EL/0NzGQ1bRK8K
 0X+VETQVJzMaaRE+s+BJHEGT0M+Gh+Nek4eit9FuFRIYB8/TeDZWe+2WfrFMaYLfrbmU
 GCHXhco6i7jUQH8TliLA8cdkYtPxsL/nnGo/EOgbF3BTTAySnmHArzXnkwIZVR6vBy5v
 uLY7Z2UGbEdC9lpgELdOXlZbyX8nrWut6HqLLy1C/1dvaZmF2nsL+qW22oG5ZeqJqhgb
 JKxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U+k81tOV
Subject: [Buildroot] [PATCH 1/1] package/netifrc: bump to version 0.7.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netifrc/netifrc.hash | 4 ++--
 package/netifrc/netifrc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netifrc/netifrc.hash b/package/netifrc/netifrc.hash
index d811acc4a2..e92c394018 100644
--- a/package/netifrc/netifrc.hash
+++ b/package/netifrc/netifrc.hash
@@ -1,3 +1,3 @@
 # Calculated manually
-sha256	004907e0c3db2d106d6a51d604d79f971f1013fa7642054ad7efe5076e52f7b3	netifrc-0.6.1.tar.gz
-sha256	da376c9e2244f2a7220767ea4dd88cf423ff5b548e7c2f96b0f3b9dac727748a	LICENSE
+sha256  ad6578bf0c08eac474fa7b557beda0aed1032bef410a01f0493395cd6568128e  netifrc-0.7.3.tar.gz
+sha256  da376c9e2244f2a7220767ea4dd88cf423ff5b548e7c2f96b0f3b9dac727748a  LICENSE
diff --git a/package/netifrc/netifrc.mk b/package/netifrc/netifrc.mk
index d13dc356f3..dfa1c96bb8 100644
--- a/package/netifrc/netifrc.mk
+++ b/package/netifrc/netifrc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETIFRC_VERSION = 0.6.1
+NETIFRC_VERSION = 0.7.3
 NETIFRC_SITE = $(call github,gentoo,netifrc,$(NETIFRC_VERSION))
 NETIFRC_LICENSE = BSD-2-Clause
 NETIFRC_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
