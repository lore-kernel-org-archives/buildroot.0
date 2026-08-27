Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5F6C61DCB
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E990780EBA;
	Thu, 27 Aug 2026 19:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oxfz5ClJ0lEP; Thu, 27 Aug 2026 19:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787857219;
	bh=DgModUHw5UNwiC5NfLl+TYLlf3lpavdBrug8jr8Fec8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYCqdXmAbFAdfgsBzmrFHjyAl3EW8/hu7q2FSmKLyZhazVYbjg4VUNrR8EGGbFGHw
	 UNaGfbMDlN7jQmmaPkLl68lEupIjFkdrIJAJk4goNAIKWdH3GWTrpnuhGO8pl2L8mN
	 fxMBXaaRSjqlZy1npzjAm+F10r1pwZ7OVX7eOB4Auktfs8RKQPUE5/5Gk9H4YSLv0Z
	 ePg6Z+CEFU9FDFfhA4JnJeETCZUuApurVk+uYxkgVlR7pw1ChVxx0pvirzFPamoQEt
	 xJBd80fDn1BvWT6exyK3LrILCDo2F9rsUD+rzCIgqiEc96y3d6na/pVd2eJaJLsJNL
	 +D9gbq+ZG1JNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF56C80EB5;
	Thu, 27 Aug 2026 19:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0851BB2C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE0DD40358
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAq_Y5IVcC3w for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ASq3HHxK
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E572D402D2
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:16 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-4b190cdc9feso307759b6e.0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787857215; x=1788462015; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UxcQ7ac13HcgetgaKAp2bbdqGnzcRNxNwnqIhO1SGMo=;
 b=ASq3HHxKybY2SqjPu0U0rT/vRE6ePCjJQXKGH16aSCE7woDqSI3IULgAqLtFlju9+H
 ql1rG0k7gm9sdAlIXww7Rp1h8fyAWCk0Vw81R6IbjraGoQzDa4J/PTd8c4wDB96U7yaF
 iwl37nqmmMudysswExv0vz5YPSsnkEsBDykYC53zXDAg66Q26ouaH+3yC2rlz45KS2hY
 NUBXdWRIvoPrAC/VnBWmqlKHEzRpJCZXEFfb4uv6JCHGPjcEHhrBoXihoAzffpTR/c/K
 bCiZPvU03OSZN4glBQee+XVe96LZg9zgTRAcatetmGskNzHdtfWtw3VE8pIQHdN+hjju
 6whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787857215; x=1788462015;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UxcQ7ac13HcgetgaKAp2bbdqGnzcRNxNwnqIhO1SGMo=;
 b=MNcC9srblmn0zR8zMlRqXgLjpKiCu7HuOnXzO4pweqkmnA2FqgGZZL5VL/aW817rTY
 4pgrmI7eSGTuMsxIawVGR1zBaquksWCIQGTC0gDJQXXCl4sFBR8gjtKlyfwxPg0TbS6f
 Zu46zUP87/wt2Rb7XseHegCxzwEfUGi4IGfaGCeu/91RzDp9Yv4K95ukJNWbktA5QFBc
 LK4hHNcRD7T/a+9Gx5aFW5kV2Nzr6eTlpGmDed+W/sSsSjYQGoqMO59KOf1zoBM6Qrdd
 erXYoAQcrNFbkrGSatD5XSIwb/ZTp40UZP19BCUNmwLY1dgMQk9GHbvOc2s27BfUhk3T
 ZzNA==
X-Gm-Message-State: AFuF++mP0hxbvNYLMg/BG95mvk92kUoUacC/WG7LSu8CDwmaXpG0+e+W
 MHqJoOt/3DQuvOHKiI+NfGFqnxmEObyXLHNw3TYCXD9TwjZoAwc8auzejYxJHZmK
