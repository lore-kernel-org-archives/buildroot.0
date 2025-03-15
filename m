Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7A7C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAFE64128A;
	Sat, 15 Mar 2025 19:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phUujBuHS46o; Sat, 15 Mar 2025 19:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 907AC412A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 907AC412A7;
	Sat, 15 Mar 2025 19:57:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29D29EA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1598A40465
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C83fysUc6KtC for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75FBE400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75FBE400EC
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75FBE400EC
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so1792384f8f.3
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068636; x=1742673436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5eoclcTyyfw5c6Izc9UguHVe/ozOme62uFtzhCqqIw4=;
 b=EZNZslTua4OGrLbw9aJA+/loUAXcdND5zk+wzryT0bBWwrQOQ+kUhGNowHxeszB8yu
 FfvlZR/8AVw1+LOVFxjaaC64VWueWG+OhuoPhrDw/KYhSQ1OmfrgzohBQRrZ9hyHZURP
 /ylXGjrm3UeFTb2bu/n5h49ZGwlnePUyHloFhSlKJCkj+hOQqc46m669EroRnZXW4P8c
 YeOM/kWhgpitgw4zx2aCNNMAE1BESsW3xUEvC2RhuhhsH92ZGqOxWPuXgnByqNvQx24X
 AIFAIRlSHMwvWis0IG6h2HL1BNY0TNwo0DxElSwu0/6HIGau9QYkhZYclXFIIUWR7ont
 e56A==
X-Gm-Message-State: AOJu0Yx3MudpT7ahMHrVzYZFH6gG4KT4cbODXSq70WI53HE5jwLivjvJ
 q/TNqqmzW/i53CfC8ehqar4bxdlL+AAnMDPPxWNBwRmFtOrIpuoZYAtJTw==
X-Gm-Gg: ASbGncsPdPnP/ykXexgL/XuUZOYs20Up8aVJIIlr6VowuRmTFkokZQIeNVTWRzFEROz
 hoclRPdKJTtCAtPtRt+1YIoBOPwV4d875FSTXPW3J0wCbb7oNWUcf4eOy2e/dsudyxL7NMpK4h6
 0CppVmKJc+8iElNTgzJ8XPlrBzR41lUywXiyPxkASo5Gh8QK/4KSumtaGDRMrjaBadDhVNlwJJE
 WeKPBbFarIu1Hvbzbgoy0rccbTo8x0EGKYVPyvUaGFIAksa01Ce4Ejp6dBmSwQum0Yz7maYb0La
 HF575f6gvQc3qou0Rw1LaU4rfneueKqayHB+EWMGFy2cTysEqcuGz7E=
X-Google-Smtp-Source: AGHT+IGM3ZPJfmi6ZkfB+aXsK0VXGUB7GvhVdv8KQhukfndDFcjMl7pzuTnnNiCCksjjHVD2GANpaw==
X-Received: by 2002:a05:6000:156a:b0:391:2dea:c984 with SMTP id
 ffacd0b85a97d-3971d133670mr9566792f8f.11.1742068636204; 
 Sat, 15 Mar 2025 12:57:16 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:16 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 20:57:06 +0100
Message-ID: <601d67bc61712e9ac7947b9660b614eecd3f91c4.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068636; x=1742673436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5eoclcTyyfw5c6Izc9UguHVe/ozOme62uFtzhCqqIw4=;
 b=Vu876YU+LdRgiO9VhSzpssusva3BjMQou7nOrHOWGzlD7N2wCQCWDPsvgBISHD3mtc
 h90McpH9UvFscFAI3kVNWf0/LhUKYCjzwB4KmrpzFyrJIJJebVKCQ9iqfMuB4T/kVVm0
 OZfPjrbaRDvpOOTv3za3wB4wDeOro+NhhWwtcAiLH3uB2Qj6VHk/GC0I3ArSWIoShWBR
 XgSGb4PQ/aFoVx6El3/HmLVkCk1UncvLKUdKyZTYEwv/2f+tq7kjpDJYgGQlsRHmD5W1
 Fzfg8xLvs2lu8AJ1tHhztKbwzi+1DNCSHXM77SZo0oxmmC4gO+dlJ0WqwprezKzlo9sB
 IIwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vu876YU+
Subject: [Buildroot] [PATCH 08/14 v4] package/nftables: add an option to
 force JSON support
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, nftables JSON suppot is implicit: if jansson is enabled,
JSON support is enabled, otherwise it is not.

Some packages will require that nftables be built with JSON support;
that's the case of netavarks, for example (to come in a later patch).
So, in the current state, it would mean a package would have to select
jansson, althogh it does not itself use it, so that nftables has JSON
support. This does not feel right.

Instead, introduce an option to nftables, to explicitly enabled JSON
support. Packages such as netavark would then just have to require JSON
support in nftables.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/nftables/Config.in   | 7 ++++++-
 package/nftables/nftables.mk | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 833a3a38a2..514682ec48 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -13,9 +13,14 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
-# Legacy: this used to be handled in nftables.mk
 if BR2_PACKAGE_NFTABLES
+# Legacy: this used to be handled in nftables.mk
 source "package/nftables/nftables-python/Config.in"
+
+config BR2_PACKAGE_NFTABLES_JSON
+	bool "json support"
+	select BR2_PACKAGE_JANSSON
+
 endif
 
 comment "nftables needs a toolchain w/ wchar, headers >= 3.12"
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 380e553cde..f6e6a64efd 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -42,7 +42,7 @@ else
 NFTABLES_CONF_OPTS += --without-cli
 endif
 
-ifeq ($(BR2_PACKAGE_JANSSON),y)
+ifeq ($(BR2_PACKAGE_NFTABLES_JSON),y)
 NFTABLES_DEPENDENCIES += jansson
 NFTABLES_CONF_OPTS += --with-json
 else
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
