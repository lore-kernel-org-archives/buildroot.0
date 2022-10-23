Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86139ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 07:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A10560BBD;
	Sun, 23 Oct 2022 07:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A10560BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B8DblQQb1Vo8; Sun, 23 Oct 2022 07:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475DA605EC;
	Sun, 23 Oct 2022 07:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 475DA605EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2455C1BF356
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 07:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3A4081AAB
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 07:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3A4081AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IL9fZ7WpPBTO for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 07:19:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D8B81AA7
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37D8B81AA7
 for <buildroot@busybox.net>; Sun, 23 Oct 2022 07:19:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a3so11120782wrt.0
 for <buildroot@busybox.net>; Sun, 23 Oct 2022 00:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FjyDQ0zMY8I7DTKl8BYfMY2gVreO5IYevWyba1r4s8w=;
 b=A+V2ISg6uGJUs2VMeq4xJESP8fgSd2++S6chCA1KWktCop9cCYtQcAUYal8kH1VgVJ
 36ypyHAe7AsRixsAuf7by6HA8gVjp0FXoGl3i/WyLGrtwbrLFlEcTRUn39oalzajPp9+
 Zt/0+6+FfrMF7f3eUjEW1Klam5mhcsTdS3KHWfBatzBcZ6hbBG76hFLIvTV9zKzcv7l6
 sFQwZfgbEIfs59QSPbRS9OMVK7lryUbvo4EoX9UdUub7JX/kwCzEwXi5DiAroJJlvdCn
 OgXT+UfEVjcYS2QPiFRxU9g1JW0J4BEUDjE7SsNDk7jvnmTSY79rnG88pQwIrIeljNGf
 Xekw==
X-Gm-Message-State: ACrzQf0HDou2uM81JgPa53afLAqB2IOjzFZa/2Z/SX2rkVoW+t1+EdCO
 XlJ3DT6BW6NUxJT7EJ9ICETfhyqhIQQ=
X-Google-Smtp-Source: AMsMyM4k/gyv4LiSXoWL5RhPjktGsPXlWOD+hG7u/H3pDwXThIJPLOtVvegJMaJQl2gYmklJp3YTlA==
X-Received: by 2002:a05:6000:2c1:b0:22e:7b7e:de28 with SMTP id
 o1-20020a05600002c100b0022e7b7ede28mr16863680wry.123.1666509597105; 
 Sun, 23 Oct 2022 00:19:57 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003a682354f63sm4974781wmp.11.2022.10.23.00.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 00:19:56 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 23 Oct 2022 09:19:46 +0200
Message-Id: <20221023071946.433502-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FjyDQ0zMY8I7DTKl8BYfMY2gVreO5IYevWyba1r4s8w=;
 b=pLP/+h1X0HqRymS45UrC3pZnB9qIs0Fw9Xq5DHRSYZigDYVmPPON2qoNvaXaNiUdoq
 CTvNAZf8I3UFnOYhRdhXBXoOmyOxa4/hjkUN7InLmESIvmHfN9ueLB6KiWF3SmDeQVK/
 9nSvA3PMrJm9NemNUd5g5o6DGLb3e6A8ACjVT22MMV6YjB7de7h2+vuJyllODL+NIIrJ
 T0Bu05b+daK7oW3+Gfcj54SUsm50bn//UCU20RCQJUUmfjYVaqskmSMepzQg1VsDsYN0
 vbbaQetcGHSukaI0YTFiEPPmAOMXoigEbQakWfMnp0hoxuwNfzzFbtu/CSQ4bgTHeDwR
 012Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pLP/+h1X
Subject: [Buildroot] [PATCH] package/lua-lyaml: bump to version 6.2.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENCE:
-Copyright (C) 2013-2020 Gary V. Vaughan
+Copyright (C) 2013-2022 Gary V. Vaughan

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lyaml/lua-lyaml.hash | 4 ++--
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index af3d0ae6d..a8599bc3d 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9bb489cefae48b150d66f6bab4141d8d5831fcb7465bfc52a9845fa01efc63b0  lua-lyaml-6.2.7.tar.gz
-sha256  81e4ea1d897e259b31111adc2d3c185fe23e435942ff3e9de8c8c9c5d01247d0  LICENSE
+sha256  c6169f516ff2a8da96d55aa3a087e718edf7bceb2f1cae2def4e65cd2b41ac2d  lua-lyaml-6.2.8.tar.gz
+sha256  796d267e51d61652c55694d21108e7352e98b1ed489ab7516acc07102157e08d  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index 77980f531..00a868ec2 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.7
+LUA_LYAML_VERSION = 6.2.8
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
