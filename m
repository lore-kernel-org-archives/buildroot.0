Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CBB107BCCB
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 16:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6980C60C03;
	Fri, 13 Mar 2026 16:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBtVgnHzUmkN; Fri, 13 Mar 2026 16:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E2A60BF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773418752;
	bh=dFXJFqjLa69y1bXjp6jIbhCdDOE8fp+r/gADY+60/9U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B5Len0NRkwT1BocHjwkjMWHepU0tllqhmGcZf+P7WD1uNWpxyttX2wB7TiYWsV/Fs
	 XTMD5s/iw/IX4qNxWB7YVzgITP+oFTMUb1W0d2CvkR8gk3bh4nNbOA9tKfEuwVQa9y
	 +81qLl1ogw7FbErUa1DxiJlrV8sSgDqCriNMBrkg+BpRZAm0R7TZzvjZbhhadH4S4J
	 2pyKr3zIVdpJNBdeWi4t4osnr7y6ZEeg9vxHQpVEziebCrQSdSy/K4lKzdVPkXxUHq
	 MPOo3c4ZxA3JmlPKVumgd3M3BFQNNQSrNY6wgNK+j0aYr0mGFpGyvik2unEWCZaMlY
	 sxwN09TXHUqUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E2A60BF8;
	Fri, 13 Mar 2026 16:19:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0779F201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1646404EB
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5tOxCEka0I5 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 16:19:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2BF140418
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2BF140418
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2BF140418
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso1562032f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 09:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773418747; x=1774023547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z229xm8wYDF93K6nWnhTeTsXNQs2W7SpaOZ5v8vOZtQ=;
 b=HWUOLpHHuIN4Wkuee3lBYwKti0n/XbNlfmY4aLQGw1eDPL0HP0DssPs7pO2oUFM0qq
 Bxng/gVMZGOoqzrkEayquQ4TKFMjuQ9e9MyfJkytTEWkwC5zCVYRj/YiVA96RTeWBw/p
 C0vRaKC5fBlF1dn40b7DMRUFenx3SCqZ54BYnq0oCflPPRPcZo+cOj2219W32RBDY/zQ
 +pEZ2PQF1W9WoTCdsxc+vch7vYxRuEl/xuLZojJWKwWP9LJvTFJLTjPLhTXmojXVf7cW
 vwsFAAsE4vtlVlCR1kcbhRNJGP4zXPB/gX74lbBFfnLPMq8g0vL7i3xhBkUrEChPD2hO
 IsCQ==
X-Gm-Message-State: AOJu0YwiZx2aGcAE/3s/5JcRkz/pdSg+s2x04V8f3JT+/XojclYQPVm5
 HFs/uY2Ptq1Te7HG3GBOl+iYIW0V1qJ/ZAJzRVvwhOGJlsCrSg/EIujfHS+/Abu9ya93Qk+xAKT
 uW8Yp
X-Gm-Gg: ATEYQzy1b1rAop0LnVLspr+vpBSGwjSvzfW19ylwdtmfpbLbBb8PwNIr5GAd/mE1qoE
 9kBbCamNbcnvxAue6qzKaIBj4Qp7abtJbWyty8bXsC3DhUOiBk0qpGNr7ji4XnWvM2RFL1w9E2z
 ImhOsEiHTxXLvKyM91hO1u+yBUy4tYhlxRSrvjs0AV9i73LdJHHBliYuSOiTTfS3o2Mk/5gt0TP
 7A+kiI8CXeD3Y72LW0ZCc+R4eOKiHX49FV1VBmT9x58Ac3eyzmGu0cnqboSWVpYDTk0mzx2rxQ/
 VBNxFQuukKklla61XvMk6R06gV024KiFXw84qDKcgI6tS5LlunbChqs8KhMxOQviL4Vk5idRxgd
 4NbnzWIXCSf/bNLcjfX1fWtU8bKAcY7s5KJPfQibagRQpTtMs3eMq980kEPUjtHuZq3X/leuaGW
 IL5WTl168yBnCLhmZQUHgSPJ0QSRcjXjuH1eWmEzicNqQkx4O4OJbupA9crtZNVGTbyeVNXAJYJ
 yIOEz8Czo279KYNmeePGw==
