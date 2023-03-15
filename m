Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD19C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 09:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E17FC40258;
	Wed, 15 Mar 2023 09:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E17FC40258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qm_FA8HfBBvQ; Wed, 15 Mar 2023 09:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0545D40257;
	Wed, 15 Mar 2023 09:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0545D40257
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6F591BF2C1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90D8981308
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90D8981308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcAUBz4Li4aR for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 09:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6E0812F7
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B6E0812F7
 for <buildroot@busybox.net>; Wed, 15 Mar 2023 09:07:40 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z21so7306576edb.4
 for <buildroot@busybox.net>; Wed, 15 Mar 2023 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v6yQe9TkolrZSoVT02onKy38C55bP7luNC9J5Nf2SUQ=;
 b=WuoNZ5urym6Dd7y03drqCCF9TmGh/O78lE9zXP/Y55VVijQ32x+Sj+6FF1Il+wiLMf
 ArVRcVCX4+lpybsmH6/7w/V8L331sQOrHiM5cNRvCo9PzNzGHH12mcLBMiXB9HLYcSWs
 FBmFLF/E9ZeEucNbDXZsqPnPHz/b7db5IdE/HP+Fsw5ycFqqVr2NPquomViE7JkmyV6w
 l+xv4LkMFmYkvXekJHs35IIpfZI+YwHivkoffz+PLtU1pArmN7LVuYMW3O2rHJ/6sJPI
 WO6OdHmZDXOQw7BZBj44fAblZx0cXkcL2wf5jSUm7abO2ejmEm3fPf0G8LKG5QBxnO6x
 GP2A==
X-Gm-Message-State: AO0yUKWKwMzDtCvsmw7gp5miEb+pCzxBXrhlemtRKoCmC5u71naikVIm
 ZflIBNYoR8uYK4WVoohdJjKlNfTuvsw=
X-Google-Smtp-Source: AK7set8Elypivo5yNw6I3IhLfqnOthT8nSc9TlZp66IWEv1A5rsQxTirzcnyNn2q2rCUh71xwnxKJg==
X-Received: by 2002:a17:906:80cf:b0:884:930:b017 with SMTP id
 a15-20020a17090680cf00b008840930b017mr5631516ejx.60.1678871258130; 
 Wed, 15 Mar 2023 02:07:38 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 kk1-20020a170907766100b0092b8c1f41ebsm2210284ejc.24.2023.03.15.02.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:07:37 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Mar 2023 10:07:30 +0100
Message-Id: <20230315090730.399162-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678871258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v6yQe9TkolrZSoVT02onKy38C55bP7luNC9J5Nf2SUQ=;
 b=AU8NKrTEy7xrKICrme0v6CpC3t1wBnfYy50VqpJ6oTVMs1LSWABM8c/3AL0R39cV0b
 n6PT+msG2d0B4pfTQjsJAdpcIzdbiHwnQrn3CKA4a76GFJJ6D9aV0n2JZplKOtx4wZHj
 LLHyfmdm+ktOgWfCtGQ2h8UTlhq/2XhgfcXp8Oznf1bKadsRvGLMkvbKvuXkw/YGYSLD
 9KLXoGckJGqBeIebPBPLuuwLWfdlteAmOgrtBj4Mkba51vmTb6LS20naTwagQFrIfdWJ
 QGlJ/wfDeJEY0Cd5eIB0yM9enh8i5ufjiivOnyKEviV6s/YDwUSpUcI/zdtwSBCCsWcM
 EIAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AU8NKrTE
Subject: [Buildroot] [PATCH] package/lua-mqtt: bump to version 0.3.0
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

diff COPYRIGHT:
-Copyright (C) 2022 Francois Perrad.
+Copyright (C) 2022-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-mqtt/lua-mqtt.hash | 4 ++--
 package/lua-mqtt/lua-mqtt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
index 3636e9e6a..62f8f350f 100644
--- a/package/lua-mqtt/lua-mqtt.hash
+++ b/package/lua-mqtt/lua-mqtt.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  986ec63dd9f0761f9c5231f6e19529138602c289e13da5c71dc1449f5f247152  lua-mqtt-0.1.0-1.src.rock
-sha256  e86d7c8adfabcb7c6515cc6e524bf0a76f7b3a86560a7ac47d7cabae5f8391a2  lua-mqtt-0.1.0/COPYRIGHT
+sha256  1b5ec0aebb2d41700762e3d6f542517c55b8cf44e323c53d55a47f19e22b664a  lua-mqtt-0.3.0-1.src.rock
+sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.0/COPYRIGHT
diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
index a2f17d2b2..ff889237e 100644
--- a/package/lua-mqtt/lua-mqtt.mk
+++ b/package/lua-mqtt/lua-mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MQTT_VERSION = 0.1.0-1
+LUA_MQTT_VERSION = 0.3.0-1
 LUA_MQTT_LICENSE = MIT
 LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
 
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
