Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52312C001E0
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 09:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 030EB41525;
	Mon, 23 Oct 2023 09:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 030EB41525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32smAR7ga-8Q; Mon, 23 Oct 2023 09:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8091141559;
	Mon, 23 Oct 2023 09:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8091141559
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4251BF35D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 836C740A94
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 836C740A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuJeWeASpvej for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 09:25:11 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7632441463
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 09:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7632441463
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso24605605e9.3
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 02:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053109; x=1698657909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s58D2pLhhEoib6poJxUG9dORaRi25MkWj7TphNhC974=;
 b=WpAnk7OlqWeNi6gZzsx9WtEPAUoNMKb9XOq8dUhdy+RJxU13SnwvYQ7ZPc5C+06ua4
 mUOeyyymb3t47fvOik1rKJIA2fwDK8YxwsMFOOQ77yhYQ3tJIntBUCI5NtY+oXHP57sl
 rpjl5WRZGW8hYmbXGthwdjdhSNa3jplW8asoRpN+hwkZFnpIqkQhZ4UDWrn/PZXdQNWC
 h2uNRV2Eve8fb/F8sm2VTZqE7zU+OvRLNNTuae+G+4+/yT/+216sAizdz64RotOPWx2q
 MzeKluTUcoM63+0VJ2gFbM4DKMCdp2fLQNN1deVc3oFXiCOAgScshGXM2Iqrj5FkXdW8
 +XAA==
X-Gm-Message-State: AOJu0YwXzhAtM4LQFDupl07jn0uhm/FrCtbMapd6YYnztC9fQp8oURiB
 6p44jr6h/IVNq7yeD2kJvwo/ou6KXL6KmbdG4f4gZYM4waBuXQ==
X-Google-Smtp-Source: AGHT+IHGkntHq/4MujgYzCks/8nIomitfa/3pQThOH82GhyqEkj9R9y99hQeQSf1O3FsY3ezbKqXjQ==
X-Received: by 2002:a05:600c:19d1:b0:408:cd96:7179 with SMTP id
 u17-20020a05600c19d100b00408cd967179mr2921955wmq.9.1698053109300; 
 Mon, 23 Oct 2023 02:25:09 -0700 (PDT)
Received: from fedora.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b004042dbb8925sm13911859wms.38.2023.10.23.02.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:25:08 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 11:24:58 +0200
Message-ID: <20231023092501.481436-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698053109; x=1698657909;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s58D2pLhhEoib6poJxUG9dORaRi25MkWj7TphNhC974=;
 b=gn7eUxrVBUkix7kuJPpk75TGeazRDVf8M6euzoYZ4UJIbPoTYwsGOZ30Z6/O9Q4FRn
 ZuUJzFVXdZXs+plFx2p+pebba1wg6oHlnMtVHmR+Ucu4KIyQ49CgsC5RFUW/PVFAoom7
 yOhkuJAayS18uk1TBEsPt2YNs6ALdXwKD4Qs8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gn7eUxrV
Subject: [Buildroot] [PATCH 5/8] package/opkg: Add lz4 support
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
 package/opkg/Config.in | 6 ++++++
 package/opkg/opkg.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 679214beea..69378c0de7 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -32,6 +32,12 @@ config BR2_PACKAGE_OPKG_GPG_SIGN
 
 comment "compression support"
 
+config BR2_PACKAGE_OPKG_LZ4
+	bool "lz4 support"
+	select BR2_PACKAGE_XZ
+	help
+	  Enable lz4 compressor support.
+
 config BR2_PACKAGE_OPKG_XZ
 	bool "xz support"
 	select BR2_PACKAGE_XZ
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index e32dd1a84c..270a7a1a75 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -27,6 +27,13 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+ifeq ($(BR2_PACKAGE_OPKG_LZ4),y)
+OPKG_DEPENDENCIES += lz4
+OPKG_CONF_OPTS += --enable-lz4
+else
+OPKG_CONF_OPTS += --disable-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_OPKG_XZ),y)
 OPKG_DEPENDENCIES += xz
 OPKG_CONF_OPTS += --enable-xz
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
