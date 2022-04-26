Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15A0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 16:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78027610FA;
	Tue, 26 Apr 2022 16:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHR0jWnwJ5d8; Tue, 26 Apr 2022 16:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4E4561100;
	Tue, 26 Apr 2022 16:40:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4021BF94D
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A0D18348C
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlHna2M98qkH for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 16:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A636F82F9B
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 16:40:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id dk23so13928129ejb.8
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMvf3xwZKcRddL8uI3P0L7QGc62TURib+rx9h+xkuo4=;
 b=WflmIywGIzSI9+XDRN07Y6qN9fiLZ8Um+0XXWtnLt9vFl5sUSUVuNQlQFxMJbbLQQn
 Gquq/5hYigudxY6WjF3D7fOsPV46LsIVDBvwHY6W7iiSCbjs6gIIWu3ac6hIkp8T8htH
 qg3mi1JnV9qbIhgVOiHm2VaIhMY16NbklDGhSi7KMGy5DppsAOsj7jjm15zgyXUEntCt
 OP3W2wJCzXzjD7ZLnW5JqydNmq8M/OdJNfM4ITIfgRhD2WXn9p5WleuT7dzkqZs1NA3m
 1XeOvW4k4C9V/3ZeRGi4dlQpTVPl8QkzZNHWsV4YDKsPHPwHe2X0QbcPKImBl0o0EB1j
 ppLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMvf3xwZKcRddL8uI3P0L7QGc62TURib+rx9h+xkuo4=;
 b=w+hAdUsk8gjvI+3teHKI3a2Kw9B/ztaKzaxM2ES467BcYA74YAPJdD0ogpMxg6268o
 AKatKO16iEIHvOUrdY/fAGjQZkrn/1v8tXj0NPJGOwtxsZFP8f2vb3UOmk8r7Znpyu1z
 ZI1hGMny0KwmgeWa6NjP3razJyhu2q7Lps+dlqeCSSHcminGy7U7RXkNZvq8t/1j8RPh
 9kPo+Ymg+6FvcxM36r7LWnkck9KxBMU6jrK5byVo+WfD0m2SwGsccAb6M6iRDSmeUIk+
 rhd5IXZxDQxVmycVNyfnBEwk05dEiUWIdsc5RV9u9OcpvPgQWiod2YalyOCiUoyxMn8g
 fAkg==
X-Gm-Message-State: AOAM532EO23dPrTp0ObD6mxJjCy2QphSHYwL6tppbah2kyrBsUsbkKPC
 QZkshXP05CgM/bdqzlIXLeaU2CRN2Xg=
X-Google-Smtp-Source: ABdhPJzUqH4jbAxr/rA1wFG65on0IB+U6Pzvrz6xA5rISEU4JWJ5DX0dSR4wefzsi2g4zCOe4YDiFw==
X-Received: by 2002:a17:907:d16:b0:6d6:e3b6:9cd8 with SMTP id
 gn22-20020a1709070d1600b006d6e3b69cd8mr21794846ejc.94.1650991214883; 
 Tue, 26 Apr 2022 09:40:14 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 wh24-20020a170906fd1800b006f3a0a8efd0sm2043844ejb.110.2022.04.26.09.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:40:14 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 26 Apr 2022 13:37:45 +0200
Message-Id: <20220426113745.3544578-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 4.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/harfbuzz/0001-meson.build-check-for-pthread.h.patch | 2 +-
 package/harfbuzz/harfbuzz.hash                              | 2 +-
 package/harfbuzz/harfbuzz.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
index 9fa09863c..102f9ff49 100644
--- a/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
+++ b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
@@ -26,7 +26,7 @@ diff --git a/meson.build b/meson.build
 index bf3925db..6d263d48 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -281,7 +281,9 @@ endif
+@@ -270,7 +270,9 @@ endif
  # threads
  thread_dep = null_dep
  if host_machine.system() != 'windows'
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1576824a5..f3ba22835 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f2200f177768bdc21445aa09703326f3bbe8114ac083d081fe1a79d305c7ae73  harfbuzz-4.2.0.tar.xz
+sha256  bd17916513829aeff961359a5ccebba6de2f4bf37a91faee3ac29c120e3d7ee1  harfbuzz-4.2.1.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 551277a78..38ed34ab7 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 4.2.0
+HARFBUZZ_VERSION = 4.2.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
