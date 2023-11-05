Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E71C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 22:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D996400CB;
	Sun,  5 Nov 2023 22:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D996400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_SVRuug3535; Sun,  5 Nov 2023 22:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB5D740131;
	Sun,  5 Nov 2023 22:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB5D740131
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 678531BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C2E812F3
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 22:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C2E812F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIPSn-hmi6nz for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 22:35:09 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB0EE812CE
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 22:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB0EE812CE
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40859c466efso28890025e9.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 14:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699223706; x=1699828506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQNcZZEQSCmwxGQszNFIQdt8TZZ/K2R/Fy7/b7S+6yY=;
 b=LtuZEoLuaamt7lDzXygSZBtuNETTSiQMIUNtupDu0HxSGC7zjRxrSzFPsIs+KQ5K8R
 wt0eXae4NMaVJyPyLV5GPQKnMFMi3x0CPJnDxCnGQT/pGfVTczHglVuwmCKgtUHVfl4D
 gnIhjlGUluCPEcKC63Op3AQ9TXbZ4R2AF1RMgF/Os9Xq08bKLhV0R0r8cyhWLTZZ6Q9P
 4dLoK8KPuxZEdRsDqkrrYfw9L3X/Wv1qLan3LVW/0u52oLpgmZ9cKCD3epwyZ9JoStAE
 7wBOAOYfo0YoGjhdJJ5A2+Hxa+gj8FLiGKOVwqA6FG3xdHtH0ydZCI0dEarZWy6K6A2b
 d0OQ==
X-Gm-Message-State: AOJu0Yx3MrwwoitSB5Mi3IFKdnSHFz+/sHhAuwBPifLXdapjenTAKFag
 uYw6B61bXQQMAIRpUxdwIMTZHT+hJZQ=
X-Google-Smtp-Source: AGHT+IFwyCbOZvqzG8nF3Fh4iKq4ld4XS5JbxBcqC+naJMajvYXtdotft7F6IYE0HytywP2c12fCZg==
X-Received: by 2002:a05:600c:450a:b0:405:3a3b:2aa2 with SMTP id
 t10-20020a05600c450a00b004053a3b2aa2mr22825382wmo.37.1699223705657; 
 Sun, 05 Nov 2023 14:35:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 je3-20020a05600c1f8300b004083bc9ac90sm10214893wmb.24.2023.11.05.14.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 14:35:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 23:34:54 +0100
Message-ID: <20231105223454.432408-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699223706; x=1699828506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQNcZZEQSCmwxGQszNFIQdt8TZZ/K2R/Fy7/b7S+6yY=;
 b=LAFUMbhu2BrNrZjMV5T5GP6j0YFPHKZ4dDH8rLH77QR5J8MiYRrZW4kRUUcX7weak+
 X1ePDxtwL0kChXd+Tt24MUttrXphA+439kJqWy+IKRcnqpCiFDe3L7ZEEJo0gZm+rnvK
 iE9zECNlMUVBvjBgVEUMwUp/l5aMOhQwf7K3XyiqC6wFTwnsI9tufIF5yRcrNROX/o7F
 6EAiZ7v+FBxpo5drKCmqzy0ofQYbvP0jitd8cs13AOhRN1DaMloDD++pwRhTCHV7L2uL
 fxyWeDaHmdTJgtpv+19CkcAnGEqqdxDxAQ8Pnt121+5PFtfo6fgeXxt+62NIQ12/kZVh
 MZPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LAFUMbhu
Subject: [Buildroot] [PATCH 1/1] package/jq: bump to version 1.7
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site to get latest release
- Drop autoreconf as official tarball is now used
- _GNU_SOURCE is correctly set since
  https://github.com/jqlang/jq/commit/52d5988afb5999c71fd24484a93efefa2a9e9a8f
- maintainer mode is disabled by default since
  https://github.com/jqlang/jq/commit/54fef09ac39d6fb003367d65709349c43078405e
- Update hash of COPYING (BSD-2-Clause for Windows build using jv thread
  added by
  https://github.com/jqlang/jq/commit/34182cca7babec086bbc93dec209275be896ca9e,
  mispelling fixed by
  https://github.com/jqlang/jq/commit/5cebe86a7b90e5718077c5e1d5c2165939d3f3cb)

https://github.com/jqlang/jq/releases/tag/jq-1.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jq/Config.in |  2 +-
 package/jq/jq.hash   |  4 ++--
 package/jq/jq.mk     | 17 +++++------------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/package/jq/Config.in b/package/jq/Config.in
index 5edb5d0989..ed2e0fa34f 100644
--- a/package/jq/Config.in
+++ b/package/jq/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_JQ
 	  filter and map and transform structured data with the same
 	  ease that sed, awk, grep and friends let you play with text.
 
-	  http://stedolan.github.io/jq/
+	  https://jqlang.github.io/jq/
 
 comment "jq needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 125781385c..6c2db98e87 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20249104d4df2247253df6df4a980b8be1f5232f03fef7cd41bacb7e6eab04fd  jq-a17dd3248a666d01be75f6b16be37e80e20b0954.tar.gz
-sha256  c8437d414ca5b394718784c3bf5bdff7f01fee417625fabf1fb722ca263037da  COPYING
+sha256  402a0d6975d946e6f4e484d1a84320414a0ff8eb6cf49d2c11d144d4d344db62  jq-1.7.tar.gz
+sha256  10e974638a41fadfd72357f2f3a4325e20b856c563365128f72feaa406f8c92d  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 7f890f8998..d886459dcc 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,25 +4,18 @@
 #
 ################################################################################
 
-JQ_VERSION = a17dd3248a666d01be75f6b16be37e80e20b0954
-JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
+JQ_VERSION = 1.7
+JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
 JQ_CPE_ID_VENDOR = jq_project
 JQ_INSTALL_STAGING = YES
 
-# currently using git version directly
-JQ_AUTORECONF = YES
-
 # uses c99 specific features
-# _GNU_SOURCE added to fix gcc6+ host compilation
-# (https://github.com/stedolan/jq/issues/1598)
-JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE"
-HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99 -D_GNU_SOURCE"
+JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
+HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"
 
-# jq explicitly enables maintainer mode, which we don't need/want
-JQ_CONF_OPTS += --disable-maintainer-mode
-HOST_JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
+HOST_JQ_CONF_OPTS += --without-oniguruma
 
 ifeq ($(BR2_PACKAGE_ONIGURUMA),y)
 JQ_DEPENDENCIES += oniguruma
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
