Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B26FC021B6
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 22:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 108EC81479;
	Fri, 21 Feb 2025 22:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFsjN5u40HzQ; Fri, 21 Feb 2025 22:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 199DD81492
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 199DD81492;
	Fri, 21 Feb 2025 22:55:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73910EDF
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 569F040BF1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mspVpRhZclyF for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 22:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FC2E40BEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC2E40BEF
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FC2E40BEF
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f6287649eso2002549f8f.3
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740178533; x=1740783333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vwf3aCAjbDvTGVfOTEdTdeK2NtjFvwEeXv7wngGcnxs=;
 b=VOffUCNJi4nGNGYr+7AQ1O5pocMOkW8Qma3thBizr9ZAlrVdjv7tbitIbYd4GOsQA+
 ZfF15RxiNy3HkIudErDJj1X6/PWlWBhi+QkDQKD36buuo6u3xXakoesWTqBHTSMGD5fR
 FEcGqj5//TSheo33yDxIldP2p4HORwJL+YJvDu1pAmmqYBBgU+L7vSn13kM+m1Yr7GHV
 VjNbR+cRGRgEUK5PGG/Ow2M3KdQYttV3FgQiCkxWDlM53G0Zqkt7T/1h2vKjahhJr8kx
 OYY+NZz8YfRCC8ev1bU/HOn9BblUU5iCuyWUdyM3/pkmHnaCZO+opn36v2mGw/XKIjVl
 Nxlw==
X-Gm-Message-State: AOJu0YzKC6HT36/Qk6P3xDUrRhUkTw9D2TK99qp8lLrEhXl6VVHIdFcy
 a3TaZFxa0VgoDcYTPbl9a9LDu9OBXTDJfFMxRayNlvKuY1xwcl41Jy3csG5Fh0po9FcRugVBkSB
 2
X-Gm-Gg: ASbGncvC5Y1BDiUMNYnT4SrNe0yoaIRl+dSHvrFBLVKUVP7GbTFntO9fV+dyEe0k0xK
 4AD1T/PlHBkry+Z6m+LljkhtDyHXZMJuVhV9ZS1nQshR0obhC3Lt8zYdezEh1EctrbwO8taRb00
 rugkIHmJJ/G7NkOKr2iyo6LhvXnnKzFuoe73esY4+Kaobjl+Ou3uaWLaougIg8J3bNk9zqA9W4H
 pA9Sfr2A1veMeoP/66MnNq0r60SoMzFpgYd+IqJYK7Z+hIjUc1QAQjl+tZHD76p5MeYJombDd0m
 WC3XYMBBH/XbnMqC0SqaXV1Q+oHxdx28Es1JVPgEUztkUXLL2th5HwMwIo4t/zPgrvzfIy0rhMx
 F6rdzIvD+osrD+mihVbNDZSk=
X-Google-Smtp-Source: AGHT+IGfMzF8E/RY5v2RWNq0DFcbKpkG3sbOtRu6FvqKrIe3RDCkJgm6SktlikuUwcOk7FbsdQHROA==
X-Received: by 2002:a05:6000:2a8:b0:38d:d69e:1326 with SMTP id
 ffacd0b85a97d-38f70783ad2mr4072066f8f.9.1740178533348; 
 Fri, 21 Feb 2025 14:55:33 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8602sm25218585f8f.94.2025.02.21.14.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 14:55:33 -0800 (PST)
To: buildroot@buildroot.org
Cc: Niklas Cassel <cassel@kernel.org>, Romain Naour <romain.naour@smile.fr>,
 Niklas Cassel <niklas.cassel@wdc.com>
Date: Fri, 21 Feb 2025 23:55:26 +0100
Message-ID: <20250221225529.441084-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221225529.441084-1-romain.naour@smile.fr>
References: <20250221225529.441084-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740178533; x=1740783333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vwf3aCAjbDvTGVfOTEdTdeK2NtjFvwEeXv7wngGcnxs=;
 b=lKfn7KcxhUZfX/MYBHcEmSCGkwG+GlyiPxGPnblojZnHWl/bhRn0lFNlysWLIqZq4e
 s+fGPoWmVYoDhkFFg1tvMHDbp57Ak7rtljY7MdUQo4Ag0W0K1MIlDOgfv/bz7bvSEtvN
 xnpIm6VZaTjVeeRJu6hpwZljUBpL0Sh8GFi1Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=lKfn7Kcx
Subject: [Buildroot] [PATCH v6 2/5] configs/rock5b: build and install rock5b
 device tree overlays
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

Build and install all in-tree rock5b device tree overlays.

The device tree overlays will be available in /boot, such that it is
possible for u-boot to apply one (or many) of them before booting Linux.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/rock5b_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 8a4b579e58..7d718df15d 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
+BR2_LINUX_KERNEL_INTREE_DTSO_NAMES="rockchip/rk3588-rock-5b-pcie-srns rockchip/rk3588-rock-5b-pcie-ep"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
