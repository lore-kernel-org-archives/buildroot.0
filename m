Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D539E7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 15:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B482783AAB;
	Thu, 19 Dec 2024 15:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnncilP3SSLj; Thu, 19 Dec 2024 15:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E7F81B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E7F81B70;
	Thu, 19 Dec 2024 15:21:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F97375B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD5342562
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhNEHwrVxwcz for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 15:21:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B164142584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B164142584
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B164142584
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:21:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so1179450a12.0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734621702; x=1735226502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwS/4ghX/4JNoeE0Q2IyFSWj4mtkgSp1aIEd9QarE4U=;
 b=Zc/aZloOgStVb2pNmr2sAw2kmZCpKhrn8tuh5eoz5eTTEvfx4VSf+nsQv200UadWi8
 rAA9vwjvzdab9xO59wXIal7yTl81Z64inByzOl9R7YCMQTPRP+R2b2TCnOqxMUv4N9QM
 sAroxt71b3yZXB3B3fLPCGq2GOJBf4dmFYj8ism0CoBJVBf/P4EFYdFmrd/TU3gvA7lg
 VE6xfxQBBb4xkgLXBHpIaSX3VwAic9eZq2WalSXZKsus5boUs447HREtN7jN7S91Snei
 EIQRSXHKdntJeMFN2wFt4YYshHI/oWhBBbxC3JBgkCIxaKIO54GMhhVI5a2IbXcdph7v
 j8qA==
X-Gm-Message-State: AOJu0YwzphfIdKuj+a3la0nbUxP/re+8zEh217WRly4WZ/6sNvnLuVMk
 CtnziQ2K87V7RP3SEZCvvUzBpUWdYKixl2V3x1uPCYVzdUCnZgA88NAQsg==
X-Gm-Gg: ASbGnctOW1rngsRQkKTnYHmnuvOIFW6O4D4Spv5OmVNrdrBkFaeA4Iq7VEw7+gute1g
 Tu46Ptf1LFzRvuoqF5hB9YEP+xS8iZWd1exqKjKe2DgOi615ZW/rTeeQRZ5mx3pT8k61QW2FL9u
 kqJcO8ZbJzDp7KhoUD0DI+TBNnDA09gWc3h5lbULkgMsakT/PqNT3DsTpiT6ahmeRgra+G4IyL6
 iuID5AJ0C9sMu9DfQKt4rzSbU/Xp2v92t9iIjTUUW4dCJlaX7sVJESSi67TTIGq5nTF4SNqQA==
X-Google-Smtp-Source: AGHT+IHwjl+cBrXzVR9rIk7EFSqrr89bIBK4t7lgbDa2omGNmAksMotwvlOZrz8knB0mB2VLlbbp6Q==
X-Received: by 2002:a17:907:72c7:b0:aab:d4f0:c598 with SMTP id
 a640c23a62f3a-aabf478a5d0mr709977266b.27.1734621701439; 
 Thu, 19 Dec 2024 07:21:41 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f070a7bsm75504166b.201.2024.12.19.07.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:21:40 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 19 Dec 2024 16:21:05 +0100
Message-Id: <20241219152105.298310-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241219152105.298310-1-heiko.thiery@gmail.com>
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734621702; x=1735226502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwS/4ghX/4JNoeE0Q2IyFSWj4mtkgSp1aIEd9QarE4U=;
 b=DfnXmXNa2I4ZAXtm5aykFiRUS6LbMJC9h2n9HY1mdJ7Dp5CatRHWqD3KObUV+NfctW
 DOtIIJu27PIxpiRx3CeXah9PmWAZCHAv6sgw08ppTk1XDj/kY3+6ZRwdaNnh0w4A2hzE
 qqj57sNroHQ6z+QghaGwM+B2M8VvibvYbVWpe/Gn49mxWVBwohBaDK99T+If56qDey1T
 lNFhx2eOPy4Zr4CBWp1U6RX5ajkAWNVk99dV6u24qWWlsEV91F+ni9U9WzWES50btemD
 JU807qLXTVop5rkWc2QDSfABBS6/1uYOl1tGjAA5G4jvbwqu1UzMJbiraI1fztzGyoYU
 tZqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DfnXmXNa
Subject: [Buildroot] [PATCH 3/6] package/sysrepo: bump to version 2.11.7
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

Add new config options to enable/disable binary tools/daemon. By default
this options are enabled.

Also some sysv init script shellcheck warnings are fixed.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/sysrepo/Config.in          | 21 +++++++++++++++++++++
 package/sysrepo/S51sysrepo-plugind |  3 ++-
 package/sysrepo/sysrepo.hash       |  2 +-
 package/sysrepo/sysrepo.mk         |  5 ++++-
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index b1535bed9f..ff75575952 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -16,6 +16,27 @@ config BR2_PACKAGE_SYSREPO
 
 if BR2_PACKAGE_SYSREPO
 
+config BR2_PACKAGE_SYSREPO_SYSREPOCFG
+	bool "enable sysrepocfg"
+	default y
+	help
+	  Enable sysrepocfg.
+	  Build binary tool sysrepocfg
+
+config BR2_PACKAGE_SYSREPO_SYSREPOCTL
+	bool "enable sysrepoctl"
+	default y
+	help
+	  Enable sysrepoctl.
+	  Build binary tool sysrepoctl
+
+config BR2_PACKAGE_SYSREPO_PLUGIND
+	bool "enable sysrepo-plugind"
+	default y
+	help
+	  Enable sysrepo-plugind.
+	  Build binary daemon sysrepo-plugind
+
 config BR2_PACKAGE_SYSREPO_EXAMPLES
 	bool "enable examples"
 	help
diff --git a/package/sysrepo/S51sysrepo-plugind b/package/sysrepo/S51sysrepo-plugind
index 60ea3ba7a9..4bee6c1705 100644
--- a/package/sysrepo/S51sysrepo-plugind
+++ b/package/sysrepo/S51sysrepo-plugind
@@ -10,6 +10,7 @@ SYSREPO_PLUGIND_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -x "$EXECUTABLE" \
 		-- $SYSREPO_PLUGIND_ARGS
 	status=$?
@@ -45,7 +46,7 @@ reload() {
 }
 
 case "$1" in
-    start|stop|restart|reload)
+	start|stop|restart|reload)
 		"$1";;
 	*)
 		echo "Usage: $0 {start|stop|restart|reload}"
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 056f70787d..93c336e1a9 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  467efed8d0f62c26a0d200602b911096eb2d67858e620937ab68f96b316fa9b7  sysrepo-2.2.150.tar.gz
+sha256  45a98a71827dd1428e2c6b7dedea47558cdfbc491042bbdbc0c52e607ab8266e  sysrepo-2.11.7.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 7f2570bd7d..c215be0159 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.2.150
+SYSREPO_VERSION = 2.11.7
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
@@ -18,6 +18,9 @@ endif
 
 SYSREPO_CONF_OPTS = \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
+	-DENABLE_SYSREPOCFG=$(if $(BR2_PACKAGE_SYSREPO_SYSREPOCFG),ON,OFF) \
+	-DENABLE_SYSREPOCTL=$(if $(BR2_PACKAGE_SYSREPO_SYSREPOCTL),ON,OFF) \
+	-DENABLE_SYSREPO_PLUGIND=$(if $(BR2_PACKAGE_SYSREPO_PLUGIND),ON,OFF) \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
 	-DREPO_PATH=/etc/sysrepo
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
