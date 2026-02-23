Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84843E98DEF
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 06:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D83D40D20;
	Mon, 23 Feb 2026 06:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sml3IUHNF_Ns; Mon, 23 Feb 2026 06:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6AAB40D27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771829975;
	bh=5m4LXVx1lS44/zgKL0Tw3vzwJSjUaDAzX/1Slf00wZw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nY2SkX0G37u85kFs/pki/YYaqhE87+SUBZZOAUOcABZa9fdLD1X4o10/UCV2yz5Dw
	 vcUff/dA++m5nhIHMSbNMzbPAvkuEZ8gukx4tJ9YK7cPJrI5zSIwuPwVANBiXNhYW3
	 7xKbZAuUt6zF9LIYxEb/A/jFBBQ17z08Nzf1Hyn4bGhFt3GA7Nx7DAUMIeJF0MCA8K
	 GphuYohwhyDmCf5wSJdmjamL++/eRJtyXZu08eo46NSJZBKG2kcCJhVY+BiHhsRFzt
	 qXIaUa63YV2qmNUpLPmSzSbdWrHb2Gnwn1WX82CU4BigVPcbfQbtNhAoGM/z4U7tWr
	 Z3tMAGvq4r8sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6AAB40D27;
	Mon, 23 Feb 2026 06:59:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8F4E1CE
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 06:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97C2F40061
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 06:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adUwH3zEoR9k for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 06:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75F1840018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75F1840018
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75F1840018
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 06:59:33 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3530715386cso3180948a91.2
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 22:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771829972; x=1772434772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+TR54jE1erQrw9bPmcAt40369EjaTjp22t8ymWut5M=;
 b=hcP9IwKd2Nnj0RGWMay/2zH1hjVzLdu6eYOk5zcSF91Nl27wiUKEdsHKTZelvolfKY
 cz9XxPZY6FDtUuvnql1bHLy3skUS/kU41DaP/QbcgHuj7pnpppJVzPN5c208ZGIZTY2B
 0pzjz0ATIYVFnzLO81sA6f5WWJLdghI9coYcsKgjnFDT3+rE1V/CB3cB1v4hcoypjwvd
 CJRwSuVi2pQtr0bB0I754yk3RxKgJ+4unpl35TK68nQGfBKwyc3MGPO4AZzKh0o496e9
 EJ8OECDgPYMBJUUGSOZr2TZKiZAOp9HoZVYrkXmwNqYXKjallj22v8zHoZ+9kPuQYPNF
 4mdw==
X-Gm-Message-State: AOJu0YzVcdsxanzh+ihCX/bIpaKUJ7WnhXDILbfEvfOCfpQCeqnwxpyz
 cj8tJkuTmgtYn3Wr7kTEAipepOloLHZampA6bDiP8GcvlbJEWxSmZaWMf7DTgC7oIwYuUQ==
X-Gm-Gg: ATEYQzylCZtc8eLRYr0gZHGIWjmuu0fLtO23VcZ7cWojltovLp/ZjGHdtMm6BeFrgFg
 YKEDEeu2EjHpXfnUTPd63iWICXSkf0SOCkwWp+tSTMomlwY35Mi8XsawIw3f12dWZKZYoIc1jaP
 wIwM0ii6T9AuDbGrf0V8xYS6vaS1EdL2TKb/daRisvn6CuudIyrYkbDgE3VH5bYgvcChOgwMKjl
 TAFrk12OHZvnyxMYfhgPy81qN6Xbsvai77qynBFEM/lsuI7sgljT4L3tLFgnFUv7scKgK1DeFtW
 MvLjXEjD5yTCmdjLlV/5vsyzU94Iq+BipL2wF3fTw8JGU3SnShqQkXTBJawy3ScPTJQoQr6FNBN
 UkDEjIow2in4bM0aXiZ4Hg8MbUX102flHbSHt70MUFoORUxplYIp2Ww/qWoE3Pz6TW3223Qd4ST
 NsiDjUoCCSyI6mfIiKeHYOYwwvjXMptFyzRw==
X-Received: by 2002:a17:90b:4b10:b0:356:72f3:acaf with SMTP id
 98e67ed59e1d1-358ae8dbc97mr6459084a91.32.1771829971361; 
 Sun, 22 Feb 2026 22:59:31 -0800 (PST)
