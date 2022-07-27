Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663F9C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11E3A81AEF;
	Wed, 27 Jul 2022 09:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11E3A81AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmsD5K6yKJ09; Wed, 27 Jul 2022 09:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F0C881AAD;
	Wed, 27 Jul 2022 09:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0C881AAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3251BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC1E460B25
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC1E460B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXZKqunNuDtm for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:47:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A9560B0A
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5A9560B0A
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:47:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k11so22958865wrx.5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxBitYs+Efjia9BJ7tr/g6KSOlJnfycMbbtzuYr+BFY=;
 b=ku3pgaLyuF09GT4CbPAANV7qCWJnfgrJZGAKLSIExrINZsoLRrcSS3WXxM3YIigY8j
 290qRd4xkm1fkIL+Uk9nH65S3uqsmNcIn0FnV8Sc4YuIaRsha6V34qi4l5yhA9RAqwgW
 kOpZ2irQMBE/9+uBkwEzKIZgE4qdCiXUZZ6hldykPohzAGy7X81Cs8CXvdKCrUtoALln
 JQPtMv67Sl+niZdrU4m/ZQsdUMCYRZckh9F648hxg11tEYvt0kpUSmQcNtkThdm4kJSM
 jjw/vhnIAyEiSKvUujiqwjQ2l/7MGERfZQYNcKB9DHssGFdFF5kdMLcOdcFgklPLkhTR
 Bh6Q==
X-Gm-Message-State: AJIora+zCO60jhVZewUclzjy/7CducCyOzSPoV5jk5eU/mV3v27Ifk3X
 tHxEFX2yimr5brn4z9IzuZ6saOcUpEI=
X-Google-Smtp-Source: AGRyM1vRA24hq3yzm7lr/RqoY63tO1tM4NlZu0MPvUObYJSftfz5uFLM0DYbNqsCQVEUtuvi5JyXtQ==
X-Received: by 2002:a05:6000:178d:b0:21d:a3cc:54c8 with SMTP id
 e13-20020a056000178d00b0021da3cc54c8mr13104527wrg.602.1658915246665; 
 Wed, 27 Jul 2022 02:47:26 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c500b00b003a2e42ae9a4sm2086804wmr.14.2022.07.27.02.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:47:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:47:19 +0200
Message-Id: <20220727094719.1086106-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727094719.1086106-1-fontaine.fabrice@gmail.com>
References: <20220727094719.1086106-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxBitYs+Efjia9BJ7tr/g6KSOlJnfycMbbtzuYr+BFY=;
 b=lfjn6qwrrSRgH6rJFlaCxHmT6PktfeDEtl3VG+z9+5KSp/WKZBC2Ct7v9NqJzidY86
 sAVJ4XR/i2s+wxSJr1T0dUW8mW6ekuIZtxfpkqghLoKbswY6zljk6pjycUJIcUJXi1QB
 Dm4c2OrfvL7dHZDPyd77Ks7O1QQXZseZXLinbNK+6KMkIbHBM0gji3rMzF0Jpm6lc8C6
 wmnwR/jO0/7sGLLotkai+0PjtbDR4+4PBY/i0pihhAmoe6vBn6Ajv+XhBcNhNHizUL/g
 SuYzy2UFouGOeqG1qsLU8Ji4PFczYi6lfNA29YncAYFkeYVCg6PvNzUPSqJtI6bMJtyX
 Hrcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lfjn6qwr
Subject: [Buildroot] [PATCH 2/2] package/cryptsetup: add libnss support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libnss is a crypto backend since version 1.3.0 and
https://github.com/mbroz/cryptsetup/commit/7b6eda0d273eb514bf2c1f834a5af019f614f606

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptsetup/cryptsetup.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6fdda78fe2..20cf5d6346 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -26,7 +26,7 @@ CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
 # cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt,
-# nettle or kernel crypto modules instead
+# nettle, libnss or kernel crypto modules instead
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CRYPTSETUP_DEPENDENCIES += openssl
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
@@ -37,6 +37,9 @@ CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
 else ifeq ($(BR2_PACKAGE_NETTLE),y)
 CRYPTSETUP_DEPENDENCIES += nettle
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nettle
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+CRYPTSETUP_DEPENDENCIES += libnss
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nss
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
