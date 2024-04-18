Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7811C4345F
	for <buildroot@archiver.kernel.org>; Thu, 18 Apr 2024 10:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D4D6415BC;
	Thu, 18 Apr 2024 10:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kJ9ns6Ok8qi; Thu, 18 Apr 2024 10:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F8254158F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F8254158F;
	Thu, 18 Apr 2024 10:15:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 602831BF3F4
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 10:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5998940190
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 10:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrBJqji6PrX4 for <buildroot@lists.busybox.net>;
 Thu, 18 Apr 2024 10:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 674F8401C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 674F8401C8
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 674F8401C8
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 10:15:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-418dde387a3so4962295e9.0
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 03:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713435332; x=1714040132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUgEr67ucwrddETML/V4MFVrG+at0hrtgoh31zw+1RQ=;
 b=Bw7O7VI0SN8b8GHAGReGxvQWWG4Bj1hjypWNU33PIv7LkbzAiwtxxd4OXM6D0TdEWg
 YE4rWUK09gP0unaVhy2bko29Yrm6ButS/g7VfB++TFjAKShJqpbOLrmHAQYxHnITC1It
 LuYiLQ6wAjdbzUoX2q0o1ADLsWlama1/xKC9p8EYcy5EiF7H6svH7TLSfuKrbe7bReik
 gajKV9R79j1hxT5wNaZ0xdGCRhTTIOY2Ollw7UyAzPV4UHT6rw5WDUnX+GMN+JiqC0+K
 kxGHwuF1UnE5gvWFJ2uurB/VbmyBWjIJT9FAWe8H5sxV/HDd+VxU2ZVfhuiRfRzNN4gh
 Ib7g==
X-Gm-Message-State: AOJu0YzZpRh9ncDleeJQzTpRLKPhY7wdeVUg1kTgM0N+YVF5s3AqqPu2
 ec/WkCALXNMUBQ8BhJA8e6X5hfn0k+jn5OPLWShjqtrRN1GSbHHRReikKBsbqH0LaGK9KeS4g1w
 8
X-Google-Smtp-Source: AGHT+IHCwF+/jHPsfiL9yXY2V/knyfQcnROVxRTiuiD52ufHOhbjIkW5wCQQj6i/ehiExL5vGXtHOw==
X-Received: by 2002:a05:600c:3554:b0:418:d626:30e4 with SMTP id
 i20-20020a05600c355400b00418d62630e4mr1842451wmq.3.1713435332261; 
 Thu, 18 Apr 2024 03:15:32 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a05600001cb00b0034a21842accsm739320wrx.86.2024.04.18.03.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 03:15:32 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 18 Apr 2024 12:15:29 +0200
Message-ID: <20240418101529.124290-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713435332; x=1714040132;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FUgEr67ucwrddETML/V4MFVrG+at0hrtgoh31zw+1RQ=;
 b=3E8TeJ8tfYQ7cPqQEnNDn+tR26br/eDRuWPu0Cj2etjbc75IrVOPhRakTvaVKRga99
 MmzB3YwZF3k+7uUwbfejQluMauz3FNovWGZQPARjEi4/B7Xbur/LICXO1/p51MQaezV3
 7Gxb9cMIAC27bmMKSWLH135dDsl5SY7j3ly3g9gp2pnwUulMBJYDEUPTJSSTfK2+kvoA
 Ce/mtvLb5vOYMpqCZ2SQvxpJwoXtGcmWHGPTJLTj/H0U8P+Ag09XpVvGJaDjnHFHNCtS
 EgP98Rax+t9lCRFaPxSV/MCw5nKzfzI1Ho31dQJey5VO8NdacqLmMdvUX60/6TqjAwqI
 3pxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=3E8TeJ8t
Subject: [Buildroot] [PATCH] package/openssh: add libxcrypt optional
 dependency for sshd
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing sshd's libcrypt dependency this broke
the sshd password authentification at runtime using glibc version 2.39.

  # sshpass -p testpwd ssh -oStrictHostKeyChecking=no localhost /bin/true
  Permission denied, please try again.

Without libcrypt, OpenSSH >= 6.2 fall back to using openssl's DES_crypt
function on platorms that don't have a native crypt() function [1].

Note that DES_crypt is deprecated since openssl 3.0 [2] [3].

"Use of the low level DES functions has been informally discouraged for a
 long time. We now formally deprecate them.

 Applications should instead use the EVP APIs, e.g. EVP_EncryptInit_ex,
 EVP_EncryptUpdate, EVP_EncryptFinal_ex, and the equivalently named decrypt
 functions."

Also DES_crypt is provided by openssl only if
BR2_PACKAGE_LIBOPENSSL_ENABLE_DES is enabled. Otherwise crypt() is
never defined:

  sd-compat.a(xcrypt.o): in function `xcrypt':
  xcrypt.c:(.text+0x48): undefined reference to `crypt'

It's not clear why the password authentification fail with openssl's
DES_crypt but since it's deprecated we use libxcrypt to provide
a working crypt() function for glibc based toolchains.

[1] https://github.com/openssh/openssh-portable/blob/V_9_7/openbsd-compat/xcrypt.c#L57
[2] https://github.com/openssl/openssl/commit/c6fec81b88131d08c1022504ccf6effa95497afb
[3] https://www.openssl.org/docs/man3.2/man3/DES_crypt.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402147

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/openssh/Config.in  | 1 +
 package/openssh/openssh.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 08d3c7d391..25843447a7 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_OPENSSH_CLIENT
 config BR2_PACKAGE_OPENSSH_SERVER
 	bool "server"
 	default y
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Server programs: sshd, sftp-server
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f0b499590a..d7f4db59ca 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -45,6 +45,11 @@ endif
 
 OPENSSH_DEPENDENCIES = host-pkgconf zlib openssl
 
+# crypt() in libcrypt only required for sshd.
+ifeq ($(BR2_PACKAGE_OPENSSH_SERVER)$(BR2_PACKAGE_LIBXCRYPT),yy)
+OPENSSH_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 OPENSSH_DEPENDENCIES += cryptodev-linux
 OPENSSH_CONF_OPTS += --with-ssl-engine
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
