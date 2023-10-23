Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2992BCDB474
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 09:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6C4F4150A;
	Mon, 23 Oct 2023 09:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6C4F4150A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khZc5o1HNsUF; Mon, 23 Oct 2023 09:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8787341453;
	Mon, 23 Oct 2023 09:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8787341453
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 012AF1BF35D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE7BC60F3E
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE7BC60F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iaur-ngfHnj for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 09:25:10 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E525C60011
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 09:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E525C60011
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-507b9408c61so4176735e87.0
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 02:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053107; x=1698657907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3FK9919tLvjgwK2ZEosZMSjLB10eVaGGSCoeqE7E7s=;
 b=iANxAHw/8VpInIB2mek+NntIuhV/WeqFjLsT3c9cqTgshU8h7oXGr+gE06ri7B2o16
 JJP9TCloTzyILKXoLIFgUj1+E1BXnhizrWhZyq0KzmJiiE0bsS9dbRYhy1453orhVugR
 J+fZ52H/gAMYApkl/fsPmgbp5I5MzNTEgAhef98Q0THB9iOj/JGsV+0duY6E7tYjklnP
 s0AF77OKznAlVDlui2/ir4z7G9jKmOdQURLeqsNZtbwbajljcjV5Ubr8ZATRRmKw0nW1
 D4OD+LY3OHkyq0rKccASN8uzZj6YmlwEFaf/fwsObsBTnZcGUHJ3Igu4/1kt7WEh16tm
 mSMQ==
X-Gm-Message-State: AOJu0YzXTLbyZ4cNsbUw4dL5JpbPkYQymMhsp4XgNHJqAJByjibLELwh
 Owjb23a6dAUhPw1vG6ToG5mpOVkT5YWHYxiYNeWNCI8b0sIBdQ==
X-Google-Smtp-Source: AGHT+IGqDNRq68spRASsa0BVGyLS9WhQ/O1Czzbw2xIocHppj/BnPLjLprX/Fj8y9Wo6cxSgyb1siw==
X-Received: by 2002:a05:6512:4885:b0:507:a984:bf40 with SMTP id
 eq5-20020a056512488500b00507a984bf40mr6705014lfb.47.1698053107124; 
 Mon, 23 Oct 2023 02:25:07 -0700 (PDT)
Received: from fedora.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b004042dbb8925sm13911859wms.38.2023.10.23.02.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:25:06 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 11:24:56 +0200
Message-ID: <20231023092501.481436-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698053107; x=1698657907;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3FK9919tLvjgwK2ZEosZMSjLB10eVaGGSCoeqE7E7s=;
 b=p+xWGJtTzPrgEfEkmOC7go5YsyuOZNoPXK5m/DG6qmUNy99pL5gtpzWVw4LDL1SHNQ
 hBlSt+H4aaQ9XJMBta84ZeNKVf9nZ0lusHaZSqsEL9eP23btbbwAGdUAwomwJrEvUvS6
 3ZW3UPu0JC9VKRXESt+xEZctBtf+52NUXYeAQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=p+xWGJtT
Subject: [Buildroot] [PATCH 3/8] package/opkg: add zstd support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/opkg/Config.in | 8 ++++++++
 package/opkg/opkg.mk   | 9 ++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 1f6a39343f..c3c2463393 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -30,4 +30,12 @@ config BR2_PACKAGE_OPKG_GPG_SIGN
 	  Enable opkg package signature checking support using
 	  gnupg/libgpgme.
 
+comment "compression support"
+
+config BR2_PACKAGE_OPKG_ZSTD
+	bool "zstd support"
+	select BR2_PACKAGE_ZSTD
+	help
+	  Enable zstd compressor support.
+
 endif
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 9b1ffb3c74..605d4de82f 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -10,7 +10,7 @@ OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPTS = --disable-curl --disable-zstd
+OPKG_CONF_OPTS = --disable-curl
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
@@ -27,6 +27,13 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+ifeq ($(BR2_PACKAGE_OPKG_ZSTD),y)
+OPKG_DEPENDENCIES += zstd
+OPKG_CONF_OPTS += --enable-zstd
+else
+OPKG_CONF_OPTS += --disable-zstd
+endif
+
 OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
 
 $(eval $(autotools-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
