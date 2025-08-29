Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB938CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 07:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8244D6143D;
	Fri, 29 Aug 2025 07:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUiOoavdAxVv; Fri, 29 Aug 2025 07:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87060614D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87060614D8;
	Fri, 29 Aug 2025 07:34:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC071D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90A8B84084
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDs776z7c1FM for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 07:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98D8A84069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D8A84069
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98D8A84069
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:34:04 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afede1b3d05so313051566b.2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 00:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756452842; x=1757057642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ODzYSuE4Aq3t1+cKkkbuIIOI99K5KHggSh5EOZJleck=;
 b=nwX4KF9htSCHhMT2JT9BsOM47lryAFc7j+9IOmBBYrnwlznGVZo7/4orGGkGCddOpE
 O15Sq349cUrIGn0tBn1bTCaL8gCGOM5SOlJNiAVTLfumJXsajFYQybgZHEuik4Lu1njH
 RzF3FwHHXijRw3nRWobH3MneJzD8l0JprYFFOCJKm7w/oR1ji5YZHKYLS9FmH12IBvlk
 wId8duKyYhaH0B3b4SXqAPsUhYwv2yBNlnjwC8wZwakdQ470rWS4UBuPQvjVg8QkJ1o5
 XhbEwToyKW2GTvNK3X3DOrkKhYLqhcE4u7eJ5GIDuLeYoNO4atjKTEmnQ7APQHTJrpun
 5XNA==
X-Gm-Message-State: AOJu0YyxmrUc4qbNTjoGZgNG6ts/C1GvsSZrWBWjEurV7S6IOB8OXsUl
 MxbmUft95efe7zTRM6vPYvUBrM3Nbnv6kYKL5qN6s447s7qHqaaurSGogLjoalQcMg42sbxEzFb
 84mkaUa0=
X-Gm-Gg: ASbGnct8lkr6Xer35NLpsp6S20uacqTkIqzGlNBgJZxe5ufqcSt5fd9hgHnRoGya3vu
 Yz3U6q8KZKrPT6eZ5mm7e0UCsTZeaQpdZlMh3ktsQbcehZqPRRQBG+I3ZjlfQfSEC1LqI2VQRUX
 mcu+8S4Mmcv+BYmKAmWIPKtkr8n1xRtzsDHYxK3L847x6WPO+YNhkewhaDSb6bNTT6YmmeC1bR/
 F71UcW0IJ3NsE4PVuWjIcT3tp0GO/g6XwYx0B7jm8XUJtiRMJshfR0WAPa0a2H3jT9ehlNMEHdh
 i+IDMsuAQ7BB878qf7lAAGl3i1NAN/qBbtapZ98596/xOkJws0oRxgz9Kgz+Y62y/RfpPXC8BYE
 iE37nbxbApaFcKKBN0mWYqnqVkCF1wR3/D/MokMQOK4j5BKFhUIzV3b+XyYbiJt95n1T1ruqB
X-Google-Smtp-Source: AGHT+IFaJd17Sr2bl/HGzg8J+c2H2UtzjE1LrMIbc5y/7bVBOZuxe7RHkSzlmz74+6OvNLPgJp6oaQ==
X-Received: by 2002:a17:906:730a:b0:afe:cbfc:377a with SMTP id
 a640c23a62f3a-afecbfc4431mr856827366b.27.1756452842094; 
 Fri, 29 Aug 2025 00:34:02 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0a591819sm54794466b.41.2025.08.29.00.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:34:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: faessler@was.ch
