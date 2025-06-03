Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4131C5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 19:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B896614FD;
	Tue,  3 Jun 2025 19:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pn3LgenY3Z2t; Tue,  3 Jun 2025 19:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F6F16124B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6F16124B;
	Tue,  3 Jun 2025 19:58:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2087B07
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 19:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A81B9841C5
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 19:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4jmi2dmUF95 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 19:58:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.45;
 helo=mail-wr1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A916841CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A916841CC
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A916841CC
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 19:58:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a51d552de4so49236f8f.0
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 12:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748980715; x=1749585515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/01yz8ybhDBqjbigqLgX76sskQ2bMJNG8ZCEi+SdnY8=;
 b=FD4f/ZWedwdetWNf3ivkbLB+f0YY5J6mcARU5JsXqdG0fFiOt9dEzsPLYx0MVqB22g
 WYsGJB2f+u1WikxGrgwN2zdZtfPqtC6w/YjmQ23DITJXh83pmvwSTxofNwa2JHzqxZUx
 hjI6knqE5BZMfoANo6Cs1U60YQ5wzWA89/OP8gTR5GdEhKPnhCYMwcpDXt+zfheyNaBW
 p++oRBHjdU+5KGl52GAoZoRAlFe+CiZraRMVJiDvNEGGoVhKIMKwi3+V4DxqKH7XlwSI
 Ljh4ppwXUn95ZF74DSD65glbFV0hzMHf1lNpEx9UHjSLxZAmwxWH9JgSZ99C0etD/9Ja
 AzGg==
X-Gm-Message-State: AOJu0YyuoiTSxcntmKyZM9Jgn0bqdKOisJHSWCRVGo6M+IWcT2CjxFIg
 xvYBVRIy8TYZTt5RU6N7xQtkOFYroSU4rnCtWTwXfn3h3NNjrFQvlw5HAMD3lw==
X-Gm-Gg: ASbGnct8wky6SSn5GqAObRkWXq/jjt3HTHcgxk40Yi1+ye0LeDuiKjRLKB7aPP7/E4D
 a5Os709lEk6IOJsfrHYJhR3ZLYWnFMYRgjwCgGfuacdZmPT9Ft3sdBB5sZyjx27eFf2d6zNChnj
 FD++OA23/e+MGWQcbQXBWDKoE05wAOOmOR1Y20uZN3//jA7839TDo2xypMErOnMqOLK8L4O2ZCi
 37fPFyPfRKnGX2zoJAjMMmmS42yQWwZjVowNc8eIInFYE6NSBY1QsZfQxMyT1b2gHt7Y9MEHd4F
 1DxiO3BWjM47Q9TeWhmy93IV22ZZl7MHEG0FAxYCqzdFyDVh5w9NLllORLeNXMk=
X-Google-Smtp-Source: AGHT+IHq+9DCwFeLpyPkR5Dby4ZPGnSn6A5uyyY3mfIxCJ6v5HpBzGgu5q0rAvC5rPbj1WCLHH9EFA==
X-Received: by 2002:a05:6000:430d:b0:3a4:f6f1:faef with SMTP id
 ffacd0b85a97d-3a51d961cc0mr59195f8f.32.1748980714668; 
 Tue, 03 Jun 2025 12:58:34 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe7415asm19387116f8f.57.2025.06.03.12.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 12:58:34 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue,  3 Jun 2025 21:58:26 +0200
Message-ID: <20250603195828.1189582-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH 1/2] package/msgpack-c: add new package
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

