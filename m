Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9812DCD37AC
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 08:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17EF60B38;
	Sun, 17 May 2026 08:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFbSpmsMMJeN; Sun, 17 May 2026 08:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 949CF60880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779008029;
	bh=46KVyEzBHs6lE3vupQu4A8CuIJ09cvHeUBitr4UrWcY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r0PYlGoev3hK4U4S00nfUt/HUzoL0cO1IE+OdcAvgm1Z053SZbEVeGwnQF0Ifh+r8
	 kX24jFRPo8bnRXTDoQjOTa0s8IYCO9/IMDEH27R/RnCs9CwZCqFfkP0E8tlMhwa0zw
	 0xQr4VrMkIZ2Ry3JfpgE3aJqjUcJZYPRm/8O7EmrCK7R4cNYQFfg5wchJhyFlx11kN
	 vOYZocJdt4RL4GN88Zoj5AT/g77whlQdHSe1VI3c7bkmvHdDMM5FQJA7wI1upNyFpg
	 boIfc33TOlEYINs2fQIWHA8HV51OaFPVCiZjfuFWnFPa2akP0r31Q57du0HsT690pL
	 bXz6EWcAZXIZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 949CF60880;
	Sun, 17 May 2026 08:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D323B390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 08:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1173404FC
 for <buildroot@buildroot.org>; Sun, 17 May 2026 08:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhQADMNEpKkJ for <buildroot@buildroot.org>;
 Sun, 17 May 2026 08:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9CB340330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9CB340330
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9CB340330
 for <buildroot@buildroot.org>; Sun, 17 May 2026 08:53:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488ad135063so7538665e9.0
 for <buildroot@buildroot.org>; Sun, 17 May 2026 01:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779008025; x=1779612825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ms3oN+gXHFIVLmma5Ygn/0IX1FyqLeF50aIJoMYgxQ=;
 b=o0pi3eYEmPvpw9V0VhYcDUR9J3sWfcmbN6mTQjGNfFnwWCvc9RcyiRaJDrj3SPIGhm
 d/2l4S4Fc8siLmpdOOc5ctg0Kqha04T+mGdP+MkUXGuyU45/bb304dl0wRX1fY3m/KQz
 QVR/5ez8RR0X95QRMof04ebWEX8FskP5+0i3xT0aPclX+t9Z5uXgVnic2Z4zyLp0g0Ca
 Ehy25tb3s4WXhWEeqne05/3h06s2hHTMv3/3cgnYaJgXGfItc3tfVj3sCaR5EgdbBZMr
 m0V8Oo8XNURXok6e0s+QOMcOH7KR8UoUduXMaEhW5o72kjNgC/F3EeHQ8y8aepK2dptp
 7cfg==
X-Gm-Message-State: AOJu0YxlA2fC+XBa0TEN0rATzoeKp5pk8fUzZZFvGE24SMlWk4V5E66T
 A1JuxbYqknPv9J9vC6RW8Q6+froMA2gQ0T2Dn3/V7sD8N20eX7CmnmU9fM7Z9A==
X-Gm-Gg: Acq92OGfDs5VcALkhd8GqXmdsvRhzGfOcHue2wrtgUcvHJjVrNe0lwbJqHWvHw3C5xc
 IkzjRydeRXl+65VPxJvU7NmZ2oKHtA3Da4+r2G0MicU30AdbvXUbP+GJpJV+v9JicLzp0isxi+b
 EPtzNaH6PFdMYLJBMBT+zfxryfNxY6SFeEubCis/dtTYygubuQjSeDmJvArWQzdwxuCOOm6/ZGx
 nyrvsSosB0w3DHGdMvR1RKYKHStIO+WC/YUzAdVBpa3W7OxHCOXGw8cCQYqRzu77RoS/9dJEa3R
 bQdIeHuvNWG+sfhlWEoj/JAkD1Ba9yX+484rESHLPTEOM17IQMYPYR5aHRHGohQGFnub8M0wL/Q
 rGkpeV/Z4URTThEFjp9m/Eyup9lmaiDtj4YtTPqdcSwbvCZtTcePUFX4+SC85QtLa1E4xM064k/
 BYn2nEBV3ghHLgHyGzuI8WNlQzMunxBi1dWga8b2HS2WOtyeRGpzIzpIAx589RHYNcpFBtdA4s/
 8Byy20yLtaiFfjJ7XHSxox8s65/lBQ8ab98CAYSBZ2JVxrG0lMQRQvhMFPxvUL1cHfilw==
