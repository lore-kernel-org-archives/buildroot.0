Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F48AC4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9EEC415C8;
	Sat,  4 May 2024 21:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKuHiyitqmfV; Sat,  4 May 2024 21:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC4DB4160A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4DB4160A;
	Sat,  4 May 2024 21:40:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B101F1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFAEB40605
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgNeFp1R4ibn for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1731F404EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1731F404EC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1731F404EC
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41b5dd5af48so6323925e9.0
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858829; x=1715463629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZaLKcuIxsvbvS89KgbpC2VF+0A+QxJYP1pgkJ0mOJ18=;
 b=orTq6x1pdkPMmXEm4yHxrbnZ+FYRirRZhLzq+X9d7O18oAi6ose3rAqSZHUSqJJQA/
 nkATHoR/3sgzwK3bi7Zoief5KGeu86PEalbeqbPLaExrm2saczOwgMD4tRSwa3w8a+2X
 i5xygIvjKw4bJqdywpjDJ7D8nWZXAju/XqNVVX/VAG60IMCIkIOFb3LQgqLPMiTxRGul
 lb8MY6BLw4y60TTUc5bDFjndK2XgZBaawn16vH3tnCJ5A5F1yNYTyrexB6En44vOYJu9
 19aEy6YOyduZVCcRzR+NRyX/dJInGtdAncA1xalZBV697F4UcCOwXi6hruxRdyjHAG0d
 ia8g==
X-Gm-Message-State: AOJu0YxHhNyAspdf7m2R2FZ/yxvYcIlrd0Yln/4bPo5cFp8HgUegTGY+
 3VphX00vWQ2vIpiRlWhbIuEa5XT7eJ5E3faOYO/2hA6tzKiFp64bSXkM7Q==
X-Google-Smtp-Source: AGHT+IGHKV6CusH7plabhPO5YvZ8KoxOjOZD/YxnWJZRkcuMBFisr1dXQq2qrrB3CLa94DgzTm+1zQ==
X-Received: by 2002:a05:600c:4e54:b0:41a:a5ff:ea3a with SMTP id
 e20-20020a05600c4e5400b0041aa5ffea3amr4243453wmq.19.1714858829042; 
 Sat, 04 May 2024 14:40:29 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:28 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:08 +0200
Message-ID: <92b9d6ab3032e4121bfb5c272de080035d71c2fb.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858829; x=1715463629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZaLKcuIxsvbvS89KgbpC2VF+0A+QxJYP1pgkJ0mOJ18=;
 b=BeqhozkfEr7713ZF0PzZIWBNro1dQdWidXhs+OEM0kqU8hyVf2NssbbLU70eMmBO1x
 G6YBKxOlgD1Qi6YQbQ2WWRnpfQZJxApYhpQMTpU0PSzroWbHjtOC3BcM4/Dljxa1lqu9
 84hDS/XgpDqqOyRaUwz8rDhgJ6QeTsCJjxtPPM1sGPVY+tHBNwajVaalkFhCc3fmYVBe
 Fwi73zPSYpJBCd2s2/i6nQeDCpvo5s11s+3gTcIjMZmNea2EknlgyzACnUCrsSP9/hht
 54inEoaIZ6TP43bG1BpoIIfznYiDxjixBc12KbNc8JLAwe88dDy4vOpnl5WszwJC0/Ks
 /YqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Beqhozkf
Subject: [Buildroot] [PATCH 07/22 v3] package/*: update hashes for packages
 with export-subst git attibute
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those packages use the export-subst git attribute, so the content of
the generated archives change.

Update the hashes accordingly.

For pcm-tools, we no longer need the post-extract hook, as the git
attribute is properly handled in the git download backend.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pcm-tools/pcm-tools.hash         | 2 +-
 package/pcm-tools/pcm-tools.mk           | 8 --------
 package/qt5/qt5knx/qt5knx.hash           | 2 +-
 package/qt5/qt5location/qt5location.hash | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash         | 2 +-
 package/qt5/qt5opcua/qt5opcua.hash       | 2 +-
 6 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
index cfa3faeff7..5be5885d41 100644
--- a/package/pcm-tools/pcm-tools.hash
+++ b/package/pcm-tools/pcm-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  29416f83d1de95594d225f63af34f8f074ee4822010ce2e05b1fabc66933472a  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br1.tar.gz
+sha256  f3eae080e1bdc1f6264709534dff4881fb94d0d78c17ba4c8d0dbd816f6b17b9  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br2.tar.gz
 sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index c530492696..30a8fbf0b6 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -17,14 +17,6 @@ PCM_TOOLS_EXE_FILES = \
 	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
 	pcm-pcicfg pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
 
-# version.h contains git attributes; replace them with the previously-known
-# value.
-define PCM_TOOLS_FIXUP_VERSION_H
-	$(SED) 's/\$$Format:%ci ID=%h\$$/2021-10-25 16:07:54 +0200 ID=93fc9193/' \
-		$(@D)/version.h
-endef
-PCM_TOOLS_POST_EXTRACT_HOOKS += PCM_TOOLS_FIXUP_VERSION_H
-
 define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 031fad5e92..7c78b50615 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  932ea512aa8ceb514ac40ce1fcbebe86c306caff1a0b11320d9a36fd84bae10c  qt5knx-5.15.2-br1.tar.gz
+sha256  df517ec632aca8d95150c73f4c43d1d396452b40d434b5f1969f266f127e1d70  qt5knx-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 0188f51c83..3f80f19586 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  133d28fc0071e419682b7ed736c17b39240545c8e9d6ff7e9905f365bb1eb693  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-br1.tar.gz
+sha256  e94800d108e0f7a05df5586456fa812a0b6dd348623332b5cc8f837ccd206ebb  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-br2.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index f4ea6b7015..cd4272fb17 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  38f2bc1bcbdf76d30d78c86426c85f62a6c2091c997cad4b087039f795b2b406  qt5mqtt-5.15.2-br1.tar.gz
+sha256  eb7b75ab3f8fa6f512c3e2ba05e1356d15bc850977197ebbd3d360528b05281c  qt5mqtt-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
index e55fb17743..dbc749eaf6 100644
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ b/package/qt5/qt5opcua/qt5opcua.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  562171c6dfd6f4f072316ddb6d7c5bcc8907a68ba31005cb8c20ed75beff34fb  qt5opcua-5.15.2-br1.tar.gz
+sha256  61a39fe7336709a9b2068e250713c2eb66fd3460b2c6e5f7bfc569b15b9cacb9  qt5opcua-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
