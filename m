Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0152C05027
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA4B81826;
	Mon, 30 Jan 2023 00:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA4B81826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkVCL5lHBzAy; Mon, 30 Jan 2023 00:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A8B817C3;
	Mon, 30 Jan 2023 00:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2A8B817C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 905AE1BF869
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77E3F817C3
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E3F817C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDGxO4gTLR-B for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A26D817BD
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A26D817BD
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:04 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id g16so4586909ilr.1
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKhPzGmdC9iMqzBLyQQQw4aYppdgVdG2HoKi5hN7pkI=;
 b=ErrnuPtBXOVcH2MGd3Fn16bAQRPvzTfOSsCXgtog8Y1+6sYxCUrNlVmFlv6tGwvSfx
 qFarrqR24DBFnf4zEMMY+gHKumWXr4pWuvXTcZ2LZ25xJ2jru9b07c3LrWpeP/wVQAXa
 Ax/e5ejD/tykRDS85E5AMPRmevGy1JJ3Cvw7rnSztt3D4vwGn2HkFht+7XzKRAMQ1HhC
 YZ2N8bPR/56L8zIjEPN2qUfsxc6DMQF23Ybx3wlIlJqx7AIxjcNYcg8BCELpIiXSIlD2
 457AJx++cMn9OwzPQw6vujFa00DFUmc9gTIjqVSX2neF1dd0WXFpxB3+ZToQoUSYjfzd
 UZNQ==
X-Gm-Message-State: AO0yUKWeaajlgYos8zV9C/UBGDUmJa9CsE7E18kofOGUP5g7bZeJgvaG
 SkcS4fR53aSUODmtygRximDlI6fRR5ZPDw==
X-Google-Smtp-Source: AK7set9mFMDnR5RZDgNMkbQx5icKE2NR+962TCO8s+9Wwfyx9gdoQnQ9ChIHbVsrQVarnAz0kLzBdA==
X-Received: by 2002:a05:6e02:1b05:b0:310:fa98:25cf with SMTP id
 i5-20020a056e021b0500b00310fa9825cfmr360686ilv.19.1675038543251; 
 Sun, 29 Jan 2023 16:29:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:48 -0700
Message-Id: <20230130002854.2300661-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKhPzGmdC9iMqzBLyQQQw4aYppdgVdG2HoKi5hN7pkI=;
 b=XZhvdq5kWUjB0il3sGL9dJN4DzHpa88ewR+g+y6QClNOYljl1fnt1hAFe7qQf0p2I2
 T4PG5E2fR5FJdjksZhwgFNO0f7bU6LJC++0rE8j3Thc1E91W74jMinTw8/GD35ZbLD9z
 IK1xhQ8L6RDg/TATH7jtcxpoQfY7fjqanYcvG5/XTUrxwzK30a8IIpILVF9//G7+LnmF
 UU3vRChrJkj9JsnWBPLMeQpLhciagY0xfHJB4xOIpsJpKlLWd9hV8GUJT95g0YddX+B1
 i65CF4QTtt3lxCGqHzfU8qgx3Lf8r9VeqFUpshr1RUzQ568jUoO4VjOuHZceww0B3+ib
 LO8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XZhvdq5k
Subject: [Buildroot] [PATCH v5 04/10] package/pthreadpool: new package
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
index 01e64e5fc5..6d25f44dcd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2726,6 +2726,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/pthreadpool/
 F:	package/ruy/
 
 N:	Stefan Ott <stefan@ott.net>
diff --git a/package/Config.in b/package/Config.in
index 8fd8f05bd6..873aade1a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2118,6 +2118,7 @@ endif
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
