Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0D6C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 19:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A7660D4D;
	Sun, 29 Jan 2023 19:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A7660D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fWgYTtwnTpc; Sun, 29 Jan 2023 19:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14DEC60C16;
	Sun, 29 Jan 2023 19:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14DEC60C16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9681BF3DE
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 19:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 301878174D
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 19:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 301878174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRUnpMELfJLa for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 19:07:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCF30813D7
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCF30813D7
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 19:07:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d14so9216389wrr.9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 11:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6WDnk2lI+GNNayyVmOb2xsQsmANxus9Z7Uc8jjblCYQ=;
 b=xudT3KJcmxrey3WYzhq5qlNIR8sx6BfSIS+TYjs2c2j5kv7DT6tDGFhNMrt5tQNV/d
 WWmpe4l5GdwVAZsJPFQLXlLzojybMIsK11luvfmRwD9QrenRUkGRRxJoWWzVZjCdYEsY
 MX3NvJVeO8qPoIK8w62gzu0rpLTEdbGgxpIbWGYdrgUXKtKYH12CQn4knyrDtEtU15k1
 19g9kuPiXVpcH0xnjZ75IDj/FojkYRPu3tn/ZAp2bA8c+2VrzWt7dR/jLJL9hm8s7FB6
 tLfuFd7ztFC+pF/gSpQ5bF8CtGUQWjEPHRdO7iHL2cCySryXR59wklhn52jj3r6IOooR
 S3bA==
X-Gm-Message-State: AO0yUKU5axvex0mKgGSoL3pB61iTZbBJSZ3s2RXtx8DPpzjXzfMgM1bq
 dZjAAxsrylNBb4js41XuRoNBfqTyBPc=
X-Google-Smtp-Source: AMrXdXumpN5trUiNcy9hmFTGWscXiYD3yJUjgQbwkY9zfVPhirguO60wXIjJAvbb+noJnd8eZGPq1g==
X-Received: by 2002:a05:6402:49:b0:49e:33ce:144d with SMTP id
 f9-20020a056402004900b0049e33ce144dmr122140789edu.37.1675019244834; 
 Sun, 29 Jan 2023 11:07:24 -0800 (PST)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 dm23-20020a05640222d700b0049eea46c909sm5692461edb.37.2023.01.29.11.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 11:07:23 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 20:07:20 +0100
Message-Id: <20230129190720.186357-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6WDnk2lI+GNNayyVmOb2xsQsmANxus9Z7Uc8jjblCYQ=;
 b=IJGLagWCBY/MB+mQgj1wx7oMR7MOhae/hUvbrUXMmiT7B4rnVbxzy42HaExPBlUxMS
 HmoEV9hn9FWhUCQOMt4L54qxvRoJxiojv5uUUPbSQVYRED7I3qXHZEmDdUCUfS1uSs68
 lp5F+E7KG0VbWwYwLfjaHN56RHIa9sjJ0cFdJ7y6qtK951UOYqSpnN4ALF5/167zS70n
 V72rDzCx7tubLeUDow1yqharQFCsyjtyZ7Slag815lyC/QNm3aPoyI2gTX7LxLHlq3PE
 hogqN+d34QhBnp0cwbiFgpOlubTM9y+cEJSG9cuxWghHIT0z7zlMBLYqtK2xfhk1o35l
 2bVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IJGLagWC
Subject: [Buildroot] [PATCH] package/apparmor: bump to version 3.1.2
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Angelo Compagnucci <angelo@amarulasolutions.com>

Bump also the dependency library libapparmor.
Update also the hash computing method because the hash is
not provided anymore on the main website.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apparmor/apparmor.hash       | 4 ++--
 package/apparmor/apparmor.mk         | 4 ++--
 package/libapparmor/libapparmor.hash | 4 ++--
 package/libapparmor/libapparmor.mk   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 497491b6c9..7ee5ef6275 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
+# locally computed
+sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 76c9f2cafe..eeedd805e6 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the libapparmor package
-APPARMOR_VERSION_MAJOR = 3.0
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).4
+APPARMOR_VERSION_MAJOR = 3.1
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).2
 APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 9fbfe3b92e..147e357993 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
+# locally computed
+sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index af59335933..7f3cfcab2f 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the apparmor package
-LIBAPPARMOR_VERSION_MAJOR = 3.0
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).4
+LIBAPPARMOR_VERSION_MAJOR = 3.1
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).2
 LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
 LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
 LIBAPPARMOR_LICENSE = LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
