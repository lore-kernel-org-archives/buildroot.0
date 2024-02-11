Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA59C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 16:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 382A68215D;
	Sun, 11 Feb 2024 16:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnub5UQzDtqO; Sun, 11 Feb 2024 16:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F95D82165
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F95D82165;
	Sun, 11 Feb 2024 16:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C27FE1BF33F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 16:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B00E46085E
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 16:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXi_zEFWBEaq for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 16:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 290266085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 290266085A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 290266085A
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:12:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-410d097784aso1498245e9.2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 08:12:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707667942; x=1708272742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4/0wBDc2x6Mr/Bz7zTjI78dTMVI2zz22q//XRtxEg2g=;
 b=VSq4VhNjJpCIB0GT1I4Kd+5l1hUiFtZ95jBki9+9cTKyWlGUl2ZBicZ4XbzEWjCl1H
 YYTgBKuHYEjM3qB933jPVA0Uj0il8O+v0izTRMs/k+c5OaHGdDyU4JUdTfQ3xyxGaj8I
 XBCfHVgGzfDZV/h8r1CMlL3jZTBotXAExrMlZPH4vI9ChlUTEKUnkmnBQnLMYM3DUHL5
 Hnj5XcnBXGzOgR00ol60n7QHGxKK1PMw+2aKtuKy5MINn8CnVVv7guA8/FPDn4nkIbl1
 SzWDqf9fKB7gXY1cQhQmyjz04Lur6xD7/o583K/aOBRfJRw3Ox2DUYV9ZQLm1ExK64LL
 OVTQ==
X-Gm-Message-State: AOJu0Yy9woW1io8D/P/EOVfNEKUaePW9g46h/zT1kLOwpivrx9XgAqbh
 s7mqYDnFCC5Jl+VM8SmZjFBHiSik8VSYxPtSi68Ip7rG4w+rj0f0mgwP03QZjYc=
X-Google-Smtp-Source: AGHT+IE9B3qE9AEahH/n3bL9jwH8zvfkJb0WPL0xVJKfmx7E2QZDW5g4igptjCkt9uZ0/DTmEA2mZA==
X-Received: by 2002:a5d:4850:0:b0:33a:fcc2:d850 with SMTP id
 n16-20020a5d4850000000b0033afcc2d850mr2677734wrs.36.1707667942486; 
 Sun, 11 Feb 2024 08:12:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bv15-20020a0560001f0f00b0033b48190e5esm4563320wrb.67.2024.02.11.08.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 08:12:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 17:12:19 +0100
Message-ID: <20240211161219.453635-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707667942; x=1708272742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4/0wBDc2x6Mr/Bz7zTjI78dTMVI2zz22q//XRtxEg2g=;
 b=EsxYtn8vuLGNvUMMzZq3vjntRzvVyd3HgIDQ8bn364OJgiJqobZdkpp5Wj4FGEgfTy
 hiHR90VVl49rdNmvdpUixoD7jvQiualjY0EH9ZVrtknBidwC8U4jy2KTBLYrWRB24eRC
 rKKGgAZgmvv+/6KeC38kYb6fC9TPAc6Kqk+q3+aAUdvezq1HujcAeD2C//HqA65Rpptw
 iwop7TEWA6TW9t9aJSKA+Z8LlvEANs6JT55apAIEyV/lc4i49U7SOMaIKZH7Wm1cACVW
 rX7Tkt0HthpVF7VxA4yzST4GpAl3zvYdVJhcxofqKWefPGZxbyuACMB3XqR7PGCntiDT
 gl7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EsxYtn8v
Subject: [Buildroot] [PATCH 1/1] package/libdnet: replace
 PKG_PYTHON_DISTUTILS_ENV
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV as libdnet
uses setuptools instead of distutils since version 1.16.2 and
https://github.com/ofalk/libdnet/commit/4e4fc687953105b66bcc847a68869126ac3ec918

This will avoid the following build failure raised since commit
09de823cbc7bd50a40e25f4166b4e42be94b0c7b:

In file included from /home/fabrice/buildroot/output/per-package/libdnet/host/include/python3.12/Python.h:38,
                 from ./dnet.c:40:
/home/fabrice/buildroot/output/per-package/libdnet/host/include/python3.12/pyport.h:586:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  586 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdnet/libdnet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index fc2995979d..e678565bdf 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -19,7 +19,7 @@ LIBDNET_DEPENDENCIES = host-pkgconf
 ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
 LIBDNET_DEPENDENCIES += libbsd host-python-cython python3
 LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
-LIBDNET_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
+LIBDNET_MAKE_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
 LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
