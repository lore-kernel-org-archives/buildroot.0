Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FDFC0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20CE560E07;
	Sun, 26 Jan 2025 15:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlmp61D9VjtE; Sun, 26 Jan 2025 15:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CCF460E2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CCF460E2E;
	Sun, 26 Jan 2025 15:47:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40084941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CC6060C17
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pktDZtxFqePI for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B207D60E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B207D60E07
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B207D60E07
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:46 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3cfcf8b7455so15167345ab.3
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906465; x=1738511265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rtya3Pk0EF4Dljrn4v2acllDC8pZ2Kd/kKTyp6jmYtw=;
 b=FGDVC9xFzKNqKYkdKOuLo9nv02vdLnqq/QFzLh3JXJUDSql/m0mMWxoZ9bx+sRFntY
 oom+HMNLedNZgQ/G0ae9luee0zxUUl01GRJ4BQR95hk3rCY4TFSLOXmekZ+1nKaOC8mA
 74jrvYc9uOgfWrdPDUyumkbuTVzAcGZT7eVTQ5tMT22MB7IVKifyLtt1Oa338NIZ4x9t
 G+XwSbxN+p/BZWD15ZcGvv+iRf7786U7kkaz5NwlFT3JSDOug5FCYuIdOFClUZhVk4HY
 FBtduQAL4B/3BHR2eWFeeDyrHQfCFz+7gbANipL5BXG0VGZ0QNWcV76MAmn2AD0v0fQS
 pgkg==
X-Gm-Message-State: AOJu0Yx0wiRSXYZC5Jdg/nj7YjiTymgt+fhG5eyQLBP3qqvdsijKkIsl
 0wQqNHxa9QDEOqfmT5isZY8tggYHUxoqS/YgI2Ga/RaZYKrKaokv67MQ7PTv
X-Gm-Gg: ASbGncuZneA39B0kHkhTuJKN93SfG8TECxf1MUZLftz5GwtXSZ4w3lgNzWpV47FLqeI
 Rs+dn0dvIjKhxRpNoffrQKjpEDVJPwAkoxwjTksIEvd1LRmOhtBQr8K/0+d1w8zbIEo0HGemUPn
 DgjHPvY1ss9HKvOXu2ffsvjhes+2Ho6trpAykK9RT/NEEFemrg3gKpjETS6QeYpJSYwMxf8jwZb
 0Klmu6s1VcwHhuwjeK6S094UCQL7QEOVOHeByGzqz7c1nfeoPe3xq8E4VDut+LqXzfq3lomZKyG
 q4yr4Pw++r/fwaaupfQL4vL9ixZGjkE2f1ZILZGr8d3Idi445Spb5Js=
X-Google-Smtp-Source: AGHT+IGMJ/wgxtaG16tWNczyOpQAlDRbIAExCFUkzo/5jprOGvYRd3x/mGL4/TKhfmOJmFk8/t8jtw==
X-Received: by 2002:a05:6e02:3dc1:b0:3ce:4bc8:7844 with SMTP id
 e9e14a558f8ab-3cf743bb516mr333216295ab.4.1737906465505; 
 Sun, 26 Jan 2025 07:47:45 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:26 -0700
Message-Id: <20250126154732.405055-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126154732.405055-1-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906465; x=1738511265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtya3Pk0EF4Dljrn4v2acllDC8pZ2Kd/kKTyp6jmYtw=;
 b=UJgBWzgCzMdZS0zzFNBuv7PV4DYH2go9znhYcaZAHZ6M+lE4coNkNJvCkPeP7b35L5
 p98FEl0Tla9+Zq7S7oekWiNNhkF14JUl8ijMYx1Ckg3LzcTtEg5X62wFq5Ey6qOcrOM7
 Uc0lWsRqnz2tY7y2fovid3nBLNxoVZAtfzy47VeBdxQ25qJQo4trvvPJEdEXxY451QzK
 8KmkK8DegsmWInYvdF4zbXnz2Ce/oiylX5MBBhESKSObFWu0u7bv/1LuBycQ64Usm4DZ
 TCbNk7EwmHkSYM3CzwMK9olkuCn7MPLblfN4OWNwxbJd3zGXkN1qAs9FIsgV6uem1C2J
 jkAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UJgBWzgC
