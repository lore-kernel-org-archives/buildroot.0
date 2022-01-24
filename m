Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE11C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE06A60AE2;
	Mon, 24 Jan 2022 07:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5ktEbhLVOlh; Mon, 24 Jan 2022 07:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E7E60AD2;
	Mon, 24 Jan 2022 07:25:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA611BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19F4D40916
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fLfA1TCtLZlX for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:25:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E87540912
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:25:30 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id f8so14569573pgf.8
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uXUjYq5vKMrgW0vi4L8yf8kVNlVtIgy9VOktIi6yUFY=;
 b=8FHiei4p9RhhoenjFIwF4OSHe3GNLESWNXwlTVKxQzCDuysdxrG0ZG9aBiS4vxjAH+
 8miOsw+jxsIyyd++tdostsoTbT7zpmtpdQJ4/Wq9uZcYHA0CBUGYtb0XLxC+BFrZGrJg
 M67HGrDbakXdcqDjT/OSUqda4liAf6fBLd69y+8zosuNGEbhj8xGRNV0s1EJOOuSlYAo
 /cQZlf3VChBQJWdjkIAlBNuiCXkf349J+vuk9On6jkDqBshYzXRX30T5NqmOqbB5i5My
 yZ1yMTJ4o/QZJGqIuIo//3AK44EM3/UimQ2lbijrDmRgD8O3MeNH7X5qM9Qno1UjwcC+
 p4Xg==
X-Gm-Message-State: AOAM5331Id9+wvSfvTtyRjs+jGXuws4pgHqzG300opNsb1ooYwamLDjL
 GnPzfr4i3wTqsT7yZMZT9cQgGRJq7JDa+Q==
X-Google-Smtp-Source: ABdhPJy+yqb9LsusByWs0QK4iaZ95VhSe5FJvHvUUeUYUVY7C1ackpLZnk6CtoehqAuzEhc16w0opA==
X-Received: by 2002:a05:6a00:8cc:b0:4a8:262:49e1 with SMTP id
 s12-20020a056a0008cc00b004a8026249e1mr12709950pfu.28.1643009129491; 
 Sun, 23 Jan 2022 23:25:29 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 e4sm10945488pge.74.2022.01.23.23.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:25:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:25:27 -0800
Message-Id: <20220124072527.29954-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/delve: support building as host
 package
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

Users may want to debug Go programs using dlv on the host machine.

Adds package host-delve and BR2_PACKAGE_HOST_DELVE.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host       | 1 +
 package/delve/Config.in.host | 7 +++++++
 package/delve/delve.mk       | 5 +++++
 3 files changed, 13 insertions(+)
 create mode 100644 package/delve/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 20034f6ee0..341e24926b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,6 +14,7 @@ menu "Host utilities"
 	source "package/cramfs/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
+	source "package/delve/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/delve/Config.in.host b/package/delve/Config.in.host
new file mode 100644
index 0000000000..243b02f6a2
--- /dev/null
+++ b/package/delve/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_DELVE
+	bool "delve"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  Delve is a debugger for the Go programming language.
+
+	  https://github.com/go-delve/delve
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index 6c346552a4..9e00934375 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -14,4 +14,9 @@ DELVE_TAGS = cgo
 DELVE_BUILD_TARGETS = cmd/dlv
 DELVE_INSTALL_BINS = $(notdir $(DELVE_BUILD_TARGETS))
 
+HOST_DELVE_TAGS = cgo
+HOST_DELVE_BUILD_TARGETS = cmd/dlv
+HOST_DELVE_INSTALL_BINS = $(notdir $(HOST_DELVE_BUILD_TARGETS))
+
 $(eval $(golang-package))
+$(eval $(host-golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
