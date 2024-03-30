Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E2BC47DD9
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 09:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5690040B71;
	Sat, 30 Mar 2024 09:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-lRp33OnVSu; Sat, 30 Mar 2024 09:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D01F940BDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D01F940BDE;
	Sat, 30 Mar 2024 09:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA451BF41B
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67F00605F8
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICNYfgkpoWNs for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 09:03:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 543866082C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 543866082C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 543866082C
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:03:44 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41553f150b9so7600735e9.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 02:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711789421; x=1712394221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jgSWRQ+g2moBfiEYp4r0+4mGoY4M9XobzGATtGra+NE=;
 b=WgJg9Idk6O1yl7yHzeko2WrQhzn1aH5kO64jk8NqeAgHSn5j8wveLUypdg1twuUpkD
 K9TOIWurWOmVI3+nWlBvwjPDaxmBtuzkZ2TW5OFdN9SDZsc/ArjmM+b6YUIeRpIJ+i4z
 1fBlamYkxPrAyoYG3yPBpvd1Vpfk12+kJUT+3wQnyJV28BWZbd3xrlTaaKOvpgClqNF+
 sRcHIGpGlsQ2f1kFdtDBcEOn/9wR5cQ+5RJn1Fe075A322gYK80JQ1Cv2B0DpkayIXc0
 Kg483sftVVNlfrZ8iz9ZYwgnGHu75di8fDMt3M43CjFIfUjKX7sfl3BWCtJGkkOz7JOS
 UcZQ==
X-Gm-Message-State: AOJu0Yy8yLLsAczBGLS5cvnUEffFZL9BlBhg9AR2fnUVFzdUPKtolUjy
 VQTgeRgTrp4jmKxvNL9tMWBK37JzftxFb3ImKsxUpt/zvRPQJvPW3w6ObsqC
X-Google-Smtp-Source: AGHT+IF2A1Z6uPPqeAgfim8vtM0MD6Wx+4kuYnvO9KnLTOJXwB4/wwd8roEzZ80vUFNFarghXFRGcw==
X-Received: by 2002:a05:600c:4f86:b0:414:8e02:e441 with SMTP id
 n6-20020a05600c4f8600b004148e02e441mr3608767wmq.13.1711789421498; 
 Sat, 30 Mar 2024 02:03:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004148d7b889asm10978316wmf.8.2024.03.30.02.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 02:03:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 10:03:35 +0100
Message-ID: <20240330090336.567660-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330090336.567660-1-fontaine.fabrice@gmail.com>
References: <20240330090336.567660-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711789421; x=1712394221; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgSWRQ+g2moBfiEYp4r0+4mGoY4M9XobzGATtGra+NE=;
 b=dGyWuWB/5QXoMHOz7+oeSt46kxR/QLEUN7R+yPgEyqQY/3pu4PqslFrZI4G+YK7FQl
 Ca8i1KS/RjdxWs5ia9TMapyJhlKzj1pPYkuRzHVcLP7tLH1/HGajz1DofBWbe6FvMJfW
 ZFuJ+AHjzd82T6ka30x16lhyBKNBx9qj7nZ3IQNw/Qme2G1X4HSRwPYvd/qmpojD3nxm
 R1mwbZB07ea9Ev32F3mfq8fTeq30prfkgt17ISts7msNx2J0KekEfF62JbaOZ8DgUr8i
 ceI9L8TuhOHUqFE+wUWKVYqVzRi3RJz9VE8cGGHaQEnuGG/cVnbpbded15skgcWWxVrH
 tf6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dGyWuWB/
Subject: [Buildroot] [PATCH v2,
 2/3] package/php-xdebug: add zlib optional dependency
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

zlib is an optional dependency (enabled by default) since bump to
version 3.2.0 in commit 8280400fbadde09e51ccff312d7a4ef6a386f589 and
https://github.com/xdebug/xdebug/commit/3954e5cd9e48eec0a8a2a0c6a2fc120bbe562656

Fixes: 8280400fbadde09e51ccff312d7a4ef6a386f589

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-xdebug/php-xdebug.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 62ef3fa997..3bc197e556 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -25,4 +25,11 @@ endef
 
 PHP_XDEBUG_PRE_CONFIGURE_HOOKS += PHP_XDEBUG_PHPIZE
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+PHP_XDEBUG_CONF_OPTS += --with-xdebug-compression
+PHP_XDEBUG_DEPENDENCIES += zlib
+else
+PHP_XDEBUG_CONF_OPTS += --without-xdebug-compression
+endif
+
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
