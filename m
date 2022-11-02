Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E93AC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 12:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7E81408D2;
	Wed,  2 Nov 2022 12:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7E81408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDcC7REvEEDA; Wed,  2 Nov 2022 12:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 979E640168;
	Wed,  2 Nov 2022 12:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 979E640168
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6666A1BF366
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 12:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4181060E68
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 12:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4181060E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88STIZ7DJeRA for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 12:35:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6EAB60E5E
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6EAB60E5E
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 12:35:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l14so24334811wrw.2
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 05:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQVauVydg/Sh68TAaFyDPAZTUZHdBNP927kPdPi4dLw=;
 b=LDb3I/DwGjtnT0pvSk85RCta6hg1sD7ARLfEU/lfQ6VWB2bpV7bRZsPQYLeXOcMshO
 cMxRNyDaq4R3KzEDkuNeaDxgpyMXteb13SBin+YHQ3uz8n4MQkNiUOqy60zkBROZWzkA
 heqnqXeutFmCx0DV77/HqtnSqaLOkbw+DECvQHk+ULDoRMOTpImKub/6SEcfQoZCowqA
 bSMBUJmbQoHE7RT/NBvDi6swCS44VdWPXPal//zDw4ZwKtaq8NcbLKDkwJOa1gLEqdrL
 9NUWDh85QFyWh2fPVZBbPcUnsRHlFtn8nPUGJHPYRbgAfdLIg8sirN+7rBp1wLeWuzlh
 zOCQ==
X-Gm-Message-State: ACrzQf2Vs6/7ldrtp7IP9BOTnIETBiDL9in4FiNHdQc3jf4DNoE+4iuV
 G9QoU9Imhj4o9fCu3RZTHCoo+EAfPnM=
X-Google-Smtp-Source: AMsMyM4xdFgVSvoLxpz9XJOtfJ1AlzFnRWFqQXaF8qqQ51C8NOnbtK3IsQM8I3olV1MO0YtGxJvJ8g==
X-Received: by 2002:adf:a3c1:0:b0:236:acff:e2d2 with SMTP id
 m1-20020adfa3c1000000b00236acffe2d2mr14935796wrb.255.1667392502509; 
 Wed, 02 Nov 2022 05:35:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003cf87623c16sm1794495wmb.4.2022.11.02.05.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:35:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:35:00 +0100
Message-Id: <20221102123500.311904-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VQVauVydg/Sh68TAaFyDPAZTUZHdBNP927kPdPi4dLw=;
 b=Pd9xeovsalZvqt1SESgEj6MnBqIPXIO7LCrynTVW0d4Fr3OWCRcOdBqc6mqpEGNUBL
 OHk5rb+ECFgmPYnMBE9XoaX6dy3OoLFk1itIl23Ds3wiUyZ79atjm2e27t/5z1zq6YMB
 jnFEBOLU6t95ATmwYvWA1E9o5k+eIcLDrXTt77XuwMJkPwNkCNbrc283dJgm9L0yNKQZ
 10uGHgHw5USSpotv9a/quiZyLPXH0ubR+72c17TaopTcoK2NSP5JsyF2N0vFk5IPldrX
 s+aDX3yjoCVYCRsNWHUb7FThHEA6BJbSbaX3oshovD9G0LUMk/6/dVNF0P9rstAyuHhS
 ubQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Pd9xeovs
Subject: [Buildroot] [PATCH 1/1] package/numactl: link with -latomic if
 needed
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 2.0.16 in
commit e9bc980d93a189a16e7320bd254b906c87ca9f87:

/nvmedata/autobuild/instance-7/output-1/per-package/numactl/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_police_memory':
libnuma.c:(.text+0xe28): undefined reference to `__atomic_fetch_and_1'

Fixes:
 - http://autobuild.buildroot.org/results/a92c1c60518d3fe08f3f808f9cc812031e85a4e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-link-with-latomic-if-needed-again.patch | 41 +++++++++++++++++++
 package/numactl/numactl.mk                    |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 package/numactl/0001-link-with-latomic-if-needed-again.patch

diff --git a/package/numactl/0001-link-with-latomic-if-needed-again.patch b/package/numactl/0001-link-with-latomic-if-needed-again.patch
new file mode 100644
index 0000000000..54d55656ec
--- /dev/null
+++ b/package/numactl/0001-link-with-latomic-if-needed-again.patch
@@ -0,0 +1,41 @@
+From 692abb6d751a41c7f0206771ecd454933750256e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Nov 2022 13:28:02 +0100
+Subject: [PATCH] link with -latomic if needed (again ...)
+
+numactl unconditionally uses __atomic_fetch_and but some architectures
+(e.g. sparc) needs to link with -latomic to be able to use it. So check
+if -latomic is needed and update numa.pc accordingly.
+
+This linking was made by e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9 but
+wrongly reverted by 10c277c20768be9a563f75265bcd7e73954763ad resulting
+in the following build failure on sparc or microblaze:
+
+/nvmedata/autobuild/instance-7/output-1/per-package/numactl/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_police_memory':
+libnuma.c:(.text+0xe28): undefined reference to `__atomic_fetch_and_1'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/54b7567d804d9abff56f47cd26bae774c1e38669
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/numactl/numactl/pull/144]
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8510fc5..ebf9917 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,6 +27,8 @@ AM_CONDITIONAL([RISCV64], [test x"${target_cpu}" = x"riscv64"])
+ 
+ AC_CONFIG_FILES([Makefile])
+ 
++AC_SEARCH_LIBS([__atomic_fetch_and_1], [atomic])
++
+ # GCC tries to be "helpful" and only issue a warning for unrecognized
+ # attributes.  So we compile the test with Werror, so that if the
+ # attribute is not recognized the compilation fails
+-- 
+2.35.1
+
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index b2f349255f..157f953c51 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -10,6 +10,8 @@ NUMACTL_SITE = \
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 NUMACTL_INSTALL_STAGING = YES
+# We're patching configure.ac
+NUMACTL_AUTORECONF = YES
 NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
