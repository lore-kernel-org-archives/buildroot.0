Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A36C87FD3
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 13:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E2E60DA8;
	Fri,  8 Aug 2025 13:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUluIHPbuo9d; Fri,  8 Aug 2025 13:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C42C60D90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C42C60D90;
	Fri,  8 Aug 2025 13:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C219310A
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8CA081EA4
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGiwPutYO773 for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 13:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFA96811F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA96811F8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFA96811F8
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so11257185e9.2
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 06:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754659888; x=1755264688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DF9B48haSF3zBGCygocdR3Tn8ObROTZ3uFeswCYEXIs=;
 b=LQF3vIT2Ji75tNrc++EvLD79wrWubSymIWgxCYwSOXj8017JvZ9S+6BKG/3IbOuAiE
 ZUaJ7/kw3BK+qdx2C7B6IEj8fic2PR8j8JB4WQmYz7fbqrzvlyjojNrkm9O7u6JtlbC/
 x1QLHC6Tti4JmVZ15F+grtFvlQlhnnBRcE2XgR5x3RGcWo5qTONsVS6+hWQD2xPC/aep
 q1WR3jsaM4rbwPcoVFni/Y98lk9Y5cleKMboUK/dfY2FBuKjvZOgS8Grm1KS5/1qtuZr
 mVff4y5nj8aFGKKxHbsTQG6G7OJPizUX5hZmCNwgCmROlT7duYs+Tc23Z+MJcatkGVI+
 /GqA==
X-Gm-Message-State: AOJu0YyTUAX+qjd/kFv+Qb+7njSFLLJg71cLsU1VuK2xrEgGWaxtSXsW
 RUtBUqJkqCxAjypG9a+ELZRf9oaxFQvN7De6TQYNrUnurGtXw75EB6uo3LbQE6eabaf0QA0dAwg
 DD73S
X-Gm-Gg: ASbGncsaakuOUTAKrx//4K6xtgY/aZffWF3pTPtRI+nnsL/mIKIUuGaCtEBe0EaKVST
 q7WJd+EMHU6MqA3U+BwOiUO9rxlorql3pPYY/hIXjnVbK0NPvJaB+OIzxdcSykPmnLuRC7aVM6E
 xjZfdvXF6lRMSI0CFGkMkgqCWU/WWpIrJ1jx6dOgurlhB42fIx+Dkp6nm9ulb/uvrteAFZSfJZM
 nwbQXG7ighgJlYOgji94qwNxad84ey83APahl2Ij47KhcHyIDo25tHPym6VGYThx52vI+eFW7lg
 bQtAWs9jYykERy5/i2wmRKJqBAlMNe+2zxk29ir85Uovv7ujDKBoS/foriSBmrblclIAl77jitd
 T9XUTQiDk0xS2LWWE9oicQnbZ6iPIbGs3+vkTlrL++wGSDpHTAeQBAO9e/S5glpVtSsS65d91i3
 87+F8/eP8M19UutkRk
X-Google-Smtp-Source: AGHT+IExeH9Hx3128yHkHslwbs+hIIsfdFWhN7uH59gTKf9qAmMtcYGXqdO3sLYEKpSPwvSBpLEwwA==
X-Received: by 2002:a5d:5d10:0:b0:3b7:973b:39bc with SMTP id
 ffacd0b85a97d-3b900b572a4mr2689454f8f.54.1754659888270; 
 Fri, 08 Aug 2025 06:31:28 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5873c43sm149053965e9.22.2025.08.08.06.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 06:31:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  8 Aug 2025 15:31:10 +0200
Message-ID: <20250808133112.3212687-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754659888; x=1755264688; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DF9B48haSF3zBGCygocdR3Tn8ObROTZ3uFeswCYEXIs=;
 b=MVcWIPXhPFjO5jpBAnpILUeRhD3hyJC0F6/jILEAA1wYlyMkZme3cmNZurRC4He6eT
 s4bq9BPJtjoskolbZuxYXiAQmcunJFXb7gg0VFWDLAwjJDuk/FrfdH4J81I3AFprvSvr
 Ij3c/h14lWp1UEcWne7EgP/sgHyExF9nuRHqE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=MVcWIPXh
Subject: [Buildroot] [RFC PATCH 3/5] package/rust-bin: install rustfmt
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
emits a "rustfmt not found" warning and the generated bindings are not
correct. Provide rustfmt from rust-bin by adding it to the installed
components.

Note: the dist tarball exposes the component as "rustfmt-preview"
(as listed in 'components' file), so we use that name.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 2195584f8f..75494fb286 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -43,7 +43,7 @@ HOST_RUST_BIN_INSTALL_COMMON_OPTS = \
 
 HOST_RUST_BIN_INSTALL_OPTS = \
 	$(HOST_RUST_BIN_INSTALL_COMMON_OPTS) \
-	--components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME)
+	--components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME),rustfmt-preview
 
 define HOST_RUST_BIN_INSTALL_RUSTC
 	(cd $(@D); \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
