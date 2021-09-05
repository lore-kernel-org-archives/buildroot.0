Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D987C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:58:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B79660F8F
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B79660F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5AEB819BC;
	Sun,  5 Sep 2021 06:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PGPa-YcLUxBc; Sun,  5 Sep 2021 06:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB938196E;
	Sun,  5 Sep 2021 06:58:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43B431BF5D7
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33FA08196E
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vhi6tRF7iToW for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 06:58:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 435548196A
 for <buildroot@busybox.net>; Sun,  5 Sep 2021 06:58:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q11so4787991wrr.9
 for <buildroot@busybox.net>; Sat, 04 Sep 2021 23:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I3mtod3wKphQm6WgyO3Y/vYKvClCdJ8rZpcHzJea2Vg=;
 b=D9SIq0SFN/EZN6bHcATTJs7BYGyA98e+rOIHuKHcBkVUq2zcpWg5uk51hji2iHHk1y
 ns4nmZscJ86HOpUPZ1gPAdMRODXoSONVz/Gd6Z87kT+h80oQ6eONd8pVqL0lxHhYC3Nj
 HZOLOXVinNcYsYm7D3B6Fo3xE+s2cU6shwltoq1Id16d1tvYsK0SLQH7PAj3CXi9BQ+b
 ibgPv5tlxArP++I0O+UGRDOLaZPWL1MZQ0D5NrgNaI8AbDMR+0XaerKqqXlFYdqmEvcp
 mjihbYwaQGnYGpHngYTRqzg3YleO5R87SeHxNK2k64KB8nDzQaha9ILcXW9QSexgxQhO
 VBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I3mtod3wKphQm6WgyO3Y/vYKvClCdJ8rZpcHzJea2Vg=;
 b=fdNXHuzOtGGrUFf/kLr8tDxjl2JoUFYSdkClIbinInhgo4YIYL4Au6iJDdMmpKhslS
 VsMIR5yW7/aIxI6YmDVFFN79HiY76zskmHI45XdLqxz4naamqM10wEEFkOxnfHanHZUg
 xrCmGZDzn1O7MtfSInmgbJYrpi4JUoEfbSJ6V1BpVgYyEfZClp6dc+wRSgg9/4WvK/WQ
 qfUyrfZDJjW5r2KBQ5v+CltQHzAsNr3aq4JI6L7H6SIjRLSRaEWooP0Wwlp+DJR0P1f5
 ZFjCfNK4XRsJLIlwFZnSUOT5v7eN8PcuhuKc0msc3UzVlOBGwZac+78vaba/BTyUp0fF
 T8VA==
X-Gm-Message-State: AOAM532tIGjUFMu1wdy16nVuqPl9+1R8VIvAxPIaSFMpQZvINX+O8P11
 P6dKXNSibXBT7qOnA5LhrqPRuah4FuE=
X-Google-Smtp-Source: ABdhPJzbrPoP8xIJ/mNfbXPaNr9ZoTTomkFywxnaPpk3u3FlDelY6U95UAilczIZrgBsL0jto+ZS7g==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr7164598wrq.285.1630825109664; 
 Sat, 04 Sep 2021 23:58:29 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id b12sm4700921wrx.72.2021.09.04.23.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 23:58:29 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 Sep 2021 08:58:23 +0200
Message-Id: <20210905065823.1828910-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libsoup: bump to version 2.74.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch | 4 ++--
 package/libsoup/libsoup.hash                              | 4 ++--
 package/libsoup/libsoup.mk                                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
index 5a85e05de..f2e8f7701 100644
--- a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
+++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
@@ -26,8 +26,8 @@ diff --git a/meson.build b/meson.build
 index 4dfd8c15..a5ebc63a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -3,7 +3,7 @@ project('libsoup', 'c',
-         version: '2.72.0',
+@@ -2,6 +2,6 @@ project('libsoup', 'c',
+         version: '2.74.0',
          meson_version : '>= 0.50',
          license : 'LGPL2',
 -        default_options : 'c_std=c99')
diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 01bf41956..95c1c26eb 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.72/libsoup-2.72.0.sha256sum
-sha256  170c3f8446b0f65f8e4b93603349172b1085fb8917c181d10962f02bb85f5387  libsoup-2.72.0.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.0.sha256sum
+sha256  33b1d4e0d639456c675c227877e94a8078d731233e2d57689c11abcef7d3c48e  libsoup-2.74.0.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 964488f43..a8b4cf12b 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.72
+LIBSOUP_VERSION_MAJOR = 2.74
 LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
