Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758FCCD6E5E
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C79E60F8B;
	Sun, 31 May 2026 15:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3FZdW2NFcM5; Sun, 31 May 2026 15:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BFF614F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241795;
	bh=BV06qhGMNEICopqlgfGbF6E0rTpXJky/1mT2QIorjgs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=OsWkzjwFkPYM8yFD7cLRA/zp3zr1t6s5j0Wn9szIwo4nUJobG2CLA/cl6khRfarqX
	 hcBVF9gt8qxghubIkGxvPyb9GAxmVJ8nbSN4vFZjJtYhYEnyNhta/k29nD2NoLWRxv
	 tB+1S3vFLyW5EZVKf0Ecvu2LrbccS8pHY9vSA7Al9BgV6DvIu4dcKiXrFNnjnzxMlR
	 NlPpu27Dl0anZ87BN3tfo+DvBchpYWsV6Gv2TihrrEIxYOmmbojiaUrR6VMbJ0p3Lm
	 Qy/gEI3B+h7BeUsRzTVhjynl78IEX8FQAVNd9WOTPadwheu+1sEh3rrlt3p0ZjWBPa
	 8ej08HClbVpOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94BFF614F5;
	Sun, 31 May 2026 15:36:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1340E257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6E784077F
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmIqrRsd0GC5 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE65A40714
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE65A40714
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE65A40714
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so81920705e9.2
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241785; x=1780846585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yuxva58POnvOKCxXv7pHvWm9eLgSzQ26B/6GXpLQPjw=;
 b=XDDL1ucRbjDIDPLqUeuBg8cbqfSVuWLEFXwfdDg72cJzqMs7nsSceDwX3M8D6ZpXw1
 2Dhg2Dkw7eIhEN4RWpO15UY40WZNcJlgEZnO2ziban7ASlW7wAComEnmpjRDBSS5Zh4a
 UMbc64FzjWEVM77Qy6rxSEmLPGZjsuWute2am3jPJKPRVIXYOqCHS6NbWrVyvxlfVpC6
 lODwNAN4ribMh7x5E1uj203AujuGwlK4G4R7ugFOwVWYnWw2cdSA6t6W4TlTUtUbsOKM
 6acWy3xqQCP5N1FnHVKi+zwSdnEi/jSCLFgMgdguPIfD47LvzF40DxhlPm3W16fPBSaU
 s4+A==
X-Gm-Message-State: AOJu0YxWx19r6+Z9+bYJ5vusmS3XqHH2Ill/ICn8gdTFrigeYwEI6MrX
 6wNZ+2V4D70nxIGRbaxmtFho+zP6h/t5LVZmmu3UzPm7Y0O1JYONRwMaXF7h/rgFiq2wpAl/Xx9
 AxFMt+Vg=
X-Gm-Gg: Acq92OHTqbkXEhOOqrm8Tjar44ddUGQe4/3b3qe5jlUYNGpxwEEgq1snHOdHo6O401Q
 pHG2d1wvholUjCO9yj89Vk6nFsEl5CsWOIrtdp4RhdIpC/J/dlQ8Dg0Af0QM38IYel5wnC2uOjm
 0VsODhX0HAi/wJ7H8K5imphrTNVJeQEjbgv1OdNL/pO1waMTUzVpd+Z7sjn0oz1dmkuqJMai8AZ
 3EN2HvVVV9szwFWI/dvZJ2jlCbDq5leB5hQsoPZIkB6IoRy+AN2isYrI/qvaxXJUJOmFVju6Y98
 XeBnqpRwy0YmpRT6biptip2iLrYy5I0uL/KPPBgYCLeN0y5QZFgSwekyBtxbxkuUErHdMlI2g3u
 rsd3eUUq+CY5md32HJh7onSzm21zV4Tj0YgTiXDxThOcPBWTswHrlgEHo5TBBxGg9C22esjxtex
 AB9hFysAXscjViqK7pn/SFh99GqONfT0mR2RuaP/St4NHXzH0ovbH7S9hUw/++0+BW4cNEFEU1f
 i/yL/fzlav4HRCv1raQq9vXuQt2LTXk
X-Received: by 2002:a05:600c:828d:b0:490:507c:bdb1 with SMTP id
 5b1f17b1804b1-490a291cbbemr154571085e9.15.1780241785437; 
 Sun, 31 May 2026 08:36:25 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:51 +0200
Message-ID: <20260531153557.2375580-8-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531153557.2375580-1-titouan.christophe@mind.be>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241785; x=1780846585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuxva58POnvOKCxXv7pHvWm9eLgSzQ26B/6GXpLQPjw=;
 b=cY7HhhvBwePG5+Yq0c9LZFL/wEo9SrrWGRSkXKh/yRnGPE5NgzIxY0iOhulW16F+su
 rtP8s9OaqztdXjFXDHS6564zcgLaIj4tYXFaUXXzCLn+nkmEql/g91dKCmGIMGjXZiHT
 yaMvATkBEC3Z/6Iaib0r3FgFxkSkimvqAAmHDemcGc71pwOVmL9FtYpuDZr7HCUuF48f
 K+nr+t+kwGwMNJnro76yRXVjofTd+yeK6LJPJZ2f2MhT8qfAYEWij6Df75N1dss72G+y
 1hRYv7A5PELSpB7j5fHBXgAZlpLPIgx6P/obLLtzeez+GVDxLtTNMGqtG5OFvRAnzMvX
 hqwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cY7HhhvB
