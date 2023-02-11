Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D74C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 15:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AB1F60A68;
	Sat, 11 Feb 2023 15:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AB1F60A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YI-xee1FyHB9; Sat, 11 Feb 2023 15:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BB89607FF;
	Sat, 11 Feb 2023 15:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BB89607FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 864711BF293
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66009607FF
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66009607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id snxrBACcxmBb for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 15:58:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AADEC60644
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AADEC60644
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 15:58:37 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so6069327wmb.5
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 07:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvP4vMs2gTIYrKyGiGkyW0GBCh9JI4kbQYURoeWUPHg=;
 b=CFX+RdgzcK52c+aqY5AFiFHnv3QULrFrwLDHXH2fSRpZ0ZIBKhkNJfRMjqOczx4j6t
 CEprEI2csZe/7H/IfbYH3IiC/gxmbf+b7cx9aYSlbpp0gknX7V4uKblni9NXwv3RZ0Fg
 ycKP6QFE7DjLpZ5gXo34YGVSAMo6UY9Q8qipQ0E6viuiuj7Z5Z/HorGLdY9RG0Y+ztWA
 FzLeD9tyNBjHOOycIDlWkcoZ4CJUWBBIcAXB6HjUvt67gGg/8k0AGMBt0gCnRPPHKqIA
 QVGTkAaqRAkvJsRnfnhkFVY5lDubi7ffnJ6iCygFvUGXI6xGM/J9Ozx360daYCLIiZNC
 DQjg==
X-Gm-Message-State: AO0yUKUyPuTCxVxGayRkSOePE6qczcA40NrD6DE8CAMAVnw8eBFOzuVe
 FBEXFY4/lk9zMCNKQifWUPgEm22aMmE=
X-Google-Smtp-Source: AK7set+a8Z/vJ9PiFQMcbrpB0gIUxQpBq6R59Gr1pyCULJi+yHtpuFw8SXIlN4OJhBSpEuQISLgaAg==
X-Received: by 2002:a05:600c:4485:b0:3e0:185:e93a with SMTP id
 e5-20020a05600c448500b003e00185e93amr15764664wmo.25.1676131115377; 
 Sat, 11 Feb 2023 07:58:35 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:b1c2:a5a5:e7a1:4a02])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003daf681d05dsm9177191wms.26.2023.02.11.07.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 07:58:34 -0800 (PST)
From: thomas@devoogdt.com
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 16:58:26 +0100
Message-Id: <20230211155826.285037-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/config-fragments: add a bootlin s390x
 toolchain
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

I do constantly get mails that fluent-bit fails to build for s390x.
So added this to ensure that the s390x architecture is checked as well
if I manually do:

$ ./utils/test-pkg -p fluent-bit -a

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 .../autobuild/bootlin-s390x-z13-glibc.config                 | 5 +++++
 support/config-fragments/autobuild/toolchain-configs.csv     | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config

diff --git a/support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config b/support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config
new file mode 100644
index 0000000000..fe3f0380c9
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config
@@ -0,0 +1,5 @@
+BR2_s390x=y
+BR2_s390x_z13=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 0b19051543..a65e9bacc3 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -38,6 +38,7 @@ support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv32-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv64-musl.config,x86_64
+support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
