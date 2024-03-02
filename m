Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B459FC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 23:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D7CD4060B;
	Sat,  2 Mar 2024 23:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ly0TGeMsE-xY; Sat,  2 Mar 2024 23:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ACC840640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ACC840640;
	Sat,  2 Mar 2024 23:29:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34E1C1BF296
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 23:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2264760AC0
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 23:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGvaA5Eu06yC for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 23:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F8ED60ABD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F8ED60ABD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F8ED60ABD
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 23:29:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412cd73ca83so8860385e9.2
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 15:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709422183; x=1710026983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WDllHpxJVOI2XaSprkfYCoqAqbHcWOj6OMj/4UabfM8=;
 b=sVaW5K8gl6ChkQRPrBP7wojomVWRhVpK6CgjRfPXe1UcD6IiZM3t1f71eNkldYg9pw
 8vJ3aIz8G1rU3IDCJhvtq71zGymr79sFiIAQlO9mzd91PvHdFgZRr7u52tWGSgDBNxDs
 jcALKWRTsuZkg7QCodhWa5cQThAR9VioDxy2wSKTRlBsP+VNr1QMxob8Ck1DebMuJ46q
 E13nxobcOpiVx3lB+qUv70qrUGy6hcRSlLmZUqvF/yBBxnk9iA837+gvYLJ/fbAtwq7u
 qbRzK+6Q+bj/qG9gODahdCCQKLGO0qcZc59B5vJ7aaici9u/1L45zM+an+D/fPe96kUF
 KkFQ==
X-Gm-Message-State: AOJu0Yyahit40ROZ2T1mOUojPH2vhKTe2xl9nh3cz82BpNYl++LWtfEM
 8FO38xDJtGaTgUYR6fmKPjioFav8ajzsG9Nm/sU/YSc5h1FwYZmjVN+ubPIBYtEzpINf6vQgyRP
 C
X-Google-Smtp-Source: AGHT+IEpqVS+V8Ze0+7Yhq/E5eE1V07pnC8D+Y3RdsVFVnH+wEGfQQIIGexBKiqIqKYBW1vrTlSMeg==
X-Received: by 2002:adf:e0d1:0:b0:33d:8029:b136 with SMTP id
 m17-20020adfe0d1000000b0033d8029b136mr3791401wri.55.1709422182399; 
 Sat, 02 Mar 2024 15:29:42 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 dw2-20020a0560000dc200b0033ddfba0c67sm8253727wrb.41.2024.03.02.15.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 15:29:42 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 00:29:40 +0100
Message-ID: <20240302232940.2455257-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709422183; x=1710026983;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WDllHpxJVOI2XaSprkfYCoqAqbHcWOj6OMj/4UabfM8=;
 b=fxjrwK/s6onishhc8Bc3Ypl2V+hKSRGx+RerpP82Za+aAMYYoxYsIpoGchJPfzCYTN
 Zf9MI6N8Tr0AdOvAtLi1bLMT9IV9dmOlUtEcieGUR+KA1g5pCa35+Cw1qUUAZJF0/Htp
 wyGEvaXObGJ5ULRXKGShMGBeD7SujtXlkBlwbBz/U69fAx++VcdvT0dFJvSKVok6Pcv9
 cv13fY3fVLx5rhplwTUkIvIf1OItg0PTcXzanzi1k+6F4pK+sltndityjtg+09rUZYvA
 4rvlLf72Pi7XQTXGCrZmp60fJkYHISaG8HOc7ITiTCOSdfUo/aPunkDvwTVXS7+qcaoC
 /UZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fxjrwK/s
Subject: [Buildroot] [PATCH] package/rust: provide RUSTFLAGS for cargo
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building the rust toolchain, the build system endup using
cargo (from [...]/output/build/host-rust-bin-1.74.1/cargo/bin/cargo)
to build some tool like rustdoc-tool.

But the host-rust package doesn't use the cargo infractructure (since
it provide cargo binary) and some cargo environment varialble [1] is
not set to crosscompile cargo packages in the rust toolchain.

For exemple, we usually set RUSTFLAGS="-C link-arg=-Wl,-rpath,$(HOST_DIR)/lib"
to force cargo using libraries provided by Buildroot in $(HOST_DIR)/lib.

RUSTFLAGS is actually needed to find zlib library (host-zlib) to link
rustdoc-tool when zlib is not installed on the host.

Add $(HOST_PKG_CARGO_ENV) in HOST_RUST_BUILD_CMDS since it already
include RUSTFLAGS but also CARGO_HOME.

Fixes:

  error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02-rc1/package/pkg-cargo.mk?ref_type=tags#L167

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: no change
v3: use $(HOST_PKG_CARGO_ENV) to provide RUSTFLAGS along with CARGO_HOME. (Yann)
---
 package/rust/rust.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 4903060368..c544582c99 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -70,7 +70,8 @@ define HOST_RUST_CONFIGURE_CMDS
 endef
 
 define HOST_RUST_BUILD_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_PKG_CARGO_ENV) \
+		$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
 endef
 
 HOST_RUST_INSTALL_OPTS = \
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