X-Gm-Gg: AR+sD11t5nG2m9z6tsQBX+9JHsbp+bxrwq1Eew0JP0khuTuucoKzh0/8KBthubvDJ92
 GFt2PLHMwLBDcMLuxPbfFc+VN6PEb6FVsA4n1Kvy0yLe6QnD3Kx4kiGdxvAkvLb7Ml2uczeIJLy
 6eOsxJvpL4ItK6nZCqE3cMs4HmGf3E3QY4rP1r7eDQIP9BKIpJKS3k2d33etgDS29lkRVyGB+Ww
 zWi459Rp73IQywBIlKrj35DutCxutfCo5hQg7sPXsA59E2DXmqDGc2jOjjJ12PIi/+VwDyZqRXx
 KpdpspBZHRrtoN3W0NEIaDUIWxNrEkUzETmkZfdZiUYwM7zQehJjFtBwM0Uiacxs/tGdKAtjbkb
 36/9OJhJ4SMkuDSw+NOxGxZT7CzkWHzkxZJ9XT5anvMYt8zBl1ibwjWNKr2f/Ozqr+6i4tVNCTS
 fcIrCiBHy4kjm7xk/0bLPoBEcwZ0G/hXsCohuTnMHUS6Wli8eDQSynQlq2mQ64n49XsA/EPaink
 mAHVaV3QvNkqbxBw8/qRm6Q5Rlh/TKPhJBXiwJcwnnKU/EFEQnXvaSaDcl5UTyVHw==
X-Received: by 2002:a05:6808:3c4a:b0:496:b7c:9445 with SMTP id
 5614622812f47-4b3981e351fmr1385672b6e.12.1787857215059; 
 Thu, 27 Aug 2026 12:00:15 -0700 (PDT)
Received: from 4769c4e2f3e3.nos.boeing.com
 (138-28-90-168.fttx.imoncommunications.net. [138.28.90.168])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b3984e0d40sm263428b6e.9.2026.08.27.12.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 12:00:12 -0700 (PDT)
From: matt@thewebers.ws
To: buildroot@buildroot.org
Cc: "Matthew Weber" <matthew.l.weber3@boeing.com>,
 Clayton Shotwell <clayton.shotwell@boeing.com>
Date: Thu, 27 Aug 2026 18:59:49 +0000
Message-Id: <20260827185951.3180679-2-matt@thewebers.ws>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827185951.3180679-1-matt@thewebers.ws>
References: <20260827185951.3180679-1-matt@thewebers.ws>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] support/testing: add libc-test runtime test
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
Content-Type: multipart/mixed; boundary="===============5179346782206082602=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5179346782206082602==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: "Matthew Weber" <matthew.l.weber3@boeing.com>

Add a Buildroot runtime test that boots a minimal system with
libc-test installed and exercises upstream functional tests across
categories: string, stdio, stdlib, pthread, and misc POSIX APIs.

Includes skip tables for tests with known musl limitations:
- wordexp (shell expansion)
- strtold (long double rounding)
- tls_* (need dynamic linker)
- dlopen (needs shared libraries on target)

Tested on aarch64 (QEMU cortex-a57).

Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@boeing.com>
---
 DEVELOPERS                                    |   1 +
 .../testing/tests/package/test_libc_test.py   | 169 ++++++++++++++++++
 2 files changed, 170 insertions(+)
 create mode 100644 support/testing/tests/package/test_libc_test.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 3fa3cf2378..8f0da11859 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2396,6 +2396,7 @@ F:	package/rlwrap/
 
 N:	Matthew Weber <matthew.l.weber3@boeing.com>
 F:	package/libc-test/
+F:	support/testing/tests/package/test_libc_test.py
 
 N:	Maksim Kiselev <bigunclemax@gmail.com>
 F:	package/ledmon/
