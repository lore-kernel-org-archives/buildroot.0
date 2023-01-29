Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF8BC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 09:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4CB640453;
	Sun, 29 Jan 2023 09:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4CB640453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwRCCU91ouRd; Sun, 29 Jan 2023 09:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 128D1403E9;
	Sun, 29 Jan 2023 09:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 128D1403E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13A251BF3EB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 09:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2707401C9
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 09:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2707401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52XLeQU_LQBG for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 09:45:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCAF24015A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCAF24015A
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 09:45:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso6259008wms.3
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 01:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DhFqRlp1GFLL15JGTAdBSPjtWr+Kv52gv3n6eiy8DM0=;
 b=jLBGL2O4+MCfCuDVvnqh6MajP+fbXeRdWv9ki7ritPB8R1z8jJy6UplNm96X4Oflcb
 Z5hC7AsCiza01foHoimKyZ9jk9QhcPB/Bzac1Ii9v9fPNEXu8tVI2xTzgrb845WGcQ4B
 SKXmR1ywRnNG7MGmcVFYWFrGpz41UQ/I13AB6BqobAPBA9XSeMy5/XkFEp1fbuDR5eMr
 GmJqvbCi6m8E44Sx0sRGqnyJRjOaYgMBhOuox1/F9HuSdlReE+OTWWD18Ujbehp2/Pxn
 CI9BLw/++DO3ykoljsDNoeWpQp+COBpAb6LSVS3TytXAA/aER64g6eY9YbwsgrVFu4/t
 hI6A==
X-Gm-Message-State: AFqh2kqPUFUITtqODjKrIXY9quQlgxuCeozFITsj0FPPMid6c8mUFCJA
 jZJxEO+RqAFPK7IPL9+SePI394202bo9/z/M
X-Google-Smtp-Source: AMrXdXvdLqcCLadXF8erKVOxb3D0eFrRKXMu8XJbBj6Kp00fJdVija4fnxFhKp3cLy6pVKOm0JTEww==
X-Received: by 2002:a05:600c:4e05:b0:3c6:e61e:ae71 with SMTP id
 b5-20020a05600c4e0500b003c6e61eae71mr48288557wmq.1.1674985548349; 
 Sun, 29 Jan 2023 01:45:48 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 d11-20020a05600c3acb00b003db30be4a54sm12634713wms.38.2023.01.29.01.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 01:45:48 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 10:45:30 +0100
Message-Id: <20230129094530.884944-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230129094530.884944-1-thomas.devoogdt@barco.com>
References: <20230129094530.884944-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DhFqRlp1GFLL15JGTAdBSPjtWr+Kv52gv3n6eiy8DM0=;
 b=FZentDWIiW4RylhRpLQGdukMasYyI2VOc1+Shcu7bpK7XvAx7ba6cHVdv4xkknCYlA
 R9OMpHxJjeF/QaukydBV9DbH/oF1KtmYz5ky+aJ2CnkUNthkecDoQOUhqgvGKE/TRMnH
 Oo8y0o/YJM8Qjjz591cIrripUB7FRJ7fOM4SStI6+rMtRq2FVnANN1fV75KShnyFMeQ8
 jslgR21ws0I4wcJVTtAAPdk6A0ocT/WG5/jztM5YhKC80hMjMFWwsMpYU33kzaBO+fn5
 ZyP4HyKR23d1vfNDBpKKS611YIsqc8HFB/Y164xXcFe8wiVaw3WrpANDBizFu1e+BhfQ
 CEnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FZentDWI
Subject: [Buildroot] [PATCH v2 3/3] package/fluent-bit: needs arch support
 for wasm
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

See:
https://github.com/fluent/fluent-bit/tree/master/lib/wasm-micro-runtime-WAMR-1.1.1#supported-architectures-and-platforms

MIPS & RISCV32 are mentioned in the supported list,
but that seems to be wrong, so excluded those.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
v1 --> v2:
 - added package/ prefix to the git message

 package/fluent-bit/Config.in     | 11 +++++++++++
 package/fluent-bit/fluent-bit.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index bd89c05faa..0ed69e09ce 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -11,3 +11,14 @@ config BR2_PACKAGE_FLUENT_BIT
 
 comment "fluent-bit needs a glibc toolchain w/ C++"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
+
+if BR2_PACKAGE_FLUENT_BIT
+
+config BR2_PACKAGE_FLUENT_BIT_WASM
+	bool "Build with WASM runtime support"
+	default y
+	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be || \
+		(BR2_riscv && BR2_RISCV_64) || BR2_xtensa || BR2_arc
+
+endif
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index c84042a0fa..6e9a33e02e 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -17,6 +17,12 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_BACKTRACE=No
 
+ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
+endif
+
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
 FLUENT_BIT_DEPENDENCIES += luajit
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
