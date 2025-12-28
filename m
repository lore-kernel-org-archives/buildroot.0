Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F35E8FDBE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 403B640540;
	Sun, 28 Dec 2025 21:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhzMLeH6Skgt; Sun, 28 Dec 2025 21:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4877E404D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766957838;
	bh=lZ5UZumwbmBXqliB26hGmn9L9DbfLEsKNjnc7/qDtGc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ufcn9r+j12I8Cac8HCQVjQKKkGqYDkSCQdWDb2KxmAx5FZEEY6L0hq0X3ZSmAyq/V
	 x1VwFHOYAArfdpNmD6i0nax0AYnUgWtzUcJC/n2Vn3MbCmqwGB4FUnI4BfgFBN/D1b
	 IjK0/Bv33JjjegZzivvMZk5/f82ZyGn/ZhM5N2NbFozjUW0DrlF9HFhVhNxjSoc48N
	 g609hOFirvl68ALkLEP5+yn1y4GAYhItb6WPsPj05GmoWqeWDPwvyNwLmIoJMv5glz
	 x445hLU4hXaaDfyboqh18+4PYB0SVIYT/VwxE7It4H1m9tLnNALBIpfnIlvIiquvo8
	 AZCDghpmEVDLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4877E404D3;
	Sun, 28 Dec 2025 21:37:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAAAE1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7BBC80F7B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djKI0x5vAXqH for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9E8080CD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9E8080CD7
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9E8080CD7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:15 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7cac8231d4eso5322008a34.2
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766957835; x=1767562635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QK7qOYQai7he2rSQyt1dhofkUN7O538xaqufoJ5CSXE=;
 b=fYnNhVtWmrPa2nN40ZvG5iYRGkpxctQo4zKGwf5vFhxz032tackCDQ6emtPben+dto
 aRmLAQrMFSw6NRDbRegrTNj6qC/XM93JN1lZfVHjLzPC6tFEV9IubU3hxvPbkvUbr/bv
 E+om6NdebX56gKICk3pnu/se4AtHsPAyhPyOOcxlr3p3J2O36bX9VnouGu62ezlxANzn
 FIpm8EPSZvuI8w8a+xnqFe62YqdJGVR/VHcBP35XkBVg55CbkDWYutuWsTKgMAZcrcor
 C30gUATSFk815cF4kFYCvaF+kKQtQILsW69k5RJWwlXbVZPINjfzUtQcIePwCvIwFwHI
 r0+w==
X-Gm-Message-State: AOJu0Yy+s4veMKkobwZ/54j9P7iD+PGLzxoPY85zWeiWR1zPgV75h8PZ
 xjGGLTS6CmA1IBrO1yh+RZQE0FdQeK/IvXx4LtMRzC5dLSNJNnFT+orUIEgVvBp+Mrk=
X-Gm-Gg: AY/fxX7oXDKES6xXeIFMUy/i1bXtENX6ZGSdkMCCmbdBsCmFdEWIE7X56/EDya9V74U
 GIpQK6sSZQdAGWJTFUt3Pxc63AYfGkCYIVoVz+hOfGIkdd+4a9ma/DZVUr3NwN1WkW1c+BZFBrB
 nizVKnZP6HF6zApBarb2xllh6yB7AOUOIH4PaE2Z27MGkp8oHEhBoTrOLDQ1ktETIezszqkG483
 y2swWNPX9B5q4fmoA3b1ohWtosxOzsAIODTQqxhDJm/RnfqYctFguan219VzjiZcIjL2FrlYdLI
 Yp3f1PpgpI3cPfqreKyGSeEIJV0NgcmWaVGcoxUbZQbB3kPY1pYEaytI71ipFJzuWB+q503WWkD
 3VmiVH4aTyaXM8IFIu0gAJ/nEfYUeygpMYuYnTUN2UEYXWGIP9B0dfWuUbiwCZV9OKQTB6eanDO
 vc9KSnEjT5jw39u6Ukdppq04Cp2Ey86G+6O5Cv+mfxpWbAqV9YoB0wKSJr7xHRKOOgeyitfi+QK
 3SKngvY0cIvgNuwl2i5UfTLtTiXYXLCF90KYJHxKcmQ75ea50puoJU=
X-Google-Smtp-Source: AGHT+IGBJ58BM6L5Pkby4854uocQW6F0ZqDZcTsLTsErbtdODCMEmrq/eAHD7eLhbNzFfErPk8nSEA==
X-Received: by 2002:a05:6830:44a4:b0:7b4:1768:ff3b with SMTP id
 46e09a7af769-7cc66a7f734mr15863901a34.22.1766957834660; 
 Sun, 28 Dec 2025 13:37:14 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6680358asm20003855a34.30.2025.12.28.13.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 13:37:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 28 Dec 2025 14:37:08 -0700
Message-ID: <20251228213710.2591716-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766957835; x=1767562635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QK7qOYQai7he2rSQyt1dhofkUN7O538xaqufoJ5CSXE=;
 b=Xa6KcgbeS0Rr8AwND1Zpi8JS4ZO1qHin2FKijpMKuRpeM0qLzNJYRMGIHpTQOStvjc
 eP9M8v+Dtnmwr/6aGA6+QoGNvUTET28Qsgm+v4EJxCKrQLyaG91SjLdsZdhtj545LtWq
 tyEjnhG/EK1oUivccL5TL4C/6gN6Z/z0xET8M2bbAG88SMoRazqeKs9+hBMp/2Kk4pCS
 Q9+e+JyLBm+9V0XZ+uq+uHpxOqDHTHVQfIbevOgsi5YRFKDzuTpRqtXjz0NAob4X6+xr
 2KrYG+Vn8GdOfz3sDP4n7dvi7C6wbALYFKpGUSEONOvGqRpbKrnRrbt5Yj7p0eYNi7by
 DzVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xa6Kcgbe
Subject: [Buildroot] [PATCH v6 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
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

This change sets the default GOPROXY value to match Go's built-in
default of "https://proxy.golang.org,direct" which provides several
benefits:

- Avoid package breakages due to missing module sources
- Better alignment with upstream Go toolchain defaults
- Faster downloads via the proxy compared to direct Git clones
- Maintains reproducible builds through Go's module checksum validation

The default value from the toolchain can be read with "go env GOPROXY"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ffd50adecc..26da7be71b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY="https://proxy.golang.org,direct" \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
