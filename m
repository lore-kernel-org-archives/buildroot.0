Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2440C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB5C160FD9;
	Sat, 13 Jul 2024 09:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07QmFuoSLxzG; Sat, 13 Jul 2024 09:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C3E2610FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C3E2610FA;
	Sat, 13 Jul 2024 09:37:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C42DF1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD6A540230
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG_AHMS4CIXh for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EE4C40190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EE4C40190
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EE4C40190
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:37:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266f3e0df8so18380255e9.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863448; x=1721468248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGovj6c/sZN6Zhf2gJ0B/vCIWAtxRVhO8KxeKx6HuVc=;
 b=kkbEkQmLAyRSw+CI1umjAenxiMiPmSPFdVBklKVXqTfQ2BZqwYn8grK3MUcY8fgqVi
 cLyApV9kDz1TpFH9m/0/Bu0CsMvgDrXoilU/6EDtgrdITOsQ7sY83aPbgzMF+jQeXRpC
 m2IJOwFAZoboTiSvSohWuiNishq/D5RBgsSMLE9Hq3Ku7qxI99mQ+ljeCO5T69xTM8kO
 VBvtNanRf0ocTnkfyYUohwpa9qXmzlu5oYwM4SgVBS3sQKi5eRONXugNIqitl1HuxiSl
 sqIml51Hn2jQoUmvgu0KQlOd3CtwGKWHWYmRK232nAmE3X9BwDj9LJX0KPc4cEgCcm3E
 9VTA==
X-Gm-Message-State: AOJu0YzDrO6MHAVK7wovd9h5PfSujATdrPIbLXCKZB76yh5zZBOc7Vem
 7VnI8D+clSnALPI0jLhXdNxfTkpQyQ56oPNJXTXpjkWXXjITc8zZJP3uQOK3lI59NBlMskmS1r0
 d
X-Google-Smtp-Source: AGHT+IE6/vrlqyFYvFnivBYQJ0CRpyDWEGOhbpLd6pTNdi02qvkV3twfTflvwaD2cBG2h7McrkVh8Q==
X-Received: by 2002:a05:600c:6b04:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-426707d7da9mr82701675e9.9.1720863447933; 
 Sat, 13 Jul 2024 02:37:27 -0700 (PDT)
Received: from antco-7390.home
 (2a01cb08994fdf00389d87faa24d1c32.ipv6.abo.wanadoo.fr.
 [2a01:cb08:994f:df00:389d:87fa:a24d:1c32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25abf0sm49065935e9.14.2024.07.13.02.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 02:37:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:36:58 +0200
Message-Id: <20240713093700.13981-6-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713093700.13981-1-antoine.coutant@smile.fr>
References: <20240713093700.13981-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863448; x=1721468248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGovj6c/sZN6Zhf2gJ0B/vCIWAtxRVhO8KxeKx6HuVc=;
 b=BEKFyXDz5DqJFPfe8hvAWR26uGpMTojC6mhtjYFER7GbvCcKlAsyNmt007IYzjx5w1
 hqYu+FdrmX/KWlt2wyAcxGYamo6AYAgI2dDHS05Iy3fbj+2acnAt8EYIZQH4VCjAIn19
 Ojq6TpmaLc2SUIwJA9rKpKbhJ7szsjcNsLr+o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=BEKFyXDz
Subject: [Buildroot] [PATCH 5/7] package/llvm-project: add opencl-c-base.h
 on target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Antoine Coutant via buildroot <buildroot@buildroot.org>
Reply-To: Antoine Coutant <antoine.coutant@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rusticl depends on the mesa clc_compile_to_llvm_module function.
This function requires opencl-c-base.h when LLVM version >= 15.

The header is deleted automatically by CLANG_FILES_TO_REMOVE
post install target hook in llvm-project/clang package.
When rusticl is enabled, after the whole clang directory has
been removed, the header is copied back to
/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include/

By default, the mesa3d variable used to retrieve Clang headear's
is set to the staging directory on the host machine. A merge
request on mesa's gitlab solved this problem. See:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568

The patches have been backported to mesa 23.3.4.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/llvm-project/clang/clang.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 0bafd6461b..09aac7f0ec 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -90,6 +90,15 @@ define HOST_CLANG_INSTALL_CLANG_TBLGEN
 endef
 HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
 
+# Rusticl needs opencl-c-base.h to be present on the target.
+define CLANG_OPENCL_C_BASE_HEADER_TO_TARGET
+	mkdir -p $(TARGET_DIR)/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include
+	$(INSTALL) -D -m 0644 $(@D)/lib/Headers/opencl-c-base.h $(TARGET_DIR)/usr/lib/clang/$(LLVM_PROJECT_VERSION)/include/opencl-c-base.h
+endef
+ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
+CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_OPENCL_C_BASE_HEADER_TO_TARGET
+endif
+
 # This option must be enabled to link libclang dynamically against libLLVM.so
 HOST_CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
 CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
