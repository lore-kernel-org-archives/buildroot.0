Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9123C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:06:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F6C61054
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03F6C61054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FFEB4059D;
	Fri, 12 Nov 2021 18:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6CHNBT4HyoNB; Fri, 12 Nov 2021 18:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D881F40503;
	Fri, 12 Nov 2021 18:06:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7461BF289
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BB1F826B4
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQshMxLhp3jg for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 18:06:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id A62A6826C0
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 18:05:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id law1mHFlmFhvKlaw1myo4v; Fri, 12 Nov 2021 19:05:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636740358; bh=YBYa4AUvnCf2tmPn9Krulgdw3VoOyQuDyrb3yqng1Oo=;
 h=From:To:Subject:Date:MIME-Version;
 b=FN/I44ga1X3o10LnlcgpLaRB2l9R8aUuCJvfruykLk92qG51Z2pyPViLCYJXStlWt
 cOJZAhv61jA7CC3CMLUykAR0wvGam39UzeamsKXJDU33jP71crYCyQjMAx1VvK6SW0
 LNw9RU//WalnFcPAn78h830PESKGqMLbIVZFrw5x+QN+e6Qo2PfNQvAeUIt9dvOvjn
 a+eBdW/oXQsAhRjJc9zciJw1qVd2IgAzQPcyxp1wseSQ/jGVON8mOzNVntCTqjdQbu
 EEfqIBTZbMkuhxxlO38aPgWP9aTox09ox9PEaSwyrDs8JfEKvvRlkE7CC6eS8bYVyl
 T2PhYZT4Fa1yg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 19:05:56 +0100
Message-Id: <20211112180556.2124148-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfM0zLxEaGrUbLtptwgOwxg6DhTOeUJGLope3gxqamNrJiljMf/6fSq1+7aVckPb1hGEITjHvaNtoimKyX7m2g5Q/i3InhirK2wI+KwMQXA2lJ+ST9BZI
 UNKDjD3paJ7TpkkFfeujkc20XJVgxUxrSAvQe6IBv8TDvLPZi93W1Flal25b+ZZ7aDtIm3XM8umeIMy1W499zOJCmJvioSuMsZLvycER5YVzpoE6M0253akh
 sJh1h83me9v54t7aHx4x9V5t3KnsqH55v4qvZdxWpMpk5noLLTR66PJgDc97d8v7fsNuZsitGhuDe3ZUkH5HBA==
Subject: [Buildroot] [PATCH] configs/olimex_a64_olinuxino_defconfig:
 backport gcc >= 10 u-boot and linux patch
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The old U-Boot version used does not build with hostcc >= 10. Backport a
patch fixing that issue. Same goes for Linux so let's backport a patch for
it too.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966188

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ve-redundant-YYLOC-global-declaratio.patch | 52 +++++++++++++++++++
 ...e-redundant-YYLOC-global-declaration.patch | 28 ++++++++++
 configs/olimex_a64_olinuxino_defconfig        |  3 ++
 3 files changed, 83 insertions(+)
 create mode 100644 board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
 create mode 100644 board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch

diff --git a/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
new file mode 100644
index 0000000000..71ae991816
--- /dev/null
+++ b/board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
@@ -0,0 +1,52 @@
+From f9df4186c17d686f1ca38f973d7a3a49e8e37c01 Mon Sep 17 00:00:00 2001
+From: Dirk Mueller <dmueller@suse.com>
+Date: Tue, 14 Jan 2020 18:53:41 +0100
+Subject: [PATCH] scripts/dtc: Remove redundant YYLOC global declaration
+
+gcc 10 will default to -fno-common, which causes this error at link
+time:
+
+  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
+
+This is because both dtc-lexer as well as dtc-parser define the same
+global symbol yyloc. Before with -fcommon those were merged into one
+defintion. The proper solution would be to to mark this as "extern",
+however that leads to:
+
+  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
+   26 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+In file included from dtc-lexer.l:24:
+dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
+  127 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+cc1: all warnings being treated as errors
+
+which means the declaration is completely redundant and can just be
+dropped.
+
+Signed-off-by: Dirk Mueller <dmueller@suse.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+[robh: cherry-pick from upstream]
+Cc: stable@vger.kernel.org
+Signed-off-by: Rob Herring <robh@kernel.org>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index 06c040902444..d1b3810156c7 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.25.1
+
diff --git a/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch b/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
new file mode 100644
index 0000000000..ec60fc5825
--- /dev/null
+++ b/board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch
@@ -0,0 +1,28 @@
+From 018921ee79d3f30893614b3b2b63b588d8544f73 Mon Sep 17 00:00:00 2001
+From: Peter Robinson <pbrobinson@gmail.com>
+Date: Thu, 30 Jan 2020 09:37:15 +0000
+Subject: [PATCH] Remove redundant YYLOC global declaration
+
+Same as the upstream fix for building dtc with gcc 10.
+
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index fd825ebba6..24af549977 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.20.1
+
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index e35c6014bd..7df52dfbdc 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -2,6 +2,9 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
+# System
+BR2_GLOBAL_PATCH_DIR="board/olimex/a64-olinuxino/patches"
+
 # Linux headers same as kernel, a 5.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