Subject: [Buildroot] [PATCH v7 04/10] package/pthreadpool: new package
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

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - update to latest version
Changes v5 -> v6:
  - update to latest version
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/pthreadpool/Config.in        |  8 +++++++
 package/pthreadpool/pthreadpool.hash |  4 ++++
 package/pthreadpool/pthreadpool.mk   | 33 ++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/pthreadpool/Config.in
 create mode 100644 package/pthreadpool/pthreadpool.hash
 create mode 100644 package/pthreadpool/pthreadpool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 461582c62f..c3a348cf86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3035,6 +3035,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/pthreadpool/
 F:	package/ruy/
 
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 594ee41d06..13caddec34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2297,6 +2297,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/reproc/Config.in"
diff --git a/package/pthreadpool/Config.in b/package/pthreadpool/Config.in
new file mode 100644
index 0000000000..194ae33f85
--- /dev/null
+++ b/package/pthreadpool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PTHREADPOOL
+	bool "pthreadpool"
+	select BR2_PACKAGE_FXDIV
+	help
+	  Pthreadpool is a portable and efficient thread pool
+	  implementation.
+
+	  https://github.com/Maratyszcza/pthreadpool
diff --git a/package/pthreadpool/pthreadpool.hash b/package/pthreadpool/pthreadpool.hash
new file mode 100644
index 0000000000..4adc1507f9
--- /dev/null
+++ b/package/pthreadpool/pthreadpool.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  8d8ebab96df6aa12922643060e72c43bfdca9fd80cf5aacaf7391bc6850560a3  pthreadpool-560c60d342a76076f0557a3946924c6478470044.tar.gz
+# License files, locally calculated
+sha256  57814a606b4d0fb087d9a534919084b6c11b58a4174cb5a4aef200187780dc3a  LICENSE
diff --git a/package/pthreadpool/pthreadpool.mk b/package/pthreadpool/pthreadpool.mk
new file mode 100644
index 0000000000..6a05256461
--- /dev/null
+++ b/package/pthreadpool/pthreadpool.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# pthreadpool
+#
+################################################################################
+
+PTHREADPOOL_VERSION = 560c60d342a76076f0557a3946924c6478470044
+PTHREADPOOL_SITE = $(call github,Maratyszcza,pthreadpool,$(PTHREADPOOL_VERSION))
+PTHREADPOOL_LICENSE = BSD-2-Clause
+PTHREADPOOL_LICENSE_FILES = LICENSE
+PTHREADPOOL_INSTALL_STAGING = YES
+PTHREADPOOL_DEPENDENCIES = fxdiv
+
+PTHREADPOOL_CFLAGS = $(TARGET_CFLAGS)
+PTHREADPOOL_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_PACKAGE_CPUINFO),y)
+PTHREADPOOL_DEPENDENCIES += cpuinfo
+PTHREADPOOL_CFLAGS += -DPTHREADPOOL_USE_CPUINFO=1
+PTHREADPOOL_CXXFLAGS += -DPTHREADPOOL_USE_CPUINFO=1
+else
+PTHREADPOOL_CFLAGS += -DPTHREADPOOL_USE_CPUINFO=0
+PTHREADPOOL_CXXFLAGS += -DPTHREADPOOL_USE_CPUINFO=0
+endif
+
+PTHREADPOOL_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(PTHREADPOOL_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(PTHREADPOOL_CXXFLAGS)" \
+	-DFXDIV_SOURCE_DIR="$(FXDIV_DIR)" \
+	-DPTHREADPOOL_BUILD_TESTS=OFF \
+	-DPTHREADPOOL_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
