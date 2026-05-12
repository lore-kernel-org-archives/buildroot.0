Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A944CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 630AC82542;
	Tue, 12 May 2026 19:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOCNnWnab0Cz; Tue, 12 May 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 837B582548
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614631;
	bh=HARVRawKkOEN8zTyaVP8XkG/7GLB9v2Oa5b4zp0mE4c=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAMt4t78jfzBPpGdDHpkm91vjpDlvvQpKZDfIEAjhfMjTGVF4hYS+r/D0eOSmYLF1
	 fWZ5yspSo0yNOtpUKrK9BDu3YLLxP1mItswBXSOAZykiIQ3FN3gou379q9ZW1tHGGa
	 Qta+Jz85ckvSJOJC79og3ELrP+fi1wqr6z1W4iWSLJxZVdttSJvsxB7R61uHsyW7PQ
	 t1Fjur81G0Vqehb1DtHoPR0wldjb1i5HkqQMtOvczB6oNQT70C0hemDZM3SSGPBiHK
	 6DM7O81Try6aQO8e64CHdFOI3T2gpLlfKKz5JNFMCumRu0zCS21Ko3VxO3RVn8RuBX
	 mjhCB3zeI3YsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837B582548;
	Tue, 12 May 2026 19:37:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EF34219
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90867406C9
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eK_7dSQ3fgQd for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B18304008E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B18304008E
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B18304008E
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:04 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-82fbdd60b64so4436824b3a.3
 for <buildroot@buildroot.org>; Tue, 12 May 2026 12:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778614624; x=1779219424;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wGwrJYHIjKeEFQ7ClYlDryEU06kxrhu72SbguFIpXe8=;
 b=R5yZSXhbNEm32gLbyyPIhCX1Kfg31H91I+NWqP6vHxxcbsfVqdGDPFfExB8I0QQtSJ
 WpL7gMX3jDuBElBT/5QySC0EuhAiVuosAmr6FKPHbLFu+Dlt2sKcTJrd9RwpA1gqQ1O0
 3acA/3+3yc1Z5LmOVCTzjm2PT9f3YEQuVsGvNXu6nH2BQ6Qa8968zhlJyANjwelct8F0
 FF88cIRG2qp68ApHBS/3p9CgYpiU8mDUU02mDUgs/smGmYBEnl/zxHATS41DmAnyzbVi
 hUZv8CRtZMLlh+aiUPBEKLiP5MPccT40b90w1A7OKd/92BTB0wBZdPV2E+aS52mIZs3W
 SbBw==
X-Gm-Message-State: AOJu0Yx0m2QUWBqZDbm4FTw8nlXwIWcEBy2USaSSucH4+szUC5j3MT6F
 ldqFr38p7AGwaRYeln0GXdv15x5kILfvdKWKQwnSL2jbuussbogqc09B
X-Gm-Gg: Acq92OGcbDKATpxh7gm55U8oCk1dCd9NZztVOwsvuS+DU2Y5AQpQxvl+KA08u9oDXiV
 PhTI2mE7KO0iAy27NlnUMpwPBEXQf5LnbcIX20CxukDm+ahctMeHcv5KIkRjQqE7ha8XU/WcBXY
 EQDxuAkaD0GaL/NtbbS/7iZEGLNccnsJoyWJNi6RRtVfH5LY9EmuqWl3eXNS/OVZ5v+kI47zie+
 H2G9kvynSCQMt+w9ACMJMA79SgU08mqdLZa55B693Oc0U24x+yH2ZQb9X8X/LYBPba/lJQL8uDT
 AeS4ZfmyCjTW+lW40E8uGPqqd6azFtJSdG0JnddMZ0vMxpPyFLLk6u2dSCiEGaxEPbU4TPg0GdL
 OQ/kvB/z2KgFE8JL9OITfH32nVW96sD8g86Z6W+RIlOQkJ+bXKYhg3s0fFvAGPiWLulMKgB9bwJ
 gbIpKrlvZ4i5U1vr1AVBgsSrGi
X-Received: by 2002:a05:6a00:39a0:b0:82c:dfea:9e2c with SMTP id
 d2e1a72fcca58-83f03e88370mr78236b3a.9.1778614623764; 
 Tue, 12 May 2026 12:37:03 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839679c8634sm28932799b3a.39.2026.05.12.12.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 12:37:03 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 12 May 2026 12:36:34 -0700
MIME-Version: 1.0
Message-Id: <20260512-virglrenderer-v5-5-1806e588eb59@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
In-Reply-To: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778614619; l=1963;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=tre6l5SJ+Xxb+Ad2xJZWWMItuMqN46/ezTkuCtUtths=;
 b=nsnjvGJi/T4+vLQCULohcmFYcTgnTtIFFyqzCz2rSb/7QfmrQCjkOMOHiQ/IVVxF9w7TJOB8i
 hkGwnLoW6d0A1ifMdwKTx6F9yBZqSrKcEgOqCgXmyw3j+VRGYW4igDr
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778614624; x=1779219424; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wGwrJYHIjKeEFQ7ClYlDryEU06kxrhu72SbguFIpXe8=;
 b=XEZBQaTH0J+UtWzDyF3XfBP5yNFL3q72IlsNsOuC9M9d77aoxe/Z42g9dU2om1u6D3
 x4NdZpuRWamFnHJRo68k4xOAy/xBkLlKHXiIa2LYmLsmrIe5NuKrgcS4+uh00HKexnjj
 gs6B1LleOyuXsN9bb9sn9qZdyGwNnlLSUwbYtwtQ5RArWYVMfmXtBMuuM4wRMbgm3udU
 S6iWj0e+eq6ChhZK1kXgk3HeHb+lYQMR60qbfFraVSEy3TMogJDzkTs46/eR5gIEdwzb
 QJchs7MnGz/o6g9T36D0khwVaB4RVIervNMICYrx8yfHhosEr5wFiwnf+VrcBk9l7agt
 8Mjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XEZBQaTH
Subject: [Buildroot] [PATCH RESEND v5 5/5] package/qemu: add virglrenderer
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

Add optional virglrenderer support, along with enabling OpenGL when
necessary.

https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 17 +++++++++++++++++
 package/qemu/qemu.mk   |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e4e8eb3b63..599bcb11bb 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -130,6 +130,23 @@ config BR2_PACKAGE_QEMU_OPENGL
 comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
 	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
 
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_QEMU_OPENGL
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable virglrenderer, enabling GL and Vulkan
+	  passthrough from the host to the guest through virtio-gpu.
+	  This enables the guest to have accelerated GL and/or Vulkan.
+
+	  Run qemu with `-device virtio-gpu-gl`
+
+	  https://qemu.readthedocs.io/en/v10.0.3/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
+comment "virglrenderer needs OpenGL accelerated display frontend support"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9b780797fa..e250128dfa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -281,6 +281,13 @@ else
 QEMU_OPTS += --disable-opengl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VIRGLRENDERER),y)
+QEMU_OPTS += --enable-virglrenderer
+QEMU_DEPENDENCIES += virglrenderer
+else
+QEMU_OPTS += --disable-virglrenderer
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
