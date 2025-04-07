Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAC0C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 19:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 565146107A;
	Mon,  7 Apr 2025 19:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfwioywZl0PS; Mon,  7 Apr 2025 19:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693C46104F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693C46104F;
	Mon,  7 Apr 2025 19:03:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A4D6DA
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 140DF40352
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDyUgaeMN6H7 for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 19:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F22E54028F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22E54028F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F22E54028F
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:03:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso31432295e9.3
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 12:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744052624; x=1744657424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+IT5l7PeH26mbeykRiIDnHEZiscHDJ1JLYGZ2l3CR80=;
 b=jE8JkFcvzM2899iluXAVizbKx84GMPCZl1k+t1TyeHbLMnTBeX/QLCyvsAC/Wh28XX
 RWFTeOuIsgNGrA0EnlVyGMH5uGDCt85tuB4Fwurb+cmd0QpEww+65HHh28RyQRwLsB8p
 2iR+DY5Do5XzbAGOB5TeD9nX8+/YCj4zluFsArKUyw1zQh46jH+lnixc1s7OJkT3a0Rz
 NsaWqNJQlvwHQw9K7OnI7+dGpCApYCrYp9htsz3C9idCb5Yw4+qt/1t6XHSTpY/feg5/
 bKgzxXsh2JCyaUvtC9Jt2G0EXcZaFqgYOZr9zko9UFFWzGgSdfp4oKjbpgfdreEHjmV+
 ggOA==
X-Gm-Message-State: AOJu0Yxyp+W5R+8nrSUKyVmDRgKPUh7I9/iNw1McFYwr7LGogGpmRDQ+
 tcPW1JBMuSeZzDfv6zdDkQAvQ5AfGf9x13sxgyKtV0lCYFLw6xQSy9/n1yci
X-Gm-Gg: ASbGncty3ZrGwvigbOD/WD8MiCSkl4SEcQnZA2pmLwhdBirZCOFtJvo8O0DNzQ5GLLU
 NvxFG9dRDWFC79/t748FglCnpoJsnLjZJPb3TVBwjMKG83TfV3ZI+AEMrsFlirGcm9ZUhYIou/d
 pQSlKd28BJqCIXKtoPg3rM88+kgQA54RtsPsiDkCasRyzM/wWEV6L2M0C9U/FftL7RmA8x1Ygzu
 XhRRfHlhIo2FRJEfxbAA+8U0Drv6z7owOzih7E92FwRiikNQR/z9hrXc9jfjjvr4s54+7oWxV8E
 d6wpgAQijwoMDA3+0rCi5A5u5MqTvw8Tbi6HwmSkAgVEEtv9
X-Google-Smtp-Source: AGHT+IFdCxflg5kh8D/bbxtKgVjJLkaXD2Eu/fmgz9L2ZYpU+YsVyGUNs5r72UV3HZ+I4E8NMa/vIQ==
X-Received: by 2002:a05:600c:3505:b0:43d:cc9:b0a3 with SMTP id
 5b1f17b1804b1-43ecf9fed8fmr93369685e9.22.1744052623752; 
 Mon, 07 Apr 2025 12:03:43 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2962:9e9d:9c98:77f5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec169b4e4sm142036785e9.20.2025.04.07.12.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 12:03:42 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon,  7 Apr 2025 21:03:35 +0200
Message-ID: <20250407190338.7436-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403190705.14994-1-maxime@leroys.fr>
References: <20250403190705.14994-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744052624; x=1744657424; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IT5l7PeH26mbeykRiIDnHEZiscHDJ1JLYGZ2l3CR80=;
 b=KADWY8Ep+uAa/MNz+pIB8f9+MrhIvk2Iz1HQm2gnEnWx6W1VsXn4lLCyWjwDSUKLNj
 s65yMSbPTPp1ee1qQbIt///V5AyWnMU2Se/8ndaKUpFK5DpSiz644kEF8dFoaLmEyRgC
 dKEWIs9s6fnBAX9JqS+/WE33SVyJ7IXYfIj9FCvKKNWuAyERQWb9djZYMfFFPcbDZnhk
 xO4mOIw6hrQBVHeOn5oE9sZzp+VCb4En1Mac5HhkSg5DE/RfKUORYoKXkvAsBJFaV01T
 8kp3ygGVC81LFh7WQQyX6gmK9S03Vo+LVdkmqoe+i169lH3HH1W3IfclT97IIkIM3EgP
 EjhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KADWY8Ep
Subject: [Buildroot] [PATCH 1/1] package/frr: security bump to version 10.3
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

Update FRR to the latest stable version (10.3, see [1]).

A new package option `BR2_PACKAGE_FRR_BFD` to enable or disable the
compilation of the BFD daemon. This one has now a dependencies with the
kernel headers 4.10 (i.e. IPV6_SRCRT_TYPE_4 from linux/ipv6.h [2]).

The configure options have been updated accordingly:
- Versions of FRR before 9.2 used `sysconfdir` and `localstatedir` as-is,
  without appending `/frr`. The `/frr` suffix had to be passed explicitly
  to `./configure`, which did not align with standard conventions.
  This behavior has since been fixed upstream [3]. As `sysconfdir` and
  `localstatedir` are already set by `pkg-autotools.mk`, they can now
  be removed from `frr.mk`.
- The `--enable-shell-access` option has been removed as of FRR 10 [4].

[1] https://frrouting.org/release/10.3/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ababeba4a21f
[3] https://github.com/FRRouting/frr/commit/ff62df2e4484
[4] https://github.com/FRRouting/frr/commit/afb034b0bb42
Fixes: https://www.cve.org/CVERecord?id=CVE-2024-55553
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/frr/Config.in |  7 +++++++
 package/frr/frr.hash  |  2 +-
 package/frr/frr.mk    | 11 +++++++----
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index c26b160b2a..211eb83419 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -24,6 +24,13 @@ config BR2_PACKAGE_FRR
 
 if BR2_PACKAGE_FRR
 
+config BR2_PACKAGE_FRR_BFD
+	bool "BFD protocol"
+	default y
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	help
+	  Build Bidirectional Forwarding Detection daemon.
+
 config BR2_PACKAGE_FRR_BMP
 	bool "BMP protocol"
 	select BR2_PACKAGE_C_ARES
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index aa13ed5625..7786cc8009 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5323e5ec236346860301e57f6845443855e8f2508d7ccd87ead395a9991c01c2  frr-9.1.3.tar.gz
+sha256  0f10aca9074c773c12be8a07382c7560d625d4a2c842d82261d18bb8f4b26f6c  frr-10.3.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 5391bcb265..78979e2beb 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 9.1.3
+FRR_VERSION = 10.3
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
@@ -38,14 +38,11 @@ FRR_CONF_ENV = \
 # Do not enable -fplugin=frr-format for production, see doc/developer/workflow.rst,
 # it is only intended for FRR's developments
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
-	--sysconfdir=/etc/frr \
-	--localstatedir=/var/run/frr \
 	--with-moduledir=/usr/lib/frr/modules \
 	--enable-configfile-mask=0640 \
 	--enable-logfile-mask=0640 \
 	--enable-multipath=256 \
 	--disable-ospfclient \
-	--enable-shell-access \
 	--enable-user=frr \
 	--enable-group=frr \
 	--enable-vty-group=frrvty \
@@ -86,6 +83,12 @@ else
 FRR_CONF_OPTS += --disable-zeromq
 endif
 
+ifeq ($(BR2_PACKAGE_FRR_BFD),y)
+FRR_CONF_OPTS += --enable-bfdd
+else
+FRR_CONF_OPTS += --disable-bfdd
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
