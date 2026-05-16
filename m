Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D137CD4851
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 02:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB60615FE;
	Sat, 16 May 2026 02:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljqAND7pFY9o; Sat, 16 May 2026 02:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 726A8607ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778897015;
	bh=EkWB8TvxdHYWM25dlt5KuFgc/+3LvLLvtCpz0mwq2W4=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BdbKItWAAnKJM4Okk/xaxrP0ALNPExbNV5Z+NY+XXf2tQkuSWCfJEwdCspvvtFCQZ
	 v04oO2C5ZPg4fxqgHeHbXYWkDG2K2rrREEI0tTunQDkNaDJ6zDCV4cuJmJyEePcLYc
	 Q8DtPVsc+81dfshp5WgFCmjAi8rYzSHgE/6LwtdxYNFLybG85oOBbkuc6PtW3wu16m
	 5POcHE9B4i0Pd1+GDJnhiM7jTysNuReR/XgTC0tcV1FdRNGIQLmQ7gcMVoDadIH7/0
	 wxijLV4uu/kl9orfkFaQCVwTWCfyM2mVQSwbiT/IJB5uiWG55O95HvhF2njdc4f+y+
	 OK3aOwGMRHN3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 726A8607ED;
	Sat, 16 May 2026 02:03:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4413A45B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A05884A64
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2exMCO9qKp8z for <buildroot@buildroot.org>;
 Sat, 16 May 2026 02:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82319847FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82319847FD
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82319847FD
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:31 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-367d88b9940so261674a91.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778897011; x=1779501811;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EFW50pkuXqujso0Nx9AKVd9iKpKG/7/+Gzj/k11d+tI=;
 b=KeEU/dtFEaYQDprShd/JsZUsQ7xyIuPZt1AQlOdLBKy7coiP3HQH02ZZbsRMqPX2c/
 2xbg7NQ7l/1v4pLYfkJeidPB5F+GbfZ5FGpZwUWJZrHA9h0cmyx8N2EQlwcBbZQODe8A
 z6E8J9wu34x+DVx8gTVCSGJtETtOZIKMJSku/Dh7dfF/Jv3fK1hPnyTzartzFnTB7Gv9
 J84H+AZvM4Kn3BE8+aJ3LB0b5lcxTYZsJygbEep38kjmNx5Jbnbu3o8zbNNSdSQ5SKIZ
 8buotY6Lih0wpW+9efweNDQezIPHb7TDEQxw0oBJqgi/Hi/SBMrIa9D9+j1b+F2cqWXX
 EMug==
X-Gm-Message-State: AOJu0YzacLF05Rt1KnSaBCDlVeILyDAe+7EuFe23UyZv+dm4pmXTSxNE
 zS+fYja8Kch5ABHNRLvq6gtDA62hTI2n9hJqvSXKeC6Kk/4jNMMeoyWE
X-Gm-Gg: Acq92OFSyQwaCg7hJbnCIGTNK7rkAVf0MUbLuOK304b61KE34XfYxlfa5a4i8lDt2yG
 9IlU/IZzyXxaJZnnsKpfbOjJKMxCIRqZA4bEIS1p4TRFUwElM5YuViNmOzl2DsD9X8ge4cSxn4h
 z3n0iHutq7H5PwoWj+Z0npBhJRkyhuS42RoArgIHfEKe4MViRL1qxC3Yqc4I6K3WJ9v4QDgZ5vS
 0lcqP9T0UwQu8Lx3S/dZQA0ODI58473dzbJKtj42Qu968YRTCqa3/HOXcWAfI9BzLW+mbfVfiA3
 RYFMHgBEsoLAR60TaRNEbmPt25lCmaAEul+cT4TccAiaZzLd801SK5Qgks6GptZk9dvQXxYJrvm
 XRnzadal85GimGn2uMtVwPTH7ll+OUXac5ul4oW+xC2MhByU3w9lvVVIt9YQM8M28IzelK7Mg9B
 lGfdV8rULPq8geW40rQDpMmFw7
X-Received: by 2002:a17:902:c406:b0:2b7:a1ff:b239 with SMTP id
 d9443c01a7336-2bd7e847effmr72073495ad.14.1778897010743; 
 Fri, 15 May 2026 19:03:30 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c16ac4asm68201375ad.33.2026.05.15.19.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 19:03:29 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 19:03:15 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v7-6-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
In-Reply-To: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778897001; l=1783;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=nWb7/sMHsmR7wcuRO9jkLpb2TNzQaTQeWoiZsuAi+1g=;
 b=khVPVdQAxSRg7jSrI0T6vEEdHJcJL18rAM3H3XrsHlhKQQU6V+2n+qFkjKx8aDWZFXeRuGRVC
 OM/+bCqlSeRA7D8NdJnqFnq0vJBirD+aCOFJMruOvZmD/6kU3gFjxMl
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778897011; x=1779501811; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EFW50pkuXqujso0Nx9AKVd9iKpKG/7/+Gzj/k11d+tI=;
 b=JDjwiNXUuQu16YdmicNMedcogXjf/Afwkng/oH68eJFKzriGK9ZTDFQzAPQh621Z0z
 IZsIX1YD66Rm6042yKc5yxjTvwdwou4FowRrlj7jEHLUvf3Ah1SrCv2OTzmGg8dOAwYs
 fNoARhZkPbXwxjl8mE2qfVpClgrwqHd2WGUMZulz3KcH8TF+jBwT+XF0lopCExsnz/xp
 yO9eBdrWEGnWXsXsyDb7fLWOEXfiykN6AfbTXaCnyYn77/OMB0i5wRhgPKhIUfG3767g
 7IVAYdsNiQsZ/ojmfzWz4xxTqyApCPHFXnCIDsALePmHMYxBZ25cGpL8xx00UzXvOkD1
 S7TQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JDjwiNXU
Subject: [Buildroot] [PATCH v7 6/8] package/qemu: add OpenGL config
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

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 14 ++++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2a6aa288d3..d4e4e37a3e 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -112,6 +112,20 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # needs libepoxy w/ EGL or GL
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  Say 'y' to enable OpenGL accelerated display frontend support.
+	  This is necessary to efficiently display frames rendered in a
+	  guest on the host.
+
+	  Run qemu with `-display sdl,gl=on`
+
+comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2199db38cf..aff1762fb9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -272,6 +272,13 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
+QEMU_OPTS += --enable-opengl
+QEMU_DEPENDENCIES += libepoxy
+else
+QEMU_OPTS += --disable-opengl
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
@@ -329,7 +336,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
