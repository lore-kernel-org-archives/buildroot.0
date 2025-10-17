Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E0CCCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 17:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4C2981E1B;
	Fri, 17 Oct 2025 17:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GF_9ZTZ537Qb; Fri, 17 Oct 2025 17:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D28E181D9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D28E181D9F;
	Fri, 17 Oct 2025 17:26:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3261943F
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E3916114D
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnDhfiSbhYuv for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 17:26:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2D9861161
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2D9861161
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2D9861161
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:26:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so10365635e9.1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760721986; x=1761326786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z26Rg7QsdzRLk/w/gjoGVD+BlDaXKvwp0SOm85v6Tx0=;
 b=k7c0yjOuDjiG0wqrM1DG95ImMHgmrHh8btTcXV4umohxZXHB9B8k2xTZ3hX6EOG9c8
 lKl5/lMtQOkYOIwrVpeNcsQEoNV7GKKFoxEWaaEe5lCLAM5rv3OOYOCR3WzkL2owhLfL
 virtMw1cbZsjkLnl91qVMdkwxGaBu2DaK36fGyce99VoRkMQiu4qc+3HjEg9ZLXSYxJM
 RIS17z2EEjs2n7ePAQJygoxO14V89FPbtSsL1o/NkLFJncjU+mVSK4q2LAsvSBc6MNSH
 2UNNJo9nL8faBHFRgYkS8CW9UtBdlluuLQshsO7adfoDWve7lsIUTia9tFq3NM7yFgYt
 RgJA==
X-Gm-Message-State: AOJu0YxJ1E9s9/ueFa8Vr0PKdzcuaLdaFZIC3zV/TvdnJneITGOw77Ox
 MT2Sqbxh91rzNLCSveIshJIZDgTKdkfWPjxfq7jk33L73wMICea99+sLNvodjCWrn+uLz8vEoJy
 Oa7J9lNY=
X-Gm-Gg: ASbGncu0DOxkde72kV83M1xBL2kywtMu6jsxWGSA1pUvqb6ZS6J9GcuyIo9qGN6wHk4
 +1yhhMsMYaHmlNwB9FARNWropOiSXLL3jvPAN+Mzhal1xaaFi/P0khkaSTGKbyGqcFJXdRlBnNT
 XljMYPAelEa48lXJaN3AMHoezw1TldJXTSdjQj5qKTg7nv6W9cIL5WLd9qA2tuNhEGYE9bpjFn0
 PQ/UxQEu00I8CLV1OMB5xe4Yzrjet9+PHV82cNchouhwi4F31CzokViT2gWUSaSM/Dd+NJrGoJH
 ZBc+GVpXxO/lBiAVWGZoo8/iRYzyYWBNGyxQxjBqSwQUFQfXnywl+vPfCtVMk9XLK7p1w1B5xBO
 mwmY4JLZS3kiwoYpxsr8H/pKzN2de25/b9IVktcV18MTMTt2alr3pvvkG/nnVW0i4oEBKbO0Xis
 INVDTQFA0Meyr44YhQIdM8rjpUixIYQg7Ddyzp7UKf
