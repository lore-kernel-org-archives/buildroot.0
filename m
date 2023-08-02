Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107FCC00528
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 11:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9207F611F2;
	Wed,  2 Aug 2023 11:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9207F611F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnPldtmkSBBX; Wed,  2 Aug 2023 11:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A155B61160;
	Wed,  2 Aug 2023 11:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A155B61160
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E90A1BF343
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08DCC41B80
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08DCC41B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhcUZDMhGqo2 for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 11:15:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0C7341966
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 11:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C7341966
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso6158218f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 04:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690974910; x=1691579710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6w0fxDEcWIeHAicHhvjaBCR6qjjAVJ6HMiJEHAWrYM=;
 b=YlpbRKh0yXa2TN4hOphmUhLdFzesdzLADte/cVO2u7qF3kSNm6ht5mbCm26C1rsyQI
 7AtSplIe2xlZRuzo8XgALwY5oHRm06GONxmTqZ5ucICaah2F9CPMxGkweMrhRSc9TJER
 l6wPLciQgQ1U9g4MJbW4O5iFqhzL0tXH56UH8YAwLLLVW+ulnOiIh9+ukieZsCte55t7
 PyLeiMED56PpY+V+zKVtuKvs5DS3fd9yDJ3TSAaMrBPOr4hKJnf5C9iiMEFco/mDfE2A
 P2VSav0VKtUY2yyxrKjqmaD52rqH2GXN5UfQ/0e2+LXjUHtzzX3u06jKhRF86UMVyC5G
 2pVw==
X-Gm-Message-State: ABy/qLYxCrZ1aQn5YNYraaj5JAxdV9dn/Ol9sD7aykvvfoSBxz+JlT+n
 M94OY3C7TDQj+7HCd9O9IGtTxNdRP/3myCRiHk0=
X-Google-Smtp-Source: APBJJlGhaZDOfGcBIYOEXheaOeVcyHBwXC3zkNSvTcpOyM0niA8cwq+gNIse7KCFut9LWSvh19uUcA==
X-Received: by 2002:a05:6000:1046:b0:317:5c8c:3f17 with SMTP id
 c6-20020a056000104600b003175c8c3f17mr4035971wrx.66.1690974910563; 
 Wed, 02 Aug 2023 04:15:10 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056000104400b003143b14848dsm18653128wrx.102.2023.08.02.04.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 04:15:10 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 13:14:45 +0200
Message-Id: <20230802111447.41714-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802111447.41714-1-thomas@devoogdt.com>
References: <20230516082155.22014-1-thomas@devoogdt.com>
 <20230802111447.41714-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 2/4] package/webkitgtk: use the CMAKE_NINJA
 flag
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Replaces:

commit 16e5c92ff5fd2b44a1126bd7d7538c68ce838213
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Thu Feb 9 18:07:05 2023 +0100

    package/webkitgtk: Build with ninja

    Webkitgtk needs cmake >= 3.20 when building with the make backend since
    webkitgtk 3.8.0.

    Cmake 3.20 is above our minimal version in
    support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
    with cmake >= 3.18 < 3.20 - So use the ninja backend instead.

    https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v5: no change
v6: rebase
---
 package/webkitgtk/webkitgtk.mk | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 56277a0a0a..aa1c11f7cd 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -13,6 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
+WEBKITGTK_CMAKE_NINJA = YES
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
@@ -140,23 +141,4 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
-# webkitgtk needs cmake >= 3.20 when not building with ninja, which is
-# above our minimal version in
-# support/dependencies/check-host-cmake.mk, so use the ninja backend:
-# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
-WEBKITGTK_CONF_OPTS += -GNinja
-WEBKITGTK_DEPENDENCIES += host-ninja
-
-define WEBKITGTK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
-endef
-
-define WEBKITGTK_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
-endef
-
-define WEBKITGTK_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
