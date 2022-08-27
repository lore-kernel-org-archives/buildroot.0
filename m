Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6210CECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11064175E;
	Sat, 27 Aug 2022 07:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A11064175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8lESE6sD8kS; Sat, 27 Aug 2022 07:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DDC7403AC;
	Sat, 27 Aug 2022 07:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDC7403AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09E8D1BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B8A82C04
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B8A82C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TO0Pqb7rUvY for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:38:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BFEA82BD6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BFEA82BD6
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:38:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bu22so3854038wrb.3
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 00:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oezERZCnU1TuoIgplxpA9H9F+p9T2VUpCaGYpsslOEQ=;
 b=iwoNUfM/ZysN0Lg2sJdxmbLwMVWDhU1PzY+ZUvolXnurEVrdAscgYbbIMVn37lOoA8
 CpC+u1WTVFc/Ujs2vwUFnXt/o2Qb58UZXO7Wz5X/Afypr2F6pW5FkMmBbvG0nw1rlTnZ
 ONGGbr2Vz6Wy5FPCeddsYblKJLVXaZYITDf2IFacbc3f2dISTz3cwVhwqWtheE2y3QXV
 /+u1E1Yavg9ki+QXDRi/HCYhcqTzxTOTCWEZL7VYBQbgPcnJEbqYepEaPg0fCCbRuvmE
 aZaGxHhB/CEgFld2SAkmby1y/u25nbU++6jmQ1HJ2UCdH5yMVbsLhK3ZhDw8rbpUTlig
 0DTQ==
X-Gm-Message-State: ACgBeo2ImuDVvGFGb0u0khiI/4rR8ZA0sL5URFBUv48aSmJUn7Aq5TFU
 EWe5cJrdQ6bphTnonSn0q8FELe6QCI4=
X-Google-Smtp-Source: AA6agR58BleHpSQPAHzlZw9LefhTL3TjCoUdUVHe6g3jCSZ8P3xfAaXophlp4Rx2D1vZLgcnUdjLBQ==
X-Received: by 2002:adf:eb4c:0:b0:220:6aaf:ef5e with SMTP id
 u12-20020adfeb4c000000b002206aafef5emr1493491wrn.488.1661585906692; 
 Sat, 27 Aug 2022 00:38:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003a601a1c2f7sm1851961wmo.19.2022.08.27.00.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 00:38:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:38:16 +0200
Message-Id: <20220827073816.59961-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220827073816.59961-1-fontaine.fabrice@gmail.com>
References: <20220827073816.59961-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=oezERZCnU1TuoIgplxpA9H9F+p9T2VUpCaGYpsslOEQ=;
 b=KVTLWwrU0Cyjplc7dyjNlFEQra5+pC+fK4+MPIc3zAppWreoPdeXWA+P9aYxg5Yxyo
 Cuj5zLxc/afigt6+f615Bx60M5H76SCRxwtiJAWMxkviyUIUJzyRy4g72JV/FmilvViQ
 DA7dkbj1QxDXbvziNAAZDTANMmqYYKr9F6at7XhIqZrUWeyNsRmpkqbdgF67Tg2/4uRA
 a/DokiRTBYJUyKlqNo9fLUUyQIF/OMlxiYvsrSpcWy5uS6cNlC9HEl2mkhupIF8ZLNbt
 Rf0hrAdzEAZrIt6X7LQiNDXSkAkc6wzzOPZSg3SoyTkBYTMXin69GMcJwvZWc1E57tt5
 6OgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KVTLWwrU
Subject: [Buildroot] [PATCH 2/2] package/dbus-broker: fix legal-info
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit bd3cf3fb5b0da97e6d4dd9c9321e44c376c1f36a forgot to add all hashes
of license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dbus-broker/dbus-broker.hash | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index 26ebab7ac1..fc661003b5 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,3 +1,17 @@
 # Locally calculated
 sha256  4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a  dbus-broker-29.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
+sha256  70a742f7a88831ad6e7b94bc27058939af182b59578ac829e928094319764442  subprojects/c-dvar/AUTHORS
+sha256  f37eb9b23d99d56070b41d98d211eb9156776717ea332d4895d7cc6d68440cf4  subprojects/c-dvar/README.md
+sha256  17a927565c92aa664a010f2146d539f5df46e38d98030dea607554df7b9e4ad5  subprojects/c-ini/AUTHORS
+sha256  46b75a7e0e2a6cd233f4066bbbf4ee0dee862c040d4d8431bd77aab4c1e1b16b  subprojects/c-ini/README.md
+sha256  0e7d0f64caa88761647ba5ee21e9b173b5fe3210a6eda67ff00a86eb230f6a42  subprojects/c-list/AUTHORS
+sha256  0dd74d40d3994b0c7441b0cd9725fd39bcedc75f9ca7cb4320202572817c64a5  subprojects/c-list/README.md
+sha256  469aa63261a1b92487777989e449f1552f1bdc7df7804955e9652eb47ca7bbbf  subprojects/c-rbtree/AUTHORS
+sha256  fa140044c88f8a6ca0cf554273a4b84a8e1905e7e0a517835b32f2b4882afb92  subprojects/c-rbtree/README.md
+sha256  17a927565c92aa664a010f2146d539f5df46e38d98030dea607554df7b9e4ad5  subprojects/c-shquote/AUTHORS
+sha256  769b71ceb1c4dee816eeb701627d2893299a6c5c090dadddba1ef678e7e28901  subprojects/c-shquote/README.md
+sha256  9c9c40e94ff58884564fbae0cefd9af0eb2c270d5f25f4666560b89c8cb584a8  subprojects/c-stdaux/AUTHORS
+sha256  481e73f260f6fa1073b7bb91f8f7b46b89dd7e6caa9d0922a5c2ed2dd41d65a0  subprojects/c-stdaux/README.md
+sha256  36438bc0796d76828e104d2766e28effe8c6a1a14f90440a2223b1a2fab6c69a  subprojects/c-utf8/AUTHORS
+sha256  f195e6943366a0b0014b65920a5becb7ed64f0a589b7d55ddb7489a0e5893364  subprojects/c-utf8/README.md
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
