Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3084ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 20:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5569A60888;
	Fri, 26 Aug 2022 20:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5569A60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkKsu-gCMcOw; Fri, 26 Aug 2022 20:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8264B607F6;
	Fri, 26 Aug 2022 20:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8264B607F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AE581BF2A5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1498940576
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1498940576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id delVbxbsd8dy for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 20:53:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18D7140571
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18D7140571
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 20:53:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k9so3147742wri.0
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=AgcGH7RVW/xc3cjwmGKeJ8GD2mti7ETyyoScZg76k5w=;
 b=otsk5uil3VundMxcIfRJ0pXUGE+Le3q92bDE4VihBoIehkX9pXufLj4/LfducI5ZE5
 T/+OG4xP03xj36l/TvmhM/+zgn6V+rOxLh32kVoqI/ZCPFbXBPCq1FyGBfOeqdn559AD
 3no3oICUMNcVwTXkzUZPwyPRwE4CQ5kNsfE7Xmn6ep89GF9bqr6uRJIfsBXjVIs34XiH
 DX84xDG3X8t9K2LJudvKXGEwFUnlyxcMUAEoehYdikL5kj8FOEI9NFrMQlDv42N7LSzy
 Q2dCdrtLB6Gq6lWVo613MZa42twRZoN6wNoUpK3DNWoAz+FIA4tRQjh2O7Ge4sx44V8K
 8sKg==
X-Gm-Message-State: ACgBeo1Yz8aVKQkLxO0gTd+t2dS5ET9XzqnuYpsn8A8hvDe8tcS/HABs
 K7I+vQKLUA1ZzKGeLRahiRXe6Hnh6jI=
X-Google-Smtp-Source: AA6agR7C7+MzjAY6Gd4UuKJSMAEUMd4pHjd3660dF8Fe4jB+xnoOYJ9VT+W4Ovc+pEFEUL0xGpyBTw==
X-Received: by 2002:adf:cd06:0:b0:225:1b57:a3b with SMTP id
 w6-20020adfcd06000000b002251b570a3bmr714958wrm.154.1661547213045; 
 Fri, 26 Aug 2022 13:53:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i11-20020a5d438b000000b002235eb9d200sm699852wrq.10.2022.08.26.13.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:53:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 22:53:16 +0200
Message-Id: <20220826205316.20112-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=AgcGH7RVW/xc3cjwmGKeJ8GD2mti7ETyyoScZg76k5w=;
 b=L6xL5HLqSy+N0Z7IxtN+4BhRr/iZhTwimRPkSEFmhhfP0x8lMaDdhGmBtCwpu0IqQI
 iyPnGGdcQnOqm6PthsGzxbKhIOb6aDlK0iWxOSeO1Dv7Gqzs6Lw7kNv5KGRmXjGs15a3
 9q3Db+YZZ2VeWFIiHtRmiuKddEXEAtlwDX+wMwvRC0jNcgnAI11ACL7GEpCiLulL6r2C
 98Vlkizi8FPNaRTsLfdztMOcWQy1TBa1ZAIqbovvf4xZTQLZYf9kFAAmB5VWkhjl4eWB
 02eEgnvtIGCvswCcYk5j9M5CYQ/b8OKIxw9pauVj6mkSTZMZOxhMv7OmsvlJpqoUl3nJ
 abzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L6xL5HLq
Subject: [Buildroot] [PATCH 1/1] package/edk2-platforms: fix legal-info
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

Fix typo: EDK2_PLATFORMS_LICENSE_FILE -> EDK2_PLATFORMS_LICENSE_FILES
added by commit 33aa59e7b500e60f2d736a17183c7d49b7baf5bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/edk2-platforms/edk2-platforms.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 430791ae3e..7de59c1afc 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -8,7 +8,7 @@
 EDK2_PLATFORMS_VERSION = db922e1253cb6f1fc456805bc42fb7d401eed5c2
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause
-EDK2_PLATFORMS_LICENSE_FILE = License.txt
+EDK2_PLATFORMS_LICENSE_FILES = License.txt
 EDK2_PLATFORMS_INSTALL_TARGET = NO
 EDK2_PLATFORMS_INSTALL_STAGING = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