Subject: [Buildroot] [PATCH v4 7/9] package/openssl: move
 libopenssl/libressl/.br2-external.in.openssl source statements outside of
 the choice
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Seiderer <ps.report@gmx.net>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/libopenssl/Config.in:5:warning: choice value must have a prompt
  package/libopenssl/Config.in:7:warning: defaults for choice values not supported
  package/libopenssl/Config.in:15:warning: choice value must have a prompt
  package/libopenssl/Config.in:18:warning: defaults for choice values not supported
  package/libopenssl/Config.in:19:warning: defaults for choice values not supported
  package/libopenssl/Config.in:20:warning: defaults for choice values not supported
  package/libopenssl/Config.in:21:warning: defaults for choice values not supported
  package/libopenssl/Config.in:22:warning: defaults for choice values not supported
  package/libopenssl/Config.in:23:warning: defaults for choice values not supported
  package/libopenssl/Config.in:24:warning: defaults for choice values not supported
  package/libopenssl/Config.in:25:warning: defaults for choice values not supported
  package/libopenssl/Config.in:26:warning: defaults for choice values not supported
  package/libopenssl/Config.in:27:warning: defaults for choice values not supported
  package/libopenssl/Config.in:28:warning: defaults for choice values not supported
  package/libopenssl/Config.in:32:warning: defaults for choice values not supported
  package/libopenssl/Config.in:33:warning: defaults for choice values not supported
  package/libopenssl/Config.in:34:warning: defaults for choice values not supported
  package/libopenssl/Config.in:50:warning: defaults for choice values not supported
  package/libopenssl/Config.in:54:warning: defaults for choice values not supported
  package/libopenssl/Config.in:58:warning: defaults for choice values not supported
  package/libopenssl/Config.in:62:warning: defaults for choice values not supported
  package/libopenssl/Config.in:66:warning: defaults for choice values not supported
  package/libopenssl/Config.in:70:warning: defaults for choice values not supported
  package/libopenssl/Config.in:75:warning: defaults for choice values not supported
  package/libopenssl/Config.in:79:warning: defaults for choice values not supported
  package/libopenssl/Config.in:83:warning: defaults for choice values not supported
  package/libopenssl/Config.in:87:warning: defaults for choice values not supported
  package/libopenssl/Config.in:91:warning: defaults for choice values not supported
  package/libopenssl/Config.in:95:warning: defaults for choice values not supported
  package/libopenssl/Config.in:99:warning: defaults for choice values not supported
  package/libopenssl/Config.in:103:warning: defaults for choice values not supported
  package/libopenssl/Config.in:107:warning: defaults for choice values not supported
  package/libopenssl/Config.in:111:warning: defaults for choice values not supported
  package/libopenssl/Config.in:115:warning: defaults for choice values not supported
  package/libopenssl/Config.in:119:warning: defaults for choice values not supported
  package/libopenssl/Config.in:123:warning: defaults for choice values not supported
  package/libopenssl/Config.in:130:warning: defaults for choice values not supported
  package/libopenssl/Config.in:134:warning: defaults for choice values not supported
  package/openssl/Config.in:12:error: recursive dependency detected!
  package/openssl/Config.in:12:	choice <choice> contains symbol BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
  package/libopenssl/Config.in:5:	symbol BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC is part of choice BR2_PACKAGE_LIBOPENSSL
  package/openssl/Config.in:17:	symbol BR2_PACKAGE_LIBOPENSSL is part of choice <choice>
  For a resolution refer to Documentation/kbuild/kconfig-language.rst
  subsection "Kconfig recursive dependency limitations"

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libopenssl/Config.in |  4 ----
 package/libressl/Config.in   |  4 ----
 package/openssl/Config.in    | 19 ++++++++++++++-----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 03d3def802..a76def1470 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -1,5 +1,3 @@
-if BR2_PACKAGE_LIBOPENSSL
-
 # 4xx PowerPC cores seem to have trouble with openssl's ASM
 # optimizations
 config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
@@ -228,5 +226,3 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE
 	help
 	  Build with SSL Trace support. Disabling this option may
 	  provide a small reduction in libssl binary size.
-
-endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 600829cb9e..2146481faa 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -1,9 +1,5 @@
-if BR2_PACKAGE_LIBRESSL
-
 config BR2_PACKAGE_LIBRESSL_BIN
 	bool "openssl binary"
 	help
 	  Install the openssl binary to the target file system. This is
 	  a command line tool for doing various cryptographic stuff.
-
-endif
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index ca9d1a7e50..335e00d04a 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -39,8 +39,6 @@ config BR2_PACKAGE_LIBOPENSSL
 
 	  Note: Some helper scripts need perl.
 
-source "package/libopenssl/Config.in"
-
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
@@ -56,12 +54,23 @@ config BR2_PACKAGE_LIBRESSL
 
 	  http://www.libressl.org/
 
+config BR2_PACKAGE_OPENSSL_EXTERNAL
+        bool "from an external tree"
+        depends on "$(BR2_EXTERNAL)" != ""
+
+endchoice
+
+if BR2_PACKAGE_LIBOPENSSL
+source "package/libopenssl/Config.in"
+endif
+
+if BR2_PACKAGE_LIBRESSL
 source "package/libressl/Config.in"
+endif
 
-# openssl from br2-external trees, if any
+if BR2_PACKAGE_OPENSSL_EXTERNAL
 source "$(BASE_DIR)/.br2-external.in.openssl"
-
-endchoice
+endif
 
 config BR2_PACKAGE_HAS_OPENSSL
 	bool
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
