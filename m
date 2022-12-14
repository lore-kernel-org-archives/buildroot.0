Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FE6C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 14:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD13D60BD5;
	Wed, 14 Dec 2022 14:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD13D60BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WnePOcmDU21; Wed, 14 Dec 2022 14:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C4F0605AE;
	Wed, 14 Dec 2022 14:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C4F0605AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B10171BF470
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8610081EA4
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8610081EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLqPKMIPpu6K for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 14:47:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A97E081E9E
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A97E081E9E
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:47:55 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id z9so6618623ilu.10
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 06:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6akNTJeIMyIuoApJvJLdfT3KHIgp9kV58wROSzejqLg=;
 b=q0V51wNphfAq9k6te+HULZtFKbkycSfabUzbMz1gY2KffSQpwNkMt/6QUYuSAd8ZsW
 HuLFK7/FEFytHXSa3ynSH+SLjfD6WthHTLnjlYB5ZhBL4PxGgPkn5ycW51g/Oz4eug8M
 VAlZkYfuX34+TG/l64rzUVvdZRW0ykpDzsExY355qj604j5mmmmdy6EzUYZSAF364CdA
 MgoocL7bICEhs1WSNhU23NFnNcGnIvbz4I7fGAZDi6+neXUgK/7U3RFrDEJ1drZg0Kns
 lV2FLxoUKzDH+YQqzxCVnXNx/zA1Ufg+e94qyhb9a2pEzKwtKwcmD1Iy2nRSb76ymThN
 EL8w==
X-Gm-Message-State: ANoB5pnUlHZaQkGZn9P7Q+DTlUpSk3HoV8ue8TFbZ/FnD6X787JjXZiR
 BLerruPOOFMxAuIwsx4EzAfVc3TrTVr28XKB
X-Google-Smtp-Source: AA0mqf4HsAIYlJMzaW/hC3qFHqk9ijeX8b51f2QoQOxhCrU0O7TGir4vKvuVcTYL91dgu6dK1s0qUA==
X-Received: by 2002:a92:da08:0:b0:302:b411:fe2e with SMTP id
 z8-20020a92da08000000b00302b411fe2emr15683735ilm.9.1671029274472; 
 Wed, 14 Dec 2022 06:47:54 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 7-20020a056e020ca700b00300f4e0d41bsm4643793ilg.57.2022.12.14.06.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 06:47:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 07:47:52 -0700
Message-Id: <20221214144752.3009430-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6akNTJeIMyIuoApJvJLdfT3KHIgp9kV58wROSzejqLg=;
 b=aaLKHGoa1sAreNmJAUBiOAux3POsdsA6oPb9CcVb2y6ts2KD5bCVjbV9SZuWU0FXpL
 KiDn+wdu84yzoo/nkDpDojMWYmFp6e6qJ8v9X0eM5VikUNNqJYy6KFYheRmthNt8kg6H
 D3jlW3SWEl4zGNhgQwS4L3U/iAmNwQxGQah+HpikR6FsmcE9693hUvV/koTJDNunuYtL
 czIDjbk9ZWPuuVq1y38N9fekR1GwI7klfBfo58mhuRekDU+x2mP+JHA5TbgSZXgeUb0Z
 /GVnm60rWfBJ9QSe6TTczDGntE4tsiRR0dxtykspAqbiRJQA/D9/bXd3SQLIqT0uJGCf
 x6uA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aaLKHGoa
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to version
 1.31
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
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 8884babbc0..45c62a396b 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042490.html
-sha256  c7659fb6bf14905e68ef605f898de60d1c066bf66dbea92798573dddec1535b6  wayland-protocols-1.28.tar.xz
-sha512  092454c6a7e5cc47729de49e9061fb91dfdc5610859e17c495642806ca14dcfb3850a5d3a7459ddb70b2adb08d2590d4b0f92c3a97600e48598682d59adb102f  wayland-protocols-1.28.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042524.html
+sha256  a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238  wayland-protocols-1.31.tar.xz
+sha512  402ce1915300e29afe554d77965ee0a28a5f22fdb5b901c4c640e59b9f3a9c11094e1edae87eea1e76eea557f6faf0c34a0c28ee7f6babb4dc3719329c4e25bf  wayland-protocols-1.31.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 830136ce06..54f9ed8a3a 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.28
+WAYLAND_PROTOCOLS_VERSION = 1.31
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
