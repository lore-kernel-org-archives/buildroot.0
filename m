Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31912C4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 07:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2CBA812C3;
	Mon, 26 Dec 2022 07:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2CBA812C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTt2PjDepxAz; Mon, 26 Dec 2022 07:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12E1D812B7;
	Mon, 26 Dec 2022 07:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E1D812B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77D571BF228
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53CFC812B7
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53CFC812B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COghMvPEe6FG for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 07:48:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410BB812B5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 410BB812B5
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 07:48:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i7so9479189wrv.8
 for <buildroot@busybox.net>; Sun, 25 Dec 2022 23:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNqE+F2k3/MdnM+94i8+Dy3V5IlokY2N543zOgsuYJs=;
 b=2HkfHKOIDfbnIXmF3U2xxt3KLDKQTqetx1ELhiRzKJcfrS9estqCg/aH8Sfv5SU0pZ
 YciL/CIgJbhmRzyrhdWVjF7beJjIj+C+HXww3sKxzuha5QyXGWeWa5GIA1vazrTk466p
 qnmPcaoA4e+QowZpL2M6C2nEQQXHlXjpoltaWs1RjUycNxqwmVz9IcqzpMNxIKCEdJsO
 Gg2z3HXg2eEWQ1GrsOG0qYsgRHYqkbz0d3m3XpJbvbQ3XoOpq70JSt0l2AIo3Z4ksyzk
 1c00RAtn4ZKtsBak5Flb9EHiShyqS1PQaeq+qw60PXlwxyyApgssSLRbEiKFQBiHA60e
 9SuQ==
X-Gm-Message-State: AFqh2koz0usOQHMjchEWBk0U/t5HPqkhYe/E6hrUe4F44w611l21ANaT
 8QJp6JzGNvaKL5GxpBIuIn3wyW09ZRI=
X-Google-Smtp-Source: AMrXdXv2WF26bNth/3TCOMxX4hxBvoa+RQVPiWjEi6T7zjShHJKFlQ5LnPQcIm4uBgG7PeBSIPxrKw==
X-Received: by 2002:a05:6000:1a47:b0:242:78e5:6c13 with SMTP id
 t7-20020a0560001a4700b0024278e56c13mr10637645wry.44.1672040935387; 
 Sun, 25 Dec 2022 23:48:55 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a5d6b4c000000b00241fea203b6sm9555515wrw.87.2022.12.25.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 23:48:55 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 26 Dec 2022 08:48:51 +0100
Message-Id: <20221226074851.143689-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lNqE+F2k3/MdnM+94i8+Dy3V5IlokY2N543zOgsuYJs=;
 b=cHyvUE7CnmS4aB1VmEelu3D+z0+HSBHhL5y6/LNj5tZKWyZUGp8JpsDcoNbmzte//x
 bxYJYczQSTrrHmS5RUcDJe4ZLVyuYDovgU07XiLpYz59llINp0PdYLP2c7Zr+4GQqGpk
 D4kDUwIdFR2DCXNbcGSfsKETP/xo3IERXUk3MrNwM2hN0HKCc+pBhq8q2VMAsVX8BcIw
 Mjdxp4XSjo1ljNeqaDf1nnYPBTW4Euc5+pnLfrv6X+0Dzyc9gemgLSjov8bJigmipn4f
 doJvfLKBtVAjsa5e+/G++AbXGEpSqZMSJ4RkB/2HqM5N1boiTN0bp7aZWs5sWh8eLZDX
 kgjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cHyvUE7C
Subject: [Buildroot] [PATCH] package/lua-utf8: bump to version 0.1.5
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
 package/lua-utf8/Config.in     | 2 +-
 package/lua-utf8/lua-utf8.hash | 4 ++--
 package/lua-utf8/lua-utf8.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-utf8/Config.in b/package/lua-utf8/Config.in
index 313fa4e45..5815936df 100644
--- a/package/lua-utf8/Config.in
+++ b/package/lua-utf8/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUA_UTF8
 	  This module adds UTF-8 support to Lua.
 	  It's compatible with Lua "string" module.
 
-	  http://github.com/starwing/luautf8
+	  https://github.com/starwing/luautf8
diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index b6720b360..b4d455ceb 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  88c456bc0f00d28201b33551d83fa6e5c3ae6025aebec790c37afb317290e4fa  luautf8-0.1.3-1.src.rock
-sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.3/LICENSE
+sha256  68bd8e3c3e20f98fceb9e20d5a7a50168202c22eb45b87eff3247a0608f465ae  luautf8-0.1.5-2.src.rock
+sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.5/LICENSE
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
index 52aaf5c71..33c34a4eb 100644
--- a/package/lua-utf8/lua-utf8.mk
+++ b/package/lua-utf8/lua-utf8.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_UTF8_VERSION = 0.1.3-1
+LUA_UTF8_VERSION = 0.1.5-2
 LUA_UTF8_NAME_UPSTREAM = luautf8
 LUA_UTF8_LICENSE = MIT
 LUA_UTF8_LICENSE_FILES = $(LUA_UTF8_SUBDIR)/LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
