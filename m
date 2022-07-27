Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8392C3F6B0
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 404D360C12;
	Wed, 27 Jul 2022 13:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 404D360C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLg64vDUhEiC; Wed, 27 Jul 2022 13:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E3E960C05;
	Wed, 27 Jul 2022 13:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E3E960C05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91B931BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CD9281B60
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CD9281B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuwvLaDB5Xn6 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:19:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEDB081AC4
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEDB081AC4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:19:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h8so24112861wrw.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lZckN14DnA9cAly4bS6XqiAIRh23F5uUjc8DXMQUO4=;
 b=fWc8QmyyX1GlMT22Dn1p2VWKUC8kx2id1aQTTUuT7By8SK9jo9a6CbMk07A6iIHtk4
 41Vz05LrM5ECQGFJgIEpCzBNbRVkdQQDDWCVxnUWFCx2luHoXHHrSlFXzBKy3SPyjq16
 nJquHbMgDLURH6H+thlIMOYoKqB/Os8Jtu03Ypi2Uxy0tfszHUy08VelLywKDYfsKy1g
 gSHY34urQnybzc1L0upI0I/cwdx0cLpc3TLb4yOBz8izwqQPLFprGBgd67fDSOTDkJMC
 wb+yFZLLXspZ/htmjDFpyrf+Xy6DB9HqprZ51ISdZm0p1VOqyTIO8NnV9nJkji2hHi1m
 Lxvw==
X-Gm-Message-State: AJIora+NmBmcb9Y0pY/Re20Q3dWhSPWeOJa91MpXgdJloEy0ygthJzyZ
 RYi0AbXiU4Loo/Fo5Qb1xzc22xCZa1c=
X-Google-Smtp-Source: AGRyM1tzQaExFQ25UtSwu23NAa23NRKTghInj2274PPzZKexYgXo9YeCIA3ZI4lVUinSbs6CDYxceg==
X-Received: by 2002:adf:f804:0:b0:21e:de03:b64f with SMTP id
 s4-20020adff804000000b0021ede03b64fmr1287026wrp.543.1658927972387; 
 Wed, 27 Jul 2022 06:19:32 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 az30-20020a05600c601e00b003a31d200a7dsm2699962wmb.9.2022.07.27.06.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:19:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:19:04 +0200
Message-Id: <20220727131904.1316745-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lZckN14DnA9cAly4bS6XqiAIRh23F5uUjc8DXMQUO4=;
 b=T4o3Jweiy9m2tPGej2gCrF3WKThZcw8oGi/xItMJWXKOBEz2dmXfOpqaQe3kAGgju2
 OcazctS3JD7zOkIr+ASShfzw+20j8bWIliZl3kL6fuz0IcQDGxgu4jH9v6elbZEEo6/r
 XuQNShnDlbgg2pgdNUeaD5na6XXDNOjLDeBMdSxBBSjgkCwg6tne01ffTdTpRL1TEOkW
 h+ITRxwiqWcRHhNhNzFlpLR1B3lrVpH5LnkI2czv9wNuNzEoO12e8MvpyX/ef6t1Iw5k
 R9kQckUcQ4vYdoK7UQzkHyeck5Ch7VUWPo6h0H+jheNuRKDw+OHTb9bW6pG0Kt+QfLos
 HGRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T4o3Jwei
Subject: [Buildroot] [PATCH 1/1] package/botan: bump to version 2.19.2
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

Drop openssl dependency: "The OpenSSL provider was incompatible with
OpenSSL 3.0. It has been removed"

https://github.com/randombit/botan/blob/2.19.2/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/Config.in  | 2 --
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 7 +------
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 635fe1836d..8f7f3f5c7a 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -20,8 +20,6 @@ config BR2_PACKAGE_BOTAN
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Botan is a crypto library for C++
 
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 2729cb493f..d768c669ea 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560  Botan-2.19.1.tar.xz
+sha256  3af5f17615c6b5cd8b832d269fb6cb4d54ec64f9eb09ddbf1add5093941b4d75  Botan-2.19.2.tar.xz
 # Locally computed
 sha256  472faf6d2231130382779f96de506be19296473750356449fc426ddc9cb03b50  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 6095844b14..b26ee4c66e 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.19.1
+BOTAN_VERSION = 2.19.2
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
@@ -61,11 +61,6 @@ BOTAN_DEPENDENCIES += bzip2
 BOTAN_CONF_OPTS += --with-bzip2
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-BOTAN_DEPENDENCIES += openssl
-BOTAN_CONF_OPTS += --with-openssl
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 BOTAN_DEPENDENCIES += sqlite
 BOTAN_CONF_OPTS += --with-sqlite
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
