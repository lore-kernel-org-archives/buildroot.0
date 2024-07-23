Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDACC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 18:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D2F440B2E;
	Tue, 23 Jul 2024 18:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFL1ii2AhikL; Tue, 23 Jul 2024 18:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC26D40464
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC26D40464;
	Tue, 23 Jul 2024 18:56:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06B6F1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 18:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3B4C80CC5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 18:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uhb0ffzJoKIG for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 18:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC13880CC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC13880CC1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC13880CC1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 18:55:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4267345e746so43838075e9.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 11:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721760956; x=1722365756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CfAR/ml49juoLtIT9N0AEJvg0ZBZK5zWsH4TGETvbNQ=;
 b=TxzuaGYbgPPvPJtWgFWmymE5ulI0SmiFZK8/FdlbHEdJlkqYoXfDOoFWnUhdz7ZGEH
 YlZjpw0cTKMRhgQwM17N+RuszpNp6JSwXK3yCVTh04F8oYy6GRNTd1Wgv7buw+R3kBaF
 vx366GwYxGyvrOhIelb9OSEdPC2UE58/FK0OHXnTLX227HQsmR8C+FSq5ug8X0HQIH5u
 LkDV0oR74jykkA7zviguDKWiG+yTgleFmbonlEI5+xTz67HFgRUwplKW89ZNBp2ZAFG/
 GUmAAxjk+x/RK143lilutneH5kwazM/DMAJn64kDABv7vuwqcWeElB+TlZexmrYIm77f
 SsOQ==
X-Gm-Message-State: AOJu0YwHU7KZW+6Z2yAL4RiReD1IwaxGSxOf0q6Q+Sd7PzfA8fH4FMRZ
 1cGdPZmxuzbuTdNnjjgVsB9CfItGSoNGnu3XO1mjSoQjBgURQuky6S2NfQ==
X-Google-Smtp-Source: AGHT+IEj69UMcYfr7O0BmowrBTkjzcBLXvRyensBDuaiKP3+CxN5ne8Vpp8iMJ475mri0apNsnCFzA==
X-Received: by 2002:a05:600c:4f96:b0:426:5b22:4d61 with SMTP id
 5b1f17b1804b1-427dc52547emr81991305e9.22.1721760955708; 
 Tue, 23 Jul 2024 11:55:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a9466bsm212374305e9.41.2024.07.23.11.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:55:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 20:55:53 +0200
Message-ID: <20240723185553.4619-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721760956; x=1722365756; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CfAR/ml49juoLtIT9N0AEJvg0ZBZK5zWsH4TGETvbNQ=;
 b=WrR+RZGv7sgpuEj3qWtl71fVQGsKqFSjruaW7FZ64M2Pfp6m/avkJlpj9nzw31A7af
 XuvZa43e8+qkvZUo5p8v+tFGumtBxyNCn9mkLxsPUTe82mP6tGdyVZPkEmB9CMEq1kqy
 pqs5Tjf4pc8fAXz+WXJhX509mjD/3yiB5xyNhq133zaeUDjDQGhQHR1YHRVsbFDCe20U
 KEztA5w6da19+MkYtOVRta8CZA+bFjmG6KtBb5UvwjR7GQ3WiYCzyz9EQCIE5hLFFN+v
 23x7Rs247BbEW/RTihZp+gml2MARYdKKMntPWQptjQt8yexy3aadDZJ0giXHtgniIQqe
 9JdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WrR+RZGv
Subject: [Buildroot] [PATCH 1/1] package/libdex: fix build without SSP
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without stack-protector raised since the
addition of the package in commit
70319b47f646f74f407ed3355baf5b581a10518a:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/libdex-1.a.p/dex-async-pair.c.o: in function `dex_async_pair_ready_callback':
dex-async-pair.c:(.text+0x118): undefined reference to `__stack_chk_guard'

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/f53768f654a9eddd95b583a366cd7386d9ddb285

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-add-stack-protector-option.patch     | 45 +++++++++++++++++++
 package/libdex/libdex.mk                      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 package/libdex/0001-add-stack-protector-option.patch

diff --git a/package/libdex/0001-add-stack-protector-option.patch b/package/libdex/0001-add-stack-protector-option.patch
new file mode 100644
index 0000000000..9021831a39
--- /dev/null
+++ b/package/libdex/0001-add-stack-protector-option.patch
@@ -0,0 +1,45 @@
+From 107efb2f1a014c4475e122677faddbe0dbef1000 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 23 Jul 2024 14:54:59 +0200
+Subject: [PATCH] add stack-protector option
+
+Allow the user to disable stack-protector as it is not supported by all
+toolchains
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/libdex/-/commit/a65d33aebbe43024a046b3f3cc4a1c6c533838d0
+---
+ meson.build       | 2 +-
+ meson_options.txt | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index d0ca81d..2f7aac2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -126,7 +126,7 @@ test_c_args = [
+   ['-Werror=format-security', '-Werror=format=2'],
+   '-FImsvc_recommended_pragmas.h',
+ ]
+-if get_option('buildtype') != 'plain'
++if get_option('buildtype') != 'plain' and get_option('stack-protector')
+   if host_machine.system() != 'windows'
+     test_c_args += '-fstack-protector-strong'
+   endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 519cd97..9e3364a 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -4,6 +4,9 @@ option('docs',
+ option('examples',
+        type: 'boolean', value: true,
+        description: 'Build example programs')
++option('stack-protector',
++       type: 'boolean', value: true,
++       description: 'Enable stack-protector')
+ option('vapi',
+        type: 'boolean', value: true,
+        description: 'Generate vapi data (requires vapigen)')
+-- 
+GitLab
+
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 530dfc2bab..7c652a0409 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -15,6 +15,7 @@ LIBDEX_DEPENDENCIES = libglib2
 LIBDEX_CONF_OPTS = \
 	-Ddocs=false \
 	-Dexamples=false \
+	-Dstack-protector=false \
 	-Dsysprof=false \
 	-Dtests=false \
 	-Dvapi=false \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
