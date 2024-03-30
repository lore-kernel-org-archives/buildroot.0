Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA888C47DD9
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 08:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3874140B61;
	Sat, 30 Mar 2024 08:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlSj8FV94qf0; Sat, 30 Mar 2024 08:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3726F40B8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3726F40B8C;
	Sat, 30 Mar 2024 08:57:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 044001BF909
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 08:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5ABC60876
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 08:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2twAfMJu5EX for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 08:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D856660872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D856660872
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D856660872
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 08:57:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4155b41b735so793195e9.3
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 01:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711789065; x=1712393865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jgSWRQ+g2moBfiEYp4r0+4mGoY4M9XobzGATtGra+NE=;
 b=mHQoz7zJDPM1G2oSN4xgF/FmQJtwu5rNktGOXq7e/no4I071On7mMpXFHHixRdyNKQ
 CuwXMHAEOCmKB61glLrkW5ymDvBTy7zvwj+1yvjWHdRKlVyygGL0FGw0qE67260rby1h
 Ki/uEl6Ztc7K8K6pwtR4py4bgbA1diWKQm6VjFlDdbdKOhf0BxnpaDDMso6SxIQDFQHD
 QKG306q8igFBh9gpY01FShYjDFs+CIdPnITn9pGhyZb4Vd9EVOgWtipt4zKXYH9KQ4Oj
 nbAua7g0EHc3ZJ5QLx//jvkFrYVNJiUliNMWeG5ZUJWwYRSiGQ/IOyaHOORgFYZA3rwf
 9M6w==
X-Gm-Message-State: AOJu0Yx3p1qqjv9GRoreviQLWoMjChlOplrMdsH4bQDu2drroDDv8b/I
 pcvlUqU2vfkz3cK7e0gBwWusly5GAKPOzKhYo/NNW5q/d/87jlA3yLe51pRK
X-Google-Smtp-Source: AGHT+IFEpkEDgUwo6YkToqQVFclS3YX3x5ppVRcOeDOnmT8+dsm+6SgqDLpXBWJjgRVjLK0TsIkmDA==
X-Received: by 2002:a05:600c:a47:b0:414:cbd:1ee2 with SMTP id
 c7-20020a05600c0a4700b004140cbd1ee2mr3230422wmq.35.1711789064841; 
 Sat, 30 Mar 2024 01:57:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b00412e5f32591sm7847212wmb.28.2024.03.30.01.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 01:57:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 09:57:34 +0100
Message-ID: <20240330085735.564225-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330085735.564225-1-fontaine.fabrice@gmail.com>
References: <20240330085735.564225-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711789065; x=1712393865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgSWRQ+g2moBfiEYp4r0+4mGoY4M9XobzGATtGra+NE=;
 b=HOCcOoD+yzrs5FmaTBx7WQ6YHhz+heL1Sey5E/o+OicewK1SwrbFfQuotG3DQAk48E
 DbCZxoU6tuKdKiAPO54pPpLoiLzafBW3XUzaPDw5X1k7Mq+UgAvO0vU+XUmiKeT1OkUg
 yHPuFJtvQbeRyDoI6Rx71mgqbW38Uh/NJfmXdoyIJ1gPIo1xBMWWoqzi/v8jw7SknQEl
 aB/V3JNyUQnDLFVyZzlVUiQWMBJHSH1y531QWyfXtbSQ4FewZaJ2RE+9zous+Yg7Q8i+
 j9B3KXRvi7+xPeWgojmdOii+m8Itjl0heHBE87yje9nlkJLnaGTERjauRhapNS8F0/23
 nhSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HOCcOoD+
Subject: [Buildroot] [PATCH 2/3] package/php-xdebug: add zlib optional
 dependency
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