X-Received: by 2002:a05:600c:4fd6:b0:485:39d1:b4ca with SMTP id
 5b1f17b1804b1-485566d6e27mr65302795e9.9.1773418747248; 
 Fri, 13 Mar 2026 09:19:07 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6bb4sm215503345e9.4.2026.03.13.09.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:19:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 13 Mar 2026 17:18:23 +0100
Message-ID: <20260313161825.1224877-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
References: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773418747; x=1774023547; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z229xm8wYDF93K6nWnhTeTsXNQs2W7SpaOZ5v8vOZtQ=;
 b=ybt8gf5Or4aoS67SOGRqkt2G9mwZe64apPpHO4IAAWfVEVm+fxH8eA9II0emn036wI
 4+oX2ZRhgj+OQevuriS2wx2w01Gvw3VTMyPyttOPIqlrTkA3oaNpjRTtun+OtlRLWxRU
 O8eNvcrh+5H8odQf5Vcz/u+PPBp5p9IbStN20=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ybt8gf5O
Subject: [Buildroot] [PATCH v2 4/6] linux: split HOSTCC from flags
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rust-for-Linux invokes rustc like:
  $(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
    -Clinker-flavor=gcc -Clinker=$(HOSTCC) (see:
	https://github.com/torvalds/linux/blob/master/rust/Makefile#L407).

When Buildroot embeds flags into HOSTCC (e.g. HOSTCC="gcc <cflags> <ldflags>"),
rustc treats the entire value as the linker program name; and it fails.

This patch passes a clean HOSTCC and moves flags to the dedicated host-side
variables accepted by Kbuild:
  - HOSTCC      := $(HOSTCC)
  - HOSTCFLAGS  := $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))
  - HOSTLDFLAGS := $(HOST_LDFLAGS)

Since Linux v4.19, Kbuild provides explicit variables for host flags, so splitting
compiler vs flags is supported upstream (see:
  https://github.com/torvalds/linux/commit/96f14fe738b69dd97a33efe3cc8ab330af5fd1f1
  https://github.com/torvalds/linux/commit/b90a368000abe5e015e0b045ca2ff7c2173b94c0
  https://github.com/torvalds/linux/commit/f92d19e0ef9bbbb2984845682e740934ad45473b  ).

But with this change we can have problems with older kernel versions
(< 4.19), as the Buildroot commit below warned when avoiding HOSTCFLAGS
to not override internal kernel flags:
  https://gitlab.com/buildroot.org/buildroot/-/commit/dde090c299b0357fdb1a4ec44ad8d332ac57f65e

In this case we Added condition on BR2_LINUX_KERNEL_RUST_SUPPORT to split HOSTCC
only when kernel rust support is activated, which it means only for
kernel versions > 6.1

BR2_LINUX_KERNEL_RUST_SUPPORT is also introduced in Config.in as a hidden symbol
to support this conditional logic, while the full user-facing configuration and
its dependencies will be completed in the next commit.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 linux/Config.in |  3 +++
 linux/linux.mk  | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8033361e82..50b3042194 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -568,6 +568,9 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
 	  Enable this option if you get a Linux kernel build failure
 	  such as "python3: not found".
 
+config BR2_LINUX_KERNEL_RUST_SUPPORT
+	bool
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..816e6d8cf4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -157,7 +157,6 @@ endif
 # Disable building host tools with -Werror: newer gcc versions can be
 # extra picky about some code (https://bugs.busybox.net/show_bug.cgi?id=14826)
 LINUX_MAKE_FLAGS = \
-	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	KCFLAGS="$(LINUX_CFLAGS)" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
@@ -166,6 +165,16 @@ LINUX_MAKE_FLAGS = \
 	REGENERATE_PARSERS=1 \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
+ifeq ($(BR2_LINUX_KERNEL_RUST_SUPPORT),y)
+LINUX_MAKE_FLAGS += \
+	HOSTCC="$(HOSTCC)" \
+	HOSTCFLAGS="$(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
+	HOSTLDFLAGS="$(HOST_LDFLAGS)"
+else
+LINUX_MAKE_FLAGS += \
+	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)"
+endif
+
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
 	KBUILD_BUILD_VERSION=1 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
