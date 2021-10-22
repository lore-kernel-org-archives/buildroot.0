Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B25C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 21:55:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785F46103E
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 21:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 785F46103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA39D40112;
	Fri, 22 Oct 2021 21:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHKiNXHeLOUs; Fri, 22 Oct 2021 21:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 000D3402DB;
	Fri, 22 Oct 2021 21:55:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C05691BF289
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 21:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE78183AB1
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 21:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHwDHzb6bk51 for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 21:55:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A19583AA1
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 21:55:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso3504712wms.5
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 14:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MzwiZh+YOmHp3Xq6OPvyOpQfKJhDlCn13XZvKJ9GrNs=;
 b=FWjjR/9pw1ywv+a4Yqwbi9tFQ1Z5t+nMdI2mJkxvvIoKuJT88IT06K+4gWm8PDZEi5
 a003S4PeSy2uh4CPMN/YKuq1yfzaSXUpRaGBR3ji6a/G8gI5Vmgj/OoFVCfIifA+fKjG
 nySFF6AINzkGK6UBbLTsXYX//8+FKFRFp5OmiaKNJH0u9SlHs6DKVNXkwCmZdxmcA2x1
 d/KXrUua9QoX76wSgRIAauOPz24xS92sFVa+ljdQ335ivXx5EDZ6nA5aPBqjuRxAvHgT
 byudmh4OQsQ8q0i8eXmYCvJlxpIOp4NtFlTsYY5S/fyS60oeB+a0FjriMHLkk6cCB43P
 0PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MzwiZh+YOmHp3Xq6OPvyOpQfKJhDlCn13XZvKJ9GrNs=;
 b=ZypfzIz8x41fGRqiMQtOitpBB+2QMPY9NLmcpqysTkHZmoyBMUa17t7zR/HTwUBbvC
 EShiCaSkTJhU+YTbPx85bgQrxRDAywn4BpgKR2Y7whibwRqYESauJEQiT4zwlTV7S0bS
 02uv6EKrchABEDrGDX/fcz+MMpYYwXq0TxWx2PjCPJ4Tsh318iEByFLQtWH9uYZd71Xs
 QCy1g6NKUGBhV3FTFIjNKcYlhP/91bV83xhkkyb339VgVmp/nA/Nmau2MrgHW4Y5yXse
 Ao2lWysFHF+V6TnCIvu98j+HrvXjBvat/CKD98cUoYqlOgd21yHkPJw+Ul5eVjYns3xD
 TSBA==
X-Gm-Message-State: AOAM533eorN8ceNZxn+8RpkVydNlPEkEibbDTH0NIrQaDtKCuEmsLuTp
 3Z1/forulPH6TGZ9ZK4/YY66Zexw25o=
X-Google-Smtp-Source: ABdhPJyLV4tlndixRMLbazEDhYnmCu3Hm7aAAZFYWWfgB1j6M0jjq2E76zp4deaBF/p0KOr8eSAAVw==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr2609488wmh.104.1634939702218; 
 Fri, 22 Oct 2021 14:55:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id d9sm8639896wrm.96.2021.10.22.14.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 14:55:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 23:53:37 +0200
Message-Id: <20211022215337.1990017-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix build with headers
 < 3.14
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 2.37.2 in
commit 27a46793b1a0c6c13c00b07d07bd5743e2c9c7b6 and the addition of
uclampset in
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=9dd95bea42a3b467c1f773fd2e781cc9f0d88847:

checking for syscall sched_setattr... no
configure: WARNING: Unable to detect syscall sched_setattr.
checking for syscall sched_setattr... (cached) no
configure: WARNING: Unable to detect syscall sched_setattr.
configure: error: uclampset selected but sched_setattr syscall not found

Fix this build failure by adding a dependency on headers >= 3.14 for
scheduling utilities:
https://github.com/torvalds/linux/commit/fded4329da9e8486b434d6c4aceab1ab3f433d8a

Fixes:
 - http://autobuild.buildroot.org/results/9fe26ab98c93b67f937293f28625843da7ccb77f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-tools/Config.in | 6 ++++--
 package/util-linux/Config.in  | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 2287ef5888..28641dccdd 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -105,6 +105,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	depends on BR2_USE_MMU  # bash
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # util-linux schedutils
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_NCURSES
@@ -126,9 +127,10 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	  This is very much a use at your risk option and may not work
 	  for every setup or every architecture.
 
-comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dynamic library"
+comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dynamic library and headers >= 3.14"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
 config BR2_PACKAGE_LINUX_TOOLS_TMON
 	bool "tmon"
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index f045361ab5..9e9b8933e5 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -330,8 +330,12 @@ comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic lib
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	help
-	  Scheduling utilities (chrt, ionice, taskset)
+	  Scheduling utilities (chrt, ionice, taskset, uclampset)
+
+comment "scheduling utilities need a toolchain w/ headers >= 3.14"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
