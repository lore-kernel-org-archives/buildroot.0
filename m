Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449F2C38145
	for <buildroot@archiver.kernel.org>; Sat,  3 Sep 2022 13:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEF8182A72;
	Sat,  3 Sep 2022 13:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF8182A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQHQ1Z9-evNk; Sat,  3 Sep 2022 13:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C93E8290B;
	Sat,  3 Sep 2022 13:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C93E8290B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF3161BF616
 for <buildroot@lists.busybox.net>; Sat,  3 Sep 2022 13:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AC5C81B9A
 for <buildroot@lists.busybox.net>; Sat,  3 Sep 2022 13:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AC5C81B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xt6esWhEPI-E for <buildroot@lists.busybox.net>;
 Sat,  3 Sep 2022 13:58:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E035281B25
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E035281B25
 for <buildroot@busybox.net>; Sat,  3 Sep 2022 13:58:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c131-20020a1c3589000000b003a84b160addso4286791wma.2
 for <buildroot@busybox.net>; Sat, 03 Sep 2022 06:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=pR3B2pdclJUAOqcR5gBn2OLYpabsfix8WPxhdzg2RWg=;
 b=sKjzHdMsc5lTCKVXJT6fEVzI/Z5Et0TAYvfPnfX6znUFZpMcD0fq9XgzzGfS8b8XFg
 f94fBxql6FW23mUQZUW9y5wsVVcDe2HuLj0hLY48Qf9DW1KOw0HXv9QJzZgBuUdkaRqD
 bz8S2QOB50gObCzpsbNS3+wMNIOJs6ANAPfTJxC4ao2v72qB/rN52ss7MEZIHN/gWMKm
 +ib7vVrYAz7AqQrBriIHmKY8RpT2JnDFXVZRvcBuiicQhuNYnqeQ1lnzmph4CPXk+D4w
 M1Be87V1/KC3cmYf47tXpgRqGbP/mwzqXwlHIOmxI76J3w3iQqIgAup4MhbrhftOpudb
 2H0w==
X-Gm-Message-State: ACgBeo1AOjmU7T73L4XOki0k6qgMTqu9DHl8F1DP/u+iasVtK9y4RT/V
 aKWLwLZ4gaNzAGP6gojkaxiHprnHshs=
X-Google-Smtp-Source: AA6agR5i0ED/1l4T7W3Wv+W1YyyI2F8lcqm8bX2Z//wn056itOB9bxfitvcrEsjeLcRzVwvdtt/4iw==
X-Received: by 2002:a05:600c:3d8b:b0:3a5:b66c:240d with SMTP id
 bi11-20020a05600c3d8b00b003a5b66c240dmr6039008wmb.203.1662213536024; 
 Sat, 03 Sep 2022 06:58:56 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a05600c4e4700b003a60f0f34b7sm5324449wmq.40.2022.09.03.06.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 06:58:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  3 Sep 2022 15:58:51 +0200
Message-Id: <20220903135851.2001980-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=pR3B2pdclJUAOqcR5gBn2OLYpabsfix8WPxhdzg2RWg=;
 b=oi8S8gS6zTIIlWqpwdX3pIKEM6YhTeGpkRr//LxBJgHMPAlJZ3jCh4wRkIqixxA/+y
 MYgqgq1TnJeHhnCX7LV76A/jV7JIcRlQJMIoY3WlwkyWSL/bY0+ymI9QLGy2rNlJkOAj
 froG8BoOd5owMxLEuB2pAbPCx55klwfyWZ9gaMki018D2BL1dZqJHHlI4Q5tKQO6V6ui
 /eaHYD6oZB8UKU8goIO9M0xvwWyIHUl9eXNOI+UXcr/yROCsIL7zHW9QMNjAomWibiw+
 N9U3O2Aaezzhmf//4IRDC29WZqHqNCUAc7Lzj1uHSG1TGFbEbC6nAfUaT/gpRAFwHwrJ
 7ryA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oi8S8gS6
Subject: [Buildroot] [PATCH] package/luasec: bump to version 1.2.0
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

diff LICENSE:
-LuaSec 1.0.2 license
-Copyright (C) 2006-2021 Bruno Silvestre, UFG
+LuaSec 1.2.0 license
+Copyright (C) 2006-2022 Bruno Silvestre, UFG

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 1e381612b..3c2b7d803 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  7ed5d08aad8f0e8659abb3f43c935da1c898474d4dc121e9edfbeae5c4c67fb0  luasec-1.0.2-1.src.rock
-sha256  84376baf33cefbcc1e9adbca23fcf87f51c1107956660cda2880feaef86d6075  luasec/LICENSE
+sha256  82d9ea7d11688a2b11fc1c4549a2e7b0aca00790b49e67a41dac0c81f2890f1c  luasec-1.2.0-1.src.rock
+sha256  bbf73e23eae7df57a4c4ff33bc23c41a2dc4f8707ba33235c2026d20b41405a7  luasec/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 4ace94d16..c7f3a94d9 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 1.0.2-1
+LUASEC_VERSION = 1.2.0-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