Date: Fri, 29 Aug 2025 09:33:44 +0200
Message-ID: <20250829073344.73052-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756452842; x=1757057642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ODzYSuE4Aq3t1+cKkkbuIIOI99K5KHggSh5EOZJleck=;
 b=ItuKTEYBr2jkmve8wSE4jikOpXMmfVMJbc/2Io/NKleKXHE+3wb5LfYVcXTjFIB7F1
 Xmyr3ulz9qOJi+yIF+z+Bwn9P0NsWP3Qki08rLoO05zH5hdR08w4s+ImeWVaMc1eDDB5
 He10wdPt3sgBFsbfb95NPqtDq+zRJv2AaeMrD2wDVl/X3R/47aatJAes2jtntlH9A9hX
 2ObwGP7+e4aQL0FtdCdE5Z+Tw94wdn2/cXwkMOAgPPGDfxCL+8YuHN+bwELDBx9IQOOY
 Q5rFmMCcFkiJrTc/6EHTA+cHa3h4pp35Y40MBFNOsWPVYNZ38/2SHWVmjDJ5eFyR+WMJ
 2eUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ItuKTEYB
Subject: [Buildroot] [PATCH 1/1] package/logsurfer: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The logsurfer package has not received updates since 2011 according to
its website [1].

It also fails on the autobuilder when building with GCC14.

Package author did a single contribution to buildroot by adding this
package.

[1] https://crypt.gen.nz/logsurfer/

Fixes: https://autobuild.buildroot.org/results/ed9/ed906670ab7b901d95289b388262d9eded8b2c18
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                 |  6 ++++++
 DEVELOPERS                       |  3 ---
 package/Config.in                |  1 -
 package/logsurfer/Config.in      |  8 --------
 package/logsurfer/logsurfer.hash |  3 ---
 package/logsurfer/logsurfer.mk   | 15 ---------------
 6 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 package/logsurfer/Config.in
 delete mode 100644 package/logsurfer/logsurfer.hash
 delete mode 100644 package/logsurfer/logsurfer.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0bedc24dce..0379a0cc59 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_LOGSURFER
+	bool "logsurfer has been removed"
+	select BR2_LEGACY
+	help
+	  Logsurfer last updates was on 2011 and fails to build with GCC14
+
 config BR2_KERNEL_HEADERS_6_15
 	bool "kernel headers version 6.15.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b33dbf8c5e..d489718424 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -877,9 +877,6 @@ F:	board/qemu/sparc-ss10/
 F:	configs/qemu_sparc_ss10_defconfig
 F:	package/uclibc-ng-test/
 
-N:	Dominik Faessler <faessler@was.ch>
-F:	package/logsurfer/
-
 N:	Dominik Michael Rauh <dmrauh@posteo.de>
 F:	package/gdal/
 
diff --git a/package/Config.in b/package/Config.in
index 899301078e..8a01e7bcc4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2805,7 +2805,6 @@ comment "Utilities"
 	source "package/inotify-tools/Config.in"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
-	source "package/logsurfer/Config.in"
 	source "package/lowdown/Config.in"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
deleted file mode 100644
index 43e2f519e6..0000000000
--- a/package/logsurfer/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_LOGSURFER
-	bool "logsurfer"
-	depends on BR2_USE_MMU # fork()
-	help
-	  Logsurfer is a program for monitoring system logs in
-	  real-time, and reporting on the occurrence of events.
-
-	  http://www.crypt.gen.nz/logsurfer/
diff --git a/package/logsurfer/logsurfer.hash b/package/logsurfer/logsurfer.hash
deleted file mode 100644
index 8e9f5c95bd..0000000000
--- a/package/logsurfer/logsurfer.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://www.crypt.gen.nz/logsurfer/
-md5  4c26a74d813ccf766117c95c644aa601  logsurfer-1.8.tar.gz
-sha256  74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
deleted file mode 100644
index 8eb9dc8f8a..0000000000
--- a/package/logsurfer/logsurfer.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# logsurfer
-#
-################################################################################
-
-LOGSURFER_VERSION = 1.8
-LOGSURFER_SITE = http://downloads.sourceforge.net/project/logsurfer/logsurfer/logsurfer-$(LOGSURFER_VERSION)
-
-define LOGSURFER_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/logsurfer \
-		$(TARGET_DIR)/usr/bin/logsurfer
-endef
-
-$(eval $(autotools-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
