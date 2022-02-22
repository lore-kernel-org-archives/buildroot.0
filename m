Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FB9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 22:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6162940447;
	Tue, 22 Feb 2022 22:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhu11XFt9Q1k; Tue, 22 Feb 2022 22:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F1C840207;
	Tue, 22 Feb 2022 22:43:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A30B11BF429
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 22:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9159460AE5
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 22:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EqYHBtTZzsn for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 22:43:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6CFF6059F
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 22:43:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id f17so11352134wrh.7
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 14:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIbbgUpO3f6PH0YeFHEPCtqkQR9WjVvefnB/ekgVE/k=;
 b=CXM7u76QKiMScSoLtuJ+yXQmqoqhWcRVG+A58AXyLOB6+KrKPgonk1u5nERL7PNFQf
 o8E1gfgvOT0I/l+R/evrPR13TcEHj6iEi/JB3cjAyeYWLJL5VLoDcrOnmHbTB4tnIZii
 Z1hB4ny7a3Mgsi3GuO+TOKTs1TDlPy/3+kAMFvhfdpY8w4y6HefgRzc6VeEsXfjqH9AE
 1oNR3i+EEkzYLp6Oqd/prko7C/2QiC/DeFvBBZQA1hgBucoT696U8OftOjUNXJqYlbna
 KBnADDndznUsEhTWGxMfHZaYq6u1JZCQmu5YL+VNDPV3IQRMFKYtbSHpFFlL9u/SM+TZ
 lB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIbbgUpO3f6PH0YeFHEPCtqkQR9WjVvefnB/ekgVE/k=;
 b=dJCC9HYPqcP/IfQBJogCrvBcQ05XPBVgvX889pohb9Yo0luzUnRj+JAs6H6M9Vx60k
 pIuOxYPDrlhzM3gjXWZIaCI+W7pdS9nhrScZyk+kw96hCK/Y69VNuWTg3ZlfDQwacTgT
 /fIt46SbovCj2u9j5YTkfpDdrCs5lT97m1QIZJUhF3IMJZM+9Y+743fPk9P2aoiEMQKI
 q6pGavX1pAIJk3AyA3+OEvIhfSG/ytuZndmkueVa885lihvLbEfbb8mR/WdLgfDBEltB
 WZzs7p9WQTYBUS0tfjJIwj3mu6yRM3t8TmjeWEeMYhcUFRWURzn7rfsmnVB4+XmtSxwY
 uxIg==
X-Gm-Message-State: AOAM530/5k3AvFQJRI0OwKE9Gav+xyvWUDbc4DtMWb/INNYtlbH3YGN6
 MVXgxb4aKg9wd+JFWYWsejciGy3vW8c=
X-Google-Smtp-Source: ABdhPJwEaHfZSS+AFrXGRzTiMj3kcs8CPBQfWa/v+Qxt4YBpaU4Hq4yjcdgJxewgSka3lUcTqeI/eA==
X-Received: by 2002:a05:6000:2c8:b0:1ea:972b:5476 with SMTP id
 o8-20020a05600002c800b001ea972b5476mr3557092wry.278.1645569806792; 
 Tue, 22 Feb 2022 14:43:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b00354d399ef32sm3746367wmq.39.2022.02.22.14.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:43:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 23:43:02 +0100
Message-Id: <20220222224302.3185944-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4450
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

Fix CVE-2022-0554: Use of Out-of-range Pointer Offset in GitHub
repository vim/vim prior to 8.2.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index fa3ca53cc8..8b60b7461f 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b40b4e341de6b65cdeacd4c816dea8fe5e3b385ee5e17af73fc69c00bd7c440b  vim-8.2.4301.tar.gz
+sha256  b0a5acbe83bbdd4b1412abd9dc2ae2e3593c6cff8ff11c551fda3e6e2a87ec81  vim-8.2.4450.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 98a5f153a8..28fd33c8ef 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4301
+VIM_VERSION = 8.2.4450
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
