Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25927C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 06:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A19764055C;
	Sun,  9 Aug 2026 06:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id of9PugwDNq7l; Sun,  9 Aug 2026 06:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002D440531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786255556;
	bh=eNV+CpY8W5RT81mtEoA2n7lubsYwHnLuVK7NAaKSqNs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gt7C/Zobg7dEn8yQuUIDlj4pZYkb+fiBt31LUrL9u+MjOncQx6TbsVhw2KB2zKSNZ
	 QiweWBAqTPEgty8RH64qVfq4rB+6T87qWBGs9bjVZlnQFizv5CRi8pPohw3PA+fnnC
	 SkF9Ni0yxRANoT+jNmQg3PyT/j8BsRAurZcyHsji4Ioj/aShi3ndjIvFW0OWcUCc0o
	 b4B1acBPKcnV6PmRhwePJCslUO8VS3KYuOutclfWc5DMbvxNK40MYoKz2kQaDuWhS+
	 y3VRSHafqcM/kSe7MLSjRtZLNSPQTc9PNsNtgWI2nJo1h+ila1oqsambVWK/91p38O
	 0A+htOKEriTtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 002D440531;
	Sun,  9 Aug 2026 06:05:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B8CD2B6
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 06:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D30280ADC
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 06:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQ0Co2NHPL9V for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 06:05:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=ocd2057try@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5A3180AC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A3180AC7
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5A3180AC7
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 06:05:53 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so9578025ad.1
 for <buildroot@buildroot.org>; Sat, 08 Aug 2026 23:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786255553; x=1786860353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FZv0ARzguwZEJAxugchqDVMJIm2e0DWSi27UPhwuEy4=;
 b=quZN8q/7Pq19AxmCDM9iaYCS8caJpRR/9gm80hJc1M1rOFTl2/fc1OaeVw5X7kuUOj
 zeHxBX+ZpLphrKGkJ8l0qHs1baNhHcs4+qVqhNZA5J2xMzzlIz7ipOeNaKQbn81+/BXp
 xXzKtynd1hKRHvdfvWSFeYugiXsRnlWJQ010gazn4P4jmYIJr5vDfmAcPSbykCbN46D9
 fi4qXMUz3/mACMWMS1Yw1WqgJ3IQOEahzuVgy8CHIJUTUguT+FrmkRFb/2WgnZukoUmW
 D3Jqv31TRVSMTmL8X6EIy7A5iaarsFL6MieyPGZvjxFl4bD0BEFvDD0rV52QMInWzP4Z
 UHrA==
X-Gm-Message-State: AOJu0YzU6mBgr9597tiXeXxiALxcxWfO1YoXV0qgr0R3gAcauGiPHJVa
 MoFfttRSttK6YXKQeXwBzexnAtUfhgDYw+7/b8trTcIDzYKpY8DgqArSvq/4TfwupQydkg==
X-Gm-Gg: AR+sD113MoeW9trpF0Zo6ypHP8eYv7qJqY7jhLXmNkQjaVd7yTIfknjU3Vx0+Ppep5p
 xidVPcOrtVSADENGWZqUlXLYqFy26b+BLkXlXrNUvoOMiCvdv2vjEC+VvX+rK+lZC83cUATIkai
 VG5iQzpv070E/nn6cokBv4GVSuHlSq61Vo+TRQgKWvjfzpeDoTxq+2RMGY7Ea+5f74D/zke0l+i
 ZZFVcoF39picDeWFNXrj8St8neVxg/bpvUuIkn77XYjkH1psuim9lVoLJWcFhGGH4Z6GG8a3qUJ
 lhUQZ0By4Ebl211v1n+qhxKVr8h4nNXktCyZumayj1BnFZ0buj8SKn1aUccMC7jtOLCE/6z55qh
 cYSMLc2Ff/SGLKpfKi20QdNHRgi+sUApTTp6wC5iO7OjzN/jfk6rVVZns/NGH3f7Dik9iHbSPHm
 cnSendqPkcB+ZjdFhJLPBp9ML0RS9JJ0rQdPd/oq16tu4CDJmudE6vgPk30OAlOBo+SA8HmcMFv
 IRlfH4j5a1yAfLQzlcjN8URAABSJeQauQQM0lQ=
