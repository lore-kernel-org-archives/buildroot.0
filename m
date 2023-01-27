Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D28EC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB49341D59;
	Fri, 27 Jan 2023 14:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB49341D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoECU4NkJtrl; Fri, 27 Jan 2023 14:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6620841D62;
	Fri, 27 Jan 2023 14:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6620841D62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55E4A1BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E1AE408A5
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E1AE408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28Pdnc68v6LN for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A2D8417D2
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A2D8417D2
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:05 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d22so1952808iof.5
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w9eSnNng3QE2QDToqzxHeuEKwSxWMB92Y4jaSx1ImLA=;
 b=NtWplVya+SKI0BhlOQehvYRKaMbVNQcEXcw6L6y9k345fw9YzEOA+hmyqenjUV3YL+
 KrBwaOpEDl9bPNYgidJGUBCadJDGDvNHPjdP4c4jYj7AFzLwCs/fXYMmT605lQa+QKt/
 7oYVJDEuOB5QnY1wQOt8Bf8Bm/hnsnSZWR/kUUtooaTlu7o9fZlQG2gUwSer83x59CCY
 QODF1qeMpZLWlCv8vKxiZRMVvHQLHn5oxQc2tIQO3zLlFKKvx7/pkC5qwovaScwF8maC
 s0FA8+dxywYUuLSSCaRYAEpem2o/qvSpCkSriBeHaHELUiTVbGxz6vdjUuh6nRes+GDI
 Lu1Q==
X-Gm-Message-State: AFqh2kqu9TFbQwUZpHcDCzCM0BTqFjlkKijcehBxRAQI0NFOfYk8agGr
 t9ZXENi5L5dF8SrvzatvqsPueo3XnAiSdg==
X-Google-Smtp-Source: AMrXdXv1mzsT1aICImczyZ1de9xsuSCXStRkTHFAy4Lb5Qq1yIml7N25FkCelWBdTgVv5+Gs9tUvnQ==
X-Received: by 2002:a5d:96c3:0:b0:6e0:256d:547a with SMTP id
 r3-20020a5d96c3000000b006e0256d547amr29025719iol.14.1674828664983; 
 Fri, 27 Jan 2023 06:11:04 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:52 -0700
Message-Id: <20230127141058.2180747-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w9eSnNng3QE2QDToqzxHeuEKwSxWMB92Y4jaSx1ImLA=;
 b=qm1i0pkWXcnXdD5BGEvXrMZXA/nAtgWKZXj75FrH1m85+LvixyO5nJewai3rZSYoDt
 fUswYnE/l97WGnVFpa4gxR3SHSOHEJFeFiPeXtn2cEgd5sbA93DvlZ/QWdKqpO08NR7k
 Hjb+emIX76uL7uqGs9AW0ZyCiDFIJo3TqwEX/jvONU2dAmrGt+w8oVikMH5FaGOKwZ8+
 5uQ4Vp50LOvEGFhRll5EmfV93lf9ImM3rETU7jSGIv26VhfrbMTrj7rkzRTJt3H8f6HQ
 J+Pu746nR40S7NmpB1OZPcedy4ubPdbPkuU4+FVgfGP1k6K4h1xFSRat7KhC/yxOX3Bc
 TL2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qm1i0pkW
Subject: [Buildroot] [PATCH v4 07/13] package/pthreadpool: new package
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
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/pthreadpool/Config.in        |  8 +++++++
 package/pthreadpool/pthreadpool.hash |  4 ++++
 package/pthreadpool/pthreadpool.mk   | 33 ++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/pthreadpool/Config.in
 create mode 100644 package/pthreadpool/pthreadpool.hash
 create mode 100644 package/pthreadpool/pthreadpool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b600c2914e..de15ae1d98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2706,6 +2706,7 @@ F:	package/cpuinfo/
 F:	package/fxdiv/
 F:	package/gemmlowp/
 F:	package/neon-2-sse/
+F:	package/pthreadpool/
 F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index e393760b6a..426af4e143 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2110,6 +2110,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/riemann-c-client/Config.in"
diff --git a/package/pthreadpool/Config.in b/package/pthreadpool/Config.in
new file mode 100644
index 0000000000..194ae33f85
--- /dev/null
+++ b/package/pthreadpool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PTHREADPOOL
+	bool "pthreadpool"
+	select BR2_PACKAGE_FXDIV
+	help
+	  Pthreadpool is a portable and efficient thread pool
+	  implementation.
+
+	  https://github.com/Maratyszcza/pthreadpool
diff --git a/package/pthreadpool/pthreadpool.hash b/package/pthreadpool/pthreadpool.hash
new file mode 100644
index 0000000000..164ac55390
--- /dev/null
+++ b/package/pthreadpool/pthreadpool.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ae75adb19807ea28582683b38dd4e79a6b287751452564b42e214bb21216ef14  pthreadpool-43edadc654d6283b4b6e45ba09a853181ae8e850.tar.gz
+# License files, locally calculated
+sha256  57814a606b4d0fb087d9a534919084b6c11b58a4174cb5a4aef200187780dc3a  LICENSE
diff --git a/package/pthreadpool/pthreadpool.mk b/package/pthreadpool/pthreadpool.mk
new file mode 100644
index 0000000000..4ef7949da2
--- /dev/null
+++ b/package/pthreadpool/pthreadpool.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# pthreadpool
+#
+################################################################################
+
+PTHREADPOOL_VERSION = 43edadc654d6283b4b6e45ba09a853181ae8e850
+PTHREADPOOL_SITE = $(call github,Maratyszcza,pthreadpool,$(PTHREADPOOL_VERSION))
+PTHREADPOOL_LICENSE = BSD-2-Clause
+PTHREADPOOL_LICENSE_FILES = LICENSE
+PTHREADPOOL_INSTALL_STAGING = YES
+PTHREADPOOL_DEPENDENCIES = fxdiv
+
+PTHREADPOOL_CFLAGS = $(TARGET_CFLAGS)
+PTHREADPOOL_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_PACKAGE_CPUINFO),y)
+PTHREADPOOL_DEPENDENCIES += cpuinfo
+PTHREADPOOL_CFLAGS += -DPTHREADPOOL_USE_CPUINFO=1
+PTHREADPOOL_CXXFLAGS += -DPTHREADPOOL_USE_CPUINFO=1
+else
+PTHREADPOOL_CFLAGS += -DPTHREADPOOL_USE_CPUINFO=0
+PTHREADPOOL_CXXFLAGS += -DPTHREADPOOL_USE_CPUINFO=0
+endif
+
+PTHREADPOOL_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(PTHREADPOOL_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(PTHREADPOOL_CXXFLAGS)" \
+	-DFXDIV_SOURCE_DIR="$(FXDIV_DIR)" \
+	-DPTHREADPOOL_BUILD_TESTS=OFF \
+	-DPTHREADPOOL_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
