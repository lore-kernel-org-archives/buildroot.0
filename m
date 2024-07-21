Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC58C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 14:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10CE781064;
	Sun, 21 Jul 2024 14:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXasGZG-iohe; Sun, 21 Jul 2024 14:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE5D810A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BE5D810A4;
	Sun, 21 Jul 2024 14:28:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D156D1BF2B7
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 14:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF105605E0
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 14:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYYAOY9BSC6q for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 14:27:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B4E860591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B4E860591
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B4E860591
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 14:27:57 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a77d876273dso156447166b.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 07:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721572075; x=1722176875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1gZHedI23yGclSrTQ+uDEAskF7aB/ysBUsjDMGLm8Iw=;
 b=qhWawQjaBXZW+CDpMNTjCEMDoiO1bsj2l13hNWoLRiR5szv4hCmFM+Hbi1YUf+tvdR
 pc1E5W9yNe/fFbwp0QeKT23tz9A/KPPyzdUsplLaZ635+NwE4vv+XZX3HORjIzJI5YIG
 qdLZfIrh5jefKB+WeGA4aDM4SGq6gMJFCZ4izEAcVIkfBhULYHzhO6Az+2/FdSnx9aXn
 8sxD7opUUvEuLG3NuTZBy+lOjPOVXMFJQA0n06NSvDqRwp6gjOqfK7IejxX7v0rBpuc+
 r9OMMWKIY60O8EaglkoUkczcoeJdGObVqnzIt376DWoDO+rMVohwqf/shgF8d00Q7cWR
 u8CA==
X-Gm-Message-State: AOJu0YzGWH4goARG4OPEt/7hiWGGr3UBwI9cjjKpopcv+VzXR7QU/C/i
 44j7LXEh3uD/qVStM+gN2LAn2pTif/QsdtHU3Hhx0mM7ZLxQ4Bgajbptag==
X-Google-Smtp-Source: AGHT+IEvOYma3x8/7Dy+vFnhOIrN2z4tROJM0sp6p+kN5fxcQYWE23Mb7EsAdZLlm8jTVa/6LoRXhA==
X-Received: by 2002:a05:6402:350e:b0:5a2:82b0:259c with SMTP id
 4fb4d7f45d1cf-5a47957c272mr3878791a12.13.1721572074950; 
 Sun, 21 Jul 2024 07:27:54 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-265b-b2a3-bdc4-dd7f.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:265b:b2a3:bdc4:dd7f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a7344dd630sm879741a12.54.2024.07.21.07.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 07:27:54 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 16:27:47 +0200
Message-Id: <20240721142747.2395700-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721572075; x=1722176875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1gZHedI23yGclSrTQ+uDEAskF7aB/ysBUsjDMGLm8Iw=;
 b=i8onH+uqt76jMHgt+4x6xDfbrgDyXLZ6jrGOk36CVBi644t9TvWeYxtdyItS13mb4N
 CJ0QVkHbKpbzTbGMyFdgghxZvNUnssHe2cucQQ82at2vPBjXZZ0ggXCg8N+84hBU2uWl
 IMBFolgSjpb7onXJHU5Mp5JleCSijJ4gMYuZ9lbL2g7glkC2W8jzV+CvreIAYf/whiyn
 3La2PA9aSIHrLWuXBbXjBZ5qok7BxWkVqBEGM+C/zpGNEfQZLu3n1p0ci3fme6h3HAOs
 WYlMq5C0Kh/g5JY7MGB71v63mXiq0cUNykOB8gvQTsx4nOw7gKTjyJ7gzligBKV8+DKl
 B6OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i8onH+uq
Subject: [Buildroot] [PATCH 1/1] package/parsec-tool: new package
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Parsec Command Line Interface
This tool can be used to communicate with the PARSEC service.

https://github.com/parallaxsecond/parsec-tool.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/parsec-tool/Config.in        |  9 +++++++++
 package/parsec-tool/parsec-tool.hash |  3 +++
 package/parsec-tool/parsec-tool.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/parsec-tool/Config.in
 create mode 100644 package/parsec-tool/parsec-tool.hash
 create mode 100644 package/parsec-tool/parsec-tool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e5fe7b25a5..333e26d74e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2862,6 +2862,7 @@ F:	package/biosdevname/
 
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
+F:	package/parsec-tool/
 F:	package/procs/
 F:	package/mxt-app/
 F:	package/zoxide/
diff --git a/package/Config.in b/package/Config.in
index f2e10b2b5e..a0d78518b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1589,6 +1589,7 @@ menu "Crypto"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
+	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
diff --git a/package/parsec-tool/Config.in b/package/parsec-tool/Config.in
new file mode 100644
index 0000000000..7607017bb1
--- /dev/null
+++ b/package/parsec-tool/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PARSEC_TOOL
+	bool "parsec-tool"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  The Parsec Command Line Interface
+	  This tool can be used to communicate with the PARSEC service.
+
+	  https://github.com/parallaxsecond/parsec-tool.git
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
new file mode 100644
index 0000000000..bd01bc4980
--- /dev/null
+++ b/package/parsec-tool/parsec-tool.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5b994e10305a682c22fb6f566b57874a22ed8b9120d9fd253f5fa17c40ff759a  parsec-tool-0.7.0-cargo2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec-tool/parsec-tool.mk b/package/parsec-tool/parsec-tool.mk
new file mode 100644
index 0000000000..6fe2a8f320
--- /dev/null
+++ b/package/parsec-tool/parsec-tool.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# parsec-tool
+#
+################################################################################
+
+PARSEC_TOOL_VERSION = 0.7.0
+PARSEC_TOOL_SITE = $(call github,parallaxsecond,parsec-tool,$(PARSEC_TOOL_VERSION))
+PARSEC_TOOL_LICENSE = Apache-2.0
+PARSEC_TOOL_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
