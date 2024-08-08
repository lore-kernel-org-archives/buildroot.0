Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A654C52D6F
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF8A640BA3;
	Thu,  8 Aug 2024 14:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDoa6IZ9XpBw; Thu,  8 Aug 2024 14:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27EF640C4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27EF640C4B;
	Thu,  8 Aug 2024 14:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF66E1BF294
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8C784017A
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEo1eYmiFfcg for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 14:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63D5840118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63D5840118
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63D5840118
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 14:17:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5bb477e3a6dso999104a12.0
 for <buildroot@buildroot.org>; Thu, 08 Aug 2024 07:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723126672; x=1723731472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPiRNvGe95nHduHALhRo/pyqSKskEPpONjAIzJIJckE=;
 b=U61zL/2HX6w7tTc7ak8hxphgx9ldl/iXr2ZoxOV1OQNUHILjkUjNXxMQuPiLW7AmlR
 39v3sM8TNtm+VurQMLtde/dGBaDDQLhzEgKDtPqt3gXV04wpJGufQ/0EOSwXKM3nIMcQ
 dym2ClJpgSRv9IHA3IeVWXL05BebUMdReZHhcOyazAIVYlW8izrb4VAk4ZwiKfCxporc
 PiBSh9Zx1bCnI5aDy/SvjXVT/rd1VHtWuGO2VcJKfpKdaO0JBJoCj1lBeOZVKBZoV/fU
 hkYNjo+Tp9bLJ8P5IPYm84VXEBEnVy/ln5RlWMuVe72cRpAYhtw61Yfm/suhTsUTfqMe
 cdUA==
X-Gm-Message-State: AOJu0Yzz4ylXB4MkiwVnO2sra+JEBupWPfpfvvRDlQqCaj/D04KWfXE0
 L2GbUScAqcCcLenBWqyljs923AOYcdyCF10H9kegLV8suYMhUs/9+Xng5EagO6gvvrBGRtlSZOy
 a+dXJ6cOi
X-Google-Smtp-Source: AGHT+IGmwbSnMVr0FN3CQW5Pf3DOhO0v/fhG9wIcek0X8gkjbgP84nTkkJMfzGsg51BwSugYRTHffg==
X-Received: by 2002:a05:6402:13d1:b0:5b9:3846:8bae with SMTP id
 4fb4d7f45d1cf-5bbb2231165mr2059081a12.15.1723126671996; 
 Thu, 08 Aug 2024 07:17:51 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2a02:a477:a7d9:1:3678:e036:10d9:128d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d34a74sm701780a12.69.2024.08.08.07.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 07:17:51 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 16:17:46 +0200
Message-ID: <20240808141747.1770035-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
References: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1723126672; x=1723731472;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPiRNvGe95nHduHALhRo/pyqSKskEPpONjAIzJIJckE=;
 b=CK79YlATcwA63I25rGfI1GnXSmuSk2KDkPR3HiiLuc0Jcei4MsIxN94xd0WzEmM0Pw
 ZTvexIcfZGgUnvPom6+PYz0wfsyn6PpsGzq/la9jXHTQ53O3UA6/+WkN0dix5dp1aFgM
 07lv+AriJlVNoKAZn02mAtCLiDUs3g0+5R/pY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CK79YlAT
Subject: [Buildroot] [PATCH 4/5] package/flutter-pi: bump version to
 37bd9773c1938e5f76208bc4e8632fdbbb4190ff
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 135a0deb32..6a73524745 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a7ce5c8d960735923f6897dd9852b89c8010a01b9a29f4f6bbbf7c016dac623c  flutter-pi-783db32ec6441b878783bfa241777d3bfe6b35e2-git4.tar.gz
+sha256  c3c7df5712cd7c45539b325b0d8d58d0942b08a6f66c55e3f53aa5225cbe86af  flutter-pi-37bd9773c1938e5f76208bc4e8632fdbbb4190ff-git4.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index ee54a2bf4e..fad1da3215 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = 783db32ec6441b878783bfa241777d3bfe6b35e2
+FLUTTER_PI_VERSION = 37bd9773c1938e5f76208bc4e8632fdbbb4190ff
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
@@ -33,7 +33,8 @@ FLUTTER_PI_CONF_OPTS = \
 	-DTRY_ENABLE_VULKAN=OFF \
 	-DVULKAN_DEBUG="OFF" \
 	-DUSE_LEGACY_KMS=OFF \
-	-DWARN_MISSING_FIELD_INITIALIZERS=OFF
+	-DWARN_MISSING_FIELD_INITIALIZERS=OFF \
+	-DBUILD_SENTRY_PLUGIN=OFF
 
 ifeq ($(BR2_ENABLE_LTO),y)
 FLUTTER_PI_CONF_OPTS += -DLTO=ON
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
