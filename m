Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB69107BCC6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 16:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F804095D;
	Fri, 13 Mar 2026 16:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMkykOnmZndn; Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E864095F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773418751;
	bh=sbWNFg6bbqfgEKgv/hrbCWUfLeCPMWtfh7ju8dI7Wug=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B7qSbBCuqAVZ9rNauxWjScNhlSsdL75+zAe+j8MwpLkJ+pVSkh4XUaQsExnZgZ3Ij
	 uq9lbma+6zWOaaOn0StCF9geu2sPe9P8Av6XR4FlTRXRuyZo3+i5M4KNiVXiguN4eD
	 5Qp137KJzDgWGjq/Z9JJsYDYJAAEdoHgfUJYXlhzlPl1VIlU9HW4J1brjzhfB0w9OQ
	 M+446kL/PrmkRbesM51evnzYzYMGGGoZC8GkPNDrHrtHcr/82hFfTtyYv/yEn1ul5Y
	 WMY+LqRMhsMWgM0FOfxnEtTp07Wfe1YL/qy3zKGoowH19RgAloopEdRJJ/9nMGb8VH
	 H8IFwRt5Bdycw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E864095F;
	Fri, 13 Mar 2026 16:19:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB4FA786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1780813F4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iu-kBJNxg9Ho for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 16:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CB9A813F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CB9A813F3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CB9A813F3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so19474685e9.0
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 09:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773418746; x=1774023546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A7C8Ks/vJavufnIQj3OeZApfsAX/PxyvyCmuHL4G868=;
 b=a1y6GDIPBGgIS7ajSbzfKfTrrj+9t63c/3iqahrN+Peci3KE/Pex91aWGyVdD7/wwx
 OeQH6ikgOb2B3bxvYzfziaPhlezZAiPP4SCZ2Pynjw9gLzbLGLcwRa32fFmCL6/gUQ7W
 AP4I8nt4nZPy9eC57WUF2bEf5Y9+gO+kzaNh/XSDwi/jP+rrIsteWghPIzyomdWBpnqj
 9phvcPAP0EejLqYmENuWp6bqCeMn5mcAvd6dKiB5OHOW7GXiKOAAjTDPiy56Q7AfZzW3
 7lfX+pxWpJcBbWjxSnc8CkWkncEb8bGiPX0wu3pzyDwL3LUSA0eP9oRl/pwLH/s+TmoC
 lfXg==
X-Gm-Message-State: AOJu0YwX0/mvUO4cEAaM/pB2viOzBUC0uDTCdLnHvJ/moClkzo2IroKk
 QBSkXGEH6ffw5Ypv+qiZsjVQqNO+xZ9r9qcRtPlKz77D5nvQuHkgPHOeRUgBIWSXZA/v2wLnqw6
 0jFL4
X-Gm-Gg: ATEYQzwGqOm4OaX3ISEW38WQLauY8S+2YCskzZSM3KXbdWhopDAaRFJu8+TQj0fntoS
 SGDf44vUEMYwIbiXDSnPXZHdLaP72OzKObVMUxBvWKGVTBAEs08GqtIJxmXlxvxjcHr/zkFtmss
 EUI7fDCKhLx6546JHZVFhp/DFZ9BJYGLJPgVD+PZXqJkPwKD5poUfIp9rrrEurAnGNPQHyUmWi+
 ggdTlHxWaWEaHQCzqWcSixbRcUw0mXtWx9rmm4agNtyc4HBLA+W4HtpOdWtvN9eVEaea2k2IntD
 bJqD8IPeLXebrZe3ts/j88wBbey5W2dEdpoyjERSSjeOsqBycWFY2T0n8emOc8F3ReUzmFOHkiI
 hl0WVuip5r5OHT4eMBG38FQAhSJi+1Y1Vnf/+yr9gi2jIO8+3tcVOW9PRlJ8d48t/1q0hZTswB4
 BRVfpsG36VBR94uwQPnfjJSubVegTu1lMqxR30DaFb0LH7IuUeRK3e22IkjjqfyrfAoiNLPvgOj
 JwsRJ17ylvcToIZumvWcQ==
X-Received: by 2002:a05:600c:8b45:b0:485:4526:ee05 with SMTP id
 5b1f17b1804b1-48556700c0dmr62937435e9.19.1773418746033; 
 Fri, 13 Mar 2026 09:19:06 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6bb4sm215503345e9.4.2026.03.13.09.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:19:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 13 Mar 2026 17:18:22 +0100
Message-ID: <20260313161825.1224877-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
References: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773418746; x=1774023546; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7C8Ks/vJavufnIQj3OeZApfsAX/PxyvyCmuHL4G868=;
 b=BFfONu0PA7mp0e0EbKCIf6TqQjmutYXYVsjSAedtNUEA/mDjPZexbuPP0h3rogrzvj
 dndYzhB/Nnnh2sM4Gte4usc5vrkFmOF9J94uIfLC12a+lm9mIuPgYLy54+9iNKW9+FR9
 2X4UtKTs70lJ6dmgMez4mCbaZgGFKO9wxXB2E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=BFfONu0P
Subject: [Buildroot] [PATCH v2 3/6] package/{rust, rust-bin}: install rustfmt
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