diff --git a/support/testing/tests/package/test_libc_test.py b/support/testing/tests/package/test_libc_test.py
new file mode 100644
index 0000000000..e023b10e46
--- /dev/null
+++ b/support/testing/tests/package/test_libc_test.py
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: GPL-2.0+
+import os
+
+import infra.basetest
+
+# libc-test runtime test for Buildroot
+#
+# Runs functional tests under QEMU aarch64-virt with musl libc.
+# Not all tests from the suite can be exercised in this environment.
+#
+# Skipped tests — known broken / musl conformance issues:
+# +---------------------+------------------------------------------------+
+# | Test                | Reason                                         |
+# +---------------------+------------------------------------------------+
+# | strptime            | Known musl conformance issue                   |
+# | utime               | QEMU virtfs timestamp resolution               |
+# | mntent              | Known musl expected failure (from upstream CI)  |
+# | tls_align           | Needs dynamic linker setup (not in initrd)     |
+# | tls_init            | Needs dynamic linker setup (not in initrd)     |
+# | tls_local_exec      | Needs dynamic linker setup (not in initrd)     |
+# | dlopen              | Needs shared libraries on target               |
+# | fma (math)          | Known musl precision issue                     |
+# | fmal (math)         | Known musl precision issue                     |
+# | powf (math)         | Known musl precision issue                     |
+# | strtold             | Known musl long double rounding issue          |
+# | wordexp             | musl wordexp limitations with shell expansion  |
+# +---------------------+------------------------------------------------+
+#
+# Skipped tests — require non-root (test runs as root in QEMU):
+# +---------------------+------------------------------------------------+
+# | Test                | Reason                                         |
+# +---------------------+------------------------------------------------+
+# | fcntl               | Permission/lock tests bypassed by root         |
+# +---------------------+------------------------------------------------+
+
+class TestLibcTestAarch64(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.1.4"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_LIBC_TEST=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        test_dir = "/usr/lib/libc-test"
+
+        # Verify test executables are installed
+        self.assertRunOk(f"test -x {test_dir}/src/common/runtest.exe")
+
+        # --- Upstream functional tests ---
+
+        upstream_string = [
+            "string",
+            "string_memcpy",
+            "string_memmem",
+            "string_memset",
+            "string_strchr",
+            "string_strcspn",
+            "string_strstr",
+        ]
+
+        upstream_stdio = [
+            "snprintf",
+            "sscanf",
+            "sscanf_long",
+            "swprintf",
+            "fscanf",
+            "fwscanf",
+            "memstream",
+            "ungetc",
+            "fdopen",
+            "popen",
+        ]
+
+        upstream_stdlib = [
+            "qsort",
+            "random",
+            "strtod",
+            "strtod_simple",
+            "strtod_long",
+            "strtof",
+            "strtol",
+            "wcstol",
+            "wcsstr",
+            "udiv",
+        ]
+
+        upstream_pthread = [
+            "pthread_cancel",
+            "pthread_cancel-points",
+            "pthread_cond",
+            "pthread_mutex",
+            "pthread_robust",
+            "pthread_tsd",
+        ]
+
+        upstream_misc = [
+            "argv",
+            "basename",
+            "dirname",
+            "env",
+            "clock_gettime",
+            "clocale_mbfuncs",
+            "crypt",
+            "fnmatch",
+            "iconv_open",
+            "inet_pton",
+            "ipc_msg",
+            "ipc_sem",
+            "ipc_shm",
+            "mbc",
+            "search_hsearch",
+            "search_insque",
+            "search_lsearch",
+            "search_tsearch",
+            "sem_init",
+            "sem_open",
+            "setjmp",
+            "socket",
+            "spawn",
+            "stat",
+            "strftime",
+            "tgmath",
+            "time",
+            "vfork",
+        ]
+
+        all_tests = (upstream_string + upstream_stdio +
+                     upstream_stdlib + upstream_pthread +
+                     upstream_misc)
+
+        for test in all_tests:
+            exe = f"{test_dir}/src/functional/{test}.exe"
+            cmd = f"{test_dir}/src/common/runtest.exe {exe}"
+            self.assertRunOk(cmd)
+
+        # Run upstream regression tests
+        out, ret = self.emulator.run(
+            f"find {test_dir}/src/regression -name '*.exe'"
+            " ! -name '*-static*' | sort | head -20")
+        if ret == 0 and out:
+            for line in out:
+                exe = line.strip()
+                if exe and exe.endswith(".exe"):
+                    cmd = f"{test_dir}/src/common/runtest.exe {exe}"
+                    self.assertRunOk(cmd)
-- 
2.34.1


--===============5179346782206082602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5179346782206082602==--
