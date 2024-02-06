Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D913C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA9A82531;
	Tue,  6 Feb 2024 19:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEv1qT7TZ6XT; Tue,  6 Feb 2024 19:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 261758254D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 261758254D;
	Tue,  6 Feb 2024 19:47:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 581021BF409
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5227D8254D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wKOeltdvmqc for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BF3982531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF3982531
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BF3982531
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:47:36 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40ff940b456so3824815e9.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 11:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707248853; x=1707853653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zEiFMYoiZf0zWyvTwj6j6hOGp13aK4igXvsKy3rmdiA=;
 b=ustGIUg58xs5Fyw67Awu2CulTYiSMjsOIpYyWtgPJi3yJQop4Jq4r3fd+roOmpHPLG
 6MZDwcpQYoju+EQ22Jt232/FhuquoC/vz3msnV6LJGuef5Uy+4/b20KtMi/vnF5EeN7L
 dcZh25oY5RsB5+ukS8H729kOv50E7Ga6gCu7Ns6i720U4gTEVHZgNZ2H3sqZT/SqAcrg
 g6uPRYZYO48sybZCGI4KAVPzzCMxLTcrp5elGk0O6lTjzUrLP9nBzi9SRNvIcvrAUwPz
 4kO1DIxTCNniyiVayiNYnuGS1vAMOSi13bwgLOSvg9kFWipX2/XfJfJdJjFpdUCrIg8e
 Vx5w==
X-Gm-Message-State: AOJu0Yz4RCcxBl33O5aAha6z/hsCt2mifxiyP8/zXrSJ2vGALachcwnI
 sJhi9ZtixbZRDdnaCK4OcCLC62W4F1hvs5UAzWGmrg3WlaNeZzug1onQCrgrWGI=
X-Google-Smtp-Source: AGHT+IHIU0C5/pkEyb4prr88RPB4jTjeZ1Da5e8HXIeLvR/tim81X796v0R61wxngiZymAtPd9hpgA==
X-Received: by 2002:a05:6000:1147:b0:33b:4b0a:b513 with SMTP id
 d7-20020a056000114700b0033b4b0ab513mr863306wrx.6.1707248853336; 
 Tue, 06 Feb 2024 11:47:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j24-20020adfb318000000b0033b4acb999dsm956512wrd.98.2024.02.06.11.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 11:47:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 20:47:10 +0100
Message-ID: <20240206194710.394671-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707248853; x=1707853653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zEiFMYoiZf0zWyvTwj6j6hOGp13aK4igXvsKy3rmdiA=;
 b=OOV0Gy8YLlNNJVQuARM34u1MlN3sx2+OHQF1q1kKvJcH9uMiR9QTefqqLvO7CECEJ/
 deAREDICCArajv994RaEA0ITSlPxuyMjIHmiyrtTMk41oW2lrhFQ+GjUnsDWluS4OMC4
 s/4VB+4k+BeZdlsNmQkf9xfFwtUuSSjomiXIoDPu+3wGP/ulKibsnWmdU6Vb8fT71eY1
 0lEditgJUVjokNiw7dSBhB3FNGSzr8aoeg08F6WFFz3DyBJf61IG6z7YRR/i1VGtjHT+
 5cAyfzR2oAn5SDuVRJ+TQnC+7OnOWk0449DcFyNoYjhYV5mRkPqvlai7B7RsIlLtJDg2
 EdHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OOV0Gy8Y
Subject: [Buildroot] [PATCH 1/1] package/libp11: drop libressl support
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

libressl dropped engine support since version 3.8.1 resulting in the
following build failure since bump of libressl to version 3.8.2 in
commit 21eca49ed5110872407b76ab9337d2877c4cda24:

eng_front.c: In function 'IMPLEMENT_DYNAMIC_CHECK_FN':
eng_front.c:262:1: error: expected declaration specifiers before 'IMPLEMENT_DYNAMIC_BIND_FN'
  262 | IMPLEMENT_DYNAMIC_BIND_FN(bind_fn)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/389ed112f082a4917f777f3e236211059c4c6d6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libp11/Config.in | 1 +
 package/libp11/libp11.mk | 8 +-------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libp11/Config.in b/package/libp11/Config.in
index ef1e5b4703..3c7ccdee27 100644
--- a/package/libp11/Config.in
+++ b/package/libp11/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBP11
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  OpenSSL engine for PKCS#11 modules. Part of the OpenSC
 	  project.
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 7718573ace..cd4ed34297 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -11,16 +11,10 @@ LIBP11_INSTALL_STAGING = YES
 LIBP11_LICENSE = LGPL-2.1+
 LIBP11_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-LIBP11_ENGINESDIR = enginesdir
-else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
-LIBP11_ENGINESDIR = libdir
-endif
-
 # pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
 # so let's rip it out.
 LIBP11_CONF_OPTS = \
-	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable $(LIBP11_ENGINESDIR) libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
+	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
