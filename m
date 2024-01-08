Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7511FC47074
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 01:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE55941553;
	Mon,  8 Jan 2024 01:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE55941553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-jUqYQNUbpr; Mon,  8 Jan 2024 01:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F734151C;
	Mon,  8 Jan 2024 01:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F734151C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 328A21BF2EF
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 01:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AC6641553
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 01:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AC6641553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUKFwW_eKzO8 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 01:31:05 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F36D141517
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 01:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36D141517
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-360852ae88fso8108965ab.3
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 17:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704677463; x=1705282263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hqO4FY0Fr+J1WlZ9HyuZLaaSGF0QMcvDcmpYqL6p0lo=;
 b=exEXiYMY1NdpHXUDCqKH/KW/WfL9dvfTDsjzKQHwBVWFvVVGTT/JaYqW1yg44pDb7z
 UxRZnxfaCeRJxcmyTRyY18brSHbyNxqcalBpDlEgPFCHSehWHjVWAZoEfaCpHWG943aD
 Eq11gWNRsAS21Ok6ZDenwE0PcZ6q/CNjvYZYJyezND1vpoGN0Co0mV0rx+390v36MyR+
 o1spGvtb9XdImaKheyM+BOuzAWBlh1E25j2SNEb+mvFHjPMy5rkFj0yFpATM2+AsYy9p
 hSyh4+SqV0/TOD/03gsqwIZKxJYW7hxnuN2qs5SJx1M2KZOhdzS9W3axZIKCVHJ5MQNp
 GsyQ==
X-Gm-Message-State: AOJu0Ywo/gFv2h64zTGSfESKu+VtSYQ31TWG0oRrJWIJnISm6W4Bl/OO
 QHD2vqGvY1qylf/NMj0AOTi/hJgfUp8=
X-Google-Smtp-Source: AGHT+IG3i8zrhq2hK+Du+zDf3sCTI3bEd6+8Z66hkEdWoz3rWbI41MNa+zqaEMfGUP3goT05+Le/6w==
X-Received: by 2002:a05:6e02:33a1:b0:35f:e864:f84 with SMTP id
 bn33-20020a056e0233a100b0035fe8640f84mr5790946ilb.34.1704677463100; 
 Sun, 07 Jan 2024 17:31:03 -0800 (PST)
Received: from gtr.. ([2403:5814:e4c2:0:6876:9fff:feae:cf11])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902c21100b001d3edef115dsm4998077pll.20.2024.01.07.17.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 17:31:02 -0800 (PST)
From: patrick.oppenlander@gmail.com
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 12:30:39 +1100
Message-ID: <20240108013056.39493-1-patrick.oppenlander@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704677463; x=1705282263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hqO4FY0Fr+J1WlZ9HyuZLaaSGF0QMcvDcmpYqL6p0lo=;
 b=GASjNYMZSnARhPg3JgRqMbnHcBzCFClXIlJzFtKLIOxV4Ivitle3vfKbYXSJowI4ui
 V8Ttejso35+NK3NIouU5LA1AEEC/aAePR8cP8LkXW4I83+L6lEpEgv727fVfRPjGVSf4
 CXMT7BBsBvlMkeDmza9sWuk8QIyXjKyAryJ8KGxej060xnnQEbu8zWdh3BhzwhlSxQTn
 2/l3xcKKQgFD1NTKG8uJ7oE1NfccgzQTHF1DZGHDvfFZRF1o/0SDcgXcy5QznDpjKZp0
 feHojyX61Z4zLBAJoV8aShL+ZmL+pcdrJDwnMkRXY63MpY1gM3mQMe6Ju6hHxCQ9H0wA
 htaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GASjNYMZ
Subject: [Buildroot] [PATCH] package/minisign: new package
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
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
---
 package/Config.in               |  1 +
 package/Config.in.host          |  1 +
 package/minisign/Config.in      |  8 ++++++++
 package/minisign/Config.in.host |  6 ++++++
 package/minisign/minisign.hash  |  3 +++
 package/minisign/minisign.mk    | 18 ++++++++++++++++++
 6 files changed, 37 insertions(+)
 create mode 100644 package/minisign/Config.in
 create mode 100644 package/minisign/Config.in.host
 create mode 100644 package/minisign/minisign.hash
 create mode 100644 package/minisign/minisign.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..1b7a667ea1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1538,6 +1538,7 @@ menu "Crypto"
 	source "package/ustream-ssl/Config.in"
 	source "package/wolfssl/Config.in"
 	source "package/wolftpm/Config.in"
+	source "package/minisign/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a..f03ca16b7b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -64,6 +64,7 @@ menu "Host utilities"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/microchip-hss-payload-generator/Config.in.host"
+	source "package/minisign/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/moby-buildkit/Config.in.host"
 	source "package/mosquitto/Config.in.host"
diff --git a/package/minisign/Config.in b/package/minisign/Config.in
new file mode 100644
index 0000000000..cfba5586b1
--- /dev/null
+++ b/package/minisign/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MINISIGN
+	bool "minisign"
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_LIBSODIUM_FULL
+	help
+          Minisign is a dead simple tool to sign files and verify signatures.
+
+          https://github.com/jedisct1/minisign
diff --git a/package/minisign/Config.in.host b/package/minisign/Config.in.host
new file mode 100644
index 0000000000..8ed57cdbfc
--- /dev/null
+++ b/package/minisign/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_MINISIGN
+	bool "host minisign"
+	help
+          Minisign is a dead simple tool to sign files and verify signatures.
+
+          https://github.com/jedisct1/minisign
diff --git a/package/minisign/minisign.hash b/package/minisign/minisign.hash
new file mode 100644
index 0000000000..12cde42a43
--- /dev/null
+++ b/package/minisign/minisign.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  74c2c78a1cd51a43a6c98f46a4eabefbc8668074ca9aa14115544276b663fc55  minisign-0.11.tar.gz
+sha256  d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b  LICENSE
diff --git a/package/minisign/minisign.mk b/package/minisign/minisign.mk
new file mode 100644
index 0000000000..d6be41b2fe
--- /dev/null
+++ b/package/minisign/minisign.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# minisign
+#
+################################################################################
+
+MINISIGN_VERSION = 0.11
+MINISIGN_SITE = $(call github,jedisct1,minisign,$(MINISIGN_VERSION))
+MINISIGN_LICENSE = ISC
+MINISIGN_LICENSE_FILES = LICENSE
+MINISIGN_DEPENDENCIES = host-libsodium libsodium
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MINISIGN_CONF_OPTS += -DBUILD_STATIC_EXECUTABLES=1
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
