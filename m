Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E43FD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B72E240735;
	Wed,  7 Jan 2026 17:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv5iUzy7MHdv; Wed,  7 Jan 2026 17:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B538C4085F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767807923;
	bh=06fiUzumv86Z+5TxoShkQGLA3Xd69zDIERA3IAl4Np0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CmFw8t87Qd0tT5KAIHnr0alfKFGI1kppJGqmdeAJDZt3M+HIKN8NwglFdJfKXZ6OQ
	 yXW3uzpAHFNjIMdvJomj5kpBYoVuZuUZhcqjyeWniZYon/SS9NollGgyd75/0TQwnR
	 qR3rGNHE4kMPXZQ7WrJy7/+Pij5PpmlmcaFt/5QGK8Ej6srVxAuoseOO0U5yEF/h3I
	 KSXXtC6+SEuEvVxTk+mLg5r0zQ0GiMMpEsajlWXQiM56fMFVRKF3KYVpcFV22Y/qQ8
	 3I1Kj29HbWJCdd2sIEsr4pP85XIZ0leDUJ9tltBt7pZCYemtbfpKqgrBlyxyuhRr9u
	 xDFbBlRij3tYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B538C4085F;
	Wed,  7 Jan 2026 17:45:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF3519ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5E6340263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdkobaPwUG4N for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 809BE40160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809BE40160
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 809BE40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:45:21 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C890B13F8B3;
 Wed,  7 Jan 2026 18:45:17 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 18:45:09 +0100
Message-ID: <20260107174509.2469650-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107174509.2469650-1-vjardin@free.fr>
References: <20260107174509.2469650-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767807919;
 bh=ON5cFObWYxn+1bUi591blmkJJwITRKf0sNOSpHBI+1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bxuemWjwrnSNQKJFgbNNG5zsce+J6X65y/cdgV+6jFCLxUT1mwxsZNIjTVgpTRXjR
 Qr7FODEdVBgBLbyybPnpXH0Hb49c3s+zWlT4hz2GT10igCUEipd/Ypqecbqo9q/S11
 2oFjSEaAlmBa6qBd/xi8kytL4WYka6Wg/7RGxUmXWpBVAtV3d9RVNUCfbMbETNzOIH
 gMZ7o9Hf5eIxR4GDvdJ72aNq2gFqaGny7wzcR+N51Nk6XGwfor9DftB4z23v6tkkFH
 oOHDvPWKheV77pJxxB0fU0GLZiqOzgZH089FpWZWdouADRNdhXYejYrlf681qmKZvB
 Bh1IqiDkBAIHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bxuemWjw
Subject: [Buildroot] [PATCH v1 1/1] package/daemonize: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

daemonize is a utility for running a command as a Unix daemon.
It properly detaches from the controlling terminal, sets up a
clean environment, and handles pid files.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...etopt-fix-implicit-write-declaration.patch | 33 +++++++++++++++++++
 package/daemonize/Config.in                   |  9 +++++
 package/daemonize/daemonize.hash              |  5 +++
 package/daemonize/daemonize.mk                | 16 +++++++++
 6 files changed, 65 insertions(+)
 create mode 100644 package/daemonize/0001-getopt-fix-implicit-write-declaration.patch
 create mode 100644 package/daemonize/Config.in
 create mode 100644 package/daemonize/daemonize.hash
 create mode 100644 package/daemonize/daemonize.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..c026b409e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3356,6 +3356,7 @@ N:	Vincent Jardin <vjardin@free.fr>
 F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
+F:	package/daemonize/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
diff --git a/package/Config.in b/package/Config.in
index def3db0e50..332ce359a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2789,6 +2789,7 @@ menu "System tools"
 	source "package/criu/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
+	source "package/daemonize/Config.in"
 	source "package/dc3dd/Config.in"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
diff --git a/package/daemonize/0001-getopt-fix-implicit-write-declaration.patch b/package/daemonize/0001-getopt-fix-implicit-write-declaration.patch
new file mode 100644
index 0000000000..494b21f399
--- /dev/null
+++ b/package/daemonize/0001-getopt-fix-implicit-write-declaration.patch
@@ -0,0 +1,33 @@
+From: Vincent Jardin <vjardin@free.fr>
+Date: Tue, 7 Jan 2026 10:00:00 +0100
+Subject: [PATCH] getopt: fix implicit write() declaration for modern compilers
+
+The ERR macro declares 'extern int write();' with no parameters (K&R C
+style). Modern C compilers (C99+) treat this as a function taking no
+arguments, causing a build error when write() is called with 3
+arguments.
+
+Fix by including <unistd.h> which provides the correct prototype for
+write(), and remove the incorrect extern declaration.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/bmc/daemonize/pull/39
+---
+ getopt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/getopt.c b/getopt.c
+index 1234567..abcdefg 100644
+--- a/getopt.c
++++ b/getopt.c
+@@ -43,9 +43,9 @@
+ #include <stdio.h>
+ /* We're ANSI now; we're guaranteed to have strchr(). */
+ #include <string.h>
++#include <unistd.h>
+
+ #define ERR(s, c)	if(x_opterr){\
+-	extern int write();\
+ 	char errbuf[2];\
+ 	errbuf[0] = c; errbuf[1] = '\n';\
+ 	(void) write(2, argv[0], (unsigned)strlen(argv[0]));\
diff --git a/package/daemonize/Config.in b/package/daemonize/Config.in
new file mode 100644
index 0000000000..0247defe19
--- /dev/null
+++ b/package/daemonize/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DAEMONIZE
+	bool "daemonize"
+	help
+	  daemonize is a command-line utility that runs a command
+	  as a Unix daemon. It detaches a process from the
+	  controlling terminal and sets up the usual daemon
+	  environment (closing FDs, setsid(), changing directory).
+
+	  https://software.clapper.org/daemonize/
diff --git a/package/daemonize/daemonize.hash b/package/daemonize/daemonize.hash
new file mode 100644
index 0000000000..9961648275
--- /dev/null
+++ b/package/daemonize/daemonize.hash
@@ -0,0 +1,5 @@
+# From https://github.com/bmc/daemonize/archive/refs/tags/release-1.7.8.tar.gz
+sha256  20c4fc9925371d1ddf1b57947f8fb93e2036eb9ccc3b43a1e3678ea8471c4c60  daemonize-1.7.8.tar.gz
+
+# Locally computed
+sha256  8a4306c315b0d2975f2b70fa17ab1e193b32a674759e736442174d748ab27fbe  LICENSE.md
diff --git a/package/daemonize/daemonize.mk b/package/daemonize/daemonize.mk
new file mode 100644
index 0000000000..721f14e3e5
--- /dev/null
+++ b/package/daemonize/daemonize.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# daemonize
+#
+################################################################################
+
+DAEMONIZE_VERSION = 1.7.8
+DAEMONIZE_SITE = $(call github,bmc,daemonize,release-$(DAEMONIZE_VERSION))
+DAEMONIZE_LICENSE = BSD-3-Clause
+DAEMONIZE_LICENSE_FILES = LICENSE.md
+
+# Configure test for setpgrp() tries to run a test binary and breaks when
+# cross-compiling. Override the autoconf cache variable instead of patching.
+DAEMONIZE_CONF_ENV = ac_cv_func_setpgrp_void=yes
+
+$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