X-Google-Smtp-Source: AGHT+IFv6AM8xf/3KvRSwpofJRzaUNldw0SnH1fdGcGGLcuI2GSMHK+MtQ/yZrF2U/wI/IhscPVcjQ==
X-Received: by 2002:a05:600c:3e17:b0:46f:c576:189a with SMTP id
 5b1f17b1804b1-4711791c3c3mr32773475e9.29.1760721986505; 
 Fri, 17 Oct 2025 10:26:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([176.201.10.28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144239f4sm92613085e9.2.2025.10.17.10.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:26:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 17 Oct 2025 19:26:21 +0200
Message-ID: <20251017172621.296710-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017172621.296710-1-dario.binacchi@amarulasolutions.com>
References: <20251017172621.296710-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760721986; x=1761326786;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z26Rg7QsdzRLk/w/gjoGVD+BlDaXKvwp0SOm85v6Tx0=;
 b=Hf9zwxkFsIl5RPX5qj15ck1ygzXZCGR5Yq23rkuavXIGpt0mIs+5iXd5QG56wO+s0r
 U4ZIRHHFbOI+ikZB7emYOD433soVoeB+CehkVcpOxZRs/AFBcNzm2GJoJbE67MGCe0H6
 8ozHAkXIP5H6Y6tHsoszvlait9Q9p4zjLCT/k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Hf9zwxkF
Subject: [Buildroot] [PATCH 2/2] package/ledmon: bump to version 1.1.0
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

The removed patches have been merged in version 1.1.0.

Release notes:
https://github.com/intel/ledmon/releases/tag/v1.1.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...l-ledctl.c-replace-on_exit-by-atexit.patch | 40 ---------------
 ...-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch | 49 -------------------
 package/ledmon/0003-Correct-get_uint64.patch  | 43 ----------------
 package/ledmon/ledmon.hash                    |  2 +-
 package/ledmon/ledmon.mk                      |  2 +-
 5 files changed, 2 insertions(+), 134 deletions(-)
 delete mode 100644 package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
 delete mode 100644 package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch
 delete mode 100644 package/ledmon/0003-Correct-get_uint64.patch

diff --git a/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch b/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
deleted file mode 100644
index 4e1536df4fa7..000000000000
--- a/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ff6f5cd263da4683b3ea07d4ef8afdbf95e2a401 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 9 May 2024 10:04:38 +0200
-Subject: [PATCH] ledctl: replace on_exit() by atexit()
-
-Replace on_exit() by atexit() to avoid the following musl build failure
-raised since bcb9042 ("ledctl: Remove enum ledctl_status_code_t")
-which partially reverted f08dd2c ("Fix build with Musl libc (#139)")
-
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ledctl-ledctl.o: in function `main':
-ledctl.c:(.text.startup+0x140): undefined reference to `on_exit'
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/intel/ledmon/commit/ff6f5cd263da4683b3ea07d4ef8afdbf95e2a401
----
- src/ledctl/ledctl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/ledctl/ledctl.c b/src/ledctl/ledctl.c
-index 231253dc..95db2d86 100644
---- a/src/ledctl/ledctl.c
-+++ b/src/ledctl/ledctl.c
-@@ -230,7 +230,7 @@ static void ibpi_state_fini(struct ibpi_state *p)
-  *
-  * @return The function does not return a value.
-  */
--static void _ledctl_fini(int _i, void *_arg)
-+static void _ledctl_fini(void)
- {
- 	led_free(ctx);
- 	list_erase(&ibpi_list);
-@@ -1101,7 +1101,7 @@ int main(int argc, char *argv[])
- 	if (status != LED_STATUS_SUCCESS)
- 		return status;
- 
--	if (on_exit(_ledctl_fini, progname))
-+	if (atexit(_ledctl_fini))
- 		exit(LED_STATUS_ONEXIT_ERROR);
- 
- 	status = _read_shared_conf();
diff --git a/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch b/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch
deleted file mode 100644
index 730eb2959518..000000000000
--- a/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 0d391dbcb808755a65fcc9a8a0ceaf3aa53d153f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 19 Aug 2024 00:08:40 +0200
-Subject: [PATCH] configure.ac: use AX_CHECK_LINK_FLAG() to test gcc flags
-
-ledmon's configure.ac defines an AX_AM_CFLAGS_ADD() macro that allows
-to test if a flag is supported by gcc, and if so add it to
-AM_CFLAGS. In order to test if the flag works, it uses
-AX_CHECK_COMPILE_FLAG(), which only does a *compile* test, but not
-a *link* test. However, some flags such as -fstack-protector might
-appear to work at compile time, but not link time. Therefore
--fstack-protector is considered functional:
-
-checking whether C compiler accepts -fstack-protector-strong... yes
-
-but the build later fails:
-
-/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/13.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared: No such file or directory
-/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/13.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lssp: No such file or directory
-collect2: error: ld returned 1 exit status
-
-In order to fix this, we test all flags with AX_CHECK_LINK_FLAG()
-which does a full *link* of the test program. This allows to make sure
-that the flag is fully functional. In our test case,
--fstack-protector-strong will be determined as being non-functional,
-and therefore won't be used.
-
-Upstream: https://github.com/intel/ledmon/pull/244
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d3fada5..747b168 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,7 +52,7 @@ AC_CONFIG_HEADERS([config_ac.h])
- AM_CFLAGS='-Wall -I../config'
- AM_CPPFLAGS='-D_DEBUG -D_GNU_SOURCE -D_DEFAULT_SOURCE -DDMALLOC_DISABLE -DBUILD_LABEL=\""$(BUILD_LABEL)"\"'
- 
--AC_DEFUN([AX_AM_CFLAGS_ADD],[AX_CHECK_COMPILE_FLAG($1, AM_CFLAGS="$AM_CFLAGS $1")])
-+AC_DEFUN([AX_AM_CFLAGS_ADD],[AX_CHECK_LINK_FLAG($1, AM_CFLAGS="$AM_CFLAGS $1")])
- AX_AM_CFLAGS_ADD([-Wformat -Wformat-security])
- AX_AM_CFLAGS_ADD([-Wformat-overflow=2])
- AX_AM_CFLAGS_ADD([-Wno-strict-overflow])
--- 
-2.46.0
-
diff --git a/package/ledmon/0003-Correct-get_uint64.patch b/package/ledmon/0003-Correct-get_uint64.patch
deleted file mode 100644
index 2db4c04a6e5c..000000000000
--- a/package/ledmon/0003-Correct-get_uint64.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ed747ac3540cb38797f56533f9f51f5627e6b994 Mon Sep 17 00:00:00 2001
-From: Tony Asleson <tasleson@redhat.com>
-Date: Wed, 21 Aug 2024 12:27:28 -0500
-Subject: [PATCH] Correct get_uint64
-
-For large integer values, the existing implementation will be
-incorrect.
-
-The current implementation of converting strings to integer values
-uses a signed integer for the intermediate conversion and performs
-a range check. Since any value in an unsigned 64-bit integer is valid,
-the range check seems unnecessary. To mimic the same code path, we would
-need a larger integer type.
-
-Signed-off-by: Tony Asleson <tasleson@redhat.com>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/intel/ledmon/commit/ed747ac3540cb38797f56533f9f51f5627e6b994
----
- src/lib/utils.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/utils.c b/src/lib/utils.c
-index a7936c69b242..a6ee29ba7f22 100644
---- a/src/lib/utils.c
-+++ b/src/lib/utils.c
-@@ -98,8 +98,12 @@ uint64_t get_uint64(const char *path, uint64_t defval, const char *name)
- 	if (!p)
- 		return defval;
- 
--	str_toul(&defval, p, NULL, 16);
--	return defval;
-+	errno = 0;
-+	uint64_t t = strtoull(p, NULL, 16);
-+
-+	if (errno)
-+		return defval;
-+	return t;
- }
- 
- int get_int(const char *path, int defval, const char *name)
--- 
-2.43.0
-
diff --git a/package/ledmon/ledmon.hash b/package/ledmon/ledmon.hash
index e9cfcc63cb69..97f379e3a684 100644
--- a/package/ledmon/ledmon.hash
+++ b/package/ledmon/ledmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2826786cd5e7fe7d32d22e9d209b23124801fec9c3220dcd7fb45706f3818dc5  ledmon-1.0.0.tar.gz
+sha256  4f626400e41ab1e4317b886db5b5df1afa517e8e4faa80fd4378fd22b0bcd055  ledmon-1.1.0.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/ledmon/ledmon.mk b/package/ledmon/ledmon.mk
index 71150ad1e470..4b906b1cc724 100644
--- a/package/ledmon/ledmon.mk
+++ b/package/ledmon/ledmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEDMON_VERSION = 1.0.0
+LEDMON_VERSION = 1.1.0
 LEDMON_SITE = $(call github,intel,ledmon,v$(LEDMON_VERSION))
 LEDMON_DEPENDENCIES = host-autoconf-archive host-pkgconf pciutils sg3_utils udev
 # The code base also include a COPYING.LIB file with the LGPL-2.1 text,
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
