Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D117CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 06:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3E1640122;
	Sun, 15 Oct 2023 06:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3E1640122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXd0VQScm3oV; Sun, 15 Oct 2023 06:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C80A740156;
	Sun, 15 Oct 2023 06:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C80A740156
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E501C1BF388
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 06:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE23160BD1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 06:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE23160BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0UTzZM0TS9HO for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 06:41:22 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E3E560810
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 06:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E3E560810
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so543762266b.3
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 23:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697352080; x=1697956880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0quMBbjPFIdbP48Z3cx2qVUmrR8lLHOK5CJH2ISXizk=;
 b=NjTALC+/Ri2qy3ON2CbT98AD92krH+rj52r73mFtSuzU5ho3Kr8akhQUtWExLuEIai
 TYwvE+gfXSSzcW2PxLJb0TixqGw2XCc++kN0uTvk8oIpoyuGQ2zZsdguO+NdkzDF1GWN
 wVZ6UojMjzXC36nQEaePMhNCZaGwh/YpFvi4dM4NckNCj9Rz1fpaBXKAjzgES2Zl3bDx
 IwAWD85WW4J/zykaPvkZfCKf2dZyjvQsATdbIf0xaaOE1hZenQdTKFDruJoImt03iQbe
 gkqsGVyeTKDt8ju4H7m9+3oK+e3fakblt1ShE2pl/KOXELj9QdEWmO9G60dsuH3B6Gae
 9FkQ==
X-Gm-Message-State: AOJu0YzJHTULrmUVjsoFNEUVNuDXJqMx7M59Bu75b+hdNy5jxunZjA73
 nOKUOXzGZls1vVk6hhi6RzJQI4MBwlk=
X-Google-Smtp-Source: AGHT+IERRLVxCmymIb1yWrfZschjH8g9zL/8ngf6ZQB5OT5I3lpsmhff5P7vwP5BvxPIBpMt2m5zFQ==
X-Received: by 2002:a17:906:7496:b0:9ae:72c7:73e6 with SMTP id
 e22-20020a170906749600b009ae72c773e6mr27541778ejl.10.1697352079907; 
 Sat, 14 Oct 2023 23:41:19 -0700 (PDT)
Received: from localhost.localdomain ([98.128.186.118])
 by smtp.gmail.com with ESMTPSA id
 bl19-20020a170906c25300b009bf7a4d591csm1050408ejb.11.2023.10.14.23.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 23:41:19 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 08:41:16 +0200
Message-Id: <20231015064117.1362398-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697352080; x=1697956880; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0quMBbjPFIdbP48Z3cx2qVUmrR8lLHOK5CJH2ISXizk=;
 b=QDN3kiHTltESF2MSH8zt3T2YedLf+H3jBxE5WRXo0MXcJVAU1BpPzQEZh0CdzHb1D3
 X887VUlk6wcrgnRYwlXaYAZ2Y05d0xiTWV+lGDoYVygRzRzGHXoZYCf8hm6LdBkaa2U8
 hd+wogEpYkWiYZpNyhgd+kNpACB/zKr24H+uj9U6XRhTOdpfKxaicjUGBwV4YyOnk2aF
 jsLXsrT+gTSin8V4u6s4mX7ksabrVwp2E2NT6FoJ8Xtc/1AzqewvOOPfHRpr9sjcwNE6
 8HJLJ6y6ADsicV2KZV6i7m76pMlum2PtFivnVFo5pTqHkwwW9Uqp6SZysPjjzFBgdtHC
 ChSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QDN3kiHT
Subject: [Buildroot] [PATCH 1/1] package/libite: bump to v2.6.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Only new APIS, no fixes compared to v2.5.3.  For details, see the full
changelog at: https://github.com/troglobit/libite/releases/tag/v2.6.0

LICENSE hash changed due to bump in copyright years.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/libite.hash | 4 ++--
 package/libite/libite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 7dac198ab8..b0cdc32800 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,7 +1,7 @@
 # Upstream .sha256 from GitHub
-sha256  ca086adc7ebf0c2ebf2ed7a6787f9567fb802db8583576228dd5dd5ddfb7bb97  libite-2.5.3.tar.xz
+sha256  da468005bab3d9d096974e61278b2e6a8eecf204fa018986ea21f639f38013eb  libite-2.6.0.tar.gz
 
 # Locally calculated
-sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
+sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
 sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
 sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 1cef992e53..e8c57aa2e9 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.5.3
+LIBITE_VERSION = 2.6.0
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
