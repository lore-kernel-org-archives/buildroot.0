Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E106C02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1858281DF9;
	Tue, 14 Jan 2025 07:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvfNi0joIUC9; Tue, 14 Jan 2025 07:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 130ED821F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 130ED821F1;
	Tue, 14 Jan 2025 07:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F201B8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A41B60E89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akMJr26j7cZu for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33AFE60E82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33AFE60E82
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33AFE60E82
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:29 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d88c355e0dso9021469a12.0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839827; x=1737444627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+nNitiiduCucXo8oB3UM++TSz9TG/k+0TdaP7KSyNYk=;
 b=gCJNp7Ep7kHMillKvo1nENCUwcQNPTINdKsaYwbwllLxxJl1055W/BFIyESBK/6G1n
 6TAJ0kzMMzJJaijbHrOBiWLQPmbNWC2iLhng77C2bsR3b5A972PBnoh5iYtUiNvoCwSF
 b6cjItvADJrHLbWdQZRwO1c9qaZmGxHnOOrUe8eVt04ecPHYgVw/IcgmLdIa6wC1H2SI
 XQaKPZ+4rzGbuytQZuREMKpJ1rnusPGDzdqHTf5TYoUy9x+OWzne7ODN18WjzW1jjQex
 W19eaFN37SaKN28fcuBhhnjnnZ02WArhgvwsomCaGcrefMeTdqLM1e9dJkckN/r20PZH
 hUNg==
X-Gm-Message-State: AOJu0YyhnU1vE2TuF8gT2z5+MmK4tW7ilt8EOik3EdmzL/Kn88GZb0Ul
 ey3m3Yo1qqJPnClTecgElpksoz70GC6hN2R/zmk7wH1CFTDs6s+2L8Zfdg==
X-Gm-Gg: ASbGncvZWZjDxPJe7fUDHQKAhwa0ntNQy0ssbeGEZgqivtvfwfknJsyHEdxJuaT0VlS
 A+XCjpp2XhC+DcoAFy547mN+i5jYyyGyDRV0hxnVsKcwzHLcfcVgfOlTJ2S7MJ/mKC18IReBTkd
 li25S+y9nuJVmHQufwfZTzGQmjv5BmIz6xNP8jMkqvND2i1/O7oDnlokgHQHaOFnPXpVt7OTUWN
 uYwjUsKP9obQ66spdD7sfxA4ApzDsMDgWgyDS3FqykEFM4HV6r1n8IURAI9Pq3ua+hc4lOA6g==
X-Google-Smtp-Source: AGHT+IGHG3urz+w8cMxGERZw2avwwnD9gIzqyg18pj0MD2xK6e6DwQkrwFf/7Q0P5IaoZp3h8aHXIg==
X-Received: by 2002:a05:6402:51d0:b0:5d1:2652:42ba with SMTP id
 4fb4d7f45d1cf-5d972e1c543mr23838279a12.16.1736839826537; 
 Mon, 13 Jan 2025 23:30:26 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:30:25 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:48 +0100
Message-Id: <20250114072947.284965-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839827; x=1737444627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+nNitiiduCucXo8oB3UM++TSz9TG/k+0TdaP7KSyNYk=;
 b=AbcUe+P32enBYgVtFrUv/adklOO67H9yVUMmWc6KEmul6N1WH/FliIww+PYljdoK6t
 6qk7r745qA6ozeR2ypRvNoUhmizbRxc5ozKmqIRqqrL90SxRsR3GGCmjh6aFPM8xUphU
 ihCtuqUCklo3vvslYY3MixLm2HQkGmdqBwV9KaO2Kb8yFo4IqyJq80P7tyyAE96/99IL
 ivo6ZXQWO6cLLC3a8h1urJLI/p09bhSWsw6UOuT5r0xkWhNawPBKpbHL3EnuA4LD+VPz
 3dbqRMgazbaPTAoQzgxz/He2vHeqTdiZg6BGkDDOo207Kq2uKI6v7A7cfMyH//2u1E0h
 7l9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AbcUe+P3
Subject: [Buildroot] [PATCH v5 4/9] package/sysrepo: bump version to 3.3.10
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
this options are enabled to be backward compatible to older package
version.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v5:
    - meanwhile project version updated to 3.3.10
v4:
    - removed redundant config help information


 package/sysrepo/Config.in    | 18 ++++++++++++++++++
 package/sysrepo/sysrepo.hash |  2 +-
 package/sysrepo/sysrepo.mk   |  5 ++++-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index b1535bed9f..fba565df6a 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -16,6 +16,24 @@ config BR2_PACKAGE_SYSREPO
 
 if BR2_PACKAGE_SYSREPO
 
+config BR2_PACKAGE_SYSREPO_SYSREPOCFG
+	bool "enable sysrepocfg"
+	default y
+	help
+	  Build binary tool sysrepocfg
+
+config BR2_PACKAGE_SYSREPO_SYSREPOCTL
+	bool "enable sysrepoctl"
+	default y
+	help
+	  Build binary tool sysrepoctl
+
+config BR2_PACKAGE_SYSREPO_PLUGIND
+	bool "enable sysrepo-plugind"
+	default y
+	help
+	  Build binary daemon sysrepo-plugind
+
 config BR2_PACKAGE_SYSREPO_EXAMPLES
 	bool "enable examples"
 	help
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 056f70787d..6d82692e05 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  467efed8d0f62c26a0d200602b911096eb2d67858e620937ab68f96b316fa9b7  sysrepo-2.2.150.tar.gz
+sha256  9841820d86433bdd73fca38e9bf3d4088c552142e8f5f2d5edd6c5095325210d  sysrepo-3.3.10.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 7f2570bd7d..f97bfcb6e3 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.2.150
+SYSREPO_VERSION = 3.3.10
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
