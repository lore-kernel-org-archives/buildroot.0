Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD17CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 04:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0548607CC;
	Wed, 24 Sep 2025 04:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtkIJAoA40Kq; Wed, 24 Sep 2025 04:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E840D60847
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E840D60847;
	Wed, 24 Sep 2025 04:18:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80BF9177
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 04:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 670D140A97
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 04:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bJIs2gVwwy7 for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 04:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.49;
 helo=mail-ed1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DB7840A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DB7840A96
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DB7840A96
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 04:18:09 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-62fbfeb097eso7849279a12.2
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 21:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758687487; x=1759292287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0kjf43HMpqmlBtqR/sW4bYRCG+NlN+g8K2Wfzk19QA=;
 b=K+VunUuDmuX81XqzXkODdSPQMmQbYEcKLj0r4mdnccT95jrV5EtYqTUfaoyobR3e+y
 m6iIwk1xaTiUH8cegbSZsXOJytAQSyHSY8drma8zxhQgmcZ8kEPVUm0bxKr5Xds4bqdR
 BkYBNhOTbjs51kQ+7yLWIw7G2M3KU9t3r1JB10jEDFI41SD08nLFXUIg4pjZeuhh/TKO
 EFAt96OSyn7Mz+mrAbCCHW1dJW+dhKnFfPZLmcJxckPYR+CiVPkpWHyUC0zzNvqNqdPt
 oViSQIHDQZk4Wl8iibYWtJa4M2maamNBOAXbowTvkjaXbbXU2nNxVddS5QUo71Mg+pRF
 qyOQ==
X-Gm-Message-State: AOJu0YwLiQpnVzWEev7PJXYueduujJV/FjXVqJLSJVHAGfiRtZ0qVbwn
 ZMBLOzYnv/4AgC3PIm219XTnT14G1lXbMbxVb2ni6E7samlMKQbSjNssqyydnL6j0PU=
X-Gm-Gg: ASbGnct6bL7KgFl+Fp0CfNwdNKV2qBCj9r80u0biLdW2m00ZWBT50kNAVQpVj+Ivc6i
 9YwN1MZ/wxdCtbsju04FFh0Fe7gTUxiekNVxgahOAj1HezKFwOQ0339ZSa6Rp2lRwNHPLPAqovz
 pL9CLJdHaP9HdWSko3tcvQ+enkP0xfKnb/4wn/hlOhKGC36ED3lk1cjNgwpMCPplxHKAdj+ihD+
 +2CYqPoSBqbjbtjMriJcoWaM24WQbxgyiLosyEHMe7RJYJiToHppDOmHiiITdY3nDZgbDajFAzs
 NggAE9PYM2XpirOb0id99qBXdegOnGCH/zq4/DdFsIlXb7w1+VzK6yi8ROkOvzE/TsnmkK2XhPL
 QazrEp+aP+PMwuvGCYwVWvfGfeoW/xPUuPG83P4/gFAmG856UR0DoZ0LTj6KlBqQOZCF6iOishx
 LbBSu2Zf9AiRrktue4H/2wPe6lj1ggKkVSL40=
X-Google-Smtp-Source: AGHT+IG9gx5iB4r5Np6nXPaBT2g5EK8DOIcMHsQFSbN2/cV9tMGb5CGI04Zwqd4tk+Ev+bPbNMYmvQ==
X-Received: by 2002:a17:907:d2a:b0:aff:16eb:8b09 with SMTP id
 a640c23a62f3a-b30263b8e21mr439394266b.5.1758687486725; 
 Tue, 23 Sep 2025 21:18:06 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:d339:b5c0:6675:22c9])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b2928cd31c0sm862023066b.104.2025.09.23.21.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 21:18:06 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 24 Sep 2025 06:17:57 +0200
Message-ID: <20250924041759.2449210-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924041759.2449210-1-thomas@devoogdt.com>
References: <20250922071344.3864120-3-thomas@devoogdt.com>
 <20250924041759.2449210-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 2/3] package/cargo-c: add new package
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
---
 DEVELOPERS                   |  1 +
 package/cargo-c/cargo-c.hash |  3 +++
 package/cargo-c/cargo-c.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/cargo-c/cargo-c.hash
 create mode 100644 package/cargo-c/cargo-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8403db636f..7295bf7ea1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1368,6 +1368,7 @@ F:	package/rpi-rgb-led-matrix/
 
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
