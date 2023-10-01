Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD22E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 10:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C7B41B36;
	Sun,  1 Oct 2023 10:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99C7B41B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQ0EEEpcFXFf; Sun,  1 Oct 2023 10:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83CF341B13;
	Sun,  1 Oct 2023 10:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83CF341B13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1FD1BF2CE
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 10:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2273A846D0
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 10:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2273A846D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbQvZC-DInOc for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 10:32:23 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7B3D846CF
 for <buildroot@busybox.net>; Sun,  1 Oct 2023 10:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B3D846CF
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9b2f73e3af3so114911866b.3
 for <buildroot@busybox.net>; Sun, 01 Oct 2023 03:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696156341; x=1696761141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sXb+33cbKBPgSCX954cTqpHCdwTo2E+K5YMbY+V8/Es=;
 b=aWB3jKOtB9Q6h3mk8KZ9/pphMR8lpFnuuCcNPAPMVRGGC3qNZSpr1Cx8dGH3XdMUsN
 XXhXoqfOg1e1EUI9R2giTML7lhWTYZoWZcFjFuqMPhggflh8MENLnw19FTap78Et7x4C
 xg2erye14l6yxxnmymxPL/celCvnQpUIWBlknZhbmFBixtvzoDtRDWWZfrJKUwGUaVLn
 eqSzUvrYFEbyd8onVwvAp7nBnq6+qAocPoJ6ON9CbT/JbSYEwzUhYquzi4yJAwuRS0wU
 OJ02gGFDVpHnHGhSZBaOYglI9WdSYxyrJ+ylv5gvtn6LnaEiv/IBACh9R8tblaIzXaQ5
 uK2g==
X-Gm-Message-State: AOJu0YxjegurOAmg2lPOU1bmXkj5C7Zhc3sbHtVXchk3MbhuPp0JqIH6
 N3sjsOkHSDwjk/KRnsymryVjB0+jL3U=
X-Google-Smtp-Source: AGHT+IGp1O/5bgg27Hkl81y6Lm8bQQqkORkUjQlWMfwSlo2Frn+VUMznM/Tez8ppR3MPGJcE7yiafA==
X-Received: by 2002:a17:907:77c9:b0:9ae:1872:d01a with SMTP id
 kz9-20020a17090777c900b009ae1872d01amr7952822ejc.76.1696156340595; 
 Sun, 01 Oct 2023 03:32:20 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170906540900b009930042510csm15450673ejo.222.2023.10.01.03.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 03:32:20 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  1 Oct 2023 12:32:15 +0200
Message-Id: <20231001103215.3333968-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696156341; x=1696761141; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sXb+33cbKBPgSCX954cTqpHCdwTo2E+K5YMbY+V8/Es=;
 b=A9okjle0PiI5Y0ZEb9CVWj31GgmLlwyWMonnbVUm4ZJbM+75BYtV5pQ76pG1w4GGK9
 EIpaqD8uNcGlK6n4Etap5IpyZy18CCsRO14r/e9z7WJKfKvPiSehH3rVQPnugbDzIr3E
 gDcR/PU300gEdBBmg1hAni/ivPORlCKOdgLyEhhfI38U+ogvXc4BNdHbUlX157fJOrU9
 l8i5BHKWG021NGvddR1P1gSRHQbNb5f9Y9l+eLJojSTCnKDRxXmnviR1DktPbuCxUUbf
 xfKp138h/GNEe5oUaCm0wBtJ0pw5EEoM82P0y32oj9mEwXOZMv6gSjpTbPEdWZoFaQ7Q
 qFJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A9okjle0
Subject: [Buildroot] [PATCH] package/lua-mqtt: bump to version 0.3.1
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-mqtt/lua-mqtt.hash | 4 ++--
 package/lua-mqtt/lua-mqtt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
index 62f8f350f..fecd4dbbd 100644
--- a/package/lua-mqtt/lua-mqtt.hash
+++ b/package/lua-mqtt/lua-mqtt.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  1b5ec0aebb2d41700762e3d6f542517c55b8cf44e323c53d55a47f19e22b664a  lua-mqtt-0.3.0-1.src.rock
-sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.0/COPYRIGHT
+sha256  0444119ab5a1230e38e35f3948db19e8dc6310991b419ca75e6660588f2d95f7  lua-mqtt-0.3.1-1.src.rock
+sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.1/COPYRIGHT
diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
index ff889237e..a000ffdb1 100644
--- a/package/lua-mqtt/lua-mqtt.mk
+++ b/package/lua-mqtt/lua-mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MQTT_VERSION = 0.3.0-1
+LUA_MQTT_VERSION = 0.3.1-1
 LUA_MQTT_LICENSE = MIT
 LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
