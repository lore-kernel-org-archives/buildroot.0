Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EFDCAC5AE
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 06:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0CB61B63;
	Fri, 26 Sep 2025 06:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXCoc2d-domy; Fri, 26 Sep 2025 06:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67EFC61B64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67EFC61B64;
	Fri, 26 Sep 2025 06:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6479A198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6170184A0C
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uTBErWF96fs for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 06:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.44;
 helo=mail-ej1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C39F84A09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C39F84A09
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C39F84A09
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:10 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b3882e7432bso32925766b.2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 23:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758866588; x=1759471388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UT2vTojGFC7YUGLyjuKhJjkb4+davZXCjESQE6PCrFE=;
 b=SmsPcSPg8EcGnGzgqdORc00iUavqRPmXdKnQHVaA6n4EZ0ZmtLnxWG3Gsc/jHP0gJX
 yG+bx6dS8hDMkZKcF83gE/cjFHcNeaqMsnGPbRlVFCK554LNR5SUFjJJgYqUbW4O8+l5
 IIN7EOEZyTB2T7MaeiKRnicVwrxPjD2sCAk2EhexdkJzn5f6zliKWeP1EWXtTLiiI0aQ
 CnO921O6Y5NzJ0u64AB8/RZkWBQeHq7Rm0xrNvDiJ1YQV3Zr5kDBqfK6H5bXNhpa8Gzq
 WFHw7xoOC35tJXCqLuISOVBashyZcZ3MxTm1xz//bVlEXMN2c/116NGYGyd2uV1+Z8y/
 0BfQ==
X-Gm-Message-State: AOJu0YxhLqWdCA7rJauQYbVbXztuL4xQgzPAImcyKYxIzbCMHKH5kTAT
 uEw7qs6xgOA+O3WpeoTpPnObGJ+VLeKgv9qclS/A21qxp2boBpz6ivlBMvRWUOi/
X-Gm-Gg: ASbGnctWeuCnzFnGnRuanKgfBs5ud00ULHmM/h93drz+nwSNl1Yai4RX6rPWsJ8yuru
 hw0QNelriVBpZtMhkGtUBOeW0ma6uxlJKcKYWTKe28QZyufNc6dE908pbCVkXr3XOQTIpDoCCiX
 Tl5FeZYRW9Pmx6Dc7dzM4L715m53BT9G18EovFSU6VCDv4YtzCFhPD9LX/E0/2AskATKNJWEgNe
 4HSn1Qfrfkq0GmQd7DTHYsO2cAXM9E3peb9/u42j6vh8VQzgDbmVcYsDZK+9caZZ5qX5JKpCtHn
 JTkTcsWNhky4w/EZdO5DWVg3X7qHCjOvX7RqK1jb8HBVLZE1SwUsWFVloR4CNDY4OpSyXctcuzB
 JDkdoC8GIbgvwDlwqMpNzZ10ewHUGAQ70RBHbcQLXqT8ic6nnS6Cc0YPBsrhSxLodqiGxmuSiSg
 1LH0yC8Nth9Z5ZdKFZ8T2fOki1cqUN
X-Google-Smtp-Source: AGHT+IHjTmzWu/Bz+hSBVEmLsvMYvvSvLtIrCY0iXND2mzha6ut5tik0EGyoxGRTvrfi15f+kLeFgg==
X-Received: by 2002:a17:907:60d3:b0:afe:7b8c:a583 with SMTP id
 a640c23a62f3a-b34b79c7002mr555971166b.13.1758866587607; 
 Thu, 25 Sep 2025 23:03:07 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb6f:7900:3020:9fd6:5911:46c8])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b3545a9c3e1sm298650466b.105.2025.09.25.23.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 23:03:07 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 26 Sep 2025 08:03:01 +0200
Message-ID: <20250926060303.259618-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926060303.259618-1-thomas@devoogdt.com>
References: <20250926060303.259618-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v4 2/3] package/cargo-c: add new package
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
---
 DEVELOPERS                   |  1 +
 package/cargo-c/cargo-c.hash |  3 +++
 package/cargo-c/cargo-c.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/cargo-c/cargo-c.hash
 create mode 100644 package/cargo-c/cargo-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fc561eb1ea..4f017cb03b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1364,6 +1364,7 @@ F:	package/rpi-rgb-led-matrix/
 
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
