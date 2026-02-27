Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3A9104891F
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 23:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4494583CC6;
	Fri, 27 Feb 2026 23:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y12VUCIKGcDz; Fri, 27 Feb 2026 23:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF7683CAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772234072;
	bh=3RShq7sqiGR/dJ9lCEhE5+jyi9HvAChTz2Tw5dXY/oc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loYsOYCKOKXmLzYUchM4fAYFk3aQxcatdZLAeFmk2zYj7dTYvTuxXxxln3Z496abY
	 0Oh09rRjQ7zZbpDh6jxtQdJmK4xPqAD0rYRTR57XVRrBjGdYJrTx6CzUg0gTjPKrE8
	 bIdm1dWFczTOfY7H9ODndm3EAjqmC1MTx0EyFEz+McTsaiC9O4whFOUhIhdEzuVPGV
	 bjsfPxCONrxUq88gZ9rIUak+u/FArpuBTlsLOodWzXErPtaDNjW8HDs57ZiOlR9Lah
	 gP0KVz1YmNJ8n8ASVqPGphXaB2+wB28RQDt5QQ1ai2+Y7a9lsSMqzbKW/z3oWqiGub
	 ORdh0d4TP9hNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF7683CAF;
	Fri, 27 Feb 2026 23:14:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 754681F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B63B4009C
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gECtXXhpnBOF for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 23:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A92FE4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A92FE4005B
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A92FE4005B
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:28 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-8274843810cso1164064b3a.3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 15:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772234067; x=1772838867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dDfM1zxpp2u+nhHdgKTIjlcT6NOjM7OK14AYd6elYGk=;
 b=aeSWLnAccP+ehYsWnqB9nHwdKtP8a1kO5PsEPTDB3BJsKE2bdzVg8IWYufLj5ypay7
 FlrzeEROr23jVUiuA2dtJa47b2htrHersMGHf/n0HfGeJXTle1OriyCM9sKppWkkkvVH
 clvePFeKzWul86paXk2mY/eITOpBb0fPpTUFXLpHU7pcmFByP86M2XCrRj11SzO7E3PW
 WbTsxSyUlFFJQYVdImf6r4LoCGb+PnWYiz3D+tGtECAs9nCVfmtZsOd2B3O5Qa/m9fnR
 tv5j96xq0DeeBZki+CJrCzzPCGvc9w7ZE+I42xXZWO4tONggfZLQM+RGKl6dkLCe+b3T
 h1zw==
X-Gm-Message-State: AOJu0YyPjUkfETMic8ZNxChrdIB8UV30lAE1IZCP6S11dSW2byglJ1Ow
 OQhj+nquoP+7l1Xnfpu1ZJ7CUlo7jBdJaRkl5tvERTd3tQtzWvHNN4xwcaRFUpJo1yJRFsdJdJg
 uaw4l
X-Gm-Gg: ATEYQzx7ucNOIYhS8zODDgqlashV81BM+w2jht+Rc8ll6AG5IeP42L8fcpz64Yvy67J
 1DkaYt5p2ZYozMxk6sNZ0Uwz+Yt2sBaBnx9Bi4qOPXOs0xvOa+nD2jjEPSNzSzoU37fgmYR8p9m
 WZRPANjLOfaGKtESIBAWLz9yzYUCNg/cB3kn+SzCxUblIjYfE6oRjNbO5gmosS8itB0Ta6g72RE
 qlOnsrVege6NUwCLIzb3YwCBw0rU7RwyJ6lFGtOGX/9Ubd9KOp7xGkRBmsP3bsupjp2YBspMqKq
 +mCiAeZDwXKlnOy/UbQaRYS2CVqn5zWOz+XSXw9JvTQzKI3/mk+GY5dzDh/86qyFW3g3qkb/nFm
 B4qvKECwoGMnhoTDoECVlfjedBnTbm4mfZ+KlfbL3+tkudsHGmwgqqLlK1wsjJg9siJ/9OLb0/B
 3ZnH1hEd4tJcw1HjoueUF2fsBZ3hFVjv0Vy/s=
X-Received: by 2002:a05:6a21:3a44:b0:395:732:2c8f with SMTP id
 adf61e73a8af0-395c3b16eb1mr3834837637.65.1772234067261; 
 Fri, 27 Feb 2026 15:14:27 -0800 (PST)
