Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FF5F013CA
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0BE82EFC;
	Mon, 16 Mar 2026 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaGh9sXZQW3e; Mon, 16 Mar 2026 08:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 894A682F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773649535;
	bh=sbWNFg6bbqfgEKgv/hrbCWUfLeCPMWtfh7ju8dI7Wug=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LLYPmZnZScqVI23WV14uAPKU/YHSasr4lspQhviK93Omf24/GIIjdZYoyfW0iD1nB
	 R2hw+Z5aZ//xXGC4r4r5NTkKCS28ZQFr4VK1D8eTpA2aCJUEYhkM2YkLRhGDuzG6Df
	 Vt/9zYyxTF0APv+sJF6LIHjUm4u1X2cBD5X5DIu3TvjqBT+4PPon7II8zIaa7R3EBU
	 OYjNMXQ2iyfOnLoTYqaeRHRWnJoz0G6BUANac5JXF7cGFPZQtDHlWeicn3lfg650FQ
	 F+rs6n9ulTx3DqFZmWgPu0z/keXpybAKZ4ghgjgpxcRK8bJkcFATqsmFJuh6OgKRkU
	 5m0NCDE9Gj/5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 894A682F03;
	Mon, 16 Mar 2026 08:25:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5FB6D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B789C60F6C
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPQlaTjTRH-h for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C91360F1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C91360F1E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C91360F1E
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:32 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso2595235f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773649530; x=1774254330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A7C8Ks/vJavufnIQj3OeZApfsAX/PxyvyCmuHL4G868=;
 b=T9+RIN7HKKm4ZZdzr1NYHAoIamiAzaYZKeBsuUnxxba1Rsmh0Cl1dNMGm52fuEYEyx
 /Q+Y1ye+lUjwkXRpzO4sZD5jzArdRPqK9xp1YkNP4KZOa4Khr4zwQCFDwNPzfAwEUIBq
 nOEqg8/Nu23wqYh+dR1mSz8OODywgsBxlJiwi6WbjdHcOsSoGWiEvX+6tM3aBaSpqsNv
 xbgHvxw0B+NL4QNMDKQsxWwP0ri98H9SLkuh3uMQL0EwIVvDJoP81qG/pLQroZAgGkLP
 S081VkO5Kl4x6H5AfzqYzTPHfSTR9aHQSXguovmSL6yT/LmPvGpkgCOL7NEu8b7Y30VX
 6SKw==
X-Gm-Message-State: AOJu0YwQ7juLcHZWWRWiM4FkvsARoCzAtgW8T6fHru++QAmbhKk8pxZl
 qqzm4CZotdniR1L7LnU5Q3HTMlnxiHT/d7accsO5uCQPfke4LDKOFfSDFzQknbzvlt4mDI2ogd+
 Tv9ba
X-Gm-Gg: ATEYQzyQ9WTuLjabwjgrefmx+oFjp+P7Z6sXK7pS+lO17izOuWWncJEqIfN6SctWFk0
 Zczg4d6TpKTMWTp4PiaGBd7+XB/30MCISvEhMq9l5LtcoX/U1+mUhmkN5wzPyQTt06qKPslgg38
 7gawLHEeN4Lrn+LHYTMnyCiAXKgqLICKvHIqs1y1+U/dzmZ0heVqAdC8OSydTo9yfLfJFLZRxuQ
 hU7Ygh6XKrePw3EBl26T8cvOwnpohhXxe0FCipZHSMQeUh1YkSq/oRWwio8Q4u2+fOP8mMD6bQs
 P3iDfZ2N6IIx41NBZZMkqK99YisoDwseisZ/BDxvmL+sOOI2EbOuBtgZF5M5sZHOUIppP5aJmMK
 YqA7BV+t0LN1gGTFhUu5R2OqL+fXC6Nck6wEE2IdWQ+S6FdYtfOde4pgiwc/1Ld0qdERfEhqx/f
 lHCR33/xYKdgBf9wuDBIc2tUoqu01N2Z5SuvZ4+3694KBoF6K02GpFO8RWfZMRNb5r//aOfzFZZ
 3ErrXMivvBwvEL3+xxSHA==
X-Received: by 2002:a05:6000:2207:b0:43b:4352:1bed with SMTP id
 ffacd0b85a97d-43b43521d21mr5851325f8f.47.1773649530262; 
 Mon, 16 Mar 2026 01:25:30 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1a72cdsm43151174f8f.9.2026.03.16.01.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 01:25:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Mon, 16 Mar 2026 09:24:52 +0100
Message-ID: <20260316082455.1392636-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
References: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773649530; x=1774254330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7C8Ks/vJavufnIQj3OeZApfsAX/PxyvyCmuHL4G868=;
 b=cvz00Np5V58sgQpL6fORwigIwCxsbrS1l4Vpvc6LPO4KiN1T/uUeSSiV8L1SjgrDvl
 WCSnSLit7o/0eu0tX5LrUMPIRTvMvZHoLDwhwRrH36AoGSECAx2lU5jYG0R+1rvuiVqK
 YIuY5yLqLk+WtRuv3faQzTUk8lqqRNQkpTmSw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cvz00Np5
Subject: [Buildroot] [PATCH v3 3/6] package/{rust, rust-bin}: install rustfmt
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

Rust-for-Linux expects rustfmt to be available; otherwise the kernel
emits a "rustfmt not found" warning, also when we check the generated
kernel bindings, they are unreadable since they need rustfmt to be
formated correctly.

Note:
A mesa warning was also reported by Bernd Kuhls
 Failed to run rustfmt: No such file or directory (os error 2)
 (non-fatal, continuing)]
see: https://patchwork.ozlabs.org/project/buildroot/patch/20260207093949.2339591-1-bernd@kuhls.net/

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
Bernd already sent a v2 with rustfmt on rust package as well, but
rustfmt-preview doesn't work for rust package, it is a specific
component for rust-bin.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.mk | 2 +-
 package/rust/rust.mk         | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index d3d9e6a572..20805df84b 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -42,7 +42,7 @@ HOST_RUST_BIN_INSTALL_COMMON_OPTS = \
 
 HOST_RUST_BIN_INSTALL_OPTS = \
 	$(HOST_RUST_BIN_INSTALL_COMMON_OPTS) \
-	--components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME)
+	--components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME),rustfmt-preview
 
 define HOST_RUST_BIN_INSTALL_RUSTC
 	(cd $(@D); \
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 9999475c35..c3c492d98c 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -36,7 +36,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'submodules = false'; \
 		echo 'vendor = true'; \
 		echo 'extended = true'; \
-		echo 'tools = ["cargo"]'; \
+		echo 'tools = ["cargo", "rustfmt"]'; \
 		echo 'compiler-docs = false'; \
 		echo 'docs = false'; \
 		echo 'verbose = $(HOST_RUST_VERBOSITY)'; \
@@ -76,10 +76,16 @@ define HOST_RUST_INSTALL_LIBSTD_TARGET
 endef
 endif
 
+define HOST_RUST_INSTALL_RUSTFMT
+	cd $(@D)/build/tmp/tarball/rustfmt/$(RUSTC_HOST_NAME)/rustfmt-$(RUST_VERSION)-$(RUSTC_HOST_NAME); \
+		./install.sh $(HOST_RUST_INSTALL_OPTS)
+endef
+
 define HOST_RUST_INSTALL_CMDS
 	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py dist
 	$(HOST_RUST_INSTALL_RUSTC)
 	$(HOST_RUST_INSTALL_LIBSTD_TARGET)
+	$(HOST_RUST_INSTALL_RUSTFMT)
 endef
 
 $(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
