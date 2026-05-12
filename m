Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3EACD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 22:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B5594111C;
	Tue, 12 May 2026 22:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TX3VfGc-OOv; Tue, 12 May 2026 22:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9CF4110E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778623495;
	bh=UEILTAWGjFvdcYeYn0an8zgkl9BLIRC4oemmfHT1s1g=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gn/kzD9uzPvd9Agsjz5C4Qj0cWNSpq73muctxisehkRPBky91RpzZcjgTLp7HBFxy
	 DWcx2+7hQhfvBFP5loU3xLYwrgzPjWkuqHWefESeriPs5l6GWhjohFiTi74WjIjhp+
	 PpJaLn52DN0mcxvSXzgJAPpGnZBjWaSTPIO2ENwh3OpPSAO2OEj+l6zVgqnceiAjHp
	 wgEGcyyjaKB2tSSIMKlCVmbLXTqJCTO/5seduTAPjuL0ZThJvSBZ/zg5jZyGNMjDpl
	 mSgbwSDhgT8KaQBYFwrnbPWHrTqI4w/b+sh7o6rJ4rW5n2iPf/EKMOaqvO/Ey4xRbs
	 UAcdbqmHSG6Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E9CF4110E;
	Tue, 12 May 2026 22:04:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95DC8270
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8816C60EB2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg0KV_bI0Fje for <buildroot@buildroot.org>;
 Tue, 12 May 2026 22:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E583360E7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E583360E7C
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E583360E7C
 for <buildroot@buildroot.org>; Tue, 12 May 2026 22:04:51 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-8354461da74so2932506b3a.1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 15:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778623491; x=1779228291;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rKFNi3FN5eftl3vCSN14ycpI/fsWuTq5+BFjAhn+EJ8=;
 b=ZvisjcZ0cM11gtEQqLzPsyQBgVfgG4SpGy2AbqNo+C85k3s0fLbYND6iAdtb7tU6sn
 Z+PBSbwpAyc/Pn0jNzYF5o9B4w8MdRvqCcZsXFMg+c39VD/YL62UUbNdhXNckSQ6odTN
 T7Jgxtzpdu+ds2Nu+dZ80ijFJCLIqLAYTMLCMbi5LqUTIwAbU9eGfdg+3Gc8tNiYjx9t
 pQ89Yz1iPfKmIhVnf+mBNa2lnK07AhVBcDl4bvkFCtGr7wP3JjHeK1/xgrRVO1G1RTPN
 LuzxPrk2tTZ/gX4SIzpf2NEUz5uPMiSlD5jdJgpOx0npX54lb8Gwkw0+ySyrICOypRFw
 0KIQ==
X-Gm-Message-State: AOJu0YzJYqIuseMo11kgpSIEPKKVflbdqqmWGTzJQk50OTXzTfcPfES3
 fSWleEQnPGUDgJ7sMSQ7EYMHBWeoRRlJwogXNqqBwhloLi3FYOWyTZwLm4Ri0plQf+o=
X-Gm-Gg: Acq92OHKOiiL993zTMW7Goi/EwDWrHEcoTwfL7r5JVoy8eXEC+MXdzvosu86QvfuP+C
 k60vr7iW1mABdHAx1gPzhDvo77GxjWniHFgzT4uXQKToZjnEcZz3m0BYHNZli2z35SXadBMGkZy
 LNEotSVojpPK5kvUnszjQiDgOg8M5FnxMiyDugoc7htwMTt+42rIh6ZPxBvelUrUwDxsvyKCc1c
 tBxg7jtKknPJ3Wl2cgq+DBya01X6j6WQaKahqQZGQcXHE1xr+GYWFsdOTpNgS/gVVmiltV4qnfb
 BJVHRsBisvN6H8978zaVdcvLZOQoN+WgH6U4fZWlTNBIaUchQF+NxESTuwyR000zraQ54EscZd2
 zyRb666SinalRDPj6ofdizRcxBaZTLe7NdolFR/cdvA8j+hPz9yKw8y3hXrvSaXRXkPa2cRtbeb
 jgeMDWufq7Nho3HYxbQ0BGB0hIfJXtag==
X-Received: by 2002:a05:6a00:a93:b0:82f:3436:42d7 with SMTP id
 d2e1a72fcca58-83f03e921c4mr516824b3a.2.1778623490907; 
 Tue, 12 May 2026 15:04:50 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839685a8125sm24388390b3a.61.2026.05.12.15.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 15:04:50 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 12 May 2026 15:04:45 -0700
MIME-Version: 1.0
Message-Id: <20260512-mesa3d-amdgpu-virtio-v2-2-30678b797df9@anodize.com>
References: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
In-Reply-To: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778623489; l=2154;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=iqdZcK+6Fo7CC/qqxzL/6WfiN5Dnf+RjCKFUDvWE4iA=;
 b=KTYEu8zdwMrkzmLr0L1nc9fdKjh8qkLdx2hTSU+f/Dwap7UeuM4LJ7kMO1syaKmEvTsNg3SKi
 4QZdDDUjSM+CfSRZ6TtU8JkvCt+K2KqaFBJmJvKEOp4UD8paSimvH4+
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778623491; x=1779228291; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rKFNi3FN5eftl3vCSN14ycpI/fsWuTq5+BFjAhn+EJ8=;
 b=jsYu4F7DT2GNguQdpyB7cLYfxXGVbZqP88zgqFMBnPoqZWS0ViM8l3G2KpG0GIxCVl
 taR//iZjbh5wNXHrlWLwJcE6C5nMFkooiJqyF5xjVR7wyDWRxq7/OLPrgF8sRsVSEyTw
 m8UrV7cSrT0lsSm0nmmVbrhqOU8E13sCyMsD+DvvWrWeNA4ocrSjWL6irislcXl3yC9w
 zj5S1pZWqGWQCHjeA2U81SccRc9rEncODwxOEdGAkxOQS2IPacMNys7K6sJVuXyA61sZ
 rVgcGjKyfk9xDF8QV6ORa7KW/UwPmZTso3FgV2Yk0WGJkpLracgQBY0azeMpj5p+hZTc
 6kyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=anodize.com header.i=@anodize.com
 header.a=rsa-sha256 header.s=google header.b=jsYu4F7D
Subject: [Buildroot] [PATCH v2 2/4] package/mesa3d: add freedreno-virtio
 config
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

Add a config for enabling the freedreno virtio KMD backend, in the same
pattern as amdgpu-virtio.

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/mesa3d/Config.in | 12 ++++++++++++
 package/mesa3d/mesa3d.mk | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 633f9eec1f..d4e0987a9c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -150,6 +150,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	# the toolchain having sync4 primitives, which is always a given
 	# for arm/aarch64.
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	help
 	  Mesa driver for Freedreno GPUs.
@@ -428,6 +429,17 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
 	  Select this when running Mesa inside a virtual machine
 	  with virtio-gpu host native context support.
 
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
+	bool "freedreno-virtio"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	help
+	  Enable VirtIO support for freedreno native contexts
+	  used by the freedreno (OpenGL) and turnip (Vulkan)
+	  drivers.
+
+	  Select this when running Mesa inside a virtual machine
+	  with virtio-gpu host native context support.
+
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	bool
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 34597966af..d9916ca359 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -157,6 +157,16 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+MESA3D_FREEDRENO_KMDS = msm
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
+MESA3D_FREEDRENO_KMDS += virtio
+endif
+
+MESA3D_CONF_OPTS += \
+	-Dfreedreno-kmds=$(subst $(space),$(comma),$(MESA3D_FREEDRENO_KMDS))
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
 endif

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
