Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF9AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 18:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C407418DD;
	Tue, 29 Mar 2022 18:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6IaYQC4xop9; Tue, 29 Mar 2022 18:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C481E418CB;
	Tue, 29 Mar 2022 18:51:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2896D1BF83C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2397A61018
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFsMdJ-garQU for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 18:51:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC19260ADB
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 18:51:09 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id o13so15560584pgc.12
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvZZqW0sdvEKtuu38Zxj4LDPdASCJeQM8T4yUK1mro8=;
 b=FdZpZX/oDn7eiIhWPm7BoaBQP3HM6riPqaEsedJjPC63kMrp0qIfmwVF2Vg7f+ZJdJ
 Ie3FVp2uN2RyOEEYjOXcqNob3xNX/OyLeujbwVheYzCvnQkPv+eu7duuw2SfyGv7AoZ7
 lZoAxhU3bF5M4MlWmqNXKTdQKn3p86Cl+LoY3IYxBaO/lXZOCyBWUu8K1nKVXsMaso3b
 DgflXDs46G3BSd3IY29p+kg2ECcqb9yWnbKTzmGP/eiJlgB3LTDC3B+7pRx9rzOMZ/4J
 X1H0IdpMa9XPhXS1flD8F7fKF0V6jZJdE86bUpHiCieGcoDz7vlCVCVPfT+tvsR/0bwZ
 mjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvZZqW0sdvEKtuu38Zxj4LDPdASCJeQM8T4yUK1mro8=;
 b=fnEm6iJclwG7HlTkPwo/3hFAHZaZLSDbuiA2BK5+e6S2PRF8Ka2lgz4YOXR4Rgu2WX
 qi8vlgp5AUwhlqNOmucPN7yW+FRxOft+MA5NDvfAqmV3O117c+tKs43tKv05JXKQ9Fc/
 JMSzgS1RRjALLScTw+jZpdgDBewu+ThY/7OE/m9gbJI0k8IyArhaUx1E/1gVQOthmKaJ
 svuZfZSnRiyp7hQbQUTHGwZKcRHZVTN60oSnhaPONAtgT5Xpc79eeEUtx7P4ibA0n/R1
 W/MT+KaDkUQyWmCO6ZqN8KbT+Pq+PsHF6X6WsuPjJHnUPoRNSDjAabACa54XvETZ2l35
 tG6w==
X-Gm-Message-State: AOAM530z+s2GUswdY0nmRh07ISDDTI9Vo4AGGYD9ZaAEZL2H9DTzR3B+
 xX5SSagD9Jsqw5dX7F8+LNomsBIRTYIkIQ==
X-Google-Smtp-Source: ABdhPJzg/Z45u7ljfjmesd0eiMzMXS5yzpqCe9JCZuJoxTdVDmwpulnoCYO9kN+s/0u+PFO3N5G0tg==
X-Received: by 2002:a63:d917:0:b0:372:aede:b9d2 with SMTP id
 r23-20020a63d917000000b00372aedeb9d2mr2961181pgg.449.1648579868687; 
 Tue, 29 Mar 2022 11:51:08 -0700 (PDT)
Received: from mac-mini.. ([2806:1000:8003:5c6c::13])
 by smtp.googlemail.com with ESMTPSA id
 y12-20020a17090a784c00b001c6bdafc995sm4836774pjl.3.2022.03.29.11.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 11:51:08 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 18:50:56 +0000
Message-Id: <20220329185059.943889-1-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/pkg-cmake: allow overriding
 toolchain
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
Cc: Alsey Miller <alseycmiller@gmail.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/pkg-cmake.mk | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 3b1db35fb6..9b36ee2b47 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -57,7 +57,7 @@ $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
 $(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
-
+$(3)_SUPPORTS_CMAKE_TOOLCHAIN ?= YES
 
 ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)
@@ -82,6 +82,7 @@ ifeq ($(4),target)
 #   documented as a standard CMake variable. If a package supports it,
 #   it must handle it explicitly.
 #
+ifeq ($(3)_SUPPORTS_CMAKE_TOOLCHAIN),YES)
 define $(2)_CONFIGURE_CMDS
 	(mkdir -p $$($$(PKG)_BUILDDIR) && \
 	cd $$($$(PKG)_BUILDDIR) && \
@@ -104,6 +105,28 @@ define $(2)_CONFIGURE_CMDS
 	)
 endef
 else
+define $(2)_CONFIGURE_CMDS
+	(mkdir -p $$($$(PKG)_BUILDDIR) && \
+	cd $$($$(PKG)_BUILDDIR) && \
+	rm -f CMakeCache.txt && \
+	PATH=$$(BR_PATH) \
+	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DCMAKE_COLOR_MAKEFILE=OFF \
+		-DBUILD_DOC=OFF \
+		-DBUILD_DOCS=OFF \
+		-DBUILD_EXAMPLE=OFF \
+		-DBUILD_EXAMPLES=OFF \
+		-DBUILD_TEST=OFF \
+		-DBUILD_TESTS=OFF \
+		-DBUILD_TESTING=OFF \
+		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
+		$$(CMAKE_QUIET) \
+		$$($$(PKG)_CONF_OPTS) \
+	)
+endef
+endif
+else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