Received: from fedora ([2409:40e5:116b:88d4:3795:8a9b:7eb9:b495])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-358a1a2cb62sm6715576a91.0.2026.02.22.22.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 22:59:30 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Feb 2026 12:29:11 +0530
Message-ID: <20260223065911.11327-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771829972; x=1772434772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B+TR54jE1erQrw9bPmcAt40369EjaTjp22t8ymWut5M=;
 b=DvaDCUM9+8YVTHct+H64gpaeNLjq57sljQRNxjli4flE/XC2ejlAPdmUVkn75Hl366
 8Zz06vzMwTnExWHj3q/APBfpmhdq/j5DNroFkotDZ7QnhqoWS0T+jDsii63GRsOIbVr6
 fYJxkbUyzxm8ltoTL8SKjRrZ58bMSXI+/mYVwLyjkcxtKTq9IkxRYuMtYZ86Qph0Wecd
 okAvTcNQ+gizOOsOsNzAsUYMBdIAHHYMEr0PdkvbV/kz3jI9xYs/r/aRREbfbEcFFfRV
 T/axKR03xIMl0MwIiUSG0PsI3XkwxYAb3H6bS4tFwICg9DlQJJsx89/9eUr/XLLlqLWX
 IrnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DvaDCUM9
Subject: [Buildroot] [PATCH] proot: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PRoot is a user-space implementation of chroot, mount --bind,
and binfmt_misc. This means that users don't need any
privileges or setup to do things like using an arbitrary
directory as the new root filesystem.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...ld-by-replacing-get_current_dir_name.patch | 29 ++++++++++
 .../proot/0002-fix-musl-and-warnings.patch    | 56 +++++++++++++++++++
 .../0003-remove-deprecated-sp-clobber.patch   | 24 ++++++++
 ...004-remove-deprecated-sp-clobber-arm.patch | 24 ++++++++
 package/proot/Config.in                       | 19 +++++++
 package/proot/proot.hash                      |  4 ++
 package/proot/proot.mk                        | 52 +++++++++++++++++
 9 files changed, 212 insertions(+)
 create mode 100644 package/proot/0001-path-temp.c-fix-musl-build-by-replacing-get_current_dir_name.patch
 create mode 100644 package/proot/0002-fix-musl-and-warnings.patch
 create mode 100644 package/proot/0003-remove-deprecated-sp-clobber.patch
 create mode 100644 package/proot/0004-remove-deprecated-sp-clobber-arm.patch
 create mode 100644 package/proot/Config.in
 create mode 100644 package/proot/proot.hash
 create mode 100644 package/proot/proot.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..3848a2ee07 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3055,6 +3055,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/proot/
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..619ca6220f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2847,6 +2847,7 @@ menu "System tools"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
 	source "package/procs/Config.in"
+	source "package/proot/Config.in"
 	source "package/psmisc/Config.in"
 	source "package/pwgen/Config.in"
 	source "package/qbee-agent/Config.in"
