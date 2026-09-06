Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB257C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 23:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98E6D80AFE;
	Sun,  6 Sep 2026 23:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pt3j6NiOaHDU; Sun,  6 Sep 2026 23:32:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6CAE180AEF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788737523;
	b=hcllTd9YU5i+D11uwJlxbJuW61mS3ODmEb1KObM8rXojGWpTfUDTBo0M0HIJfOOWK+IY
	 adBS+0QWzw/c/ZsA1U6KxjAVjQiwLEffKM1Mg0eOe53k23tmMv5l+XsQ+xhnhaw1MV783
	 JFdooT26+7HbFVdYoVOcMoD4bSWu0uEFmvBwIxoGxo4Ghfdl+8WNXqHXKFPD9wHy2bzh+
	 753lPSTSQEZwL5V8fQ1DMzAtRy6GgQfmIz+hdWC1VMVosbjNze4wuyc+30ffcktnOAGKZ
	 Chzgoe5leXTrlZ0lTcTcGywk6MbES/In0O1oHfyfpqOUw0OHiH5yqBZAYF2WkEl9taA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788737523;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bPoG6JzBOp9aNwVF3c9A04qlM6q2BGdn9YsD8naUyvY=;
	b=Y4YMGbXwwwXthWWznJr3dqatqi6ytE5fK291uBdTsWsCyDt6GvdIkIbj8NwkF1wrooMW
	 ik7bfj27jFIw40lT/omx1slYDbo40zVDa+vvOAAE2cq7tg5cXu2LNxlxXIs5rMiKlauhw
	 yhoTGYTfmsygQQpoiV6GK4kxCzVojgU/Z2Z1bRJu78VjFP07bpJMUS5wop1xqhbEdWupv
	 JiL6SijWAyAVMqH2PMPxJPWEmtP7sI+Jn+Ex4E5z2hzs5D6XBoLeFLk+WwOa5ygpjg1cn
	 uiXUg34yUbZeZ4VHonjhwl0EbLbXFzupvLXAU/g1OuisSep6Ekwx4yTIjXFLG9ybuAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788737523;
	bh=bPoG6JzBOp9aNwVF3c9A04qlM6q2BGdn9YsD8naUyvY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULtnlXJKQkuMLOqAChFP54a53GAbh4CEvG3IHhu5xRwLMKbYb1Uya3lTbO05hrOJb
	 Gd7qE4GhhTyw2h3PYIEjY3HHI05HANKiMR2XS9dlTZ6NO8UyJFYOjJabzCYLnvEVRJ
	 moIthL12w9BdngVIQUNAUGlV61/mE6J+av5JTwwQVq5z0VhieJcYzxPebid9C+O2QC
	 xNqx0L5l/46b5XAZPRjZzpMKSh00wPeshHVdb9Kf95Jiy8jC1EXh2irLpUPHzrj/1G
	 23N2FeDrAl35PGsFl0TYh37esIaVW4l5pY77wnk0si8v6sXui9qHkaoPL8bEAiHBmY
	 Yk3xIMIM5Cwwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CAE180AEF;
	Sun,  6 Sep 2026 23:32:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEC64118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0BAD605E9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQho1ypAz9lV for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 23:32:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D19D96062A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788737521;
 b=QiWuIkcICF2aEH1qF87nD3hojWlaey0y+xRU4Ap55ICzSQnonnm0t1Hjj2SaZXB/jA2E
 VGpgggB9890Q668ZTbBvkiDO/9pIY8WdNR0LR8YaTl1PnLeIznS5bP6FoDZpr3+RHb6sk
 NhHz4fVzIh14LWNRq2a+BYqFlcapoRjssaQXhde8jmIOEsav31dmz6QsGJFTi9c8TEJK6
 XHnlNLi9sjVs7iNHJ0RgK6Ao6eJeTjMs7YgxxoBwPbDi2ATlbCsL2DOMSuk+xMFTaN1oj
 DTv+FMLaQVRv+lJJZp7VO74e3b2Y5evDr6DJXUOLtungRjGMSZuf7n2T+zzRBN9d0pA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788737521;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zGKQxYHwuhdyo12/uDeezfxu0OrMKcj4b75MAKRfaL8=;
 b=eu+F7yrb2uF0Soznch0sfrQzGnUgHHiSDu+LthAZq/nezFGxxrUVcbdiWwmRx2F07PbJ
 pcNy5Yp+WbyW94w/QKAMSYqcrs6NiOvP4JDdjHoubTNs4ZrAgB3NcC1bB8vRSG5BPIG2/
 0lc6aspgUbKGUj4tsrakj2bOCapF1he5Fi0VhlvMAGO25Vqd/TpDp7gZwTjcAsbPCLmJY
 bJxktEqPIAuI3B0E44ee9s5Ib0tGkKX4ny+vaLW+ktTJj+sxG8Ck5gfTB+qtCetWAmqnG
 zozbxcJZceKqwuYq6wKZcqmHJCdwG/XD71hEX8X6Q0fxGQsq/Pp5yWweNO655DpLE6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="otRTeL/Y"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=otRTeL/Y
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D19D96062A
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788737461;
 bh=zGKQxYHwuhdyo12/uDeezfxu0OrMKcj4b75MAKRfaL8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=otRTeL/YouPzeyYf43XFfPmBoLhVdlis49tvWmBtij1UCSrucHWDxth6FKTVeSpaC
 cCJf859aM9Dv1qW5UXTEfBCHykb6IoUh9hRsxcXqRZKT17OzZW0Dt4NL9Q6bQK4Re0
 /3a9hAdplAWt2jasDXKntIxmeLIDtwaU2d9x5OATjfflon60E1YtacmnWx5Da4m6yM
 gHrFIftpJ+ZvdyB3XagUP7uoX2WZohQV6LR4y1OdMroGWQxs5Szj693KNKqwrg8cr2
 XfSdtszAXXRpa650qtjgKCQyCxvjzXpykIcU/HoOWR6Sv10A5iJyPuENyNTS58Eu5m
 OkSyEOaIz2PLQ==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F221AA4C3853;
 Mon,  7 Sep 2026 01:31:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44132)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3MK1-000000007cf-0RRi;
 Sun, 06 Sep 2026 23:30:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Sep 2026 01:30:46 +0200
Message-ID: <20260906233048.692559-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906233048.692559-1-bernd@kuhls.net>
References: <20260906233048.692559-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 4/6] package/mesa3d: i915 Gallium driver needs
 llvm
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

Buildroot commit 3e296a151195f9d32dbfd62d6c75d08b822be6dd bumped the
package to 25.3.0 which includes upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b8b38d38b1c14b60de0324ac2f98ff7f1f4cc3c5
that enforces llvm for the i915 gallium driver causing configure errors
in buildroot:

../output-1/build/mesa3d-26.1.6/meson.build:241:3: ERROR: Feature llvm
cannot be disabled: i915 Gallium driver requires LLVM for vertex shaders

Please note that
https://gitlab.freedesktop.org/mesa/mesa/-/commit/4235c39a9a8378f1e2dc0899dd4c3c941f27b887
later removed the llvm dependency for the r300 driver introduced by the
commit mentioned above so we only need to add the dependency to the i915
driver.
The configure option draw-use-llvm is disabled by default when llvm is
not available:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/37c7d19e46a4863c120186a99ac0344c2dd31260

Fixes:
https://autobuild.buildroot.org/results/acd9039901cf4168e6318c62252ddae6ea0ec93d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e18d25eb8e..f45a675445 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -147,11 +147,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	bool "Gallium i915 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i915-based Intel GPUs.
 
+comment "i915 driver needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
