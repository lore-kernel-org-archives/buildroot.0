Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF49C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 11:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FB3F40C61;
	Tue, 12 Jul 2022 11:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FB3F40C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryBo7CcPntxO; Tue, 12 Jul 2022 11:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CC7B40C67;
	Tue, 12 Jul 2022 11:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CC7B40C67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D7101BF30B
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 11:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35AFE6117D
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 11:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35AFE6117D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KW4Dm25TLAuF for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 11:46:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4050661179
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4050661179
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 11:46:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y4so9755415edc.4
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 04:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8YckjPg68lyRSyX2vjLA2DPlTewWCX+bScR+RE4v0mQ=;
 b=A855ousT46waJYoEPBbQCdoeRdzHJMqJWzRUNUOs0NSxq1WX+aZ078yOLF0Ud3bWrk
 tV4ha9r2bOTzdm3JoyPnkOfluUYH6mibQxL8HKRtGj/+P76CXyJxZ0SWmVblOLvmH+T8
 fdQE3Nb0/MkdDBxhrAGvPSb3dJptGRXXF6ef72drhQYM61Fk4rhvZ0VLvsKHJo7IxSK7
 kGvQygc8fmYC9DF0Zu2Zm2GkycsKq3E51RdnYG0iMAXNmLf9Q1UpO+METzryzqpu3Ln0
 VFs7pMlMPM9AuXMdcL+m38snM4iFJVm6yIf+x4wWb6mI9jxIvLvkaZDBNp8OMKZo84Qp
 Qogw==
X-Gm-Message-State: AJIora/hIT4mc2Z5+ThR7QJ2gc3XE/mne/jEcSFky8G9UKFd5SXDYUq0
 7z8MxFG3oUm9fa29kjpmyCgZCmXEMGo=
X-Google-Smtp-Source: AGRyM1t+RhQvlir7gFWaKSqW4/Go2iQ4KX8WQOIsAnIAi8jZ2LVC3tRpNySnju8IjHkRkRhY1DqEwQ==
X-Received: by 2002:a05:6402:438f:b0:43a:cee2:a081 with SMTP id
 o15-20020a056402438f00b0043acee2a081mr16023813edc.298.1657626405258; 
 Tue, 12 Jul 2022 04:46:45 -0700 (PDT)
Received: from localhost.localdomain (cust-178-252-109-94.dyn.as47377.net.
 [94.109.252.178]) by smtp.gmail.com with ESMTPSA id
 i8-20020a170906a28800b0072b13fa5e4csm3750092ejz.58.2022.07.12.04.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 04:46:44 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 13:45:10 +0200
Message-Id: <20220712114510.1434413-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8YckjPg68lyRSyX2vjLA2DPlTewWCX+bScR+RE4v0mQ=;
 b=AE2bjYriNPn1JtS38T8V81YJTng5+Qtd+kLZdFG70V7g+RY7FkBDbZNSQE82O6cnky
 UKWXOqSYKTlwkQTDYhpyl7SJbCYP1+La+JZrW265RqakbgC8zq2UULOfbimNEo2tZKD0
 Lbvl58i6KoQWvAo2n7dH19Vp0vGOnKBruGt1KiPdFJ9Ro8VKrviP/YsQEnPR5pquta3S
 s96tvD2MXjYTIgR4a/7JfKhUAp+v4ENgZHJo1tq4RRLfkbC7atlFioEGIE2fcRKzIm8L
 MTwxuLCBwzHArq4x9R0Puub4+KM/crbQDERVQWIwjiwW7TiWngCNCDK3lPz0lP5Wi6Ar
 lYvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AE2bjYri
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v7.0.3
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 582c3afa03..bff478fe7c 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  284d8bd1fd85d6a55a05ee4e7c31c31977ad56cbf344ed83790beeb148baa720  redis-7.0.0.tar.gz
+sha256  2cde7d17214ffe305953da9fff12333e8a72caa57fd4923e4872f6362a208e73  redis-7.0.3.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 3b91fbf8c8..b292782acf 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.0
+REDIS_VERSION = 7.0.3
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
