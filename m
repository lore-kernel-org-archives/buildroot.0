Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2239F013CE
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B3460F1E;
	Mon, 16 Mar 2026 08:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yR3wg62LbTbY; Mon, 16 Mar 2026 08:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9862160F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773649537;
	bh=8QZw5TQ3w0TDWjCDpp4EPcGkL1o2e9dojNLHMc6ET5Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g6lqupEcjZCAAaUa8dgxhwnaIyhBXB5oVY5fJoGIJ8PrkSnxH/ABw4WHCE0BplmQ/
	 G2qn+cHGdux1MX53WsH2SJMBMGR6rlQC2U3E8S3c2dSrNRjd+AKF35Xdc1FFq9vQvP
	 UKmENoooLT+nVt0Fs/euPyo1/jcYR6KNRg9cUYtvp6UmFJOQ3a5Q9EJTJmWt4MPpQo
	 C2WEMjMzARBd5Kbddpj+RduYsoKst59L7OGmqKi8eb3aTH8ABf9NtbwpHYsqDoz0wa
	 raF/JgVRXMxtVg5gTXVBMJLFUH4pMQepRrXt/Qsy95L6D8sdJ7gAAiR+woH01KX34T
	 zWmpv86O92Hkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9862160F83;
	Mon, 16 Mar 2026 08:25:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8A26D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCFB460F90
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cz7I_j876qOQ for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:25:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2431460F6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2431460F6C
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2431460F6C
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so3064571f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773649532; x=1774254332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zPE40CSjUdkeg0Q0Ijh5LXjEqDB0yXdCVgwTpex6qQM=;
 b=e8/stK5tM4BG6gaSVH33XkYA3NRnDrf8nDelRIG9itc7x4BiedI68ZA3jEJ1k4rTL6
 Y93Z39Uao+Zx5artZ4RGdgOaJIjSL0AkVNgLV+xtOfA0yze2R64G+KK0WWA6nEw62LQP
 nf2Ye7yexaO8p9XUoa5m37re1gU7G+oEhY8qrzSIJPeiggaylc7l6biwWxunFcBbChmL
 WY3AsPqJcLBcDV2BfYwpvvaewxzHuY23ZjqLJR4DeFo7n46CVICkcJpUrVF6wFjndD4K
 x6gi9LMHvO12f59WxwBxzJp5T8TKLSsm7EPgTroMZOvW+Hf3dR9dCerlCsvwKqaJfTmo
 lC3w==
X-Gm-Message-State: AOJu0YyKie2oiDDNcUZlE0SzZlpb//+14zqbLRJz9mRnYmn6kYKHprpE
 +PALdRtcRqjuT2Iq9kbWdi5GqNWnJpcjRJAATm9vPGd4Orotqx0/MmXaEcueoPvSOlSW0II5d6o
 k1xTx
X-Gm-Gg: ATEYQzwPApMa7Nh4ZuK7sqMOGNT/ZtXKkDOE7b4XqW/30m6g/XcaeI3jsaSRAc+isBY
 iJEU68H7UlZ/X75hiUvg4p3HPDCOhKHN43LIQtvP4HkcC3mzr/e/nDFaAHGhb2qONLVQebT2bSR
 U/zMBVEjtwpp5l2k2IpIkEldKOpevqFFx/b0z0Yy9ck6Y6pS3hcIAwngc65XK5HEzs+sY20lUSE
 iwYKBebHkXteIYCHIKqT5PpfT9H1rsj2KjuEthlEANQ1ldQ1iu1j1RIGIJ2+7NI1qobljYmwlJj
 rH+GjjZVHnPkaBcrxe6eX39PKSHAl4KkGaojy8jgdPxScmg4hBodbDbkTjQq1v+Jl5OGeOUdDvp
 Ym93fZopVcISW5UYm/aN/xnBHUpP+lgg2hGfRdwdcGypw4gE+xY1mZgPctKQxX/z10jw4Z4K7yM
 5y9T91ilpyB8XgPREzxgoiB54F9o0GMZZJ08VLAAbSmeBu8+KJ3c1vi5NNAu7INQfe5J7ot/NDb
 azJhxpqcd9vudDugQIAUg==
X-Received: by 2002:a05:6000:4205:b0:439:be04:13c4 with SMTP id
 ffacd0b85a97d-43a04d8679cmr20346042f8f.4.1773649531711; 
 Mon, 16 Mar 2026 01:25:31 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1a72cdsm43151174f8f.9.2026.03.16.01.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 01:25:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Mon, 16 Mar 2026 09:24:53 +0100
Message-ID: <20260316082455.1392636-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
References: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773649532; x=1774254332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPE40CSjUdkeg0Q0Ijh5LXjEqDB0yXdCVgwTpex6qQM=;
 b=vicdp8JCmAv8XD6hmV3ENVll7DDh4AEbp15U9ldXGMhlf+8XWSDFoyMrmw/u96H18d
 ovlTntDGqfNbh2kmqJ3MtD2mKz26p8H7AUEhpx6NgoW+uqnAIGET9ne0Gpl3acUopNdo
 Bow1xbdTi6fC7Z0lK0mhZ8X0k9/PjWnJJn2tk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=vicdp8JC
Subject: [Buildroot] [PATCH v3 4/6] linux: split HOSTCC from flags
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
	https://github.com/torvalds/linux/blob/v6.19/rust/Makefile#L537
	).
When Buildroot embeds flags into HOSTCC (e.g. HOSTCC="gcc <cflags> <ldflags>"),
rustc treats the entire value as the linker program name; and it fails.

This patch passes a clean HOSTCC and moves flags to the dedicated host-side
variables accepted by Kbuild:
  - HOSTCC      := $(HOSTCC)
  - HOSTCFLAGS  := $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))
  - HOSTLDFLAGS := $(HOST_LDFLAGS)

Since Linux v4.19, Kbuild provides explicit variables for host flags, so splitting
compiler vs flags is supported upstream (see:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=96f14fe738b69dd97a33efe3cc8ab330af5fd1f1
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b90a368000abe5e015e0b045ca2ff7c2173b94c0
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f92d19e0ef9bbbb2984845682e740934ad45473b
  ).
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
[v3: changed the links after Fiona's request]
---
 linux/Config.in |  3 +++
 linux/linux.mk  | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 44f8b08e71..29360e1083 100644
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