X-Received: by 2002:a17:903:1c8:b0:2ca:e19c:97b with SMTP id
 d9443c01a7336-2d2a8451b7cmr132196475ad.5.1786255552665; 
 Sat, 08 Aug 2026 23:05:52 -0700 (PDT)
Received: from build-amd64.. (wsip-24-249-245-104.oc.oc.cox.net.
 [24.249.245.104]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-315bec2ec20sm32455628eec.28.2026.08.08.23.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 23:05:52 -0700 (PDT)
From: Conghao Hu <ocd2057try@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Aug 2026 14:05:40 +0800
Message-ID: <20260809060542.31279-1-ocd2057try@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786255553; x=1786860353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FZv0ARzguwZEJAxugchqDVMJIm2e0DWSi27UPhwuEy4=;
 b=cfl9VlHaDiNwZot1sfTTjX98bgfto16ROznBP57p/3+31hBZ01c/+3T4pACOskjP6A
 BVbH9ED+gX5vyFroP7gEazRyu4G257Tp4mcAmeBZVFu9EUotLrevzTrpUJCwf58kXAgj
 tW7zhAcLOHVjpKz3l5H18QzFdEbv1Uj5kCSE6tNTsck5vGY+cCFO3aj1eKU3hgaDeTpw
 OIuEcvgcxfE6o21YSW4zdy1gJDoXDl9EC50z2ODTKzDqbadx5iScCWDYCNny1pdhHejP
 1uVZCTto03MxaaLLkjC9L1zlOza4k7HYhNs8bxrypZa9z5wUdb9KlLoCiTEE5q0BU8+Q
 GzWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cfl9VlHa
Subject: [Buildroot] [PATCH 2025.02.x] package/qt6: bump version to 6.8.4
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Conghao Hu <ocd2057try@gmail.com>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see:
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.2/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.3/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.4/release-note.md

Qt 6.8.4 LTS source archives use the everywhere-opensource-src prefix. The qtmqtt and qtopcua repositories use the v6.8.4-lts-lgpl tag.

Signed-off-by: Conghao Hu <ocd2057try@gmail.com>
---
 package/qt6/qt6.mk                                     | 4 ++--
 package/qt6/qt6base/qt6base.hash                       | 4 ++--
 package/qt6/qt6charts/qt6charts.hash                   | 4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash         | 4 ++--
 package/qt6/qt6declarative/qt6declarative.hash         | 4 ++--
 package/qt6/qt6graphs/qt6graphs.hash                   | 4 ++--
 package/qt6/qt6languageserver/qt6languageserver.hash   | 4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                       | 2 +-
 package/qt6/qt6mqtt/qt6mqtt.mk                         | 2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash           | 4 ++--
 package/qt6/qt6multimedia/qt6multimedia.mk             | 2 +-
 package/qt6/qt6opcua/qt6opcua.hash                     | 2 +-
 package/qt6/qt6opcua/qt6opcua.mk                       | 2 +-
 package/qt6/qt6quick3d/qt6quick3d.hash                 | 4 ++--
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash     | 4 ++--
 package/qt6/qt6scxml/qt6scxml.hash                     | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash             | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash           | 4 ++--
 package/qt6/qt6shadertools/qt6shadertools.hash         | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                         | 4 ++--
 package/qt6/qt6tools/qt6tools.hash                     | 4 ++--
 package/qt6/qt6tools/qt6tools.mk                       | 4 ++--
 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash | 4 ++--
 package/qt6/qt6wayland/qt6wayland.hash                 | 4 ++--
 package/qt6/qt6websockets/qt6websockets.hash           | 4 ++--
 25 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 33cbf7551f..056e30fac1 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.8
-QT6_VERSION = $(QT6_VERSION_MAJOR).1
-QT6_SOURCE_TARBALL_PREFIX = everywhere-src
+QT6_VERSION = $(QT6_VERSION_MAJOR).4
+QT6_SOURCE_TARBALL_PREFIX = everywhere-opensource-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
 QT6_GIT = git://code.qt.io
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 94269047c5..57707befbf 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtbase-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf  qtbase-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtbase-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  532dfbf3fa3cbc68fa37441ea9e81c5009da044eaecda78ffaeafd8bd125532f  qtbase-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 215d18c576..3fd8accd59 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtcharts-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2edea3f16e248ef508d99332798645b7f5ab6edbbf2e3d7d78fb674156f07d29  qtcharts-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtcharts-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  2120c2927c8a72dcdd55082e9464ddbe6409f1b2b5a3e97331e597e9d6a3b531  qtcharts-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index ba13da8d4e..91ff19f35e 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qt5compat-everywhere-src-6.8.1.tar.xz.sha256
-sha256  05c8c088b4cd8331fa8a9c8b7ff7c42a088cb112e673eae5708048d0131264fc  qt5compat-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qt5compat-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  9c1e9a3801887eb986d0bf2e09bbaa833ec1275cd315ef7aff23d14c37ec1081  qt5compat-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 81b8ca929b..6dcf206930 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtdeclarative-everywhere-src-6.8.1.tar.xz.sha256
-sha256  95d15d5c1b6adcedb1df6485219ad13b8dc1bb5168b5151f2f1f7246a4c039fc  qtdeclarative-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtdeclarative-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  e4e68aad4c07fbb9da670ecd621fabe51b56a2bfcce8da775653bdf8dcd768fc  qtdeclarative-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 59d35d9e66..99652991cb 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgraphs-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1e46e3de69936835652ab40ef8caf5824ea71e26871274561fb65ec142d54a80  qtgraphs-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtgraphs-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  3b0a2502c88ca02ae57814f432b46155d56f1e4fe263352e31260a9ff5fb2ab5  qtgraphs-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index a330ecb323..0ad4652327 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtlanguageserver-everywhere-src-6.8.1.tar.xz.sha256
-sha256  865e9436c1432a53e38a30625b6cee60bf72553ff508047115513a233c8e6d7e  qtlanguageserver-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtlanguageserver-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  747a8e406d6b67c6b724f35a34849489ca7859161392e9dffa979113fecc6ac9  qtlanguageserver-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index f13fbaab9c..9cea2ae2f1 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  757c96a645b81e858c19b5407d54b3a40ee288d04ffadc9a96dd52e50c6d8d6b  qt6mqtt-6.8.1-git4.tar.gz
+sha256  ac5827afaa10bfbcb3e473d53f422715e53b6732d19987249195c17a534e0f1a  qt6mqtt-v6.8.4-lts-lgpl-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.mk b/package/qt6/qt6mqtt/qt6mqtt.mk
index 00c6705cc8..9bec4d3d28 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.mk
+++ b/package/qt6/qt6mqtt/qt6mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT6MQTT_VERSION = $(QT6_VERSION)
+QT6MQTT_VERSION = v$(QT6_VERSION)-lts-lgpl
 QT6MQTT_SITE = $(QT6_GIT)/qt/qtmqtt.git
 
 QT6MQTT_INSTALL_STAGING = YES
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index cddafb56a8..7e9e720554 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
-sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtmultimedia-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  01737014580d97fe6768ba4bf95b81233c488c8349dfb5b8861e48b6930c7ad2  qtmultimedia-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index c2a9d250cf..c9160a0e81 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -68,7 +68,7 @@ QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
 # libxext/libxrandr are needed for ffmpeg plugin to build with X11
 # support:
-# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
+# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=v6.8.4-lts-lgpl#n198
 ifeq ($(BR2_PACKAGE_XORG7),y)
 QT6MULTIMEDIA_DEPENDENCIES += xlib_libXext xlib_libXrandr
 endif
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 627450af60..6e910ca7fe 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0283f634707bf5c88ed30fec604bf7ea3bc22620cd060517812f9fb6304f254b  qt6opcua-6.8.1-git4.tar.gz
+sha256  53b80bc87ed164844f1cc742063f8b7735f3ad7219ef0c8fa91b1be569d3e3c6  qt6opcua-v6.8.4-lts-lgpl-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
index 28771ba8a5..b4e1d0908e 100644
--- a/package/qt6/qt6opcua/qt6opcua.mk
+++ b/package/qt6/qt6opcua/qt6opcua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT6OPCUA_VERSION = $(QT6_VERSION)
+QT6OPCUA_VERSION = v$(QT6_VERSION)-lts-lgpl
 QT6OPCUA_SITE = $(QT6_GIT)/qt/qtopcua.git
 QT6OPCUA_SITE_METHOD = git
 QT6OPCUA_INSTALL_STAGING = YES
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index 960cda69ad..f6f626e3ad 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquick3d-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3f3d345e6c95fcd40ab37e6a37cd31811e5d239dea8e142e632d4ea41bf20ce7  qtquick3d-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtquick3d-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  a1e6239c20115f0f5bd08d6c5f288f0a79f6e98ce0e910665bb6b3545b231d43  qtquick3d-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index b042b4e2f8..db56e0dd1a 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquicktimeline-everywhere-src-6.8.1.tar.xz.sha256
-sha256  fdbc198e27fd7bce0801fb3cfa336e81932607e6a36c97ae8394880eedfe12a3  qtquicktimeline-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtquicktimeline-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  c0eec3e952e9f4d4acc843054dbcb23662359e768e968747554311e5dec39e2c  qtquicktimeline-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index f239f18dd3..b63f57e319 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtscxml-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2f406f44cfacd6eddb90468012a5d1d99d7a64ec05a21a2a7eda9dfc12614fd6  qtscxml-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtscxml-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  639bb421b25e3b7b0db00b9e3b2086d7504e44cbacaea11fe4dbecaccae1b1da  qtscxml-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 9777633b85..e98609effe 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialbus-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40788d92ec5c3ae297818e9f9eea9d21e398a54fa3fd8ddd530d324548ed15da  qtserialbus-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtserialbus-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  23782360cf662e8a2f3272e9f5a105b70d6c35ee10ed37775b5d68bae0b2f5f0  qtserialbus-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index d30c297d0f..25fe084e1f 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialport-everywhere-src-6.8.1.tar.xz.sha256
-sha256  098e72a5c06d7db003e3eea1b0ed72d7308e3ea9cb9e89b538816dc96c938395  qtserialport-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtserialport-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  8a91c7fd4839795f1ab6b3673ad51be7c84bf9c1fa50b88f8e08b46ddb8e11bb  qtserialport-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 015ec5b96f..9de49be57d 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtshadertools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  55b70cd632473a8043c74ba89310f7ba9c5041d253bc60e7ae1fa789169c4846  qtshadertools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtshadertools-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  379a70692b52903b82897869112c4759f7f6f4e76abc4987700e9cdd87c87ebd  qtshadertools-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index cd7a148fb7..df47d8e87d 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtsvg-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3d0de73596e36b2daa7c48d77c4426bb091752856912fba720215f756c560dd0  qtsvg-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtsvg-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  e2a83b315b97eeaffa1d3f17e8192436541fe53e62171e82c7311c56ee9aac07  qtsvg-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index ede1608ec4..c53f37f064 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qttools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  9d43d409be08b8681a0155a9c65114b69c9a3fc11aef6487bb7fdc5b283c432d  qttools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qttools-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  c6030ea66d7be1ca7e3b40578beb35b0f4ff4014277d8e051d3219759f6ab399  qttools-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index fd32b3352a..2bfcff4cc2 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -37,7 +37,7 @@ QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_TESTS=OFF
 
 # Disable clang support in qt6tools for now, as version 17 is needed:
-# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=v6.8.4-lts-lgpl
 QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
 
 QT6TOOLS_DEPENDENCIES = \
@@ -55,7 +55,7 @@ HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_TESTS=OFF
 
 # Disable clang support in qt6tools for now, as version 17 is needed:
-# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=v6.8.4-lts-lgpl
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
 
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index 60b9ab08de..142f9425c0 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1022a3bc4093ec732e85b659158c8a70a31eecbd0dfef4e4f6c67f474f89a264  qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtvirtualkeyboard-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  7bfe9a4d1ded37e1e10e28098dccf1768e75ec26bb0d1d27fcb3d83988397d98  qtvirtualkeyboard-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index a378097eb4..8ab0f5a21b 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwayland-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2226fbde4e2ddd12f8bf4b239c8f38fd706a54e789e63467dfddc77129eca203  qtwayland-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtwayland-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  b2475cfae9f5b8f40ea456b762cc634e7d083873aa554eb63954ee20e8a7bb8b  qtwayland-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 789f51a71d..665c3e0008 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwebsockets-everywhere-src-6.8.1.tar.xz.sha256
-sha256  e4cfdae8760bedd1c2b00429a6c9bf88cc11c5018dcb46bde277fb1edf341e3f  qtwebsockets-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtwebsockets-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  acadb896c557659fe8a2f29f130ad3553c1497524a1bf5165aacd346e1349521  qtwebsockets-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
