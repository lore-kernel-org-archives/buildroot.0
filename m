Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEC4CCD1AA
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 06:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C650861089;
	Sun, 19 Oct 2025 06:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmId718iD8Sm; Sun, 19 Oct 2025 06:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFF09610E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFF09610E2;
	Sun, 19 Oct 2025 06:45:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB3F21CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E81ED83E21
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITSqvfLdTr4q for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 06:45:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.48;
 helo=mail-ej1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7EED83E0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7EED83E0F
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7EED83E0F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:13 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b5a8184144dso534058266b.1
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 23:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760856312; x=1761461112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHILNlvCat9eHZdWCuO5hfBcsbRkzgWyOe4nma1/M8Y=;
 b=R8R80aq9Hzl0f2i+b/LOGcHQ5Lw3KWqTgHszNmvFMiijOdhGw+m2KApLb7nn5zZBE7
 zMkHPnfUTQKKUnPvmd6d2KdnW96pRcgqSZswq35kNrCi9D9AMU7kfqGlEgK+m2sha42V
 DyUnhNn3fJliBeXK+MH0KXRqn8r3BiJuMCtrH3fam5I7SE+dYtClXLCGbyk4Iwp265kk
 AkU59tZqOW+gkPxQlnHHBtYj2wMONh83bp60HbTGMo+Ck6pci4DnmlZ8W2YE6tVA0d5t
 nSTVqV637rlkW2G3sg+mDoCIXyJxGPLognA9w2d5Ap/mKzynDmkLJ5aWwb7h+Mr2RP9N
 3EYA==
X-Gm-Message-State: AOJu0YyzfTI/Qt7V4CCHpCTuMOA1hDdSeEVIy+TQpiPsvOGzpat0K+Xl
 9tL6jIzvq5k1XCXzh8LIZU3Zunn3vkHDGF13fdS654D69pG4LRT8u4jirYCFBA==
X-Gm-Gg: ASbGnctZrayyEhUKAkYH9UWyxP214oLcfFtDX2OF5V+IcChvDdverQm56kCabunqqAe
 dioT+Ls1Z8E/63G28SQIMLd3vwZBcR8qdoxpynSEB7GHfHKIMGJtnN/Ba/zR4ybK0Q+a7L+k3IU
 Yi/sgMWilo5hXoxPlBMoJUDT9HkLADaMxHoicoGAPBj/oXSXyfoNREN72jLzEorrvhibO7lBrzX
 AOtmmCmYcQEx3RL+JeTBgp7DqlV1IXmBGL67TeCfMz5wTZb+pvQqUBHJtoYOzQQdvpkuab2qVl7
 HS+pXwLH6puM0qrLfY4Wj5wTl9gBdGYsWNkjztMsKZu6l/jGjhELOkZATOnGXi65mzwonGW2Z7k
 4rjVqS4xOBAy4lJrFrqs4APXweSXUlKIaZ1E5Cn5glJMjYfUV3QgLRQYLS5FPhJ4ZnIqCixb3Dz
 DOjb8jmTMIEbONq9ZPV/pr1glnzcOyv4rX9OU2e20wGWshSig3UitRAeTnwBD36d8C85qg9RIZJ
 PFDEO9Z
X-Google-Smtp-Source: AGHT+IHBE90qLhP06363i4tNcKBJY7RmsW593Bp9mQTOCoXyEO99MtCJuBOSETqw5YuM1CY21kCkyg==
X-Received: by 2002:a17:907:d1e:b0:b64:6795:e373 with SMTP id
 a640c23a62f3a-b6475e09ca3mr1031098166b.36.1760856311626; 
 Sat, 18 Oct 2025 23:45:11 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb6f:7900:c79:d46a:26fa:5c6e])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b65eb525f48sm434706466b.60.2025.10.18.23.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 23:45:10 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, eric.le.bihan.dev@free.fr,
 fontaine.fabrice@gmail.com, guillaume.chaye@zeetim.com
Date: Sun, 19 Oct 2025 08:45:02 +0200
Message-ID: <20251019064503.2583945-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251019064503.2583945-1-thomas@devoogdt.com>
References: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
 <20251019064503.2583945-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v6 2/3] package/cargo-c: add new package
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
v6: no change
---
 DEVELOPERS                   |  1 +
 package/cargo-c/cargo-c.hash |  3 +++
 package/cargo-c/cargo-c.mk   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/cargo-c/cargo-c.hash
 create mode 100644 package/cargo-c/cargo-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 69f22259e8..3e6efb40a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1366,6 +1366,7 @@ F:	package/rpi-rgb-led-matrix/
 
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
