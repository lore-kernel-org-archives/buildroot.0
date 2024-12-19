Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87025E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 15:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D3AC41744;
	Thu, 19 Dec 2024 15:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DT59TzKSYoPH; Thu, 19 Dec 2024 15:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0531B42554
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0531B42554;
	Thu, 19 Dec 2024 15:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB84A730
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C8D3838B6
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Q7voO13TNVv for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 15:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF62E83B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF62E83B0E
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF62E83B0E
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:24 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa5f1909d6fso146940366b.3
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734621682; x=1735226482;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9Vo0aHA72neRnm1nwU7u1dR4Nx5V09umqNiLLXMqXE=;
 b=LSu8AzwCkeJRgqxN+xyvtR9i+sKneqXknKuQq+RgQtgmzyxBrTNb81BuHmwXuqILyS
 BP020dGQAv13cM3NSrYVXwocoGC6q6oIAtwYyJskoGZIJ67qLiXv5YzosLY9T/OsYUAy
 uODxCnFMsmGYgrMMj/j52w2JAo2j8OXmROucxrMUdFyWa8+GUyn/vROzXcRsk/eHv+C2
 gIMFptmSHM7WMmTyxa4aewAxCnkyj7TvwWXau7ARPuhff8LxEonRAYjLqKcWc/yEjpe5
 J9UEaVMS9kL+hqRnxo33lz28V70wq/C6pn1AMQiMOOwvms978uBsY0Lo4koR7u+AVJ93
 7ysA==
X-Gm-Message-State: AOJu0YwtoD7dJZ2H4i5i6Bw2XP/d+kvaGq7gEPYLY2w9VTc5y/qtWXvX
 4kGuZJ9IIQN6o8lr/z/npcBWgOFxtWyfgQ+hi7Y/PKdf9kwAio+75lazUA==
X-Gm-Gg: ASbGncuxW0hUMhpp52mAwZ9oGHz+XEL4N+NzNKrL+z+uH1Ffm//DLhlyQYJY3acQGWf
 mCCBdpjCB/VzmxoNz7O03ymy9GC67yARD3Ol2dHa1LYBdYFTFbJQQ+v/pe8TWKEKnOgbzF6fByQ
 bbz6nX15Dz1qVVZRyDDt5VC50gHeakgFl3Lb0lHLs4i9lvxuDBPilb3EgFAx6lXvLRO59KZlDgP
 AzMQXr52dvjY/vdRr1HfBdIqE9su6ceWaaQghr2+BsRfv3YHyoespn7k+krM7QZMLVvcXziJA==
X-Google-Smtp-Source: AGHT+IF1hWu5IBHfIWkduxY8aEjXmeHQCiLmMoR4RoDtGlrYPTv44eX5puRmowJ0tT3ilvvySn3rnQ==
X-Received: by 2002:a17:907:6d19:b0:aa6:5d30:d971 with SMTP id
 a640c23a62f3a-aabf4710d76mr560332166b.11.1734621681798; 
 Thu, 19 Dec 2024 07:21:21 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f070a7bsm75504166b.201.2024.12.19.07.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:21:20 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 19 Dec 2024 16:21:01 +0100
Message-Id: <20241219152105.298310-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734621682; x=1735226482; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I9Vo0aHA72neRnm1nwU7u1dR4Nx5V09umqNiLLXMqXE=;
 b=Ddn8owmIjprRYjMz/qG6Xnwx8r30beQoHHd2PhMVnZ8wd850/bv/D6eFe4eTmJonA4
 0XdLY3dBM4pv9p2XLC4ziKQdwOPSakGOGe3fj9gvon5buc0umkHiCTA3vP6z3fRNFSJP
 voAkQsY5Dk5woXIlq7QzUCb9Kg3GzBgdScJj8gid6xyJMllYK6mubcsNc2HvgVWcTauZ
 3s4SX3KrjndHF6LHyX7oUboXJUH4UpYdCwy0duMR4yO1WT2X0a5AZRoRVFVjtWx4Py6v
 8DszxnA/eyTMy9D/8pC/6qZm4ZuBTeBZK8bboqK/wsH+7AaC3EocAebE7DYn4t//WdGj
 okbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ddn8owmI
Subject: [Buildroot] [PATCH 1/6] package/libyang: bump to version 3.4.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

The LICENSE hash has to be updated due to copyright year change.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index e03278adfd..eb8388166a 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
-sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
+sha256  2767902aeffc55c55767f4ecfe5371c422174794edd8aa2b02028d5fe3f8b82c  libyang-3.4.2.tar.gz
+sha256  f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index fca0cd63f8..2f095c7e9b 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.148
+LIBYANG_VERSION = 3.4.2
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
