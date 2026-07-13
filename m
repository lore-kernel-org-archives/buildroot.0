Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94228C44501
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 18:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 873AC60781;
	Mon, 13 Jul 2026 18:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ner-RQnNpIcC; Mon, 13 Jul 2026 18:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD4760686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783967163;
	bh=6Km4RHxo9BhgPMqKlKMvX1o2gkDeMW9U+6c6raZeJEo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dil/Z5cTIXAvH/4NCOoc58akRradKS/YNdrzJ3/6Uf8yyGqIFBC8ax9yLAb2mvkTA
	 09gkNs4XK7rbm5WhWPhTfEtNA3LuzHBkGac8j3c7tMhhlkTeoQbWdNGBWcME0xs4Xq
	 y9F1UsT3OP6lTH2sYqC92wwBNXDA9ry+krGokD+dOfpkhmFjXGlAB01/1ezwdIO/Yl
	 JhJNKALy/g2gBKDaxr2E0QlTt1+cvypHhTQxtK0/3K4fsVuojuckYqqLVt8askAng1
	 G+FqzT/gRQtns6vqqKUK+//ycXtwhEcwhTB3GH/uCIom0YnvyscVwo6ijbZK28tC7Q
	 T6w1lusstHqDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD4760686;
	Mon, 13 Jul 2026 18:26:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6EF828D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 18:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B424074F
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 18:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8tCpB0WNeTu for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 18:26:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=marcin.niestroj@grinn-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67FB640746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67FB640746
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67FB640746
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 18:25:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so85701f8f.2
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783967158; x=1784571958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zSQBV9gDarXge35S5+UgmzgrvZCf9p3LE1z3Y28VyPQ=;
 b=lY+Y6PIRsOJeM93xzWAOoJ+SgdvEdXNre4jdHA6cYuhzCNfYVxjVso69KREMKrQ/3k
 6yZM1EhZNEdSEyy4R92qrGd4iOwcrOyRX5PXprdm5xVq0xLMF8iXpuwoSHKL6D7OHOWr
 gy7sbjN3e8l2mPMIhKBfZnftHDAlXk4e8aCXL1med5d0ONqjYwSpnTtw//xhbjmYQGUQ
 g7juA9dvanvDbpEVA5JserudlW9eQNhmVhozrQUUUgCYz/2LuauqYN/etU+d6iwzkubS
 4IZXVy7Coitd5BJpB53x8zr1Aj5qGjyk4SL+ZZNOULsLh4JsJO/ujeNQlAPJa5Q9CT94
 2C5Q==
X-Gm-Message-State: AOJu0Yz+zm6yQHPdi2rqyESSMNLfyQCYrrU78dV91BthyRPf0EJLvmJ2
 prObiTba4g4V3Wf2zzfmtm3X0P21smLyW28DLqiOeGZuxQMjpG5RcbvRa3RXxXRbOvpjhxR1M3Q
 Xs67IKlw=
X-Gm-Gg: AfdE7cnoBKHWCSGDVZQkJlWgSwVZQNRbuaXnE12ATLrKwCbWRtsaiEkvXLykkHSmgkL
 zLclFDOoU4NPM4buO5Z604BvEr0zK1BC3Y3eTVH14odPQOmwn8Y20722lSS53t0ZiGTY1W9WnwK
 N5NKzo1MYL4bMLX6rUpD+Geu0W8SayckOnddvq5CNRI/NUH87qocDEmUW5zULMfIe1nb4EOenQM
 +NhKdwuLaBEnnzEHXff2Pm/1MADG9MNehXrjhF6pfFwEF6cx6cuDK6Gb7X329mFBNqBjvcMML7K
 4txjqsgk63+e57p/m10iqQnoIjf3FJxB3sISML4MbqU3CCbZKPdNMILRqb66Y66RTw4lntl6Ku4
 o4oOy5yfJgR8cH1klwS7Kx3TQt5aIuetUd4MP8oh3EMA5Fbx1kJDceuCXdC6qTmBUAHmtX2TEus
 l0gG5HDedrMgGy9qW4jhrkjdCL39Pkfgrw4RS9h8B3OETIy1lpMb1P+NOk0Ti53ZTuoYsRiRRQk
 ipKPq4vZNJE2xuPsSKn+L5YasMJcMUXco6KvcM=
