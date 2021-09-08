Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F632C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:25:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DBB60041
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53DBB60041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220C040354;
	Wed,  8 Sep 2021 20:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTwYfxRjCS1L; Wed,  8 Sep 2021 20:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F3FC40320;
	Wed,  8 Sep 2021 20:25:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 161121BF870
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1275361392
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-9jZSgkukK9 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 20:25:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 822DE60626
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 20:25:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso2462827wmc.1
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 13:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jr7Ofuqw/V0yWdemxTD8F60mFhkOoEt0WA3taepo3HI=;
 b=BBxBVzYIo/0yRp1OgDCBYnGKax8bspkO0MAQ24d4iYn0CZg2dDo5iVb9XNFhVxc5TT
 LvQkbljwXaE4vhjFIq9hgb6XxJcs02buoyNTBwNyMT866HtUduurAya+kIWDu4l4f3a7
 IQ6QY8pu40AuVGhHnrtOLN5XOEzo7FXe8l2mxOdrBF+as1ZsUwb8ZZ6aQu2wYgl7vFSb
 nkbyKgSzIAKFf0Ka34nAKbIOzgjkXYNSLUnBXtq+TdgUMgORz0j8E9eVnmbQwKotX5PQ
 Zwslx+GMWpPjk6CK689CegVnO0+g9gtOu8DSw9KJYBsT8waPvHmyYsGOZZugZaJV/EIz
 Om+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jr7Ofuqw/V0yWdemxTD8F60mFhkOoEt0WA3taepo3HI=;
 b=yLNUaOJ+5yO55SDjCkxeb81iFUnW0zCK73OC5uaj3YQf29jjkap1zU4aVFb5PQ99Ho
 gyez7mHf0Qmilkyxgyr7tVgiCy7CTmz60AUK3agepvOa/z4o3Pdtra8zeEikT4I9AROd
 IwsQ3+F2b31G/0YXcI885RPMjl2pH6bd0FEiTfbrJWMjkH0gdUyRPUoppYf/8M7fGlqS
 dSQFsq9DPhtTdVDwToKNENdq53ERsi2TkhSBIqGhQww0NJG2+6XMkMgnjwYCMAJyx473
 B31QRSZvRW2bqS6kGJkOsFY8HwMZrJSBgwHCq86teCD9uTRSS9p53xsEXTkn4rrkw4ur
 sioA==
X-Gm-Message-State: AOAM533jENm0sCXBD5eBFyF6AJxFjkSquN60LyBHx/QBf1dcYH3Kq9JQ
 uW+5mPKnPveQ5yux4nnpRQepdZ5kEXI=
X-Google-Smtp-Source: ABdhPJznTTcRK4Qlo7PpkDdem6pS1E3e3lIzWrJnGcusdu/CJkzjRf4L9wOLKPXL8UVQyeyrc7EQSg==
X-Received: by 2002:a7b:cf11:: with SMTP id l17mr60249wmg.95.1631132748493;
 Wed, 08 Sep 2021 13:25:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id r25sm131640wra.76.2021.09.08.13.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 13:25:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 22:25:09 +0200
Message-Id: <20210908202509.860895-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gssdp: bump to version 1.3.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Disable gtk_doc (enabled by default since
https://gitlab.gnome.org/GNOME/gssdp/-/commit/652edd5c0145c0a542017840e3f3bc22b9ade159)

https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.3.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 2f13c0a847..4954568420 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.3/gssdp-1.3.0.sha256sum:
-sha256  e739cf33f813403a53973cd8f2882dcd7208bad9582269f7066fc9e8ea3a52cc  gssdp-1.3.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.3/gssdp-1.3.1.sha256sum:
+sha256  affbf145c26e02dda9d31f9da9fd5182bd2cc36565ab8ee2e877567b2fd206cd  gssdp-1.3.1.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 9e67d35db1..c7982f16c5 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -5,14 +5,14 @@
 ################################################################################
 
 GSSDP_VERSION_MAJOR = 1.3
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).1
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
-GSSDP_CONF_OPTS = -Dexamples=false -Dsniffer=false
+GSSDP_CONF_OPTS = -Dexamples=false -Dgtk_doc=false -Dsniffer=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
