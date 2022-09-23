Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BD3ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 00:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DC360BB5;
	Fri, 23 Sep 2022 00:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75DC360BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFu0uNN2wRzf; Fri, 23 Sep 2022 00:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1FB60AAE;
	Fri, 23 Sep 2022 00:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1FB60AAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1AA1BF286
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 00:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5112060AAE
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 00:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5112060AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtGepKb0cdVR for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 00:38:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5020060625
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5020060625
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 00:38:45 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso7330848otb.6
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 17:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=g+y/mteg27DJzDvnPT0wsfegfisiqEqAj3YSRBHCeuk=;
 b=EpWxWaP9PmwqtJBlFT1VSwxJEkf7qVwme9fkCAdmCQum2efPEEg67zefjxtbquIipq
 6ldPKKed8SkwfEOpokCps9DrSOxs5zWmOTVMEJw2o91rDUYlc4+IhIxNeSwikGpZyNiK
 lyVMtbupueZLhCA9+2vnm6bXEs756+0A07Vb9ZK3hFUouykbZuWLF7SZYs/wYRNC8wsC
 XbAFca/y+U061j6E09lm22Kh9wVkufnbuzKaT1885dx5vd6/q495P6avp1JUdjUWYtJ2
 ulKwKaB+bLtXJC+8XDqZrPpTXsv6F5Qo6uyzNE0P/Kv7lK6AxcqcCHRYmMoykxSeOzZy
 y4lA==
X-Gm-Message-State: ACrzQf3LVc2mgo1OgiFlcqI88Zv+0+ozaRYJqsCPMj/AmX2zf5mbt1+F
 NrBUD3x8ICcfibVoPgG1nHBWSSkZdLJHAA==
X-Google-Smtp-Source: AMsMyM67ARJOrLYuJEhnLa71AQqacI73BbUTSUpj95CaH8xGE0zcrj8kU5c/7wYyEOFagXIJDlWYTw==
X-Received: by 2002:a05:6830:1cc8:b0:618:ebac:c43f with SMTP id
 p8-20020a0568301cc800b00618ebacc43fmr2919699otg.45.1663893524051; 
 Thu, 22 Sep 2022 17:38:44 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r7-20020aca4407000000b003437e4f2510sm3077546oia.11.2022.09.22.17.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 17:38:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 18:38:41 -0600
Message-Id: <20220923003841.2976079-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=g+y/mteg27DJzDvnPT0wsfegfisiqEqAj3YSRBHCeuk=;
 b=P2ZFh9+co2+q6bb2rxgztBNPcbbPWnDVVxMXj/eE4VTCTVOOXiWmZe2SWcNAoBCUTl
 JNjxYlOnpcJJSvZoqG/2f/RYR2mQ4xmfRmW6LgrbT6HX6bJrp1e+DGut2oZ7XdB9OxWg
 mlqqTgAN6dLl80lREjFarjHkVohmb8tXXlKIxUzrAz9rZdP0kA8E1f4z1sZYg0i8aTOK
 /GXsi96PiP8txql0LKrCl4NNAqCR3zgUmrWSFQsy2lxM2vGYaWZ1vEZWVJX3EdTgSqDd
 RMHgJ/kHVxkQNtbV4xMyYYt4rNawS2F8ZIGY9Qv06XfUSG7hbNcUOPUzH62+nJqnufIG
 esGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P2ZFh9+c
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 22.7.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 149cb6bb50..4ae158be03 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  9087a228146cd58c6fe734540ba1aa79  autobahn-22.6.1.tar.gz
-sha256  fb63e946d5c2dd0df680851e84e65624a494ce87c999f2a4944e4f2d81bf4498  autobahn-22.6.1.tar.gz
+md5  2921fb2bdea60b4cb36ccec367625995  autobahn-22.7.1.tar.gz
+sha256  8b462ea2e6aad6b4dc0ed45fb800b6cbfeb0325e7fe6983907f122f2be4a1fe9  autobahn-22.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 6bf71f7a00..fb3a7b84de 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 22.6.1
+PYTHON_AUTOBAHN_VERSION = 22.7.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/62/af/1ec79d8f1ac2f92554428688986522abb919baa36c64d04174b5588b22c1
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/c5/b5/c92d6640fd55cbbdd97c05800ab534d84197f7b485d89a9df981ab67cce3
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
