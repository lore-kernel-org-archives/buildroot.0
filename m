Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF6CCD1288
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 21:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81EE640765;
	Thu,  4 Apr 2024 21:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eQOJpj6Q7br; Thu,  4 Apr 2024 21:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 194FA4079E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 194FA4079E;
	Thu,  4 Apr 2024 21:18:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CDF41BF361
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 21:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578F940195
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 21:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S34Nad5JdtB for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 21:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B41E40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B41E40136
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B41E40136
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 21:18:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3437efea11eso1060745f8f.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 14:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712265503; x=1712870303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0saf0SGJWJ/KCSPoWo3zGpPX/7j+dUcGCadHB0LsK60=;
 b=Rs/TXj2BsThMBR1cTLXgcUKicpqDJNZgxClTbTdsjYKUdz8AIdqihDcjYOaH/vnKf0
 EWXf6iq8xFdRGUh51GCXZXcPXGlMLohxWNnTPHfmmHmXDEsjPDTtuiFDTOQcvIaPLQ+6
 8Hs0HxKaJsLwuE2V2hMdxa9SrF/AS2WlbKC/LkcHwUhFtzIsKXj+kVJv4TSuUhYlFXBV
 Nzksf5P7Sru2eSBkl3ReVWbgoud9jIGtN2LJRdLDUZS3wCxD5DZzsnhNHhGYUDkFlQLw
 7IPBOJOvO2IQfe2VkGUq+fA0JHD16TNS1ueDVbshn1Dyu6mZWJKGY62Vg6GMU5VEBJOb
 y5Kg==
X-Gm-Message-State: AOJu0Yya9o/aK2NHIZtqhBwE4jbbbbregXduSolMig41Fr/wYwoEjRiI
 +yq2HKS+vXbcvfc21bPdI/0uCODUB/kXh/cOZ/Fd8sPp8rc2tkOyklwzMAIH
X-Google-Smtp-Source: AGHT+IFoaAvMSOB0TWbHl9UXg/qi+DplHtd3qLc6BwHo8YGiwi3YspKYns5lWmGZN79H2tSAnysZ5w==
X-Received: by 2002:a5d:4b4e:0:b0:343:bccb:af46 with SMTP id
 w14-20020a5d4b4e000000b00343bccbaf46mr2513668wrs.60.1712265503203; 
 Thu, 04 Apr 2024 14:18:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v4-20020adfa1c4000000b00343d75a316esm304170wrv.77.2024.04.04.14.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 14:18:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 23:18:21 +0200
Message-ID: <20240404211821.1985923-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712265503; x=1712870303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0saf0SGJWJ/KCSPoWo3zGpPX/7j+dUcGCadHB0LsK60=;
 b=gZQ430Exe23sBTPz5up4/ZuldxIBkqgsQH24Mxdkv01Wqqs+++RBPGl782/ISOaf6O
 5b0Cf9AL1QwmsXEpxoCAOb7p1djnIH6ZauBYfAoXqeuAGxi2KD3HpL3iWvMitsoJXD1h
 pD0lG3lH4Y9UrKUZZyWENgvYRhCcf06on8PXd0diEpr0ywP7FaP8sER8LfIO2wbATju/
 b4abMwy07PkussQQlmaysfSZ/n2i7jlnaUSxKEuPQAnD0eI4bgkUVMX+loe6rYLU49sb
 8uZQEwWWdKJZmVoGRAPWrO7WZaHy7BAFkf5/LClp6W1N7rA82U7jujViItRsmprZqX1e
 Q2yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gZQ430Ex
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: add libxcrypt optional
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/mips-buildroot-linux-gnu/11.4.0/../../../../mips-buildroot-linux-gnu/bin/ld: CMakeFiles/hiawatha.dir/src/httpauth.c.o: in function `basic_http_authentication':
/home/autobuild/autobuild/instance-13/output-1/build/hiawatha-11.2/src/httpauth.c:334:(.text+0x614): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/8054bd47edf613a12b09a9958f78abd5f355f17b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/Config.in   | 1 +
 package/hiawatha/hiawatha.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 4b1a3ca86c..0c35734c34 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_HIAWATHA
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_ZLIB
 	help
 	  Hiawatha is a webserver for Unix and has been built with
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 2ba8efb2fe..3e9cf2571b 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -47,6 +47,10 @@ else
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+HIAWATHA_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXSLT),y)
 HIAWATHA_CONF_OPTS += -DENABLE_XSLT=ON
 HIAWATHA_DEPENDENCIES += libxslt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
