Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66941C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 18:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0205A83F75;
	Tue, 28 Jun 2022 18:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0205A83F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Af9bvX3O3oFL; Tue, 28 Jun 2022 18:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED6D983E03;
	Tue, 28 Jun 2022 18:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED6D983E03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9831BF5DB
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 18:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 775BA6112F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 18:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775BA6112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DA86QZ6QRN-R for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 18:35:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47B4760B2A
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47B4760B2A
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 18:35:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n1so18922112wrg.12
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 11:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ag3MVynq8M9QG9bHh5URp/EE0E2ntft7qsaaXLU8TM8=;
 b=lKdoixWNOLBBl2YaMFWJ4yeCqPWg7Io8hBk7E2hq7D4d+D8HXAhEIEKWDV+ujL/Y06
 VXYUrebwAr11zphcmJA9hPhuPWDDdUnoq0yKU8ZABIckMj1CQBz/9Ia2Keh0YyWyi1Nd
 nvdNyJPnKddKJVSQIYOB4AQIJ52FAERdayyjy9PN6ZPmOGRkoUmcMbbPAamdBksrHLYQ
 x09YmelZRpUSCvJ0HLo4DL00tKbJeMvsSnhWhVvwAkqxvubTAcfboxkhQDfZCDL+oRBl
 3tYEA2Nb8hOvYeWMG3VeowBxpA0zMZ9DkyjALdKBfHntGz+K4M76Tzm7C6pdObPjTV/u
 ht4A==
X-Gm-Message-State: AJIora8cvf5g+ZlgiC/wvGIWbSuqWTdhi/gbiiMw0H5VkF+aWj6aB7u7
 GFguOmMKL/Wz7jiMshu+P6F1y5lLNPM=
X-Google-Smtp-Source: AGRyM1uc5nksp1KlhnAD68ZD4m2nFWcYbuXHUNrlI/A94BNGWtFjjpXDnflHHTFBqxh702zI3kY3sA==
X-Received: by 2002:a05:6000:1844:b0:21b:b06c:3ab2 with SMTP id
 c4-20020a056000184400b0021bb06c3ab2mr19670947wri.618.1656441357284; 
 Tue, 28 Jun 2022 11:35:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1c4c15000000b0039c871d3191sm426509wmf.3.2022.06.28.11.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:35:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 20:32:13 +0200
Message-Id: <20220628183213.2838372-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628183213.2838372-1-fontaine.fabrice@gmail.com>
References: <20220628183213.2838372-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ag3MVynq8M9QG9bHh5URp/EE0E2ntft7qsaaXLU8TM8=;
 b=gB8OB/h48CjoxclBe4mXgHmD0WLd7afOH2+qqdbCtLjRC2YrqoFVHjHlaicrzJ5A/q
 rhsNYquNgjfzYqVMCKwVVaUGeILefkRD3XgMtbgDPuzKqcF8K55JZUPhCZyeQ5jJzgXT
 uTq9wxDzEJ8hdZg3K7mh08BOvez3GvaEV8D05MiVVyc9f6V0mBP8hePyJrW8I0HOEu5Z
 /Bcv9MLUoEVAr8ltgSprZXO5rMdTnB1t4EENsO9rSsN2l/EwIHT6SP6trxBlXI4X5Kl7
 g/Smz4vGpjEa0BFFi3EoPVL3s/TsO0bSzAKW1BuwSwezGW0/CESfJv3oRe9kFGhi1eMT
 cNlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gB8OB/h4
Subject: [Buildroot] [PATCH 3/3] package/libsamplerate: bump to version 0.2.2
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

- Switch site to get latest release
- Update indentation in hash file (two spaces)

https://github.com/libsndfile/libsamplerate/blob/0.2.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsamplerate/Config.in          | 2 +-
 package/libsamplerate/libsamplerate.hash | 4 ++--
 package/libsamplerate/libsamplerate.mk   | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libsamplerate/Config.in b/package/libsamplerate/Config.in
index b394fdb0ac..5cce287f81 100644
--- a/package/libsamplerate/Config.in
+++ b/package/libsamplerate/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBSAMPLERATE
 	  be useful is converting audio from the CD sample rate of
 	  44.1kHz to the 48kHz sample rate used by DAT players.
 
-	  http://www.mega-nerd.com/SRC/
+	  http://libsndfile.github.io/libsamplerate/
diff --git a/package/libsamplerate/libsamplerate.hash b/package/libsamplerate/libsamplerate.hash
index 73722563ef..c5e22ba57c 100644
--- a/package/libsamplerate/libsamplerate.hash
+++ b/package/libsamplerate/libsamplerate.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1  libsamplerate-0.1.9.tar.gz
+sha256  3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893  libsamplerate-0.2.2.tar.xz
 # Locally computed
-sha256 2c1f76ce2effdddb425018405d5690c0b1ab4e6976e35296b0a6db65c5e1a55d  COPYING
+sha256  2c1f76ce2effdddb425018405d5690c0b1ab4e6976e35296b0a6db65c5e1a55d  COPYING
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 584f61f02a..5489f35cc0 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBSAMPLERATE_VERSION = 0.1.9
-LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
+LIBSAMPLERATE_VERSION = 0.2.2
+LIBSAMPLERATE_SOURCE = libsamplerate-$(LIBSAMPLERATE_VERSION).tar.xz
+LIBSAMPLERATE_SITE = https://github.com/libsndfile/libsamplerate/releases/download/$(LIBSAMPLERATE_VERSION)
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
 LIBSAMPLERATE_CONF_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
