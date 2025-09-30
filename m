Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F66ACAC5B9
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 08:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E86B605C8;
	Tue, 30 Sep 2025 08:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLF88HXn5pf9; Tue, 30 Sep 2025 08:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2C560E73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2C560E73;
	Tue, 30 Sep 2025 08:08:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD94CF
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FFF860BD3
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCTYqbr8VC_Z for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 08:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.43;
 helo=mail-wr1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B70660E66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B70660E66
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B70660E66
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:07:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso3276161f8f.1
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 01:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759219676; x=1759824476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Q1kpEFn/I4EyAKU6Md/WGWOgeZR4Pd67dyvZy9UHpw=;
 b=xP5ZIm2pu6+M92Y50FF4Guv+Q/rsZVovuNOha6cgJp46idPQ7fjaPgCx7ie16hhwS0
 V6fodtwTuWFM7rSSmdS757jTgoTxGT3CVC08DG5BmMnoYEQqtzF0eK+DryMFkPFbhrAy
 K7FwcuK7sp0bWjcma9JQRPc6Kjgo4kdxemKV8WZwG7ZolVoUdj5YtVPI2ozcfWC35lX7
 fjmU5NgY0CrHVwxtIgS+NhUr9hrPcCp3P/JH/SfmgCWsOo7mjXdeb7IGmeUCBuCutK4i
 ZnV5amNA8/pw16GBnD6iNldqjhE6u5AzcRQ/D1zvSZ6Uny5/bt48zR/MQXJ1nxvrQlVN
 Dv3w==
X-Gm-Message-State: AOJu0YzZ1ExfdgXJnuO8zsuRnB7GtQnQkJbfmvcr2qORhfTtp1knuNJJ
 RjRuRuSZmo4YfCQgJZGiDnw3Brbhq4tdOqy6IJPy86Ca/wbisyxl4qqrjyihTR8b0ms=
X-Gm-Gg: ASbGncvg5lBt46rXreAr+C++a9aEQe8hmlMHldGOnNnPTOgio5yOdgel09KZOI5y3Mn
 eKjpjxfRYsD0p/7n4ugA1LTIJmUs2RoIX5ECJ+NUAPSgKCsBIfWog18KMcG3dHDp3W1UeocyEzk
 IFiy9gGZP1bPn36vg3KjprKLmKRIiMeCrLpEcedAFoCQG6gyLyeKPmXEmGlpgMCE//o1suGwXBX
 rig7YsHUgqzGlv8Xmz7ITd3JCX0/VRh2Aiv0tROI2TZ+K+IqiAv2jjwyvAocMgX5kqaEw8GeKj7
 y8V1Qwe2thGdC4+I2xVRZahCDk9Wyovxf19YMZd4sSKBKdZ9pq2vdan/2wK9WtnRNkF09aomZrs
 XWD5lc384Zb/uJYNzXkEJfAoyO+9ykcOzisg4PZu8fX4g4TCiCvuvlFpnG6MhhQnUnpJ0tz8WHW
 AznCNRXBqxvH9B0FUjlxGhex0BhZD61tNa/WhnTQE+tEKf1JXQcT0TSlVJKokJ6ltzcu5Ajg0h3
 TJbh8XfTA==
X-Google-Smtp-Source: AGHT+IENjXw7Ha4+hd7SF3DZXVp9piemU5vzq9rLV5UQqaV3YtdMTlN16c2u6yjZbKE1paHTYMbVAg==
X-Received: by 2002:a5d:428c:0:b0:400:818:bafd with SMTP id
 ffacd0b85a97d-4240c7344bbmr2746611f8f.0.1759219675623; 
 Tue, 30 Sep 2025 01:07:55 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602f15sm21558362f8f.39.2025.09.30.01.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:07:55 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 30 Sep 2025 10:07:49 +0200
Message-ID: <20250930080750.353542-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930080750.353542-1-thomas@devoogdt.com>
References: <20250930080750.353542-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v5 2/3] package/cargo-c: add new package
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
v2: no change
v3: no change
v4: no change
v5: no change
---
 DEVELOPERS                   |  1 +
 package/cargo-c/cargo-c.hash |  3 +++
 package/cargo-c/cargo-c.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/cargo-c/cargo-c.hash
 create mode 100644 package/cargo-c/cargo-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d3fdbb49a0..1cd1b65145 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1363,6 +1363,7 @@ F:	package/rpi-rgb-led-matrix/
 
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
