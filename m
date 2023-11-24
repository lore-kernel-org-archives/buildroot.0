Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC99C61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 16:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24DF421E3;
	Fri, 24 Nov 2023 16:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D24DF421E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kmr2_bK_T2A; Fri, 24 Nov 2023 16:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B8B4220A;
	Fri, 24 Nov 2023 16:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B8B4220A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D90A01BF29A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFCE1421DB
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFCE1421DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_l2WJnTGnZl for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 16:16:18 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A483421D6
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 16:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A483421D6
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c87acba73bso27914151fa.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700842576; x=1701447376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j0wPMwIO0dF+fBtV8zXBPVlYQEfKyFkpe2wigT/CntU=;
 b=B+Ufat3Kie5U/dhwxQLE5ozia6Wxb9ksJXvHLARew5qI70cCevimsZXvAfw06C8+rv
 IbXbWYBkgb5HH9nyCsmOh9mlf3vaLlCQ4t2LYb6o98R085i518sO3STB7ihJ7aRIIwZg
 w2zRDHt0iQ3x0f8B1KLeXyG/HbP0YPIgzX0LmWBIoWTKcbSTblrRQEGO1b2Di+o3iZVD
 XFtAOZPU03EyFs0xURPLJ4goSGNdvvL2UQ1CL7E//WHKJ+VmF8IBb8HruIA/lfE/Z9vv
 MypF/SXe0u4kZMnvk+PppAkX9a9BEhCxDd+cFZT6EfNDoCEhT+A/CcTaL8EBPk0fdlfc
 mjqw==
X-Gm-Message-State: AOJu0YzKUT6aCOwY3Lm57bmn8W4z/pan384ow2m3DX76DJzWuVk9wrRu
 AAhwNetRfiTQff0Magp4N1oepJlR+vGLw8hu/GVDPg==
X-Google-Smtp-Source: AGHT+IH68OzES0mWXnEWcaSubE47L6rYAnhoY9aWJ1I52Tfb1PvLbTJDWgJM4EXVQ4zirENFhCDTlw==
X-Received: by 2002:a2e:9257:0:b0:2c5:b23:1314 with SMTP id
 v23-20020a2e9257000000b002c50b231314mr3047351ljg.41.1700842576129; 
 Fri, 24 Nov 2023 08:16:16 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 fm20-20020a05600c0c1400b0040b297fce5fsm6147325wmb.10.2023.11.24.08.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:16:15 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 17:15:23 +0100
Message-Id: <20231124161523.215078-8-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124161523.215078-1-antoine.coutant@smile.fr>
References: <20231124161523.215078-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700842576; x=1701447376;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j0wPMwIO0dF+fBtV8zXBPVlYQEfKyFkpe2wigT/CntU=;
 b=X1DuuawMOdfZww28OQLWmSpNvPyaLvlXL3w4+pCV6O0Vup/U02qP2t9Js1ttGRR06S
 lbIWtouCSyWl0XAX0n32zTmD4Q6x2nY+Q+7jHVQRnnfK6R6Fo0hcvXr/l7CumuCNZ68H
 UAguGzj1ZqRqTq7Mn/BztXf611aRe8wJl3nJ45jlUH3X6LlpM7KQVPDwL5tGTu7ooYTG
 9UTCXO2pJQ9+mcNdghx/SMjfp2RqGry2/CfXHxnWBxsjDTQgj2mkRCCbKkBdeCWxt9H5
 cNrD/DssUYN5cWv+skrh0UkKQoZkRKnTCpM9njPGwlKeS5ZOK4WpelD2a8R+ye4EOMBY
 Ed2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=X1DuuawM
Subject: [Buildroot] [[DO NOT MERGE] v3 7/7] package/llvm-project: add
 opencl-c-base.h on target
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 bernd@kuhls.net
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

By default, the mesa3d variable used to retrieve the header
is set to the staging directory on the host machine. Thus
this variable must be set to /usr/lib<suffix> when
cross-compiling:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568

This patch is the actual version discussed on Mesa's merge request.
It works with buildroot but most not be the final version.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Running an app that uses rusticl leads to an error.
Example:

RUSTICL_ENABLE=panfrost clpeak

Platform: rusticl
  Device: Mali-G52 (Panfrost)
    Driver version  : 23.2.1 (Linux ARM64)
    Compute units   : 2
    Clock frequency : 800 MHz
    Build Log: <built-in>:1:10: fatal error: 'opencl-c-base.h' file not found
Error executing LLVM compilation action.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/llvm-project/clang/clang.mk           |  9 ++++
 ...LIB_DIR-to-usr-lib-when-cross-compil.patch | 45 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 package/mesa3d/0005-clc-define-LLVM_LIB_DIR-to-usr-lib-when-cross-compil.patch

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
diff --git a/package/mesa3d/0005-clc-define-LLVM_LIB_DIR-to-usr-lib-when-cross-compil.patch b/package/mesa3d/0005-clc-define-LLVM_LIB_DIR-to-usr-lib-when-cross-compil.patch
new file mode 100644
index 0000000000..e03aa5ae01
--- /dev/null
+++ b/package/mesa3d/0005-clc-define-LLVM_LIB_DIR-to-usr-lib-when-cross-compil.patch
@@ -0,0 +1,45 @@
+From 25eb672ca85b3a5f85b4e7a68c582b686c61c63d Mon Sep 17 00:00:00 2001
+From: Antoine Coutant <antoine.coutant@smile.fr>
+Date: Thu, 5 Oct 2023 14:58:26 +0200
+Subject: [PATCH] clc: define LLVM_LIB_DIR to /usr/lib when cross-compiling
+
+LLVM_LIB_DIR is a variable used for runtime compilations.
+While cross compiling, LLVM_LIB_DIR must be defined
+at the path of the libclang.so library on the target.
+
+llvm_libdir is the absolute path of libclang.so on the host
+machine. By default, libclang.so should be installed to
+`/usr/lib` on the target.
+
+v2: Set llvm_libdir to `/usr/lib<suffix>` because it is possible to define
+a custom suffix when compiling clang.  The suffix is retrieved from
+llvm_libdir whose last term is "lib<suffix>".
+
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
+---
+ src/compiler/clc/meson.build | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
+index 3ac1f5fc15a..60860fd5f9c 100644
+--- a/src/compiler/clc/meson.build
++++ b/src/compiler/clc/meson.build
+@@ -27,7 +27,15 @@ files_libmesaclc = files(
+ )
+ 
+ _libmesaclc_c_args = []
++# While cross-compiling, llvm_libdir contains the absolute path to llvm libraries
++# installed in the staging directory. LLVM_LIB_DIR is used for runtime
++# compilation on target and shouldn't contain the host absolute path (llvm_libdir)
++# but the path where libclang.so should be installed (/usr/lib<suffix>).
++if meson.is_cross_build()
++_libmesaclc_cpp_args = ['-DLLVM_LIB_DIR="/usr/@0@"'.format(llvm_libdir.split('/')[-1])]
++else
+ _libmesaclc_cpp_args = ['-DLLVM_LIB_DIR="@0@"'.format(llvm_libdir)]
++endif
+ _libmesaclc_sources = []
+ 
+ if get_option('opencl-external-clang-headers') \
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