Received: from wash.clouded-fir.ts.net ([50.120.91.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69fff3sm72007995ad.48.2026.02.27.15.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:14:26 -0800 (PST)
From: Joseph Kogut <joseph@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Joseph Kogut <joseph@anodize.com>
Date: Fri, 27 Feb 2026 15:14:07 -0800
Message-ID: <20260227-mesa3d-amdgpu-virtio-v1-3-3e6d10d4eaef@anodize.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
References: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1772234067; x=1772838867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dDfM1zxpp2u+nhHdgKTIjlcT6NOjM7OK14AYd6elYGk=;
 b=fS4B0UP5C8LsQXWaIsFto1cw0LB10iU+5Z6XAdqWDpZJcHBhHCLXB+aviICtWwil7Y
 UG84oMajKWKgfFsiVjm+DhFsS9lY7Xr9nYGujuyExm9nLk5yZsLoQ9dk613zsu23jge/
 GYn4tKB3jwb469eudlo/rTCOdWm32ZQWYUE10C179EDnmOEf4GsTamZvT8w4J04geaoA
 5TcekslchDpqzZzBJwLhtkq4ZvjYDuvPLZXTBiScYO4SPIcna6czj92W7kn6qskow5pg
 d5h18jr8xcczv7+6/rPnJPcG4CsUsT0LTV3opZyoMLIlb2MVIWgyLF70B8nPaoLH/A1g
 ZF6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=fS4B0UP5
Subject: [Buildroot] [PATCH 3/4] package/mesa3d: add freedreno vulkan driver
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

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Tested with:
  BR2_PACKAGE_MESA3D=y
  BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO=y
  BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO=y

$ utils/test-pkg -p mesa3d -c mesa-freedreno-vdrm.config -a
                             arm-aarch64 [ 1/32]: OK
               bootlin-aarch64-glibc-old [ 2/32]: SKIPPED
                   bootlin-aarch64-glibc [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                      bootlin-armv7-musl [ 7/32]: OK
                   bootlin-armv7m-uclibc [ 8/32]: SKIPPED
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: SKIPPED
                  bootlin-mips64el-glibc [12/32]: OK
                   bootlin-mipsel-uclibc [13/32]: SKIPPED
                bootlin-mipsel32r6-glibc [14/32]: SKIPPED
                 bootlin-openrisc-uclibc [15/32]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [16/32]: SKIPPED
        bootlin-powerpc64le-power8-glibc [17/32]: SKIPPED
                   bootlin-riscv32-glibc [18/32]: SKIPPED
                   bootlin-riscv64-glibc [19/32]: SKIPPED
                    bootlin-riscv64-musl [20/32]: SKIPPED
                 bootlin-s390x-z13-glibc [21/32]: SKIPPED
                      bootlin-sh4-uclibc [22/32]: SKIPPED
                    bootlin-sparc-uclibc [23/32]: SKIPPED
                   bootlin-sparc64-glibc [24/32]: SKIPPED
                    bootlin-x86-64-glibc [25/32]: SKIPPED
                     bootlin-x86-64-musl [26/32]: SKIPPED
                   bootlin-x86-64-uclibc [27/32]: SKIPPED
                   bootlin-x86-i686-musl [28/32]: SKIPPED
                   bootlin-xtensa-uclibc [29/32]: SKIPPED
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: SKIPPED
32 builds, 24 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 package/mesa3d/Config.in | 10 +++++++++-
 package/mesa3d/mesa3d.mk |  3 ++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b5aaec5e1c..e8c2c8473c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -350,6 +350,13 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	help
 	  Vulkan broadcom driver.
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO
+	bool "Vulkan freedreno driver (turnip)"
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan freedreno driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
@@ -425,7 +432,8 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
 
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
 	bool "freedreno-virtio"
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO
 	help
 	  Enable VirtIO support for freedreno native contexts
 	  used by the freedreno (OpenGL) and turnip (Vulkan)
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e6f44ad73c..0a41d84446 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -130,6 +130,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD) += amd
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO) += freedreno
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
@@ -157,7 +158,7 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO),)
 MESA3D_GALLIUM_DRIVER_FREEDRENO_KMDS = msm
 ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
 MESA3D_GALLIUM_DRIVER_FREEDRENO_KMDS += virtio

-- 
2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
