Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC12C10F1A
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 02:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2787612AF;
	Fri, 10 May 2024 02:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1CQQNUctO3u; Fri, 10 May 2024 02:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6CDD612CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6CDD612CC;
	Fri, 10 May 2024 02:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC83C1BF295
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 02:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A118A406C6
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 02:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssuJuQ3pvzuI for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 02:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=zenichi.amano@gahojin.co.jp; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46BB7405E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46BB7405E4
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46BB7405E4
 for <buildroot@buildroot.org>; Fri, 10 May 2024 02:43:43 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-6001399f22bso1130229a12.0
 for <buildroot@buildroot.org>; Thu, 09 May 2024 19:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715309022; x=1715913822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AdE6AI6Hie3IoPM7IkqAMWcNBgS7cEB68rbfm97sMu4=;
 b=RFeyy4CztG4hYfeBK8XcGdjvo4E/FpiH9mYIFH5FNOfHfu1lzhkC8WX7zwxV+HoK9N
 z2ztR79erv8sF53+UI+VnWxuuQDXKAKvy8y9t3w3ymusCjl8W7YL9X8w465I0vP22xir
 u9Fe27q5kQvJ7Z3tDXWDYxsN5eu585fQM0ZQc2vQDer03+v/N9B+r2VvjIkRyRGUcb2W
 LEBEMy4HHhp6pPQPcEEoYW1/90HhLigVvFtimQ5xOy7QK/XYoeXscdEl9ICr66Gq6T40
 bFoVQv9pjizppWvugO0hOfa6fZ0093aez5Xh43wnP3wxeqPmi9FG6LKhGRJvfr9y5MJv
 Qo1g==
X-Gm-Message-State: AOJu0Yw1upKE9QAoRhJV7hu06JUdTUMWokge48aLMC1uRXCWfKdov43U
 X8SRnKhpwOqVxdGhDdgCPtg6n70BEaqZLaRQ63otN+OmpAfYNv7elrGdwRp7cLWzNzFcrPanHBE
 6
X-Google-Smtp-Source: AGHT+IEdUaqQg0gcQKwVR87Jh/kkAsj67lUGnBLW4DhjaUb8cjo6bJuCkkLkwZXQTUoT83xitww7UA==
X-Received: by 2002:a05:6a20:a11e:b0:1a7:5fe0:1c99 with SMTP id
 adf61e73a8af0-1afde1b27c0mr1921472637.46.1715309022382; 
 Thu, 09 May 2024 19:43:42 -0700 (PDT)
Received: from localhost.localdomain (122x221x233x223.ap122.ftth.ucom.ne.jp.
 [122.221.233.223]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c15a8fcsm21335795ad.278.2024.05.09.19.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 19:43:41 -0700 (PDT)
From: Zenichi Amano <zenichi.amano@gahojin.co.jp>
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 11:43:51 +0900
Message-ID: <20240510024350.566581-2-zenichi.amano@gahojin.co.jp>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509180732.23542b3f@windsurf>
References: <20240509180732.23542b3f@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gahojin.co.jp; s=google; t=1715309022; x=1715913822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdE6AI6Hie3IoPM7IkqAMWcNBgS7cEB68rbfm97sMu4=;
 b=B55cG//qqTAQqzghPDy5MMjJjOU4BA+jT4xL0jhc+khqu5LrZADVSa9JTuzlSfMXZv
 VP78Q3diPGH5UjYED6eebMvdybWa4jvQjLAOxe71PIWHiUNaYzRFCZJ9mPXF6pHuaImf
 XX27PVx1ncwkenAVm1+0b+f573OQJPjFKRTM91piX9++w+pUMUAa7d/4hn6apA1tIq0K
 JoCNzm3FlVEpLkWJVBD5xVxNGl6H2FvBtSuQhzVreaH8c4cJ8oRW3RkbTBGM9R+dnE4l
 6ACp1RetJ7qz0ua0F95rxO0z6K7u3/chGs1EIZJ8Lguh8UoCfdFvEkFJllmi3qz5T1/0
 4KJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gahojin.co.jp
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gahojin.co.jp header.i=@gahojin.co.jp
 header.a=rsa-sha256 header.s=google header.b=B55cG//q
Subject: [Buildroot] [PATCH v2 1/1] package/pcsc-lite: bump version to 2.1.0
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
Cc: Zenichi Amano <zenichi.amano@gahojin.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add configuration to disable polkit if it is not available since polkit is enabled by default in 2.0.1.

https://github.com/LudovicRousseau/PCSC/releases/tag/2.1.0
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.3
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.2
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.1

Signed-off-by: Zenichi Amano <zenichi.amano@gahojin.co.jp>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index e0face9ddb..806792faee 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d6c3e2b64510e5ed6fcd3323febf2cc2a8e5fda5a6588c7671f2d77f9f189356  pcsc-lite-2.0.0.tar.bz2
+sha256  85cab61cc744c81e2bc432656863293b8428d0136f079e3b12a84b335b5b35aa  pcsc-lite-2.1.0.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 2b2114835e..8418d6a32a 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 2.0.0
+PCSC_LITE_VERSION = 2.1.0
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
@@ -45,6 +45,13 @@ ifeq ($(BR2_PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+PCSC_LITE_CONF_OPTS += --enable-polkit
+PCSC_LITE_DEPENDENCIES += polkit
+else
+PCSC_LITE_CONF_OPTS += --disable-polkit
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PCSC_LITE_CONF_ENV += LIBS=-latomic
 endif
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
