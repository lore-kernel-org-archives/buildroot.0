Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B8CCAC593
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 19:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CA9360787;
	Sat, 13 Sep 2025 19:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjrLMj3GiBUx; Sat, 13 Sep 2025 19:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2371E6088D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2371E6088D;
	Sat, 13 Sep 2025 19:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F140D25B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E33996077D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGs5AyUC3FZu for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 19:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.48;
 helo=mail-ej1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3A3660777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3A3660777
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3A3660777
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:42 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso375012866b.3
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 12:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757790281; x=1758395081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NctGTuwV3eEJW3apG8jA/YYqq4Iq4GDwvYWypsolYUU=;
 b=YS/kmRW0YmFqXvnByRMtKPT8Y3HdPDhzzIfjiMFCKIIbZWrnyvKymNK6dX9uYO8hZv
 D1moTMB4pbf43pPhTpf/O67DvDgBFjMuPEcsHwP93wI5MDVEmNr4guUCB/I3J+TRnaoX
 y6mtUuZb+u1A5Rf6irimbxE9VMofCaNFprk8YcGa2Flxyg9gIEjk486jdoqXDpOVMz9P
 fRl9ZDk5OSJK7aE5wKdOcIB3xn51v42smkMaFrQkLQhMEEO7aPMKt9Cyjc9kKVWJIO36
 PxCewuB6/BA+fK/cecIDuqSODCgxJzXYqeunCYFxxlQfGdJe27IhA86XyX4SUAGN2sbJ
 GgSA==
X-Gm-Message-State: AOJu0YxZZ82FErzDjAJh4gdl58Ry/7DUY3DZCZd6UKKphcrVKA4rxF1p
 0u+jptBQyvIF/xiSbCpQy7Tcrs8Z7rLSpmAgozjuFr0l/ExWno7Bv8z6xhLuHhm7
X-Gm-Gg: ASbGnctukYo57RhPKH/ZHXWb/dmtCoPQZ0K0RkSFp5XXeQOaKHM4WB59pifHGktekTG
 sDksOzaQ/a32zSzoVUmxnKnyiolZcXu+ROLUwXkmenLVuuTyBAU7R+oRfx6hPF5a6IV86fwbjrZ
 hbAK9FDsjsCoZQBz8ak/HKe6SIwZuTVDrPa6Z+FXfbp5MRGImtGSkuUXnN/IQB7wl+5ZNqg/bBx
 LUAvwsduNEBYg48xAmw77c0T8agrOfjLZOCHm9B5q4Z8w2sIzxAAeRRPead4EDtS7Rd8JNZsBH6
 ys2cBGnrpgX+0RN3DFICQZrjZ8b3EMLhTYMiksD0CRrPXT1unT5nM8fmRz2z1QEuFHzj1hVQMnl
 PxYInHy7on98lwqfrGh+fKL35gZvKVDyMtpl4Lu6Z3N95N1o+pECax1yNzGE0M9FQe2DDP2pmYG
 EI3/i6klh6flmiknTOefViVml7jdjnhWsoWa0=
X-Google-Smtp-Source: AGHT+IFef1c1MERyydMs/KzGVP80I8F6zcIRv6C6g+rG8QyF85V5fURHiDrYM9+8+UhbrBh6NvgDmA==
X-Received: by 2002:a17:907:3ea8:b0:afe:b7c3:df29 with SMTP id
 a640c23a62f3a-b07c353e45bmr671517566b.8.1757790280633; 
 Sat, 13 Sep 2025 12:04:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:f67f:75ec:aef0:e4f5])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b07da7a8918sm243901366b.56.2025.09.13.12.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 12:04:40 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 21:04:32 +0200
Message-ID: <20250913190434.2224911-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250913190434.2224911-1-thomas@devoogdt.com>
References: <20250913190434.2224911-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 3/4] package/pango: bump to 1.56.4
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News: https://gitlab.gnome.org/GNOME/pango/-/blob/1.56.4/NEWS

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
$ ./utils/test-pkg -p pango -a
                             arm-aarch64 [ 1/35]: OK
                   bootlin-aarch64-glibc [ 2/35]: OK
               bootlin-arcle-hs38-uclibc [ 3/35]: OK
                    bootlin-armv5-uclibc [ 4/35]: OK
                     bootlin-armv7-glibc [ 5/35]: OK
                   bootlin-armv7m-uclibc [ 6/35]: SKIPPED
                      bootlin-armv7-musl [ 7/35]: OK
                bootlin-m68k-5208-uclibc [ 8/35]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/35]: OK
             bootlin-microblazeel-uclibc [10/35]: OK
                bootlin-mipsel32r6-glibc [11/35]: OK
                   bootlin-mipsel-uclibc [12/35]: OK
                 bootlin-openrisc-uclibc [13/35]: OK
        bootlin-powerpc64le-power8-glibc [14/35]: OK
           bootlin-powerpc-e500mc-uclibc [15/35]: OK
                   bootlin-riscv32-glibc [16/35]: OK
                   bootlin-riscv64-glibc [17/35]: OK
                    bootlin-riscv64-musl [18/35]: OK
                 bootlin-s390x-z13-glibc [19/35]: OK
                      bootlin-sh4-uclibc [20/35]: OK
                   bootlin-sparc64-glibc [21/35]: OK
                    bootlin-sparc-uclibc [22/35]: SKIPPED
                    bootlin-x86-64-glibc [23/35]: OK
                     bootlin-x86-64-musl [24/35]: OK
                   bootlin-x86-64-uclibc [25/35]: OK
                   bootlin-x86-i686-musl [26/35]: OK
                   bootlin-xtensa-uclibc [27/35]: OK
                            br-arm-basic [28/35]: SKIPPED
                    br-arm-full-nothread [29/35]: SKIPPED
                      br-arm-full-static [30/35]: OK
                   br-i386-pentium4-full [31/35]: OK
                      br-mips64-n64-full [32/35]: OK
                 br-mips64r6-el-hf-glibc [33/35]: OK
               br-powerpc-603e-basic-cpp [34/35]: SKIPPED
               br-powerpc64-power7-glibc [35/35]: OK
35 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 9f321eea62..41aa793184 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.54/pango-1.54.0.sha256sum
-sha256  8a9eed75021ee734d7fc0fdf3a65c3bba51dfefe4ae51a9b414a60c70b2d1ed8  pango-1.54.0.tar.xz
+# From https://download.gnome.org/sources/pango/1.56/pango-1.56.4.sha256sum
+sha256  17065e2fcc5f5a5bdbffc884c956bfc7c451a96e8c4fb2f8ad837c6413cb5a01  pango-1.56.4.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index df82b456fb..bd5dd4d332 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.54
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).0
+PANGO_VERSION_MAJOR = 1.56
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
