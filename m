Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7E2E82CCC
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA9C40111;
	Wed, 27 Sep 2023 20:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EA9C40111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMYs8ysGmOCk; Wed, 27 Sep 2023 20:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25C6E419FE;
	Wed, 27 Sep 2023 20:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25C6E419FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D85201BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1C4981A58
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C4981A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lvotv3JMv7xE for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:05:48 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9948281A50
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9948281A50
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so101754435e9.1
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695845146; x=1696449946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oNoVbI3q0G3vAaInlQ/K3rKmmsfHRDPS+WfMGQd0Nb4=;
 b=ChWT8XuzWXH4O7TUtnJV0Xebvjg7GWZbbidiZIeAKvLYXmp8w4tLQK/Tie3lvk2wDN
 njhB5wtGtdLVgJC3xmofWvuKqCgtNL/rWaj8z1EXmjEDeUkjBxt/NtjzY34xyQcXQjP9
 gg3yg1w5UYmWD4y94k+MYVIhgSiCZs6ftDaPm4nN970UdZAyJrXhMGBDPZIph9kg//eN
 KIyDGTND5DSnfMdPJKOIfjCWa/+NEBLGRywRyvzFk4Bg7Uurb1TOuZc1snNDU4D0up36
 PQ1FDkU6V/2YCRb/gHLX9XA4fCU0OnjoNLRefqVDT2PY6m00mA1RkMaML3OBit2VIyrW
 tJtA==
X-Gm-Message-State: AOJu0Yw5ubH90C30QBALUMLhyz6E409ckGx36uaknvo/GsKMFPfbkadp
 8TnAbJBsFYiFRQj8fA1wdcpUhxS7kvI=
X-Google-Smtp-Source: AGHT+IFsCpe9uweUpMU23VcNbYC5HHqYI+jKpwV875OJxzbK2hv+H/2eU83e6hhW8VaulAIxZ6JPfg==
X-Received: by 2002:a05:600c:2158:b0:3fb:a0fc:1ba1 with SMTP id
 v24-20020a05600c215800b003fba0fc1ba1mr2768763wml.35.1695845145888; 
 Wed, 27 Sep 2023 13:05:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d68c2000000b0031431fb40fasm17825173wrw.89.2023.09.27.13.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:05:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:05:43 +0200
Message-Id: <20230927200543.490971-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695845146; x=1696449946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oNoVbI3q0G3vAaInlQ/K3rKmmsfHRDPS+WfMGQd0Nb4=;
 b=RRHAM23C5cQYHrUH0YLUaFK3iNOo0N1sBXfmdo2h6YrXJzq0h128AZtI9qNYjUEC3a
 yH9VD8z8pC95/iXiYNKM2jEbWF0OtwEB1hxQCiBlB0zbFZZU7yU51TinN5jJgxyCzHeL
 MqxatT0UWPUV8gARPe+oedYoohjFII9NJuRpjwmSf1jdBghKScT536chb9B1KOQMqXN6
 atbLNOhNdwfOkjZm9z1oe6gbiTilIceA7R1TWKdrjlEHWWZmVsRKr18ciX0lm7bN/zoK
 bsO5A2y990XvYo8BYGyOwgEXLtY7tvsTNxoFQBJ1lnDzIEASUb5zx8ZieFEpLySor7WO
 D70g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RRHAM23C
Subject: [Buildroot] [PATCH 1/1] package/json-c: bump to version 0.17
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

Disable building apps thanks to variable added by
https://github.com/json-c/json-c/commit/bef40a342e98d090afff35ef565b41b22ddaa9a7

https://github.com/json-c/json-c/blob/json-c-0.17-20230812/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-c/json-c.hash | 2 +-
 package/json-c/json-c.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 44d068a8b4..c9bb8c708b 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256  8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b  json-c-0.16.tar.gz
+sha256  7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6  json-c-0.17.tar.gz
 # Locally calculated
 sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 9af7f9a83e..517acee4db 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.16
+JSON_C_VERSION = 0.17
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 JSON_C_CPE_ID_VENDOR = json-c_project
-JSON_C_CONF_OPTS = -DDISABLE_EXTRA_LIBS=ON
+JSON_C_CONF_OPTS = -DBUILD_APPS=OFF -DDISABLE_EXTRA_LIBS=ON
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