MessagePack ships both in a C++ and a C variant. Add the latter to Buildroot.
This will be used by fluent-bit.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
buildroot$ ./utils/test-pkg -p msgpack-c -a
                             arm-aarch64 [ 1/40]: OK
                   bootlin-aarch64-glibc [ 2/40]: OK
               bootlin-arcle-hs38-uclibc [ 3/40]: OK
                    bootlin-armv5-uclibc [ 4/40]: OK
                     bootlin-armv7-glibc [ 5/40]: OK
                   bootlin-armv7m-uclibc [ 6/40]: OK
                      bootlin-armv7-musl [ 7/40]: OK
                bootlin-m68k-5208-uclibc [ 8/40]: OK
               bootlin-m68k-68040-uclibc [ 9/40]: OK
             bootlin-microblazeel-uclibc [10/40]: OK
                bootlin-mipsel32r6-glibc [11/40]: OK
                   bootlin-mipsel-uclibc [12/40]: OK
                 bootlin-openrisc-uclibc [13/40]: OK
        bootlin-powerpc64le-power8-glibc [14/40]: OK
           bootlin-powerpc-e500mc-uclibc [15/40]: OK
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: OK
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: OK
                   bootlin-sparc64-glibc [21/40]: OK
                    bootlin-sparc-uclibc [22/40]: OK
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: OK
                   bootlin-x86-64-uclibc [25/40]: OK
                   bootlin-x86-i686-musl [26/40]: OK
                   bootlin-xtensa-uclibc [27/40]: OK
                            br-arm-basic [28/40]: OK
                    br-arm-full-nothread [29/40]: OK
                      br-arm-full-static [30/40]: OK
                   br-i386-pentium4-full [31/40]: OK
                      br-mips64-n64-full [32/40]: OK
                 br-mips64r6-el-hf-glibc [33/40]: OK
               br-powerpc-603e-basic-cpp [34/40]: OK
               br-powerpc64-power7-glibc [35/40]: OK
                       linaro-aarch64-be [36/40]: OK
                          linaro-aarch64 [37/40]: OK
                              linaro-arm [38/40]: OK
                         sourcery-mips64 [39/40]: OK
                           sourcery-mips [40/40]: OK
40 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/Config.in                |  1 +
 package/msgpack-c/Config.in      |  9 +++++++++
 package/msgpack-c/msgpack-c.hash |  4 ++++
 package/msgpack-c/msgpack-c.mk   | 18 ++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/msgpack-c/Config.in
 create mode 100644 package/msgpack-c/msgpack-c.hash
 create mode 100644 package/msgpack-c/msgpack-c.mk

diff --git a/package/Config.in b/package/Config.in
index 579b5ffc87..031f24dce0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2304,6 +2304,7 @@ endif
 	source "package/mpfr/Config.in"
 	source "package/mpir/Config.in"
 	source "package/msgpack/Config.in"
+	source "package/msgpack-c/Config.in"
 	source "package/musl-compat-headers/Config.in"
 	source "package/musl-fts/Config.in"
 	source "package/neon-2-sse/Config.in"
diff --git a/package/msgpack-c/Config.in b/package/msgpack-c/Config.in
new file mode 100644
index 0000000000..603fce7a48
--- /dev/null
+++ b/package/msgpack-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MSGPACK_C
+	bool "msgpack-c"
+	help
+	  MessagePack is an efficient binary serialization format.
+
+	  It lets you exchange data among multiple languages like JSON
+	  but it's faster and smaller.
+
+	  http://msgpack.org/
diff --git a/package/msgpack-c/msgpack-c.hash b/package/msgpack-c/msgpack-c.hash
new file mode 100644
index 0000000000..e4fe61f424
--- /dev/null
+++ b/package/msgpack-c/msgpack-c.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  c23c4070dbe01f46044bf70c5349f29453d655935b6dc710714c008bca0825a7  msgpack-c-6.1.0.tar.gz
+sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack-c/msgpack-c.mk b/package/msgpack-c/msgpack-c.mk
new file mode 100644
index 0000000000..f12dcb085f
--- /dev/null
+++ b/package/msgpack-c/msgpack-c.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# msgpack-c
+#
+################################################################################
+
+MSGPACK_C_VERSION = 6.1.0
+MSGPACK_C_SITE = $(call github,msgpack,msgpack-c,c-$(MSGPACK_C_VERSION))
+MSGPACK_C_LICENSE = BSL-1.0
+MSGPACK_C_LICENSE_FILES = COPYING LICENSE_1_0.txt
+MSGPACK_C_INSTALL_STAGING = YES
+MSGPACK_C_CONF_OPTS = -DMSGPACK_BUILD_EXAMPLES=OFF -DMSGPACK_BUILD_TESTS=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MSGPACK_C_CONF_OPTS += -DMSGPACK_ENABLE_SHARED=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
