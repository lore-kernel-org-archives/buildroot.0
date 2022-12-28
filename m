Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A39EC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 22:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22A0440220;
	Wed, 28 Dec 2022 22:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A0440220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QS5Nu2jTHAFP; Wed, 28 Dec 2022 22:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40BA740182;
	Wed, 28 Dec 2022 22:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40BA740182
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CBC81BF5F5
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38315812A9
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38315812A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTivYzUhbHL1 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 22:15:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E4881281
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26E4881281
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 22:15:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o15so11983624wmr.4
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 14:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Czjg6YrCV4o2c0o9MyIZsfvDK8AL7eYVBuMhX8cNiw=;
 b=j0loN7bd12/CWnABkOHtdxbjNmT3s4m2nbAfofuOOLeaUxsA1sugG14tWAYCE91kwd
 6dwgQly2SuKv90cZ+Qa1jw/qwQg9rIXvVKx8WCtetKaNUcMsgjCW1aLIFVoN4Y/zHfw9
 bqoLwTsdSEeWYnJUSZ1NGX2Jp89lNGY0fW/A9QJ8MZovWObqj2eSbE0CJT7v18bLLG63
 +aQJ0skcOY46giO4ZE1yrx07oDPog/0STT+7BGwQHylOOqunDlIhhM79uUHJUWz1EJxF
 Usd5BPFbMtXgd6dmmGakYTzDZj+LF7WZh6k4dqTZJLGNMxHSQ+7lezmEAC0mV/iddqSh
 zUrw==
X-Gm-Message-State: AFqh2kpgQKMv4Te70F1hVFjYlSo76Evn2/o3HnWsyL1O5rR+IRsasc84
 KTcqZO8C0vEUgGmu+9PyhNsYDz+Hl9I=
X-Google-Smtp-Source: AMrXdXs/MuPOXstXARJPrWFerBmuZeIhKURJYrM5R/qW8poOS3COD7Akn9cpPoepCB2gNBP8qQzXVg==
X-Received: by 2002:a05:600c:4e51:b0:3d1:e1f4:21d1 with SMTP id
 e17-20020a05600c4e5100b003d1e1f421d1mr24105447wmq.26.1672265727777; 
 Wed, 28 Dec 2022 14:15:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b003c6c5a5a651sm21957143wmb.28.2022.12.28.14.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 14:15:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 23:15:21 +0100
Message-Id: <20221228221522.280696-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Czjg6YrCV4o2c0o9MyIZsfvDK8AL7eYVBuMhX8cNiw=;
 b=XXrctRCr0k9DO03OpUZa42tPbFolS7WPtVXOnH6Zq4xCtymGZOadmFp3E6jIRTjGNY
 3j+c9o9vhtzeA91jjfNJhFYjnbm9VlbRhDepqEelgGMdyeDnp50jkHxK5sVBlr50Gx9s
 ASo0mA9nLU/Hd3o0JiqUXbUPNMpezVHGTbDetsgtl3bvJKEXQg4jiu6iG3B3AIcPxvDl
 1MjWK01lmruEPsTZZ8kZeP0CfSqUnCaohosBVXm9LYgL08F/XOLnVuP+8KNPQmS7XTTS
 5taldoxKiiP+36CTSUjxQ0ht4RCzeeD/FdkWqQcJEBpgVk/3owG3wRIaAMsIcOSqZf7j
 aQGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XXrctRCr
Subject: [Buildroot] [PATCH 1/2] package/xxhash: fix static library install
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Install headers when building statically

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...dd-install_libxxhash.includes-target.patch | 39 +++++++++++++++++++
 package/xxhash/xxhash.mk                      | 15 +++++--
 2 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch

diff --git a/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch b/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch
new file mode 100644
index 0000000000..22c8cdaadf
--- /dev/null
+++ b/package/xxhash/0004-Makefile-add-install_libxxhash.includes-target.patch
@@ -0,0 +1,39 @@
+From b7c91f761b6d0b79398d0a064d2d6e34de3dfa47 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 27 Dec 2022 23:12:37 +0100
+Subject: [PATCH] Makefile: add install_libxxhash.includes target
+
+Add install_libxxhash.includes to be able to install headers when
+building and installing the static library
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Cyan4973/xxHash/pull/776]
+---
+ Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index cfa5779..2276282 100644
+--- a/Makefile
++++ b/Makefile
+@@ -557,6 +557,8 @@ install_libxxhash: libxxhash
+ 	$(Q)$(INSTALL_PROGRAM) $(LIBXXH) $(DESTDIR)$(LIBDIR)
+ 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT_MAJOR)
+ 	$(Q)ln -sf $(LIBXXH) $(DESTDIR)$(LIBDIR)/libxxhash.$(SHARED_EXT)
++
++install_libxxhash.includes:
+ 	$(Q)$(INSTALL) -d -m 755 $(DESTDIR)$(INCLUDEDIR)   # includes
+ 	$(Q)$(INSTALL_DATA) xxhash.h $(DESTDIR)$(INCLUDEDIR)
+ 	$(Q)$(INSTALL_DATA) xxh3.h $(DESTDIR)$(INCLUDEDIR) # for compatibility, will be removed in v0.9.0
+@@ -586,7 +588,7 @@ install_man:
+ 	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
+ 
+ .PHONY: install
+-install: install_libxxhash.a install_libxxhash install_libxxhash.pc install_xxhsum install_man ## install libraries, CLI, links and man page
++install: install_libxxhash.a install_libxxhash install_libxxhash.includes install_libxxhash.pc install_xxhsum install_man ## install libraries, CLI, links and man page
+ 	@echo xxhash installation completed
+ 
+ .PHONY: uninstall
+-- 
+2.35.1
+
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index a8f8d1d179..6932113f14 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -15,14 +15,23 @@ XXHASH_INSTALL_TARGETS = install_xxhsum
 
 ifeq ($(BR2_STATIC_LIBS),y)
 XXHASH_TARGETS += libxxhash.a libxxhash.pc
-XXHASH_INSTALL_TARGETS += install_libxxhash.a install_libxxhash.pc
+XXHASH_INSTALL_TARGETS += \
+	install_libxxhash.a \
+	install_libxxhash.includes \
+	install_libxxhash.pc
 else ifeq ($(BR2_SHARED_LIBS),y)
 XXHASH_TARGETS += libxxhash libxxhash.pc
-XXHASH_INSTALL_TARGETS += install_libxxhash install_libxxhash.pc
+XXHASH_INSTALL_TARGETS += \
+	install_libxxhash \
+	install_libxxhash.includes \
+	install_libxxhash.pc
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 XXHASH_TARGETS += libxxhash.a libxxhash libxxhash.pc
 XXHASH_INSTALL_TARGETS += \
-	install_libxxhash.a install_libxxhash install_libxxhash.pc
+	install_libxxhash.a \
+	install_libxxhash \
+	install_libxxhash.includes \
+	install_libxxhash.pc
 endif
 
 define XXHASH_BUILD_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
