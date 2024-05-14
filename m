Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A083C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 16:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 493C18233C;
	Tue, 14 May 2024 16:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ygvr36mjJmgB; Tue, 14 May 2024 16:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C1F282346
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C1F282346;
	Tue, 14 May 2024 16:01:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29AA41BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 162A260B5D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LtDMjzOqSfu for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 16:01:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22FE960B1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22FE960B1D
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22FE960B1D
 for <buildroot@buildroot.org>; Tue, 14 May 2024 16:00:59 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7e1bf0e9ab5so191087939f.3
 for <buildroot@buildroot.org>; Tue, 14 May 2024 09:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715702459; x=1716307259;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=paFpDhxtJk1Stm1H5tUQd9cGaqnk7bW4a4L8nM0qaNQ=;
 b=P8w8xIR1g3h3J7hHvfNzK9rv0R6S7DEiL9C/avo85YqciLJMVDdMIzYtNpNj0tu+sb
 ufkJOQ5qZ8eWhUIvXWEUrruSjGKCls7UhS3QUYhWAjyi40bz8IdR3t2JJpaBvSnlvwJ5
 sCgR8s0a+OIJVIG7Se2gQNm2aJV94Q4aJjtplm9IBTbGZHsRGaVjhEgDKA8+HyczEtSb
 JdxXTzigF/X8VV7jtzsGMuO02kVCH7j6v9aWvVau3pWTvQNlIth5c6DGqRJ4IBBbZ/IQ
 tDgoE/FdM7ITWglm3gxllIyToxOVjPx9NG3YZUQf3RL+lhiS9uIsc2wutIs3g+TP9kIa
 cidQ==
X-Gm-Message-State: AOJu0YzMOzc71Wddis6tXvR2NfopzRWtULc8wwmatqiTc30QsW0FCgoy
 t8jM81GfDxNC5xyIkqjciGXQqPsrMD5bYxvF0mbnnXm22nMGQpteBbdaVw==
X-Google-Smtp-Source: AGHT+IFHvDu4kVt2q/Q9/M5rr8FCsgm2x7hAN68G277fS7L3G+mTcyDJhtqukaZ2zpI4is38Ei2TGg==
X-Received: by 2002:a6b:5112:0:b0:7e1:7ce6:6e42 with SMTP id
 ca18e2360f4ac-7e1b5219e3cmr1443255239f.18.1715702458765; 
 Tue, 14 May 2024 09:00:58 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4893703c075sm3074895173.57.2024.05.14.09.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 09:00:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 10:00:51 -0600
Message-Id: <20240514160051.1540342-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715702459; x=1716307259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=paFpDhxtJk1Stm1H5tUQd9cGaqnk7bW4a4L8nM0qaNQ=;
 b=k0LhgI0aMAPawKMZ6RyDd5N6wZNKR4PT/hzXE3rSJdrY6JIi1MxGppJMVvrLCSWGKE
 jrZK0h0wPVMPsFhjePAUMqrQQTBhT0TRX2t35/TiDW5otPTCF80LH687gFXQ2iXeEDPK
 VBE+ust72GayWNqHAfrz87JVYdEB846OnBTWPjhmLL9wyqXfzKRERbvW19RE6Ir1QuEC
 xbi8RfzVp9NxRcuifOvqJuUaqJKGSjM+bVb2BXkrTzpEGUJ4WzLjswKFIcB4UNv9wJXr
 dkNEkvsjaCD6LUvoKBkYo6X5j7jURnGN4CJK3Lnm/KSwbBTKe7zn0A5XEbeVmqPeOUfs
 5RtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k0LhgI0a
Subject: [Buildroot] [PATCH v4 1/1] package/cloudflared: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - update to version 2024.4.1
Changes v2 -> v3:
  - fix version
Changes v1 -> v2:
  - fix Config.in syntax/section
---
 package/Config.in                    |  1 +
 package/cloudflared/Config.in        |  7 +++++++
 package/cloudflared/cloudflared.hash |  3 +++
 package/cloudflared/cloudflared.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/cloudflared/Config.in
 create mode 100644 package/cloudflared/cloudflared.hash
 create mode 100644 package/cloudflared/cloudflared.mk

diff --git a/package/Config.in b/package/Config.in
index 1b6a5b0dab..db9230bf85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2386,6 +2386,7 @@ endif
 	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
+	source "package/cloudflared/Config.in"
 	source "package/connman/Config.in"
 	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
diff --git a/package/cloudflared/Config.in b/package/cloudflared/Config.in
new file mode 100644
index 0000000000..3a1a715dc7
--- /dev/null
+++ b/package/cloudflared/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CLOUDFLARED
+	bool "cloudflared"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  Cloudflare Tunnel client (formerly Argo Tunnel).
+
+	  https://github.com/cloudflare/cloudflared
diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
new file mode 100644
index 0000000000..adaf107a22
--- /dev/null
+++ b/package/cloudflared/cloudflared.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  11bed2bd793cc03775aa6270797ed328434bc982e09fd3597e267590f28d2436  cloudflared-2024.4.1-go2.tar.gz
+sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
new file mode 100644
index 0000000000..819cfd5e64
--- /dev/null
+++ b/package/cloudflared/cloudflared.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cloudflared
+#
+################################################################################
+
+CLOUDFLARED_VERSION = 2024.4.1
+CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
+CLOUDFLARED_LICENSE = Apache-2.0
+CLOUDFLARED_LICENSE_FILES = LICENSE
+CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
+CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
