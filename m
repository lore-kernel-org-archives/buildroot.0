Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B336CCA47F
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 11:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 866F0818E6;
	Thu, 30 Jun 2022 11:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866F0818E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbrmB4_2_oNI; Thu, 30 Jun 2022 11:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38BB581852;
	Thu, 30 Jun 2022 11:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38BB581852
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 706431BF3CA
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 11:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4671481819
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 11:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4671481819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrMN9VFFV9pA for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 11:07:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3292D817C0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3292D817C0
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 11:07:44 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id u20so18752844iob.8
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 04:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e0YWl7mprDmqBf3Smehrd7N88L1HxihNHaj3b2TB7pQ=;
 b=0ahiHUZN2dywLuscH1ymLVCRHhYxAGIjBjPjLY/yzjW3WEq0vXuCX7H4RHfJr3j8bm
 vfj8Uav+sPYsVe1ubNTvw+hsBRMZiNHkRpy+GgoTawPPXgwqgJncpY0/0vQrN0KJUNkT
 8Lk6A+4S75uXs7fUlitJNZulFPLb8h4Le26memTAj+dq/iNmSl6s/qVC5SLgIwkfeGAS
 qMg0aqelpuBH5+yPut1eeGDaPFPc34+LEjmvQDrVC3uTRceyZBZreeiMuk5tYolpCYsF
 78Q/OwsAStOamK6VxXRx72rQners4Iou+aPB+1BGv2AQc/UPabUR7nAiliEjO6vCXJsq
 Dz9g==
X-Gm-Message-State: AJIora/dKY6Dci1n/6+o1GGxHYanVsSzfg0pRWwxyZQELV5y0FOTCQzf
 qZOQOtn8HAyz0rDdnt8j1JxSwuHlvck=
X-Google-Smtp-Source: AGRyM1u2QVBvUhtrmhFwmAKrkxJiKQn6R33krufkS0ZWmiX6NDIrtvN8BjIbZ9HB+H7HihPu6hXP7Q==
X-Received: by 2002:a05:6638:4105:b0:33c:b13:23ed with SMTP id
 ay5-20020a056638410500b0033c0b1323edmr5079201jab.82.1656587261598; 
 Thu, 30 Jun 2022 04:07:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d968b000000b006725df84013sm9027918ion.28.2022.06.30.04.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 04:07:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Jun 2022 05:07:39 -0600
Message-Id: <20220630110739.2491988-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e0YWl7mprDmqBf3Smehrd7N88L1HxihNHaj3b2TB7pQ=;
 b=GoW8TV+kbfRYHiI7NmyCuSuM+cvOKnEH3BMW5LlbNp1kuvgmP3+Op314CPZsf5FWZx
 GcDAFQdcr93K7atUQqY9dJoQu9SC0DiuBe3Vx8fugN01HM/Hj8JJlq7d4lsMQkVYQkJ4
 7TFk9MYqssz9rMEbUXykusLutYnh/JPD1AF5pbROwEy2phgVb54QytkdOHAnlh9DKf52
 USPYgbLVc3eJGr9I0I7n9i/5jr7+lq09Ebx1wTSg/l5+SQOKVkd8zIC+jgHUGJncDCw8
 iFSWcexawXZZ9bLeHw7e55AAhrUSfntw9olS6VsbpqK44WcgXsCQCSRPrfohHka23rN0
 6ZTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GoW8TV+k
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.53
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 6112c7b5b5..9de0ac0421 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  11b9de7eec5a5735ed1641630019f8cd2691d6200db227c0299497c107d29285  pipewire-0.3.52.tar.bz2
+sha256  f7fdc30b8c6eba1d7a5740d0e493ed079336037cfd88e71ab04eb92416c0ab8c  pipewire-0.3.53.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 9f93437813..464929f38d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.52
+PIPEWIRE_VERSION = 0.3.53
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
