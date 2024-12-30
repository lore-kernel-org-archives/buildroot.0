Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C9AE77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 11:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D1368101D;
	Mon, 30 Dec 2024 11:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtY0IF_kXuZb; Mon, 30 Dec 2024 11:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D30810E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D30810E7;
	Mon, 30 Dec 2024 11:37:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2981C8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A345860AC1
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdJXC4VGhtAM for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 11:37:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D459A60A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D459A60A5B
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D459A60A5B
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:37:39 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so15500697a12.3
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 03:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735558657; x=1736163457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwS/4ghX/4JNoeE0Q2IyFSWj4mtkgSp1aIEd9QarE4U=;
 b=tn7zhfM7DJNvXtQMACBFiPa6A0xjVwbB3TznbUfH58T525Jd+SeiSKt1Qc757yJ80A
 qBExcbpXa0UlHRfy9H+uryWhoqGSoErj11Fs/6dU7+C/JF/Oouz3XxTO5gN2UoyjkLgM
 w/ljIT+wMuZF5sI/I1SS0GmoOYle4IJrQiBWHL/ql5u/kJFd23fMblwB0FLA3RV+v7qd
 7l/p2is+SutssOJ944r4FlJpRmN1BsY6/4ZpS2laCXlARkP5JSY8PWpHZCdqhjQeMzgA
 mRDU2I/A8XOX3WnVSLv16TiLfPAIFFws9jZh+NXUMlrjbQoZ9NkbaHP7t/W2M7M3dAcU
 B1rw==
X-Gm-Message-State: AOJu0YztLBLvzCkkJW+Ys+QwdDM02SA1UWWQewBGjxXHcs8GWK9QYqXk
 9zKoz0KN92FlfW2/gvNCF7TSLsFLpyZBXs37g8RIPuqeVbc0mMOSPw9FRg==
X-Gm-Gg: ASbGncvieWHi6r84oPRN0on+POmTYKCQGyDM6OZyLtu+TyFldelnN0I9a6ygLzRzO6H
 vMJh9eXwaCBNPLYvkRqzLXnLmD14ks7Fwgj6+J2OPaqRMVqMDIdFnKr2TUi6OD1XVQFT3R3AHr5
 LMcYpVoHwTsqeVAi8ivmui3nxxSKqt6845ye0mR7tQWso1H916fr6dYv4h+mU3Yi17KGSjsRso5
 ii7p/FVIZ7nrOVcvBnRH86Rq/Vi4PiMM3JAe2WZi8Nfwb3kQt/Ri9AY+P4/DJJjK1MOf6Wj
X-Google-Smtp-Source: AGHT+IH1uw/nOH0FmQAQRs0SRe/kl1B2C892tVZFOuEzrz3sKjQN0fivrqKsOuMqNW4yM3ZDUaIFSQ==
X-Received: by 2002:a17:907:1b81:b0:aae:bac6:6659 with SMTP id
 a640c23a62f3a-aaebac6712bmr1933762066b.7.1735558656978; 
 Mon, 30 Dec 2024 03:37:36 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe46d5sm1471216666b.103.2024.12.30.03.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 03:37:36 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 12:37:11 +0100
Message-Id: <20241230113710.679717-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230113710.679717-1-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735558657; x=1736163457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwS/4ghX/4JNoeE0Q2IyFSWj4mtkgSp1aIEd9QarE4U=;
 b=kOBBdFULPUqeirow5XLjbjOTGIqrO698T1we9HXRA6ykW9NBZlUbotrw0qX7X535xo
 xw93dWD4HnUAAmhTycwR2oOA4My/nAZJA1G1L4BqDBZIfjX4h48qdx4zdju+2kMvPm4R
 V1Vzwpk8qXR2S7fwavSSfJzry79aIIpBrUbvuHDd0fLZQT77FToIuE7EBMFfI9S30BYQ
 UM36gWpqzeORJZo49hmE0gAbTp7IXRwPj6BZN9YkZwnglphsqCG/wXbPK1+WB80zkP9c
 30PnoOZB8z1z+1rjfuDAPt85E8HZ3dD+QVzMEcLexsdvNrrYxTzJY+10VFoTvJetnP0s
 Hx5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kOBBdFUL
Subject: [Buildroot] [PATCH v3 3/6] package/sysrepo: bump to version 2.11.7
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
