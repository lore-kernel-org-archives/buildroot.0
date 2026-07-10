Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF16C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A26606A8;
	Fri, 10 Jul 2026 13:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFnbVebHYEQn; Fri, 10 Jul 2026 13:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B095460693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690353;
	bh=PA/UzCb2PxnqttnL/xtTXcDC6z5Xjvby0IdL6CUEqxI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hqZL3xOdlehmytA79tgbjVB4AsEHPK3nTf0i41UU9SKHz2sHzh5ND00AQcxD5BVQl
	 2X4YCfYnSbx/CBPFqtA/J8u3yQ8HLgyinI+LQMtBq/sPlX63nhqVZp6XZbBMTuOis3
	 Nk0V/aXScoP1B3tNS4WrlUbk/gQi01GvnGei/PSxlRD+Idic8WJLqcyDDzUGn66hJy
	 aZ3EUYHT/4gspa9gog0658zqxhq7JlG5IRS5tHQF0l21bxHTho9VId8h3u9bxlJRhp
	 NUWNyyBGLnVj3SxjP+m0EyRf5pGg58v6CVhT3oosao2phXS5bwUNfYccarxMJrzvpb
	 BU3rGB/GjrK8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B095460693;
	Fri, 10 Jul 2026 13:32:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82EA7A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6133760693
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O84GRjGao9uq for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABB876068C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABB876068C
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABB876068C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:32:30 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-51bf2479349so5787761cf.2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783690349; x=1784295149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rWjyh5iBuxfwTV5rlGkWRFwMwKwO5ef6yqW5Dvzt7FQ=;
 b=PuouEXtA6GjiJjuuWT5jLxzLu2cTD8S3tO7IT7rWOLKaU8jAxoQJ2s/2MA3PK0lQ5N
 T/csyRmWEtelI8dj96TpB/KTyrhvXS4FQpfPCn9AQnOK+VaE0XRJBX5hpS5JnnauRw/z
 HGjfgu66mfMZWCpWVCgDwAHCS5z1ZFEEcGlVjvI3oACANcBirPcqSmhYHCTQJFn86CS0
 lusXhGcKTtalqFc4VWQwUcBWK/1ap5i9sfl4CVPu6yGJM+wNpuXXPZOqdm1DDGNtRkc6
 O+Tt5QS5lXntyqDCpiuLmcb54uywmOKuvIMN5w2flJMJiwP3daXhr+Fu34eaolqC5Hw8
 Edgw==
X-Gm-Message-State: AOJu0YyqaygWoAKxm27VcLTQQM4YvTPLbXNqbzjY7DkAVn2wh6ZjaTPe
 0fLNE9L4PlbtTuS8cG3guWfQ7a09gvwZ61IFY6jWiu/LJVrXZWkVn3vZbcLrBg==
X-Gm-Gg: AfdE7cliPqZzsL+NCWVexDYWow+X8LoqIMFb6s8a/ltrl20s1rR5T0vQA3uU52MpXJ3
 uW4LzsSxqO0M26Dq55psBMjlChEQ5vXlwFQAfPqDAizH+/i9SGx4WnOPTFX9dGe3KcUpsqIvqPA
 9blja7PH2NOj/WgszH98PfNMMpTyF/7GzTjMqmJgQLUQj1Kulp22WKmaleV4JX789VuYUiE6BpF
 QDLOFlORmipU8RGJgft/ozmQu4i7/4C3GwtZ6FpjbGj65MQN5FYJ2oKab8d1sMSeCK/FThZ2VgD
 fZ+atgLViLNAaP2salcesEMyjb4CxNka5f1BupOmVVdR0W9RITlP+9TkJK8O9nrdDGnIuaKxMPZ
 Pf9Rmlp1kodQh6tPjV88eloQum3zu2anMigMijwqVds5Vo1QyMeGRvS7JSmgjvvckonnFilBupB
 H0WhDeEMwo+mCavIqYE56dbyXvK4KzcpL0EIKLorbZ6Kj72lvripOWPP3eplL7IaQOqQ==
X-Received: by 2002:ac8:5f89:0:b0:51c:8fb:fa54 with SMTP id
 d75a77b69052e-51c8b4d5a86mr119915001cf.57.1783690348978; 
 Fri, 10 Jul 2026 06:32:28 -0700 (PDT)
Received: from aford-System-Version.lan (c-73-94-212-116.hsd1.mn.comcast.net.
 [73.94.212.116]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51cba49439dsm1656951cf.27.2026.07.10.06.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:32:28 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Adam Ford <aford173@gmail.com>
Date: Fri, 10 Jul 2026 08:32:25 -0500
Message-ID: <20260710133225.484041-1-aford173@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783690349; x=1784295149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rWjyh5iBuxfwTV5rlGkWRFwMwKwO5ef6yqW5Dvzt7FQ=;
 b=lCqASA8FMO2EC4xC+iLxxQO9XzMiTxM0nff+sYAmC5PzjF+R1zdkKh+CfAEC9Aea0n
 z69RWJbIwUb6DL8rbi+FjCDW/lAVDoXtqUCr8ASkNkHjqAxWiGav/oK6lwzn8DM5Q4DZ
 daORUuzbuXjXDCyt6uUGcHF2ViYhoNuI+BLbWCr9qmvv6+7Dh7cLMwMgtLJcVdpc1syq
 YoqiLFS6I93cPa2A3xF4YzFyNtP3vRwKKz6A97N+nTx7tmEWxwkg3oD1EnH+80UoizNf
 MjrtysPFQGWAe6JRE+JNRJp4vTC2UMCJ0zpIIwaHVD4OF8wNvFoluJwZNlaa6Tt9F4FA
 9J1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lCqASA8F
Subject: [Buildroot] [PATCH] package/mesa3d: add intel-virtio host native
 context config
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

Add BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL in the same
pattern as amdgpu-virtio. When enabled, -Dintel-virtio-experimental=true
defines HAVE_INTEL_VIRTIO so the guest-side Intel native context
(i915 and xe context types) is compiled in. This is the guest half
of the Intel vDRM GPU passthrough path, usable by the crocus/iris
(OpenGL) and ANV (Vulkan) drivers.

Note that this is an experimental Mesa feature (the upstream meson
option is named intel-virtio-experimental) and is disabled by default.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e184039150..ad02b5e829 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -130,6 +130,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 	bool "Gallium crocus driver"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	help
 	  Mesa driver for gen4-7 Intel GPUs.
 
@@ -167,6 +168,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
@@ -393,6 +395,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
@@ -459,6 +462,22 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
 	  Select this when running Mesa inside a virtual machine
 	  with virtio-gpu host native context support.
 
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL
+	bool "intel-virtio"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS || \
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
+	help
+	  Enable VirtIO support for Intel native contexts
+	  used by the crocus/iris (OpenGL) and ANV (Vulkan)
+	  drivers.
+
+	  This is an experimental Mesa feature and is disabled
+	  by default.
+
+	  Select this when running Mesa inside a virtual machine
+	  with virtio-gpu host native context support.
+
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	bool
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8e6c2ee5b8..87377b7ce4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -164,6 +164,12 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL),y)
+MESA3D_CONF_OPTS += -Dintel-virtio-experimental=true
+else
+MESA3D_CONF_OPTS += -Dintel-virtio-experimental=false
+endif
+
 ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO),)
 MESA3D_FREEDRENO_KMDS = msm
 ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