X-Received: by 2002:a05:6000:2912:b0:47d:e022:944c with SMTP id
 ffacd0b85a97d-47f2dcb5bd8mr11256165f8f.4.1783967157695; 
 Mon, 13 Jul 2026 11:25:57 -0700 (PDT)
Received: from z13.int.grinn-global.com
 (2a00c02040fe4aeb6bbef322d0423b68.custv6.multiplay.pl.
 [2a00:c020:40fe:4aeb:6bbe:f322:d042:3b68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464a96fdsm1436463f8f.24.2026.07.13.11.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 11:25:57 -0700 (PDT)
From: Marcin Niestroj <marcin.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 13 Jul 2026 20:25:53 +0200
Message-ID: <20260713182555.3147249-1-marcin.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grinn-global-com.20251104.gappssmtp.com; s=20251104; t=1783967158;
 x=1784571958; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zSQBV9gDarXge35S5+UgmzgrvZCf9p3LE1z3Y28VyPQ=;
 b=ewLXgdNdfgV2VWgyZK7WDTD60dP+6tbcPJ96zcgFUtdoN+Od5lru+CDpi2/kxKWjEf
 I1+unw16YCoiz10nc+dqj3P0Pc02W2Vw5+FXl6CBCCSftHEleLnRxioC0oQrmwLKmnBN
 P9Ue1NkMTcm497EfCQjHxOju9AbdhVo6HokIFuptl484SMETRKOTHAZOM8KBR4apV4vp
 NgLms9ALFZjmvscPS3mAFJ8aeU6pFCUjwsJloDeMZrd0W+TXgyyB+ZZ09mioW/orDX3L
 DOylWpV3ho7AEeDM+7qyQVdJshaVsyunSOK7vWWWo0OAaU1CMFTFY42hpDJdI432Q4AB
 HF/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=grinn-global-com.20251104.gappssmtp.com
 header.i=@grinn-global-com.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=ewLXgdNd
Subject: [Buildroot] [PATCH 1/2] package/easydbus: bump to version 0.2.1
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

From: Marcin Niestroj <m.niestroj@grinn-global.com>

0.2.1 builds against Lua 5.4 (previously excluded), so drop the
!BR2_PACKAGE_LUA_5_4 dependency and the corresponding wording in
the comment.

Changelog:
https://github.com/mniestroj/easydbus/blob/master/CHANGELOG.md#021---2026-06-05

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/easydbus/Config.in     | 5 ++---
 package/easydbus/easydbus.hash | 2 +-
 package/easydbus/easydbus.mk   | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
index 5f2f3a22be..1fe8689ccd 100644
--- a/package/easydbus/Config.in
+++ b/package/easydbus/Config.in
@@ -3,13 +3,12 @@ config BR2_PACKAGE_EASYDBUS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Easy to use DBus library for Lua.
 
 	  https://github.com/mniestroj/easydbus
 
-comment "easydbus needs a toolchain w/ wchar, threads, Lua <= 5.3"
+comment "easydbus needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/easydbus/easydbus.hash b/package/easydbus/easydbus.hash
index 08a4f038d7..f83e1eb253 100644
--- a/package/easydbus/easydbus.hash
+++ b/package/easydbus/easydbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8cec24bff40f056d4874ed9d6fb73c9f1efbc5eff14528e1b49f1a162b197f26  easydbus-0.1.0.tar.gz
+sha256  d0f018f45b682e85108c10b5d1fa7bdcd1a81188bea43aa6c9c725c779f66aec  easydbus-0.2.1.tar.gz
 sha256  dec3b3103cd6889045da86fc7da22bd25545966e5bd7c214791b922dec19588b  LICENSE
diff --git a/package/easydbus/easydbus.mk b/package/easydbus/easydbus.mk
index 57d0c22392..d35da45580 100644
--- a/package/easydbus/easydbus.mk
+++ b/package/easydbus/easydbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASYDBUS_VERSION = 0.1.0
+EASYDBUS_VERSION = 0.2.1
 EASYDBUS_SITE = $(call github,mniestroj,easydbus,v$(EASYDBUS_VERSION))
 EASYDBUS_DEPENDENCIES = luainterpreter libglib2
 EASYDBUS_LICENSE = MIT
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
