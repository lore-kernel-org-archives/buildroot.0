Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CDEC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E4841BC1;
	Wed, 29 Nov 2023 17:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E4841BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FB5rRAmacH-X; Wed, 29 Nov 2023 17:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E42341BC3;
	Wed, 29 Nov 2023 17:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E42341BC3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 702461BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48EA981EB9
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48EA981EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7cfPRFXHmPS for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:39:10 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6C1981E43
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6C1981E43
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b552deba0so6925e9.1
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701279547; x=1701884347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oU/Gcxvy33VjCeR87KRc6pQcC6KJQ/sAQNnvuD1uZmM=;
 b=Mz3cNeR0Jk8pTLrl2hhND5GbJyRF5xSzJ5P82+4GKKpvlfbyBy1Zt3n37fMcwhL3W3
 6GqYkFRWHM5nBwT6GoNCPR9KHyXGiYVPyLyyXQVocwEitHuefoUuRmU3UylZ6JKYS+MQ
 dLamfrtuilLkKxo4vv7djsTPWVEEB3P6KQ5W677OOBRb0TWJVdTU2BZ77Z+dXCC3/0uK
 6h1nKTD0s1CjE3ltYnTTGd/uJgKeBiQM0y4G12Oc3CXQbtbkQ8KkNBYOlBKwHvA7iWH8
 /IaFIOCJPIA+vYvHLb1WVDaF0+PBtKGJ8+Bg+596hsnUfO0d4JG+vHPWzN/ppvYXDuSC
 zvCg==
X-Gm-Message-State: AOJu0Yw/Z5qGxEqkBly4iaLkFmN97rATDgBb++zEg2Z4kXl1QkLv4Hjk
 /OhNf7553s2O0QqRYkFRkB3u8l37wxI=
X-Google-Smtp-Source: AGHT+IGQSPSV0WrCvSsST3BHgvm9CxeaWM2DXwZZh7o4s6+z8FoXTIOUgK8tizc3oZ+vIncN1uWh8A==
X-Received: by 2002:a7b:c7c5:0:b0:40b:2bad:7f61 with SMTP id
 z5-20020a7bc7c5000000b0040b2bad7f61mr13601808wmk.10.1701279547453; 
 Wed, 29 Nov 2023 09:39:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040b4ccdcffbsm2986123wmb.2.2023.11.29.09.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:39:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:39:01 +0100
Message-ID: <20231129173901.505113-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231129173901.505113-1-fontaine.fabrice@gmail.com>
References: <20231129173901.505113-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701279547; x=1701884347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oU/Gcxvy33VjCeR87KRc6pQcC6KJQ/sAQNnvuD1uZmM=;
 b=T0xtmGyE2A1GCz2y/z1gXt0qkSUXc900pwEyj8d91su+G6qY4zi6iGvMJJxUhjCwjd
 WftfXLLrRDw/DjAXiw0EtH2djbtwcMrABItx20o6K102rsMzsMkMFRTaT72UGzXX7M0S
 d4N/qShzmVpTlJyN+E6c7VAJLSPcznRdvYm/1ZHXv2QeYQx6aPuUPltd/wGxcs5TnQ+e
 F2RDQBfgM6UQmU1I4pi7FFMlS0S0J7DFDtyemUCwVgcic8EYkDY7cIK1Zv88kDMEyxbU
 MmOuE/t2m3SXWUW2jfPgzNb1oUsuwbVhiquz9+6WDar4AEn9H9aZRPjayN+Fw1K3i0zL
 LiWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T0xtmGyE
Subject: [Buildroot] [PATCH 2/2] package/xtables-addons: bump to version 3.24
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

This bump will fix the following build failure with kernel >= 6.2 thanks
to
https://codeberg.org/jengelh/xtables-addons/commit/51761c3fe2454e0b4bc25274dd55d4ab72c54bf0:

/home/buildroot/autobuild/instance-1/output-1/build/xtables-addons-3.22/extensions/xt_TARPIT.c:
In function 'xttarpit_honeypot':
/home/buildroot/autobuild/instance-1/output-1/build/xtables-addons-3.22/extensions/xt_TARPIT.c:110:26:
error: implicit declaration of function 'prandom_u32_max'; did you mean
'prandom_u32_state'? [-Werror=implicit-function-declaration]
  110 |                         (prandom_u32_max(0x20) - 0xf);
      |                          ^~~~~~~~~~~~~~~
      |                          prandom_u32_state

Fixes:
 - http://autobuild.buildroot.org/results/e8f2a0cb5b38ff98da97268c4b642554a0a732e1
 - http://autobuild.buildroot.org/results/0191ee0590c08b73f17b35a5c8521796693772b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 840a31f947..7bdbbb8578 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  faa16a27166275afbfe8df605f55c3a81ac693bf19da674d45ceded4137ae217  xtables-addons-3.22.tar.xz
+sha256  3e823f71720519ced31c4c7d2bfaf7120d9c01c59a0843dfcbe93c95c64d81c1  xtables-addons-3.24.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index adfedbc874..efd8bd98ce 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.22
+XTABLES_ADDONS_VERSION = 3.24
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
