Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75241CAC5AC
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 07:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C2961728;
	Mon, 22 Sep 2025 07:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d754Kc5R6a_b; Mon, 22 Sep 2025 07:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FBF61712
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FBF61712;
	Mon, 22 Sep 2025 07:13:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88091D3
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E49941360
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-tvzwWFnwE3 for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 07:13:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.53;
 helo=mail-wm1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 522204138F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 522204138F
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 522204138F
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45e03730f83so15976145e9.0
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 00:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758525231; x=1759130031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i44PXyA0949f6/ZqUMVNMukUfaDBH6plFrYo8ZaSIKU=;
 b=p4ZIFJRTBcoh/EZpSAMrJSh2+0O7oDdsYQZOX4Xv7bRQFvdko5EztbJii3rCju8Z3m
 0rlD4RxZd8tn8R56tyzrSpKrfOxzYCtWyrfqQeW8qvZf6jC+J3sPvoJpd37MkO/AwjGP
 EXgLQ03x65zY3dbGcOx07HE7Srqd6eX+LHFA39xHMfVfGt6UVx31SoxO0HNdk2kwfP6d
 X3btvzCqqqbmciQPdDVVgl5md6+GQdU0LsAeG/IfDtViYPl3Yo/+sD4q+O4GeXctKajC
 /TiQU64YKABp6mk4xUyIDfejeCK3lMQBPfE4IXylP/kBS3y7Ymw3ph4ZVBuYf259h0mV
 QDdg==
X-Gm-Message-State: AOJu0Yzl1cpI4B/nrG+SKp5AR12tFki+XCz9JAEuOFLKmowvpq8c0kWd
 TN2ON9ws4cSLZLMofyEm/1ngw2AjULBlSBlJHjNUUPaT0BRyjVtc5EBfQF7mIL1l
X-Gm-Gg: ASbGncuP90Jck3iSNevwDj/oO+N0c7QDSfnYQjiQXAz/RGIZLLAuqkNbxraMWqcJKb2
 h8qfBEjsS5oGh//mldcUsgFAj2g5v0Kh774id9NiaCRUdWKd8wLF/iaKk77vMvckE3dMIe/KzVu
 0YE2ZlPXP6SSpJ5/DA9+1LEBpAlEZdDSJjJbwDFarTjoSPYMmx90/jkfF+Ab7VzT4ZxPORYdESy
 1bnG3xjoYawtsDnS6mV+wJWjKZ6Q0k+INd4r50B0Q5QEWgjUoqvRIfo6oHwKO6f2Q2qivIhRRdu
 cVsbdvWsAM8Aly097JBYgsYTD1szGaPwkOa1JW9gOsgxiAnKbTGPiAcIoiqbMFzklWUzQvmMkmN
 wKDVfrrZ/dxqfkuOjEokL7/6LoE9yKcm1jvNZZRnhgCX+YVcGxj5AULKYA2JFwEaNO2tj4jUUPP
 lP8nt5fG5HN3hCMAVgxHl66HjVPGpw2GavufzhONACDAmN7ek=
X-Google-Smtp-Source: AGHT+IFZ5H+37FdP88HCDRWf1jqbCWQoKBwiVWBOofz3rpWKDFHm2OprFYHGTqjjXJFKVfcDZVBo2Q==
X-Received: by 2002:a05:6000:26c1:b0:3ce:bf23:3c32 with SMTP id
 ffacd0b85a97d-3ee7db4c58dmr8283625f8f.22.1758525230976; 
 Mon, 22 Sep 2025 00:13:50 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f3d8csm17746771f8f.9.2025.09.22.00.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 00:13:50 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 22 Sep 2025 09:13:43 +0200
Message-ID: <20250922071344.3864120-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922071344.3864120-1-thomas@devoogdt.com>
References: <20250922071344.3864120-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/3] package/cargo-c: add new package
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

From: Guillaume Chaye <guillaume.chaye@zeetim.com>

Cargo-c is a cargo applet to build and install C-ABI
compatible dynamic and static libraries.

It will be required for librsvg.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
Superseeds https://patchwork.ozlabs.org/project/buildroot/patch/20250324173246.100112-2-guillaume.chaye@zeetim.com/.
---
 DEVELOPERS                   |  1 +
 package/cargo-c/cargo-c.hash |  3 +++
 package/cargo-c/cargo-c.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/cargo-c/cargo-c.hash
 create mode 100644 package/cargo-c/cargo-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c6ff40886..6a862e75f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1367,6 +1367,7 @@ F:	package/rpi-rgb-led-matrix/
 
 N:	Guillaume Chaye <guillaume.chaye@zeetim.com>
 F:	package/sane-airscan/
+F:	package/cargo-c/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
diff --git a/package/cargo-c/cargo-c.hash b/package/cargo-c/cargo-c.hash
new file mode 100644
index 0000000000..64353c5628
--- /dev/null
+++ b/package/cargo-c/cargo-c.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  757034535d42b345cd7b47c9d5e3624073332437805634153a19259439491be2  cargo-c-0.10.15-cargo4.tar.gz
+sha256  d69f24ad84ec2ade64c0b68bdb31b41170e997b158370342056918329cc9af1e  LICENSE
diff --git a/package/cargo-c/cargo-c.mk b/package/cargo-c/cargo-c.mk
new file mode 100644
index 0000000000..1f9e1f786b
--- /dev/null
+++ b/package/cargo-c/cargo-c.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cargo-c
+#
+################################################################################
+
+CARGO_C_VERSION = 0.10.15
+CARGO_C_SITE = $(call github,lu-zero,cargo-c,v$(CARGO_C_VERSION))
+CARGO_C_CARGO_LOCK_FILE = https://github.com/lu-zero/cargo-c/releases/download/v$(CARGO_C_VERSION)/Cargo.lock
+CARGO_C_LICENSE = MIT
+CARGO_C_LICENSE_FILES = LICENSE
+
+HOST_CARGO_C_DEPENDENCIES = host-libopenssl host-pkgconf
+
+$(eval $(host-cargo-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
