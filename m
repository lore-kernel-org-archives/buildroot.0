Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835E5FC6174
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 08:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A7AF4070D;
	Sat,  3 Jan 2026 08:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAnkziOKyD-P; Sat,  3 Jan 2026 08:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C081C4067D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767429616;
	bh=334Qj3JiIdvqhTQtDWnmCZiucKyI8NP6zwsnA2XQMD4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJnbOhx7bjKr+y8NyT8npeUaD34qt/iRK3cctEfY4aMTgR7uoYUDLhZfz/8/yAjnE
	 JAJN7/OUGCPqX9Bkq6DXsuY6MDgPmrX/Sb7ZyR4vNkTJqENFu8mpd0ARH89QEonwt/
	 o6x9n53EFuvXyjO/Npkagc8Jlf1iIRTmqZb6kjPiOu7wP8WUZmoThYY6Z7S24qQX/J
	 MORDj3DrqyI/gJG8iy/qGGHP4J8pQCuWw/tXE9FaNjZ3JH60fFlUl2fjCTpPAM4ToA
	 OvPJHD4cOw9dovmssiLRQBkUC35QvBXtrWUZrTMPjiOpT6RBr1FKXyd6ChKUqsXQbB
	 H67EQK9L8+YOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C081C4067D;
	Sat,  3 Jan 2026 08:40:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F391F249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 08:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9D8A4067D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 08:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYBFd4oye-S9 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 08:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.43;
 helo=mail-ed1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B98EA40677
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B98EA40677
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B98EA40677
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 08:40:13 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-64d2c50f0d6so15832806a12.3
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 00:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767429611; x=1768034411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zOuNzpe+TwY2b3a8x4PPdJ2g+oO0fYUFzPrdItcV0bg=;
 b=HIl3nM9MREqFhXbBBTDEygeyO0mYNEKb2Av5XeTDeMzcIAD4DWFHN5BbKYjFdcydum
 9VFAfVbCV8qSc2wAqTgrbzuKuavBn5+I7vIyjbEUoB/1VuYzoQuSguVJ+ANoGrbg7Vlz
 yA908bEYOFvfDlhkPuOD324d10XH+ytJj3TDoMtJfSDqleKK/yFb17XCsYhcVZcSA+QN
 xWeq2yeOdi8SRlht0COOzA0zE0Rdu7uGAXrsf5RHyZf+jopKORcKqQi8N+4RboDQyJ3f
 CQQ8t4Z608RXJA3D2J/xnpRp5rWuCFRJKXiwvedl6ucmdoLiM0lJecnxYyE8dqKwjhNQ
 sj8A==
X-Gm-Message-State: AOJu0YwEOs6Kz/thvnmq5kO02Eon0zxNh/wbWZ464z2evLAO9Aitiji/
 mGaonbdZYWlredp1YlGg9MiXTllPwqtafPOAikEQDZgol85eaLLl1bhDraKelhVw
X-Gm-Gg: AY/fxX5iXMoQNxw1HomgwoB1eDVa2Mc/k+T2Zv+OC1jrz5uCeoY2+48Q9iH0jRe89GS
 mBbBADaIk5aaT396Hfw6A6a43q0YfbrsRPnB7s4zk1GLhqZXOtUCivd0+ELZQQUtNLJxC//jtY/
 ZFM7pNKJk8XTMFhJSPurDOzGRbl3e7009kwNoV8ZmVsEZKuLx1dMtKy+OG5JZUwxgEvm5VOfi10
 SCU6k1c3opXbheL1+Gmo2RVMEHgMeNhVQuA/xbsBPFHVI2wEApKEZfOyfrTwgQPIdH/NKsPkhEu
 BXzVSdASM2RbKsRpRS9hhZff+T78eI/GK24VXSePMFjX7YJOor3gTo7sc+07SplKobj3F0CTHbz
 8siV/A9jK04V1S2JEwf/ct2DkYiqfnCu4gPg4DylSUP7k4e97UiHM4UDb3tR1APe91COrJt9bNI
 drntxoNgH/vziG/YAgMakR5I/N0g9rB3Psv2RtM0qHhrl0mqgK49ElRrJB3qY=
X-Google-Smtp-Source: AGHT+IGCK/4VH1myhqvoSYHvc8jaZyWqok48iIBLQT2wNlh2IPrungr3qbmEywDfAoM3xM5O4t+Orw==
X-Received: by 2002:a17:907:9686:b0:b4b:dd7e:65f2 with SMTP id
 a640c23a62f3a-b8036ecbb91mr4756172066b.5.1767429611065; 
 Sat, 03 Jan 2026 00:40:11 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:21fc:5b5e:13d0:2b7b])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8037de0deesm4845317566b.37.2026.01.03.00.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 00:40:10 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: bernd@kuhls.net, romain.naour@gmail.com, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com, thomas@devoogdt.com
Date: Sat,  3 Jan 2026 09:40:01 +0100
Message-ID: <20260103084002.2045193-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251226101445.2b29f439@windsurf>
References: <20251226101445.2b29f439@windsurf>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 1/2] package/mesa3d: explicitly enable llvm
 for host-mesa3d
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

LLVM is already implicitly enabled for host-mesa3d when
BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER is selected. This blind
option is automatically enabled when LLVM is required by drivers such
as intel-iris, panfrost, imagination, or intel-vulkan.

The BR2_PACKAGE_MESA3D_LLVM option also independently selects host-llvm,
but this change makes the dependency more explicit for host-mesa3d
builds.

Note that disabling LLVM is not possible for host-mesa3d, as the build
will fail with:
../../../br-test-pkg/bootlin-armv5-uclibc/build/host-mesa3d-25.3.2/meson.build:847:3: ERROR: Feature llvm cannot be disabled: CLC requires LLVM

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: Explicitly added the llvm flag to host-mesa3d configuration,
    see https://lore.kernel.org/buildroot/20251226101445.2b29f439@windsurf/.
    @bkuhls, I can see that CLC support is needed to compile the intel-iris
    driver, (commit 317260f "package/{mesa3d, mesa3d-headers}: bump version to
    25.0.6") but can you elaborate why this is required for the generic
    host-mesa3d? Perhaps some llvm related logic should be added for the host.
---
 package/mesa3d/mesa3d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e41bf68d8ec..09b098628ab 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -297,6 +297,7 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
 	-Dtools=$(subst $(space),$(comma),$(HOST_MESA3D_TOOLS)) \
 	-Dinstall-mesa-clc=true \
+	-Dllvm=enabled \
 	-Dmesa-clc=enabled \
 	-Dplatforms= \
 	-Dprecomp-compiler=enabled \
@@ -306,6 +307,7 @@ HOST_MESA3D_CONF_OPTS = \
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
+	host-llvm \
 	host-python-mako \
 	host-python-pyyaml \
 	host-spirv-tools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
