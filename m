Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3609EC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1EAF4053E;
	Tue,  9 Aug 2022 07:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1EAF4053E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGpYpm0ZYpmE; Tue,  9 Aug 2022 07:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB6514053C;
	Tue,  9 Aug 2022 07:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6514053C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1451BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA24B40533
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA24B40533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lx22WhB6a2m2 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED6E24052C
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED6E24052C
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a7so20833089ejp.2
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DiLdWz6LjpzPep2V4eZgo55ggMCaGadeY29r1gUEnvU=;
 b=LOPnXcRsnqOq5anQBajBoUiUC/drNiqKdYGFE2nJTRzMZJUbQekAPPBIl4j4cEF0JR
 TLHtixFFvPunyE5Nicy0Ca2XHKTL2SwCEa9zl5aIZVBR+pE6Nl6CTaOQaKi27PEAfdj+
 d58CkQUhUP+SI4SNQjNms/q5Iw+4JazWT4S5hS0UgTjnTLobUFsRdtBTn4jb4sJuQSQf
 WbuNXmQZPhrey9+4c33RW7ktwEsd4Zv97xu0RRdUaz949sydrpmUpD5wbeCPV9/BbsnE
 u9hci5fb70gzAgwntyHBggMDZF3sqOeC+yINXTX+xchK4BYq2I5ITXtKHNRlawcR2guI
 fblA==
X-Gm-Message-State: ACgBeo2A7t0cKLXsYIFMGH6Oostce7ANbeNtpLBlWAKOz3yPNi3CyMke
 ev76sJqPxRTvsqGItGMoMD1dEc4MzB4=
X-Google-Smtp-Source: AA6agR7lkJ89mbux4u3/qzefJsBKhQZoKCP+8oYPg93TN9EQKiuG+J/LEGiK8dPXbQTznuVpUOXTlQ==
X-Received: by 2002:a17:906:98d4:b0:730:b545:fb5d with SMTP id
 zd20-20020a17090698d400b00730b545fb5dmr15644682ejb.532.1660031845767; 
 Tue, 09 Aug 2022 00:57:25 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:25 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:56 +0300
Message-Id: <20220809075704.86472-6-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=DiLdWz6LjpzPep2V4eZgo55ggMCaGadeY29r1gUEnvU=;
 b=pyq/tBFf8+T8b5123wDmzpEgPAZ3f5QZ7opcfK1M4KjPw1U2nWslaYGnujOfvnkJrz
 4LqzwL1Wr9fwUKOctLcOOy1siDlppPHjKhSn7aBoZHzzbAz4gELO5KHiwIeVNtXBObD4
 jSNKuqenOmt3tDhYzY24xF1L4AxGUpy0+ZH/TfCGqkpJB6Nkl7VSQLIq2/iZhuaRZOSF
 UzQ2MQIdCnCG1p1/3NxqqeoNbfCFuS6XAaMwpJDmsLRND28OhCDmEe3hDzWxFdq39uCD
 HyqSBZ+tXMdfuZt66TD9DhdIhwqOxNNA/ybwfem/2FtPugBpjixdQMbQUDTTGvCvcGj6
 DJ9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pyq/tBFf
Subject: [Buildroot] [PATCH 05/13] package/nodejs: add host-{c-ares, libuv,
 nghttp2} to deps
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required for the host-tools when cross-building.
The nodejs target-build requires some host tool support to be able to
properly build.

Unfortunately, when building a 32-bit target on a 64-bit host, uses
will need to install on the host the 32-bit bi-arch libs for
'libicu libc-ares libuv1 libnghttp2 zlib1g', but that seems that is also
the case (already) for some other packages that select symbols
BR2_HOSTARCH_NEEDS_IA32_LIBS & BR2_HOSTARCH_NEEDS_IA32_COMPILER.

So, we'll need to do the same later.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nodejs/Config.in      | 3 +++
 package/nodejs/Config.in.host | 3 +++
 package/nodejs/nodejs.mk      | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 016aeb4e1a..fad211b750 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -28,6 +28,9 @@ config BR2_PACKAGE_NODEJS
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_HOST_NODEJS
+	select BR2_PACKAGE_HOST_C_ARES
+	select BR2_PACKAGE_HOST_LIBUV
+	select BR2_PACKAGE_HOST_NGHTTP2
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index d023ffc36d..328c8872d3 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -2,6 +2,9 @@ config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HOST_C_ARES
+	select BR2_PACKAGE_HOST_LIBUV
+	select BR2_PACKAGE_HOST_NGHTTPS2
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a8229eb4b1..d15c027c70 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -9,6 +9,9 @@ NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
 	host-nodejs \
+	host-c-ares \
+	host-libuv \
+	host-nghttp2 \
 	host-ninja \
 	host-pkgconf \
 	host-python3 \
@@ -18,6 +21,9 @@ NODEJS_DEPENDENCIES = \
 	zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = \
+	host-c-ares \
+	host-libuv \
+	host-nghttp2 \
 	host-icu \
 	host-libopenssl \
 	host-ninja \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
