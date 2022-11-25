Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AA5C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F40611D4;
	Fri, 25 Nov 2022 16:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59F40611D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPUwl0D0FGmN; Fri, 25 Nov 2022 16:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825A8611E5;
	Fri, 25 Nov 2022 16:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 825A8611E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6FDA1BF5DA
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 902F281A27
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 902F281A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZL111r8VUVG for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB31820B7
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB31820B7
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:08:04 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id x16so2159996ilm.5
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCZBKMIgDth8J8gJoVCZRSm7/FtXcNO1yJ4KGQqD+5E=;
 b=dFU3wVRcWBOH7rgQys3iEskQp51MpOHs9VoEZl0Z0JL25jcHX5Ck8wyC0YrntwzFBb
 qfHMeeUNkJUacJfCeoX07rloq0rTEs26v9pBfKJb2nkvplqen9GyOHUT/8SjRcnvKYNV
 ysOnZDi2VKN+r+Gn5EpDzUdKcEmjWgLrSj/HGxzB+t6xmuwyku8j2a4FqyFI4QQ2XNZ9
 ltTF0N71qZNgUIPNwo2tXU2WdHclYysEFacc9HBvWRc1jz4cc6cTRiK6b3+vonoq6FIb
 jTKrxNBkc0VTvNrLWq/ndjDoC6Jive9ldC7URIpSNLTNepdWA9GVRjqalJlA7Q0lYutl
 eXCg==
X-Gm-Message-State: ANoB5pkDwPO/0phnHyjtBHjeFeyVHOYqN58gjA2/aYwqTZslRrRdyHPI
 HMcOQYEASobXyzB+jwXgEOy151wmRChv6w==
X-Google-Smtp-Source: AA0mqf7vg99EKkbBqY/RI18fGR1tFPHN+ERql2IY6gwyrJ2rTax6G6yrBFxHlQMCWI/RS0qKj2Z3dA==
X-Received: by 2002:a92:da48:0:b0:302:ebf5:a7ae with SMTP id
 p8-20020a92da48000000b00302ebf5a7aemr4373187ilq.34.1669392483226; 
 Fri, 25 Nov 2022 08:08:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 z28-20020a056638215c00b00363753f4730sm1497384jaj.91.2022.11.25.08.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:08:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 09:07:21 -0700
Message-Id: <20221125160724.1725476-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125160724.1725476-1-james.hilliard1@gmail.com>
References: <20221125160724.1725476-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCZBKMIgDth8J8gJoVCZRSm7/FtXcNO1yJ4KGQqD+5E=;
 b=pY3dYPPPknGAaBPIVLgeYgIFDl8tzS1epte/Fl1T/L0QfHt+/+sXF7zXwUldR+6SQa
 Lpx7ew77zBZcsc0p/kTf+WnKUF+VbaLXqgoltaT1k7jq0yk7/eqqBec2Mb78NgklH7XM
 OAqob1UHdlxJdQcZpIiBWs2pcuX1LxdDxFpn4sDf1Cs0KO41tzNv7O23EeNjeFRKUWj7
 HgvOgY91hqqwEA5qvQvlu94r0IDEh5pcVOn0qnrr+s54hZBXMbwS2WaKtfxSyUiGs20s
 q1ovOlKKDC3HQYztFFZOKZgYYZO8SwskD3g5mN0QeiJOTtpPkBOskO103yD0JiezfBec
 h3Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pY3dYPPP
Subject: [Buildroot] [PATCH 5/8] package/neon-2-sse: new package
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
