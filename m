Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE76C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803CB4027A;
	Mon, 22 Jul 2024 08:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6i7_QxsJM4v2; Mon, 22 Jul 2024 08:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4372E4027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4372E4027D;
	Mon, 22 Jul 2024 08:57:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 581551BF291
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 416684027D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXvyNwet85IN for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D31674027A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D31674027A
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D31674027A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:57:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-368584f9e36so2073827f8f.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 01:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721638656; x=1722243456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSlVeKJauePDLdGvFkFiaVV1wlzqgE5EWmXOGWDZCMg=;
 b=Lsr8d4/kpQQriTfagYF/fQ9f7Nk61wbVrkYocsvp/b7XS3SlagN2AeBe0UXnTEj6O3
 7PB8hA6hiWWDNmGzegYxlQwJLyP2+WCcsr6tpCZ/yo4W4eW+AH9i7WtG7kd4JyqFRLRH
 O4JcmfgsnAI260OfWgA4jTGjTVane2vaAHfHgcvAIkVziwQQo1XeF7MY4xHpi5if/S6B
 TS4DKF2dLprwgjhJ8uGFkD1paCOzb0aFslPXE/AuGF4yqPF02WgzvImOzLWhfS6DgJ+8
 zSlrcX3DFRs3ejeFKM9+oXT3dMl5Ul6hPpVoD3aegA3gnidiMp0u1D2k8uaJQtu6HNrl
 HLxA==
X-Gm-Message-State: AOJu0YzOR2x3lqY1bV5KbFMVl0X1iOsaxutKgzQsze5Rbhw5rS1QbY9g
 UfzJOuaily9Z2LjnEcksM5GvCyE/8sAyynF5yKnuO6pSdcAFsAjYbldzSQ==
X-Google-Smtp-Source: AGHT+IH1vyDCEPT6dcDrzIF9WAbgln23VUD1wVYeQAs/HAHT8689rIhZVTKAPgg1l3BNWTYC558DtA==
X-Received: by 2002:a5d:55c5:0:b0:368:5e8:2c8e with SMTP id
 ffacd0b85a97d-369bb2aab3bmr4015541f8f.58.1721638655625; 
 Mon, 22 Jul 2024 01:57:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787cec6bsm7909896f8f.71.2024.07.22.01.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 01:57:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 10:57:32 +0200
Message-ID: <20240722085732.824727-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721638656; x=1722243456; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uSlVeKJauePDLdGvFkFiaVV1wlzqgE5EWmXOGWDZCMg=;
 b=RMB+OUbEiznX4lezpAj56zEN76QHnUcrwdVW9kTjrPaFjcz98GENOTv4U5T6rBYLp+
 qhwkmMltxJXsYfGFSDDgw9OD3RDkBWG4V0AoItY/1XH9x1+E51zlE1TynTjTokhtH3gS
 JYcFL4gSA1DdVrGJS7XQvLeRiuKvr2cQY2TA1PDqOEVhq5tml0O1kE22QvcKME/0WeLL
 tdEu1LGXq3U3IQYFcrfvB9YKo4U9gZrzO8RLzcmMiHnwDheZCu7ulcWT3KZUF3rLrWSv
 KD5mAoyHI2ekwddqz1VvL0dV7csjfVhgReT6m2KW/NexUejj0sre1CUvCjB8sK6xgK3j
 7Nmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RMB+OUbE
Subject: [Buildroot] [PATCH 1/1] package/erofs-utils: add libdeflate and
 zlib optional dependencies
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
Cc: Gao Xiang <hsiangkao@aol.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libdeflate and zlib are optional dependencies and zlib is enabled by
default since bump to version 1.7.1 in commit
f5f3d8ca007d46c1b4a351e53b619209b232b113 and
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=29b9e71401621d3417599067a75bd9b13154c6a7:

checking for zlib... no
configure: error: Package requirements (zlib) were not met:

Package 'zlib', required by 'virtual:world', not found

Fixes: f5f3d8ca007d46c1b4a351e53b619209b232b113
 - http://autobuild.buildroot.org/results/a56d5917b5a1e8c75368349f75ec425aeba1ff15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/erofs-utils/erofs-utils.mk | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index fbf7795583..f994ea9d07 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -42,8 +42,28 @@ else
 EROFS_UTILS_CONF_OPTS += --disable-fuse
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDEFLATE),y)
+EROFS_UTILS_DEPENDENCIES += libdeflate
+EROFS_UTILS_CONF_OPTS += --with-libdeflate
+else
+EROFS_UTILS_CONF_OPTS += --without-libdeflate
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+EROFS_UTILS_DEPENDENCIES += zlib
+EROFS_UTILS_CONF_OPTS += --with-zlib
+else
+EROFS_UTILS_CONF_OPTS += --without-zlib
+endif
+
 HOST_EROFS_UTILS_DEPENDENCIES = host-pkgconf host-util-linux host-lz4 host-xz
-HOST_EROFS_UTILS_CONF_OPTS += --enable-lz4 --enable-lzma --disable-fuse --without-selinux
+HOST_EROFS_UTILS_CONF_OPTS += \
+	--enable-lz4 \
+	--enable-lzma \
+	--disable-fuse \
+	--without-libdeflate \
+	--without-selinux \
+	--without-zlib
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
