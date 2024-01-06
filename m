Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6940C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 21:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7529D8121D;
	Sat,  6 Jan 2024 21:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7529D8121D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4xOIOR9EfVE; Sat,  6 Jan 2024 21:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB3281E40;
	Sat,  6 Jan 2024 21:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB3281E40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6541BF295
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5C934010C
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5C934010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4X4O2hORGCR for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 21:44:16 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FDB6400FD
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 21:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDB6400FD
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3606ee78686so5174995ab.0
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 13:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704577455; x=1705182255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8c7Uhk18xG5itdizCINMeDAjTLOlfCewWJVgn9VOGsg=;
 b=lKFYi3cRKo6nuAA2e/XhxKafsxkqxxYsG49xrx99LYWEIvSdN7oi/KXXD8KFqmxO9r
 ywVWenJICJ59MnQo6fzaPy0a6+Lpy9ittjwZ+g2VkylX3I63NNyNz58zo37uFo+zUP8q
 6HFo4TrR0eZTZhV+KIbS7S4C09f9cCSOljFDZKdwV47evKUZILX8jWa1631BJfod/dHb
 WDKM9F7NG5uip5NM3zPQJVBW1ok7grByc4WEb0kRu7IFOKcp1s1AKTtJ7Y4O5PXxiRiv
 JhH8QolpMhmC5xl4wXJUK9EKEW298tsOOPtLFW1jiQENLlVrzo8iNZ003psVcDLv6l3t
 FmgA==
X-Gm-Message-State: AOJu0YyE0UTZf5F0oIRn2LG5ewu9QJTocOr+jESCt5K3xR3tuGscSdCW
 UVa4WsVbRMa+CY7nGAQwZbl87XwU/Bqd9Q==
X-Google-Smtp-Source: AGHT+IEKt3psq8H3cIVRj9SOY1FFqSZ8+CKr30ro6tECp21au2MXxMsGVpV2HEwQ89fdZId32Pislw==
X-Received: by 2002:a05:6e02:1849:b0:35f:e863:a6ee with SMTP id
 b9-20020a056e02184900b0035fe863a6eemr2913464ilv.62.1704577455044; 
 Sat, 06 Jan 2024 13:44:15 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 6-20020a056e020ca600b00360039199cesm1496587ilg.3.2024.01.06.13.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 13:44:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:44:08 -0700
Message-Id: <20240106214410.3294887-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106214410.3294887-1-james.hilliard1@gmail.com>
References: <20240106214410.3294887-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704577455; x=1705182255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8c7Uhk18xG5itdizCINMeDAjTLOlfCewWJVgn9VOGsg=;
 b=Lp+e+LK9Ww+axsLed27UkHhuJnm3JDX+XoMaZsvH9jEQwT34TBJxsIoovcYIDo89Ev
 xWPz0ROmx+F+pHN72IyjBflGgpM3XOFGA72a2M8/aL1CyIJr+Jm/etpFC+9G/LDY+aMJ
 8wHi2inyHPStFo4QBSeekSwsxLM70I02fElcxZM+g4oZaf/RBJAn9uwP+6z3GhnOQURK
 ErSbcDOR4nd95DmDK6NWIPlGcXd/DA2VVLn0uq+dh/i3ZB8wAmg+YAjxbqgNN6AzIbMq
 01Cjdh/K2pSDdGy693q9V/x73F61nsna1dmQpEaKA/G9qCbrLtw+13g3SjSevmxW8HTX
 aRIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lp+e+LK9
Subject: [Buildroot] [PATCH v2 2/4] package/python-aiosqlite: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add missing python sqlite module
---
 package/Config.in                              |  1 +
 package/python-aiosqlite/Config.in             |  7 +++++++
 package/python-aiosqlite/python-aiosqlite.hash |  5 +++++
 package/python-aiosqlite/python-aiosqlite.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-aiosqlite/Config.in
 create mode 100644 package/python-aiosqlite/python-aiosqlite.hash
 create mode 100644 package/python-aiosqlite/python-aiosqlite.mk

diff --git a/package/Config.in b/package/Config.in
index f5d0c06334..ea023a84ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -978,6 +978,7 @@ menu "External python modules"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
+	source "package/python-aiosqlite/Config.in"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
diff --git a/package/python-aiosqlite/Config.in b/package/python-aiosqlite/Config.in
new file mode 100644
index 0000000000..77c78ea25d
--- /dev/null
+++ b/package/python-aiosqlite/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AIOSQLITE
+	bool "python-aiosqlite"
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	help
+	  asyncio bridge to the standard sqlite3 module.
+
+	  https://aiosqlite.omnilib.dev/
diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
new file mode 100644
index 0000000000..e06061346c
--- /dev/null
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiosqlite/json
+md5  e829bf8f641ab115c1a9ca0494d35278  aiosqlite-0.19.0.tar.gz
+sha256  95ee77b91c8d2808bd08a59fbebf66270e9090c3d92ffbf260dc0db0b979577d  aiosqlite-0.19.0.tar.gz
+# Locally computed sha256 checksums
+sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
new file mode 100644
index 0000000000..e513d53c02
--- /dev/null
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiosqlite
+#
+################################################################################
+
+PYTHON_AIOSQLITE_VERSION = 0.19.0
+PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/ea/51/060efa10a814145acd4e42c6e5ed540b8714cad52ca026c5930e7c473049
+PYTHON_AIOSQLITE_SETUP_TYPE = flit
+PYTHON_AIOSQLITE_LICENSE = MIT
+PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
