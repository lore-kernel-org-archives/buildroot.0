Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D7AC021B1
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 675D04241E;
	Wed, 19 Feb 2025 08:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wnrSzZf6i3b; Wed, 19 Feb 2025 08:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700A441A74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700A441A74;
	Wed, 19 Feb 2025 08:51:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 286B9127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08BA360671
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhUS52xttNIH for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D87D60071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D87D60071
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D87D60071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f31f7732dso345056f8f.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955052; x=1740559852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a1nuEzThm+xv67opt2YnxJ4Vrj1e5XVu0k/e5vhWELc=;
 b=kof3yEaQ+TzFbIBRQ4HUcmrNL+mn926zMBJUBMME+T/C8pqYf8V62PVMusiRXDE4Rn
 mRD+K+sHVCJCLTQhWnOWVHagl7+ILzcY6YzcyMkQ+9PJuksOL5QTchrf9jV5Osz1OigQ
 D2ADdbwIRwmjo85rw+Nsrw+ZDii+QgI39Cv3ZiFW7U/r3a+1ZBEojShDiAXpHtnu/5Lq
 wMTy0ZSHIZIzuG0nm8299vaLqjfdqWuPqaeJwOz8mhK1Ei0eT2moD1m+wSUz/TUbal98
 pM8g51bpkBOJoFiX47xx+XGEeYYWO/lhGW5OU8DyueZaVTmdqP1b6jISP8DZVwNt3MhH
 hdpQ==
X-Gm-Message-State: AOJu0YxTP/9RkCEHPSsVS+TuThttOYbNHSnYnsACh9fL+fhZdzkhwmo3
 Mi6s0RZGLsXLmChJNfjy6+B/rO1xeXHH8ioyE5IFPWhesk1fqM/psiKQUQ==
X-Gm-Gg: ASbGncvJa5EZXKyyosghT4p5tT49wH/cO9A59wxqVwfJWpVXEmtfpbSg+b8xyswZAeC
 eAr0mvw3rbeyeK3kfqiEtuMWmC3KBcGJQZXaGnavlH770hppC99jy7UMnJ07dO36LKxhDhJ2pJV
 i8RoY0FPk4qwccnph14MJuBQZXV0thAvIvQiaCCIIlpClNQJiMdC8ND7MG+pBaqsuC7fIzkBsnZ
 BfYeS3UtomIKTpHvk5MbarD12K4mwA9sbWkSi+2OWP3LswugmCNwzEV/PKbWjKRMZMe/lX6pVcG
 s87GOySQcEqUY4mjVFw8ModqRw==
X-Google-Smtp-Source: AGHT+IErySc17ZEZ/eS6R1IrB31EFFiacMLvPsNvQ+xcNLOXLWYa5+RM5DB1SFgqg6kzvbmvmNFz8A==
X-Received: by 2002:a5d:5f56:0:b0:38d:ae4e:2267 with SMTP id
 ffacd0b85a97d-38f57c08b20mr2392188f8f.11.1739955052304; 
 Wed, 19 Feb 2025 00:50:52 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Wed, 19 Feb 2025 09:50:29 +0100
Message-ID: <436246d59c19980b4d42900655aa70e0a85d551e.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955052; x=1740559852; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1nuEzThm+xv67opt2YnxJ4Vrj1e5XVu0k/e5vhWELc=;
 b=cBagGGPFAFtufAy78Nb+myFN7hG8aW7s6cqr4OQVcJChWCWlGHlm+jHxdGc/ZuCoXy
 LOQDTvKi2mk8l1y89i81pKSm0cF9Mf/jfxjawLMSUMllICTkTSpqHXbn1wQkUJwpKEEy
 x69XVMsNE10JFU9Sc5WKzuVIh12Kz03AUNbZSk81dBIJXppICobOBsyFHB0j2i0MaVvS
 3S+Y0uPZPz+53wjbw1yHyx3H2tbBjmyKf+q1NinuNpni3vKsnU5NHTyZMR8pGlCD7/ms
 h8SV5ryFh6TiMFNmvyU9K+xUGuibDiCPmTtTvYIMgbt11XuJYTO0WYJbTRQxJ3jrPtFA
 d+fQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cBagGGPF
Subject: [Buildroot] [PATCH 14/27] package/riscv-isa-sim: afirm host-boost
 dependency
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/riscv-isa-sim/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/riscv-isa-sim/Config.in.host b/package/riscv-isa-sim/Config.in.host
index 4ccf6e9546..eb28d5b063 100644
--- a/package/riscv-isa-sim/Config.in.host
+++ b/package/riscv-isa-sim/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_RISCV_ISA_SIM
 	bool "host riscv-isa-sim"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11
+	select BR2_PACKAGE_HOST_BOOST
 	help
 	  Spike, the RISC-V ISA Simulator, implements a functional
 	  model of one or more RISC-V harts.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
