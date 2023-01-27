Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E1C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D9EA61296;
	Fri, 27 Jan 2023 14:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D9EA61296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWvTLKDgHHjr; Fri, 27 Jan 2023 14:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D34C5611F4;
	Fri, 27 Jan 2023 14:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D34C5611F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15FEF1BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3D346129D
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3D346129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oh9ADduiE2Gi for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB60160E5C
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB60160E5C
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:04 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id y69so1950605iof.3
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3u/8RbCXRmpx/Qmh2fzWXIPZParsUCqtk6wX+kbSgM=;
 b=IXyf/RtdBEemjqeg8kKatWLJl445edh2OutR5+mDSOPxHQj+1PDChlsfRc+xpQfEdL
 +WJs8C8GjS+RUHuKXUEDDX8e5lt+FOM3ys5SE9gdjhpcUQaACTFvnMsNOj0CVCztJ+tD
 qDhAozxTFREPJqoLNxeiS2L1pnBkvqVi2vc30J8QZbju4JGghb4tLarVCjqc8yM6MaEe
 oOAFUwJ5eWGH/4G/BVvY8wvpn7hELi4HGBRZQN1xhBkS6djo8vCTl5VLjZadDpC6bXq+
 TKWUVVcQbfMK1hbbiNzGeEXeh0ztb6u4TSv6K0t1uf2ei0XH1ZswDXcPjvGPxHWxATQn
 zzQg==
X-Gm-Message-State: AO0yUKU8OZCWEEWjGZteQfXqTguA5yfg7Q9lJZXz9I6xAIm3oDqEmeYm
 Tdx7IwmuHfDkLh2KwCACno6ruS4u3HbKJw==
X-Google-Smtp-Source: AK7set8VZYLpEzbXxZHqnlKCyDJd3ALIiUyvhEWxwdxTVbI8bFBl9HDlMO4nCX/MOmkGbK3RKLmkMQ==
X-Received: by 2002:a05:6602:3417:b0:6e0:7dd:5976 with SMTP id
 n23-20020a056602341700b006e007dd5976mr4984532ioz.12.1674828663627; 
 Fri, 27 Jan 2023 06:11:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:50 -0700
Message-Id: <20230127141058.2180747-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3u/8RbCXRmpx/Qmh2fzWXIPZParsUCqtk6wX+kbSgM=;
 b=igrK1FwB4KNzPUBrBGpvTmtbu5qHU8JGVxVrnWCKCeoJc0ej35g6Yw2qsgSLEgvKoK
 RfVGy+dKOjUkcjfES4sjHaF6f455NRSWLz6TiOf6TKnPGCZDpLwiOuwZCCthgTbNqFOM
 Y1LHYoevp4dXMJvCDz/yxJeJIVXcBsQrQV6gUhRq52s0V1EeBhGuV5NEtgjw5lf4kZGv
 S4LKWI4O/ckVaIjbFZxxwjhqAm4MATD8gBR52P3lc+KXBFBoYU+uJwX7MosFOGhXRTB7
 ghNmH3zrCClH+G5C2iBzi5UdhNq4OTHSVHwq/llA2Wvv1NVPqrE06QUKKai4GFDj/ulG
 AVNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=igrK1FwB
Subject: [Buildroot] [PATCH v4 05/13] package/neon-2-sse: new package
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

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/neon-2-sse/Config.in       |  9 +++++++++
 package/neon-2-sse/neon-2-sse.hash |  4 ++++
 package/neon-2-sse/neon-2-sse.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/neon-2-sse/Config.in
 create mode 100644 package/neon-2-sse/neon-2-sse.hash
 create mode 100644 package/neon-2-sse/neon-2-sse.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f48ea66660..a711f9f1ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2704,6 +2704,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/neon-2-sse/
 F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index 8f78080963..6377ddd2e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2101,6 +2101,7 @@ endif
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
