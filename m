Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBC6C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 19:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E643C40CBD;
	Mon,  7 Apr 2025 19:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fv1ACWOCvdgf; Mon,  7 Apr 2025 19:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 974D140499
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974D140499;
	Mon,  7 Apr 2025 19:04:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 885311DE
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFFF881460
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpkRdgQ21Djs for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 19:04:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C85CE81CEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85CE81CEF
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C85CE81CEF
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:04:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso51666295e9.3
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 12:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744052649; x=1744657449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+IT5l7PeH26mbeykRiIDnHEZiscHDJ1JLYGZ2l3CR80=;
 b=LXQXUISwwZzPYv+j+TG868djbawYnNoc6yCaV1ngF7DN7uHYx/AFQhH384gUb93nwL
 hf8OJLeVYSR2TYXdo4IXCQyIan6krDS5ct9jHIc/GU6k/ykSWAr2/eRtB1FPfEjydJrm
 83G6mSP0MEnCkWik82bbo4yXM5UtDI1O7uf764ybKgLbK5CRD3pDhQQmu6PYBp/XzZh0
 cjARgd5C2VlrgDKFddeWvZ2uZh0WWufGy3lzDY3VREfRWwQoSJlkLjAKMJSlGJ9uMz59
 x5U0gfrIPMLshrKP6dDjVDz4rz/i1TP4kT/5AS39a0eu2UILF4cUt2R1HFlfZEaSg3zS
 BxsA==
X-Gm-Message-State: AOJu0YyrcQHJJcS9cxL39CCs0Kia4fGX1s6Lv0QIAHShrBNdfPVuygmY
 hV/mYA4sWuHQQYh5vSBbsELv+bSAO4Zc5LVLVNPlf8+JZ8WoTlR+MALEUtQg
X-Gm-Gg: ASbGncvFHKDw5DaE9fPtEzkRlNesVrH8Pcn4xZgugCJ0hj/0rZ7L5EMJOnknwzgN7S8
 Ob6YwroKzMdppz7Km4oybI1bwxm25cA+X9J2BDxOgN1P2LF7i/qqiIPKnWT6G2wuA3KytUPikUv
 CwzDqtij0fd/gDjaHotzrfu3Q5MmCL9z+DTQ1jRlRvJ2z6AbmCOBnVFiAr81hT9OJBot3JI2UYq
 gfmiIUpMG8ukrQLB2s8di/oFu2B/qSXLlM2E+D1hpjok03lpW7pTayEM+PrROS9kb8diygrXMRY
 voCikfE4Bjjse8XHVcXvRraqD2bJpFunSKEHkw==
X-Google-Smtp-Source: AGHT+IFBDG4jgp21fCwl22HudzDu6fbeaYoo20jvhqWegcuf/MrpGGt2nVibnVOREJtpT+Pm54iOTQ==
X-Received: by 2002:a05:600c:1e8f:b0:43c:f78d:82eb with SMTP id
 5b1f17b1804b1-43ee0698c8cmr110064165e9.15.1744052648501; 
 Mon, 07 Apr 2025 12:04:08 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2962:9e9d:9c98:77f5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec169b4e4sm142036785e9.20.2025.04.07.12.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 12:04:07 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon,  7 Apr 2025 21:03:37 +0200
Message-ID: <20250407190338.7436-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407190338.7436-1-maxime@leroys.fr>
References: <20250403190705.14994-1-maxime@leroys.fr>
 <20250407190338.7436-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744052649; x=1744657449; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IT5l7PeH26mbeykRiIDnHEZiscHDJ1JLYGZ2l3CR80=;
 b=QTsBJ38lEAQS5HvDYwL0cYQktsuRRP8LF2nOnyDMJMKhLe74qNsubZRqNA4SB8mdFK
 RQ73/KLedq8o+9pfnoTPZfMeDooRuFaxv/o3d3srAQPkOeKI64AF0zhObtr0phPzOqTQ
 1BkXH9mzICWrzF6nCKob4fQo+l4bkAgdHSJwADVLKQG3+3B8MywR+OyoOpsihbuf2bvS
 i+yDpSwOTl7ZX5AE5Hu7VCHHA5OlEX3W3pHtPSav920J69uRFjzyZwLQ+AOo93CjTYVG
 LFMBh7DcC3hUXSN6aYEKD1PlZq1Xh3sc24cD2fuFUNQD0nPDvwqex804CuPC8+qIko0P
 JxgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QTsBJ38l
Subject: [Buildroot] [PATCH v2 1/1] package/frr: security bump to version
 10.3
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