diff --git a/package/proot/0001-path-temp.c-fix-musl-build-by-replacing-get_current_dir_name.patch b/package/proot/0001-path-temp.c-fix-musl-build-by-replacing-get_current_dir_name.patch
new file mode 100644
index 0000000000..3cef5f1e2d
--- /dev/null
+++ b/package/proot/0001-path-temp.c-fix-musl-build-by-replacing-get_current_dir_name.patch
@@ -0,0 +1,29 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sun, 22 Feb 2026 20:00:00 +0530
+Subject: [PATCH] path/temp.c: fix musl build by replacing get_current_dir_name
+
+get_current_dir_name() is a GNU extension and not available in musl.
+Replace it with POSIX-compliant getcwd(NULL, 0) which is supported by
+glibc, musl and uClibc on Linux.
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ src/path/temp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/path/temp.c b/src/path/temp.c
+index 4160000..4160001 100644
+--- a/src/path/temp.c
++++ b/src/path/temp.c
+@@ -202,7 +202,7 @@ static int remove_temp_directory2(const char *path)
+ 	cwd = malloc(PATH_MAX);
+ 	getcwd(cwd, PATH_MAX);
+ #else
+-	cwd = get_current_dir_name();
++	cwd = getcwd(NULL, 0);
+ #endif
+ 
+ 	status = chmod(path, 0700);
+-- 
diff --git a/package/proot/0002-fix-musl-and-warnings.patch b/package/proot/0002-fix-musl-and-warnings.patch
new file mode 100644
index 0000000000..2e6ca87911
--- /dev/null
+++ b/package/proot/0002-fix-musl-and-warnings.patch
@@ -0,0 +1,56 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sun, 22 Feb 2026 21:00:00 +0000
+Subject: [PATCH] fix musl/uclibc build and compiler warnings
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ src/cli/cli.c | 7 ++++---
+ src/compat.h  | 1 +
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/cli/cli.c b/src/cli/cli.c
+index a1b2c3d..e4f5g6h 100644
+--- a/src/cli/cli.c
++++ b/src/cli/cli.c
+@@ -23,7 +23,8 @@
+ #include <stdio.h>         /* printf(3), */
+ #include <stdbool.h>       /* bool, true, false,  */
+ #include <linux/limits.h>  /* ARG_MAX, PATH_MAX, */
+-#include <string.h>        /* str*(3), basename(3),  */
++#include <string.h>
++#include <libgen.h>
+ #include <talloc.h>        /* talloc*,  */
+ #include <stdlib.h>        /* exit(3), EXIT_*, strtol(3), {g,s}etenv(3), */
+ #include <assert.h>        /* assert(3),  */
+@@ -33,7 +34,7 @@
+ #include <limits.h>        /* INT_MAX, */
+ 
+ /* execinfo.h is GNU extension, disable it not using glibc */
+-#if defined(__GLIBC__)
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ #include <execinfo.h>      /* backtrace_symbols(3), */
+ #endif
+ 
+@@ -556,7 +557,7 @@
+ 
+ /* since we rely on GLIBC extensions, disable all of this code if
+  * __GLIBC__ is not defined */
+-#if defined(__GLIBC__)
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ static int indent_level = 0;
+ 
+ void __cyg_profile_func_enter(void *this_function, void *call_site) DONT_INSTRUMENT;
+diff --git a/src/compat.h b/src/compat.h
+index b2c3d4e..f5g6h7i 100644
+--- a/src/compat.h
++++ b/src/compat.h
+@@ -22,6 +22,7 @@
+ 
+ #ifndef COMPAT_H
+ #define COMPAT_H
++#include <linux/sched.h>
+ 
+ /* Local definitions for compatibility with old and/or broken distros... */
+ #    ifndef AT_NULL
diff --git a/package/proot/0003-remove-deprecated-sp-clobber.patch b/package/proot/0003-remove-deprecated-sp-clobber.patch
new file mode 100644
index 0000000000..4c0077332a
--- /dev/null
+++ b/package/proot/0003-remove-deprecated-sp-clobber.patch
@@ -0,0 +1,24 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sun, 22 Feb 2026 21:00:00 +0000
+Subject: [PATCH] loader/assembly-arm64.h: remove deprecated sp clobber
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ src/loader/assembly-arm64.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/loader/assembly-arm64.h b/src/loader/assembly-arm64.h
+index c3d4e5f..g6h7i8j 100644
+--- a/src/loader/assembly-arm64.h
++++ b/src/loader/assembly-arm64.h
+@@ -39,7 +39,7 @@
+ 		"br %1				\n"		\
+ 		: /* no output */				\
+ 		: "r" (stack_pointer), "r" (destination)	\
+-		: "memory", "sp", "x0");			\
++		: "memory", "x0");			\
+ 	__builtin_unreachable();				\
+ 	} while (0)
+ 
diff --git a/package/proot/0004-remove-deprecated-sp-clobber-arm.patch b/package/proot/0004-remove-deprecated-sp-clobber-arm.patch
new file mode 100644
index 0000000000..858f186456
--- /dev/null
+++ b/package/proot/0004-remove-deprecated-sp-clobber-arm.patch
@@ -0,0 +1,24 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Mon, 23 Feb 2026 00:00:00 +0000
+Subject: [PATCH] loader/assembly-arm.h: remove deprecated sp clobber
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ src/loader/assembly-arm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/loader/assembly-arm.h b/src/loader/assembly-arm.h
+index d4e5f6g..h7i8j9k 100644
+--- a/src/loader/assembly-arm.h
++++ b/src/loader/assembly-arm.h
+@@ -39,7 +39,7 @@
+ 		"mov pc, %1				\n"	\
+ 		: /* no output */				\
+ 		: "r" (stack_pointer), "r" (destination)	\
+-		: "memory", "sp", "r0", "pc");			\
++		: "memory", "r0", "pc");			\
+ 	__builtin_unreachable();				\
+ 	} while (0)
+ 
diff --git a/package/proot/Config.in b/package/proot/Config.in
new file mode 100644
index 0000000000..8628253803
--- /dev/null
+++ b/package/proot/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PROOT
+	bool "proot"
+	depends on BR2_USE_MMU # libtalloc
+	depends on BR2_USE_WCHAR # libarchive
+	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_sh4 || BR2_x86_64
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_LIBTALLOC
+	help
+	  PRoot is a user-space implementation of chroot, mount --bind,
+	  and binfmt_misc. This means that users don't need any
+	  privileges or setup to do things like using an arbitrary
+	  directory as the new root filesystem.
+
+	  https://proot-me.github.io/
+
+comment "proot needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_sh4 || BR2_x86_64
+	depends on !BR2_USE_WCHAR
diff --git a/package/proot/proot.hash b/package/proot/proot.hash
new file mode 100644
index 0000000000..daa5dfb060
--- /dev/null
+++ b/package/proot/proot.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  29248aac2a7ce10c3bd5ee5602742ec33b2532310ff9cf73b79f3c133e5a5f68  proot-5.4.0.tar.gz
+sha256  e10382ab75518bad8319eb922ad04f907cb20cccb451a3aa980c9d005e661acc  uthash-2.3.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/proot/proot.mk b/package/proot/proot.mk
new file mode 100644
index 0000000000..c2c59a3466
--- /dev/null
+++ b/package/proot/proot.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# proot
+#
+################################################################################
+
+PROOT_VERSION = 5.4.0
+PROOT_SITE = $(call github,proot-me,proot,v$(PROOT_VERSION))
+PROOT_LICENSE = GPL-2.0+
+PROOT_LICENSE_FILES = COPYING
+PROOT_DEPENDENCIES = libarchive libtalloc host-pkgconf
+
+PROOT_UTHASH_VERSION = 2.3.0
+PROOT_UTHASH_SOURCE = uthash-$(PROOT_UTHASH_VERSION).tar.gz
+PROOT_UTHASH_SITE = $(call github,troydhanson,uthash,v$(PROOT_UTHASH_VERSION))
+PROOT_EXTRA_DOWNLOADS = $(PROOT_UTHASH_SITE)/$(PROOT_UTHASH_SOURCE)
+
+define PROOT_EXTRACT_UTHASH
+	mkdir -p $(@D)/lib/uthash
+	$(call suitable-extractor,$(PROOT_UTHASH_SOURCE)) $(PROOT_DL_DIR)/$(PROOT_UTHASH_SOURCE) | \
+		$(TAR) --strip-components=1 -C $(@D)/lib/uthash $(TAR_OPTIONS) -
+endef
+PROOT_POST_EXTRACT_HOOKS += PROOT_EXTRACT_UTHASH
+
+PROOT_CONF_OPTS = \
+	CC="$(TARGET_CC)" \
+	LD="$(TARGET_CC)" \
+	OBJCOPY="$(TARGET_OBJCOPY)" \
+	OBJDUMP="$(TARGET_OBJDUMP)" \
+	STRIP="$(TARGET_STRIP)" \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PROOT_VERSION="$(PROOT_VERSION)" \
+	V=1
+
+# We use -fPIC to link against shared libraries even in static mode
+PROOT_LDFLAGS = $(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib
+
+define PROOT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		CPPFLAGS="$(TARGET_CPPFLAGS) -D_GNU_SOURCE -I. -I$(@D)/src -I$(STAGING_DIR)/usr/include -I$(@D)/lib/uthash/src" \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC -Wno-deprecated-declarations -Wno-stringop-truncation" \
+		LDFLAGS="$(PROOT_LDFLAGS)" \
+		$(MAKE) -C $(@D)/src $(PROOT_CONF_OPTS)
+endef
+
+define PROOT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src \
+		$(PROOT_CONF_OPTS) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
