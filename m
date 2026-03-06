Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0972F0181C
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 09:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D8B60B1A;
	Fri,  6 Mar 2026 09:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxsCuAew7R0E; Fri,  6 Mar 2026 09:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD99960FE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772789721;
	bh=A6E0s3e65oOzwSklncGWDPneVw/VrUlYjtq4rfyE06w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nEKGcz71gNSGqX/ZvUsSu2CAQVW9CqyyQ9Zq/dGj8snoEzfCLcRXEfh6zjcGSiOQc
	 NkJE1vQ149UVU/IE5B0PO9EuRY1s0lEQAkGxH3lIu5cLU77lvprzR3tqv7Ol+/xnFw
	 JsnqWnUGElkP8L9jBpzuHchShJ8DKVaEu9wXJmHOivVMrhiYsSpKY6uzXeukEPcVmv
	 QJpH3A4//3ppjVmNOmTy3vicOQqNd1EQc02UiIhlTIgk46D0fP1bWvifCLSjOCZy84
	 qUJJHOCwMS5/takTzmlerqZgUG3LrOrgBQ2M9vpy6H+rMS3MMNo5nWn0tgZXPqywy3
	 XWmdk7MB4t9fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD99960FE2;
	Fri,  6 Mar 2026 09:35:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C3A25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C5840366
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJ-L7sTb7q-3 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 09:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 072124018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 072124018E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 072124018E
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:18 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48375f10628so59717275e9.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 01:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789717; x=1773394517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nyzYYAQ/c4aoMULqd7xKA+vsjlKEgyfDCBEi4ygYdA4=;
 b=o5Y22Ifwkwv8r2+UZQjmSJ1eyRbWxknMYPkB2OSYCdd3XsXW3D4GywN5cXWlPN31WZ
 Os/kdPh2F0HZ/B0nUsWWzm5X4LasI89zdErFcBoWmP1MxCqj8OqkobepN/yN2i7qOyFX
 ynum5Qe2PnUbYGb3vSeacwEDkGgMkF8Rlj+qNNPDEA9vYl9hZrW3efBRlVHIrdcEeL/n
 u6YNzZSzwKea5HtOnq+unM2MN0UneJQcRaHR5V2xCdKa9o6QMbq4HsBi8nu6cikEKpa2
 1SxBVRtfQDGYVQDv8s3s9wxnG+xvedHgf0Sixc1POGumI2FIVL2mkDuHg+uijFbLOALZ
 ivDg==
X-Gm-Message-State: AOJu0YzJ15LaSovwakAGwsM73irmwVYvHBMynYcMecyqKA01hWbfZQmw
 kpJBfrNGg/2KPyAy/Vmu2YzUQMpRX2fjg02Hqy3KSOK+zAW4vx5TNN/IeFTbbRH/SIPkQNxkzbn
 IgrDBlsA=
X-Gm-Gg: ATEYQzxM1b8VkhDlXmFI/rNa09i5ODIc2akW0M7eqmUKOJwIc9Nk9um8lUZs8nmAO3g
 wMeborItxfdfSkPbWaeeEOhTxaN113+b/zxinj6ql/R8M+Pp4iNVslK3c4MG2y7JJrZmChRiypv
 gMMM+PFGyJoJTBQNfjsLFXO7keCG3bZdB99LOVrAx82hbc2VdteUpy+4bjvtOgywZaGK+5RyyHq
 aapIrKV3hbX/YjTy8RuKLzdswGD1iuc/0oSerbJLXJmDzvj8D3/4bsmis7iG5yQZ/xDYHlhMyhZ
 RthlILrrOHlBAuPTmfGfv4dVJyFsZSh04JD1i2WCLGd77yZjROoUwZOYdFSFbgRnH63U1snK7Gs
 KOf8RVrfhbtOiNybA19QceSAjgqKwCxADMZ8XigShtmisVBHZl8bKDsEVUhwed8nLtox07/p+Rs
 OsfvhS6P80MMZMWWPyPxRpFE3wI+biLatAbx6jMNPFruH2FB40WS8nSgAPBI6ATxEMAAE5PX13I
 dJe6cO/Ae3Fohfr0qhO
X-Received: by 2002:a05:600c:4445:b0:483:79ad:f3b9 with SMTP id
 5b1f17b1804b1-48526979bffmr21765195e9.28.1772789716754; 
 Fri, 06 Mar 2026 01:35:16 -0800 (PST)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276bc6bbsm21227385e9.15.2026.03.06.01.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 01:35:16 -0800 (PST)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  6 Mar 2026 10:34:47 +0100
Message-ID: <20260306093448.707547-3-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306093448.707547-1-dowan.gullient@smile.fr>
References: <20260306093448.707547-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772789717; x=1773394517; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyzYYAQ/c4aoMULqd7xKA+vsjlKEgyfDCBEi4ygYdA4=;
 b=aPVjEuRa0+FF+GpqaYpvRA+7hEcC4f65TYapB9Xebjsx4n2yy8X6y8S3DNNFKcSkle
 o0lwK8HqAybeqFsXpo2szZu5rAjZxS5CnMy2xL7jkYdwyU+MVsRi60mlOgPQDps5UTFg
 IVwv5L4ujyEWzWO5e20tEy6v5TYvs9Aio9t44=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=aPVjEuRa
Subject: [Buildroot] [PATCH v1 2/3] configs/khadas_vim3_defconfig: linux
 bump to 6.18.15
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 configs/khadas_vim3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
index 89bae0f114..de737478bd 100644
--- a/configs/khadas_vim3_defconfig
+++ b/configs/khadas_vim3_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/khadas/vim3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/khadas/vim3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-g12b-a311d-khadas-vim3"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
