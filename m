Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CD4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E21C26187D
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E21C26187D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACAE340269;
	Sun,  3 Oct 2021 12:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14m7CRQ9vwBa; Sun,  3 Oct 2021 12:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89A54402A2;
	Sun,  3 Oct 2021 12:41:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 779FF1BF327
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66ECB607C4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARQ_iVZSjoN3 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:40:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B587606A0
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:40:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m22so19545717wrb.0
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EumWFeJhvNOak76pLbdgsfGhDDi2lNr+gHbp9UFfS1A=;
 b=MDMd26fgGqQhcQVAEfuSTW5fFTUg9mPy73kzixpb1faGnc0IEiL+2okdVDWVm81EUc
 6cPsmRChcepSR+98p3uwCehgODiAKp7h6NzllazFO38uf2v/kC0uvesLL0XZfgsG0jx+
 nZYfArAhVRWTNt1lc+vnRHapKFdxeHro4TGxVsef2PTghKjKWbiRSiW15UBLTkjSPLRE
 dS+YHGhek8NWuUkymjd1DfkXniIXUB6QeiWwFmppqLNMMtU43Od6jHWCJC5gxIxPCGVw
 wIBWRCgSgFc28n1xm+dQdCD4gGPFD4AKuDz3wynnNq/cElKD+Beck3ven9fgsKuneeis
 cdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EumWFeJhvNOak76pLbdgsfGhDDi2lNr+gHbp9UFfS1A=;
 b=agUbkOabIYF05l7H5F5vNxK3BRYxAnwclB1bBwvvHzNsqUxOZo0Osr4qaxhkGyP70D
 TtoRqU2kMF4bXx8qQ65+aHQ8b6lCgtt8zTx4TkgSOPWeCQi+IhHHY69DPlkqjo+1poB9
 dCutOxDk5/1fRfvcqVID6QdmORKQFyZ0nOVDeOhe9ptSFswyA7GVJGgUdpMXCHseaqn6
 lIUrwx39VJfqzv/xkThxs1XE89NDSGsUS1d6wLIDN6Tj3eswQqj0+cCbNX8zRsC8cDAr
 sPXAJ3xxeYc+7tyjrTu6y8JUm25jBPCqGQ13ywRaQqrDOTB7Jvhrc/I0c0QF+J4C+sFY
 af2A==
X-Gm-Message-State: AOAM530BfeD4GGQAryLFykOO/+fhe3wIARSzrswrllTXJtSuICPKRe77
 YEOvBVN8GsB6pehLfRXjqvj9bhnUOlI=
X-Google-Smtp-Source: ABdhPJyz8uQ+UPaCd0Dpp5+V7LrZzCkIYtlR8ZPJX2eFIeQIznYWHvbKmV6CIGYkUfaCnN65uNPSag==
X-Received: by 2002:adf:a745:: with SMTP id e5mr8266916wrd.406.1633264836450; 
 Sun, 03 Oct 2021 05:40:36 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 143sm1258704wma.37.2021.10.03.05.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 05:40:36 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Oct 2021 14:40:27 +0200
Message-Id: <20211003124027.343390-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003124027.343390-1-romain.naour@gmail.com>
References: <20211003124027.343390-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/binutils: remove csky version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Binutils is the last part of the csky toolchain fork.

The csky support has been merged in binutils 2.32 [1].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=9d24df82ece4e87a0328173d6bd31cb9ff558bb4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                | 6 ++++++
 package/binutils/Config.in.host | 7 -------
 package/binutils/binutils.hash  | 3 ---
 package/binutils/binutils.mk    | 6 ------
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2ce455c633..e49583bc7a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_BINUTILS_VERSION_CSKY
+	bool "binutils csky version removed"
+	select BR2_LEGACY
+	help
+	  Support for binutils csky version has been removed.
+
 config BR2_GCC_VERSION_CSKY
 	bool "gcc csky version removed"
 	select BR2_LEGACY
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index b4c86dd473..ea1f020989 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -9,7 +9,6 @@ choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_36_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
-	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
 	  Select the version of binutils you wish to use.
 
@@ -33,7 +32,6 @@ config BR2_BINUTILS_VERSION_2_36_X
 
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37"
-	depends on !BR2_csky
 	# https://github.com/uclinux-dev/elf2flt/pull/16
 	# https://github.com/uclinux-dev/elf2flt/issues/12
 	depends on !BR2_BINFMT_FLAT
@@ -42,16 +40,11 @@ config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
 	depends on BR2_arc
 
-config BR2_BINUTILS_VERSION_CSKY
-	bool "binutils csky"
-	depends on BR2_csky
-
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2020.09-release"	if BR2_BINUTILS_VERSION_ARC
-	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
 	default "2.35.2"	if BR2_BINUTILS_VERSION_2_35_X
 	default "2.36.1"	if BR2_BINUTILS_VERSION_2_36_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index f543b49940..d1be6cbce8 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -7,9 +7,6 @@ sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d
 # Locally calculated (fetched from Github)
 sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
 
-# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
-sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
-
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
 sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 8ec76134bc..bfad25422d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -21,12 +21,6 @@ BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
 
-ifeq ($(BR2_csky),y)
-BINUTILS_SITE = $(call github,c-sky,binutils-gdb,$(BINUTILS_VERSION))
-BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
-BINUTILS_FROM_GIT = y
-endif
-
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
