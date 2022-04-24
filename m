Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67132C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A3A181AF4;
	Sun, 24 Apr 2022 20:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_Omaouv7v4X; Sun, 24 Apr 2022 20:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A7FC81A6F;
	Sun, 24 Apr 2022 20:02:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 514751BF348
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E9CF4019E
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5nQNyNiJy4M for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:02:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C1334019A
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:02:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id p189so8144557wmp.3
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x12H7ZIi/HhaS4JjE/zgU17sv5HbmgqbblbOw52cB24=;
 b=MZbKd+f8bjTN0ChJ12ein3lOwhyeASvmTnWZinm/yjtZ9CXo4tDOmKKlxv/VS62M+i
 qIRpqfBYiqY5Z5PQ5voyMxRSyJZiuI8q1lM8KR2vzf5R94A3Qfm9rrK4hYYZVElZS6zM
 2DEeYLgLw8TR7GYahiIDnvEMYJIk/xjqNWNtZEMgq0MDkkIQIiGVmGaMr72JN5w44V42
 3DNHbk+ooYEAE8T9Cpx0YTGbzz+RIqoRZUVbckV2mbdqOnehkY0zJ3ZVOwD7cDgYmr/e
 sI3Lwuit9VEWdLF+N7R2Cupdp8QuCH/WMZ+QbYJEo9v+Mu/hiV9aiMQUztLAcsy7Hd83
 Ayzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x12H7ZIi/HhaS4JjE/zgU17sv5HbmgqbblbOw52cB24=;
 b=bcnvAwfLJTFxU+bCBBVooifae7YBuSUGkDNSxqW8H4xwTvxVM7/ZhRBsGkxaxDHLkU
 npE01DTADTJ0VMdqymVWYA952p828r1UIn/FBsl3gAONb8dVI6AWpaUoOOJVRW4prr5P
 +F8sxjnCOykmgS5fC3Z36kGi60wukFzJm6vdXLK9miDUzE3DP06eNCEEvlHBV2NS179A
 chX7gHFz7m+TzV/i7NPP6zUx6iXFhcQduiG82/Tvz7l6eUtFXfhWYX3b2Sxe94U73Zhu
 kYPPp+xp+zjm4RCdFdeumWoUcK4XUI/fyFWqf+bzce1CYuT0aHe7tQV8VwYiMa67+c0Y
 snqA==
X-Gm-Message-State: AOAM5301v64klrQa6u0wUReNZZzxSmHCraiZGp1yCmkrMb2OmK5pnnJi
 f5Vgkf5JftXWNXW1hfMQ8r5x0mfeK7E=
X-Google-Smtp-Source: ABdhPJzY0EtKKVEKDhpNGQ8yP5UxzWvaVfn25qgsSOyw7rZ/8tq+hjk8SAiJn8AKpN1Wu0f8iVJsgw==
X-Received: by 2002:a05:600c:190b:b0:392:95b8:5b18 with SMTP id
 j11-20020a05600c190b00b0039295b85b18mr22509995wmq.152.1650830536269; 
 Sun, 24 Apr 2022 13:02:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e30-20020adf9bde000000b0020ad8ffb0f9sm2034366wrc.69.2022.04.24.13.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:02:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 22:00:14 +0200
Message-Id: <20220424200014.1336771-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424200014.1336771-1-fontaine.fabrice@gmail.com>
References: <20220424200014.1336771-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libselinux: switch to pcre2
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to pcre2 which is available since version 3.2 and
https://github.com/SELinuxProject/selinux/commit/50f0910cf05bdc1d10710c7c3fb748a178473387
as pcre is EOL

pcre2 is used by default since version 3.4 and
https://github.com/SELinuxProject/selinux/commit/e0da140d82c0ebebf1060ce87d0f11276c7fc59a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libselinux/Config.in     |  2 +-
 package/libselinux/libselinux.mk | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 348757abce..3098fe3ea4 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBSELINUX
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
 	select BR2_PACKAGE_LIBSEPOL
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libselinux is the runtime SELinux library that provides
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index c6be8e638a..db35da130f 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -11,7 +11,7 @@ LIBSELINUX_LICENSE_FILES = LICENSE
 LIBSELINUX_CPE_ID_VENDOR = selinuxproject
 
 LIBSELINUX_DEPENDENCIES = \
-	$(BR2_COREUTILS_HOST_DEPENDENCY) host-pkgconf libsepol pcre
+	$(BR2_COREUTILS_HOST_DEPENDENCY) host-pkgconf libsepol pcre2
 
 LIBSELINUX_INSTALL_STAGING = YES
 
@@ -20,7 +20,8 @@ LIBSELINUX_INSTALL_STAGING = YES
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	ARCH=$(NORMALIZED_ARCH) \
-	SHLIBDIR=/usr/lib
+	SHLIBDIR=/usr/lib \
+	USE_PCRE2=y
 
 LIBSELINUX_MAKE_INSTALL_TARGETS = install
 
@@ -76,14 +77,15 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 endef
 
 HOST_LIBSELINUX_DEPENDENCIES = \
-	host-pkgconf host-libsepol host-pcre host-swig host-python3
+	host-pkgconf host-libsepol host-pcre2 host-swig host-python3
 
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
 	SHLIBDIR=$(HOST_DIR)/lib \
 	$(HOST_PKG_PYTHON_DISTUTILS_ENV) \
-	PYTHON=python$(PYTHON3_VERSION_MAJOR)
+	PYTHON=python$(PYTHON3_VERSION_MAJOR) \
+	USE_PCRE2=y
 
 define HOST_LIBSELINUX_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