X-Received: by 2002:a05:600c:3f0a:b0:48e:82af:d9 with SMTP id
 5b1f17b1804b1-48fe6612a59mr155248615e9.29.1779008025066; 
 Sun, 17 May 2026 01:53:45 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:9eb3:2105:4157:b399])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-48fe53767ecsm163059455e9.10.2026.05.17.01.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 01:53:43 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Sun, 17 May 2026 10:53:40 +0200
Message-ID: <20260517085341.1338094-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779008025; x=1779612825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ms3oN+gXHFIVLmma5Ygn/0IX1FyqLeF50aIJoMYgxQ=;
 b=WjRkVtae+9J+EnjsH/SH4muVrBjuo1T9aHmqMV4BStC53aq1MXtSHZpb0T7QgwO4XX
 2CIo756Fr85pOoTW9HEAjdM6HU+toT6+/t5JL1Q/rNDp4e9UYYe7x9IWalO8UEHh0Q6Y
 79SQeuRPGmdp6+LwLqm+9ijgcQGo8bCi1qAGV8R3h+J3Gat2GD00BhYjho921EbwKRmY
 /PlefitDyemYk/ii4/Iy5rNLtUNTQnfDdrtpHmB3ldMf7vbPtSWAtIct5Q6dtQiFrFvq
 Zi6lIlIFWUtL5u+QZEzUd+ZNDnnbUqZhY7KXthDcMSFYutsmUPjKvjiMSopEZNIJXuuS
 pTEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WjRkVtae
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: add Gallium VA-API
 support
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

Since commit 361bfbc70b2b (package/mesa3d: disable libva support),
VA-API has been unconditionally disabled in mesa3d due to a circular
dependency between mesa3d, libva and libgl.

The circular dependency only occurs when mesa3d is the libgl provider,
i.e. when GLX is enabled without libglvnd. In that case:
  mesa3d -> libva -> libgl -> mesa3d

Re-enable VA-API support as a new BR2_PACKAGE_MESA3D_GALLIUM_VA option,
guarded by a dependency that prevents the circular case. This allows
hardware video acceleration on AMD, Intel and other GPUs with Gallium
drivers.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/mesa3d/Config.in | 13 +++++++++++++
 package/mesa3d/mesa3d.mk |  7 +++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 66ebe04394..bfd072d6d0 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -461,6 +461,19 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
+config BR2_PACKAGE_MESA3D_GALLIUM_VA
+	bool "Gallium VA-API"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	# circular dependency: mesa3d -> libva -> libgl -> mesa3d
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_GLX || BR2_PACKAGE_LIBGLVND
+	select BR2_PACKAGE_LIBVA
+	help
+	  Enable VA-API video acceleration support in Gallium drivers.
+
+comment "Gallium VA-API needs a gallium driver, incompatible with GLX w/o libglvnd"
+	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
+		(BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND)
+
 config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "mesa3d" if BR2_PACKAGE_MESA3D_GBM
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1eaa4c577e..98f1c6c2bb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -182,9 +182,12 @@ endif
 #   - Building OpenGL ES without OpenGL is not supported, so always keep opengl enabled.
 MESA3D_CONF_OPTS += -Dopengl=true
 
-# libva and mesa3d have a circular dependency
-# we do not need libva support in mesa3d, therefore disable this option
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_VA),y)
+MESA3D_CONF_OPTS += -Dgallium-va=enabled
+MESA3D_DEPENDENCIES += libva
+else
 MESA3D_CONF_OPTS += -Dgallium-va=disabled
+endif
 
 # libGL is only provided for a full xorg stack, without libglvnd
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
