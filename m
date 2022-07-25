Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DC2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 00:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0FE83E56;
	Mon, 25 Jul 2022 00:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B0FE83E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zhx955wRdEPf; Mon, 25 Jul 2022 00:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 825DE8348C;
	Mon, 25 Jul 2022 00:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 825DE8348C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A066E1BF96B
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 00:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A3A28348C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 00:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3A28348C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pF4bi7mu5R64 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 00:24:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9B783443
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D9B783443
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 00:24:19 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 cb12-20020a056830618c00b00616b871cef3so7623671otb.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 17:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=crgfcv6c4s/6c5bo328pH12GbJlViqVa2b5VRxa0m1M=;
 b=0Hfd188nENftW03WLzhD0NN82c4HDNZbjS75Z958gzqT5Rm6PSz7tjvYD59QSv6qv/
 hSBrYQgovoSk7cpINAdpOSn7tBD24szb9oRjdc1dwG6ja2FuPrlaVPGeH2fJW51apAWY
 Xk8G6lu5tKI83HWiZidIvNbzBnKK0T5JgxCVC/D8kY3Y1f/uTm7Pv/spKRM36iXXPw9Y
 i9k4uoQRbdtB5W9k9jl/NYXlxzJQ282TP3n6VlmYu+6eIG6YuUGS4Y4OXCmbsmwHkcX6
 FYVjKj/f/yqrifPOxivpgvRa+YWCUZ0MbXky/FcJDEaW1Loo0RmyyGImUWuUhzjxnVrq
 2Q8w==
X-Gm-Message-State: AJIora+WE0j95WIAuQ7U03ARTbT6flhKVZvwyaU52gCNbOwkQ5F7l7N4
 cRcM5C+ezcWsVY6AQSTaXF0Lg+TDJpeFfQ==
X-Google-Smtp-Source: AGRyM1tO9nIooB5kwPkC9PySdJ/xZ4qQnrr7Rj2xHL8NpbzF5UIM4ve+SPKTrYyc2ELRftTAQ1oTXA==
X-Received: by 2002:a05:6830:3116:b0:61c:bcc5:f066 with SMTP id
 b22-20020a056830311600b0061cbcc5f066mr3817207ots.50.1658708657849; 
 Sun, 24 Jul 2022 17:24:17 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 h17-20020a056870d25100b0010c3655967csm5176239oac.40.2022.07.24.17.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 17:24:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 17:24:14 -0700
Message-Id: <20220725002414.704892-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/1] package/runc: add host package
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

Adds support for building runc as a host package.

The bin name and gomod have to be specified as the pkg-golang infrastructure
assumes the bin name will be "host-runc" on default.

Signed-off-by: Christian Stewart <christian@paral.in>

---

changes v3 -> v4:

 - drop unnecessary GOMOD line
 - remove seccomp and apparmor tags for host package
 - thanks Thomas for the review.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host      | 1 +
 package/runc/Config.in.host | 8 ++++++++
 package/runc/runc.mk        | 6 ++++++
 3 files changed, 15 insertions(+)
 create mode 100644 package/runc/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 71f2a9311c..8078a8304d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -82,6 +82,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
+	source "package/runc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
new file mode 100644
index 0000000000..ce0dd518a6
--- /dev/null
+++ b/package/runc/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_RUNC
+	bool "host runc"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  runC is a CLI tool for spawning and running containers
+	  according to the OCP specification.
+
+	  https://github.com/opencontainers/runc
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 5faa8b683d..8ccff13a3e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -23,4 +23,10 @@ RUNC_TAGS += seccomp
 RUNC_DEPENDENCIES += libseccomp host-pkgconf
 endif
 
+HOST_RUNC_BIN_NAME = runc
+HOST_RUNC_LDFLAGS = $(RUNC_LDFLAGS)
+HOST_RUNC_TAGS = cgo static_build
+HOST_RUNC_INSTALL_BINS = $(HOST_RUNC_BIN_NAME)
+
 $(eval $(golang-package))
+$(eval $(host-golang-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
