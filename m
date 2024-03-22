Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4B9C47DD9
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 17:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB3C4184D;
	Fri, 22 Mar 2024 17:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyBdJF8wu_7t; Fri, 22 Mar 2024 17:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 719114180B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 719114180B;
	Fri, 22 Mar 2024 17:49:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B12811BF3B0
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 17:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E553827DE
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 17:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKE8RqYIHV1l for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 17:49:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 882FC8236A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882FC8236A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 882FC8236A
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 17:49:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-414787c73c7so9356955e9.0
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 10:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711129785; x=1711734585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8AeG1ctEZ31jNKnLJfhe2C5vEQ5Qbg7hX9F4tQQMdtU=;
 b=gAzHuoxNnN26hjcRm0ulkuh9l4YTJ26aaKXdGxy8ifn/sGU204GOQOGLW5lKRTBU4R
 ORcItJcK+F/60Y88njDXKNnwu9llQCUTzDqbF1KDRdKLv9DFetOHyqIDTTdtAb/VqFRq
 UvXH7IoJhTq8uXUEA2WLIIXU4tC7X1L9HtD8qGpnGv1HpXL9mnb+mdV0dqcG8x1Fpo1k
 +YlQ+O/6UGzflhV7S8UUmzM4ZqijmwCru3Nca8dsoUrMtCIQiD10DOA+HNI3lpWCiazZ
 1/jgkYikTQZMhwNL1KerMV5p+eUnXxr3NLaSThQdGfEfeBAFH4tz673WZNQF+b56Zkb2
 wHxQ==
X-Gm-Message-State: AOJu0YzG9qw+4mdXGg9JGfnuNcW1356PUAWKvknIuHYa6thpEc9SWTDl
 h1QdDKZMZznIX4v3RX2Si0Hmf5U980sxS5UXQIuHoWVT09YIc0bMvM2O66zW
X-Google-Smtp-Source: AGHT+IES9PohfWl1nkVcZH0Bm6d49iNcGXQ4acsa0vCBE2zpatMB6uywfJCUo8nPu4lmulqhftXnSA==
X-Received: by 2002:a05:600c:1911:b0:414:1363:53a4 with SMTP id
 j17-20020a05600c191100b00414136353a4mr55298wmq.15.1711129784962; 
 Fri, 22 Mar 2024 10:49:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c339300b00414041032casm44723wmp.1.2024.03.22.10.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 10:49:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Mar 2024 18:49:41 +0100
Message-ID: <20240322174941.475669-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711129785; x=1711734585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8AeG1ctEZ31jNKnLJfhe2C5vEQ5Qbg7hX9F4tQQMdtU=;
 b=eqHBfuiPfGK+do9vQhnlRdFN0N6iJbMQcOHlbUP8HhdtTfp+hdAV9yLcSDw9PLYtA+
 ZQP3T0Bwe9g8S0sdRYlBf06VFlib+pgzUxSSeC4DQniZtRoEoh83+0rFpLAwSNNbejxL
 PPBXc4QAr01JhqA7+82TAvdkhTz7noc1hFbcKJuJbGU2/VixsBem4NncKesulDnTj41J
 ygQsNCWYoHwZ+OO+K+guvj66N/8rBB7kpYMUw3eDRyImFD+NOWJPyHeAxt4/c9KZ2lKf
 KBmMRxfjUurdA0TU2QWZSgtShBYGN9doj0Z40N8EGbjVqSYpk63M72f1tN2cqxbDS5hQ
 LlZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eqHBfuiP
Subject: [Buildroot] [PATCH 1/1] package/libdrm: disable tests
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable tests to avoid the following build failure with amdgpu and gcc 5
if cunit is built before libdrm:

In file included from ../tests/amdgpu/shader_test_util.c:10:0:
../tests/amdgpu/shader_code.h:113:2: error: initializer element is not constant
  ps_##_ps##_shader_patchinfo_code_size_gfx##_n, \
  ^

tests can be disabled since
https://gitlab.freedesktop.org/mesa/drm/-/commit/46d1e99a5d291b22d86ac52710b079491beedff8

Fixes:
 - http://autobuild.buildroot.org/results/612aad1fa642993da36bbec6c16c9020ac283e34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdrm/libdrm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 61d1c24377..a04331c2da 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,7 +17,8 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
-	-Dman-pages=disabled
+	-Dman-pages=disabled \
+	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
