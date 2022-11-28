Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E96C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 17:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E161D409A5;
	Mon, 28 Nov 2022 17:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E161D409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66_t2i31HVnT; Mon, 28 Nov 2022 17:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B95CC40921;
	Mon, 28 Nov 2022 17:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B95CC40921
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBF3A1BF20B
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97DE94045C
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97DE94045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqDFtr9hn92J for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 17:59:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ED71400DB
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ED71400DB
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 17:59:00 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q21so8186680iod.4
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCZBKMIgDth8J8gJoVCZRSm7/FtXcNO1yJ4KGQqD+5E=;
 b=sihT2wykg0Ujx6SGi7RNpG+F/N8DZ+Sqw1oE1xcORVxQ+RqIN0EdT44vycACNJ7G6q
 cisAgydwLbcoxalN2sI1pls1ggKEaJqteSc4qIMQ7ZJCfHEBtYCH/juunDNRqYLVY/Cx
 9ql3/4pOi0nGm6MAN60yz1RwItHCYedRyOY1j+tz6ApU5C/4BlSt/3dJ6YThDSgc1RJq
 CNvI6A7HjhrCWxMcyGIAx+cSnf+rab/8G3lstT8CEJAJPkw0ew82l7IyUT/fuoKv1Q1O
 2tEVjEDtIjz26dDvaAsob78rQS/O+4SukjsZQTrclKWaPxraG+Rp6Ytt7i7bC+7JB2wV
 RK4Q==
X-Gm-Message-State: ANoB5pkZZH/EOIquqa7V569O0ty0mclThEnbtkXv/c+cgOwaxj3ybpH9
 5TOVJMRfZSfIhAL71oS1C/gZKtfXU2AsAIVU
X-Google-Smtp-Source: AA0mqf6j9bepo+HQfkkLZV03Qj87s58SADZP+AxusjZt9BfGgzDvZb8Cpknfe7LSbAh/NjAcyAQbdg==
X-Received: by 2002:a02:9712:0:b0:363:a1bb:343e with SMTP id
 x18-20020a029712000000b00363a1bb343emr25117607jai.175.1669658339085; 
 Mon, 28 Nov 2022 09:58:59 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056638229000b00363781b6bccsm4564802jas.49.2022.11.28.09.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:58:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:58:48 -0700
Message-Id: <20221128175851.1913859-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCZBKMIgDth8J8gJoVCZRSm7/FtXcNO1yJ4KGQqD+5E=;
 b=IcItxfhTcAWWZTCcrtyy6QTf18YzQDpCl3MOzgidBome/z5ZhdfJBvkepLEWq60XM6
 zlNk5ftxvK4pBRnjvtioKhnWgd8iWHrR5ubgjAm9rzWZkXdl8XCP/Cfb64BaR/xUcH1q
 eXWNEiSmD2iLv3Ez/UCjo2Fik6FgAK2F/1huV4XZnNVXH/PHINCxElbmCqFB4+qwipjn
 j6ResOA4JIRkk1PoMbo6fsChJQq6PONl89Tc+ckPA3FeQoDoLoppZvl5RJO70QqtDXYp
 4eU4E9fW+upVj9moXmDeZo+kaILQrdApSNY+prKG4DiVkvE19zQH1GNGUboiwRICgGO5
 ESmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IcItxfhT
Subject: [Buildroot] [PATCH v2 5/8] package/neon-2-sse: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                  |  1 +
 package/neon-2-sse/Config.in       |  9 +++++++++
 package/neon-2-sse/neon-2-sse.hash |  4 ++++
 package/neon-2-sse/neon-2-sse.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/neon-2-sse/Config.in
 create mode 100644 package/neon-2-sse/neon-2-sse.hash
 create mode 100644 package/neon-2-sse/neon-2-sse.mk

diff --git a/package/Config.in b/package/Config.in
index d0d9d2905c..2ec623ed8f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2086,6 +2086,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/musl-compat-headers/Config.in"
 	source "package/musl-fts/Config.in"
+	source "package/neon-2-sse/Config.in"
 	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
diff --git a/package/neon-2-sse/Config.in b/package/neon-2-sse/Config.in
new file mode 100644
index 0000000000..25613c5ec4
--- /dev/null
+++ b/package/neon-2-sse/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NEON_2_SSE
+	bool "neon-2-sse"
+	help
+	  The platform independent header allowing to compile any
+	  C/C++ code containing ARM NEON intrinsic functions for
+	  x86 target systems using SIMD up to SSE4 intrinsic
+	  functions.
+
+	  https://github.com/intel/ARM_NEON_2_x86_SSE
diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2-sse.hash
new file mode 100644
index 0000000000..ded20d58f5
--- /dev/null
+++ b/package/neon-2-sse/neon-2-sse.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  019fbc7ec25860070a1d90e12686fc160cfb33e22aa063c80f52b363f1361e9d  neon-2-sse-a15b489e1222b2087007546b4912e21293ea86ff.tar.gz
+# License files, locally calculated
+sha256  7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc  LICENSE
diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
new file mode 100644
index 0000000000..0e9d066abd
--- /dev/null
+++ b/package/neon-2-sse/neon-2-sse.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# neon-2-sse
+#
+################################################################################
+
+NEON_2_SSE_VERSION = a15b489e1222b2087007546b4912e21293ea86ff
+NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
+NEON_2_SSE_LICENSE = BSD-2-Clause
+NEON_2_SSE_LICENSE_FILES = LICENSE
+NEON_2_SSE_INSTALL_STAGING = YES
+NEON_2_SSE_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
