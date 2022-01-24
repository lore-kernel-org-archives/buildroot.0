Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B5BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFC774025D;
	Mon, 24 Jan 2022 07:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1t1minyrawu; Mon, 24 Jan 2022 07:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE0B4015C;
	Mon, 24 Jan 2022 07:48:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 555991BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517ED60A91
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vefY_9BBEed for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:48:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A44516059F
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:48:56 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so10936874pjb.1
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HtM7UUozFPs9QhA4izR0h19WNc/xmeTYc4/obpCh/B4=;
 b=qHVPP7cldwqY8Q04YF9/sdEjwYKhsN7sDSLCz898pxJqRBdFsOtGfU2k5IHOIoMEbI
 c+cGn+Mwxq9homP4aXNfdkERbs5lm6DimAZZ1kKjeRN+LSo4YwRzn5hAJh3oMbeEXkEY
 FomcUNidsGAWCi+HwnECzFhVHmYyK8F56Pz7Lm86Jpq8sbjBvRDJZF5POS1xnZ4HYMTr
 LjOII3VWY2b6AAlePoPrEAwYll2nEEsJILa3HUgGXuHg9iRGzQ2sbjWcZd+IoxIFmLH8
 Ybo90W9gKeR1/IyDebglJC3E+70t29nZyTvPwx8ckJvcMl6ufcnMibBj6CFmmNLVElCt
 lHYw==
X-Gm-Message-State: AOAM532GyaJgu+9yA1vGKDrJ7C52u+WnTQoX/7F1szbqVsYKTC+4YpPD
 fWu8ix5W8rCEPlTBnB76SYgqZq6lz6CmzQ==
X-Google-Smtp-Source: ABdhPJy1VZwKBTHWRToQ7Gn6aB+RtX8ZrB1jstRRWoM7jvJXzsoeuVYCYpYe19+wjyAWAyqlHuHRQQ==
X-Received: by 2002:a17:902:b903:b0:14a:db1b:6a57 with SMTP id
 bf3-20020a170902b90300b0014adb1b6a57mr12740180plb.67.1643010535718; 
 Sun, 23 Jan 2022 23:48:55 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 bc19sm1213714pgb.66.2022.01.23.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:48:55 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:48:53 -0800
Message-Id: <20220124074853.77797-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/moby-buildkit: support building as
 host package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Users may want to use buildkitd and buildkitctl to build images on the host.

Adds package host-moby-buildkit and BR2_PACKAGE_HOST_MOBY_BUILDKIT.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host                 | 1 +
 package/moby-buildkit/Config.in.host   | 8 ++++++++
 package/moby-buildkit/moby-buildkit.mk | 6 ++++++
 3 files changed, 15 insertions(+)
 create mode 100644 package/moby-buildkit/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 20034f6ee0..3bf6fab2db 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -53,6 +53,7 @@ menu "Host utilities"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
+	source "package/moby-buildkit/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
diff --git a/package/moby-buildkit/Config.in.host b/package/moby-buildkit/Config.in.host
new file mode 100644
index 0000000000..a3b18548f8
--- /dev/null
+++ b/package/moby-buildkit/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_MOBY_BUILDKIT
+	bool "host moby-buildkit"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  BuildKit is a toolkit for converting source code to build
+	  artifacts in an efficient expressive and repeatable manner.
+
+	  https://github.com/moby/buildkit
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index 3f0df351ef..533ce6485a 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -19,4 +19,10 @@ MOBY_BUILDKIT_LDFLAGS = \
 
 MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(MOBY_BUILDKIT_BUILD_TARGETS))
 
+HOST_MOBY_BUILDKIT_TAGS = cgo
+HOST_MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
+
+HOST_MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(HOST_MOBY_BUILDKIT_BUILD_TARGETS))
+
 $(eval $(golang-package))
+$(eval $(host-golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
