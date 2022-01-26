Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61102C63684
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 19:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D02D04093F;
	Wed, 26 Jan 2022 19:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCbfIo1rkOFP; Wed, 26 Jan 2022 19:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDAA440990;
	Wed, 26 Jan 2022 19:34:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 788841BF4D6
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 19:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 743D584C77
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 19:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBf_3rBUTPee for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 19:34:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A349884C6B
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 19:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643225672;
 bh=D/7Ec4Q4ivyX7fG46zcoYY2y5TVlK7ujYb1fQcyoJvU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=QlTzB9CeFI/IEuhcaJECm3UrbUTcDFnL295eQDSR9H9gWc6iC8uoHu7ngcZ0kUTyW
 Wo3LpoWSOOVx0Ob8N7cnZdTBcXCK9+L0Kmxh6vk4Ay2i7cC7zbE/b1gQoLcX0EkYuC
 2W6zWlpmFi1n0ktoM9jjDUZDs1R/uzjPcS4Etr4o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.233]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N8XTv-1m8S2j08WH-014U2i; Wed, 26 Jan 2022 20:34:32 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 20:34:31 +0100
Message-Id: <20220126193431.17777-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:j7pjXyNQ5UOBidlR4jLK+nnbR08EJnMGVavwTALFr3l1mDmwSVr
 1bvM/92pajhgSGa5rdKhVAq8UBjKcMA829cm3dJQCmD9cR9VVPoU75Oo6DOJqIT0qXnktjT
 4N2mRLdFvOpvOWbGkJ8M2A05CJJI34wR0IUUuc9/OZKMEgCH9vVxwR/t+CL1Di60JXGHT9S
 bHNutWDV4l0/vRHFGbUag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2mVT7fls5VU=:RcUGn5tgcjzuXMyzaxMLOI
 KMWCLoh/nWdLTQjxVkVcNP9IbYzaaX7ybNNoIGO8Z/3wVt1LooHkY5nj21be4RSpfrXS+5qku
 uTR5i1cjexlz0qCqwDLECBkpf4IrSrUIK+qH+dLQovxKg26+7qgPzUJjuvIY95+k50F1A0Xn1
 aEEM337MloxcoFaXngXfk3GbjZGjK847xOEwVZhG20Drue5ZYO7baknkjjqOnDZAhmZ9RKugL
 9JtiZs1LJTbJld8DomaxKyDBX91ARnfrtpYYSQObGRgyWoQusihRwXDUtbJ1I3aDbWyjhrXk9
 ijvvcrNa7p1t8x73/O6j/D1FUMb0m6KkospEkTxgyXg397k9Zv3dLoRnkGKRqmpE/rKFYWzbv
 44/sGukoLRRuCub8IGmm2jb317rOcf1+gCwBEjCjJzhP1l0rvZb0s4mU6EzbnwV7S5sgektVP
 aKBqKh1WCvzR9RaQyxTzALrZZr9zRvFqbmiHh04Mtp0D4CqOWFt97a93lO7ox2arJDRj5EDhT
 8bcZ0EQxGSN1kn0VwT1R6fPKFFyUjgLwz19UeZcGfIQlk7iJIZx4939CVUgZ+SEQ7TgtZcPLE
 P6A+Sx+eYN0bv5eFcxwzvH9broWIXxYo6tostKSe9+enh0giiRt+oMEe305mVVcYSYgtJP6W9
 jnmDuSIduYeZGl0X4J56HwL8F+RZOGqoBpETblvj6owrVQ6LZwwCsOez6depelCWFO2brKQ7p
 1zsMTsW95zpNLb0++92+qN6PHv+388paXf8GWUS/m11taOqwqbh/j5Ao4fJKY0xeAjNxxZi4V
 r2ItnrZxUQnFgrijaQJGx26HZHiCBxOM5gzawZzbE+oP5J3vAa143r94LesqnG98fauwJTTQ4
 T6vRjWOm9MhunUITVPur9j+0r/Oq5f4RZzSbUNBZFT1Kjrwh+m4xiWCvBuNVkn6f38JxbNXq6
 dMXEJbOhee+He9bQFQ1WwbbJEj+znFMr51d1KyK0gRjrnPTUB2Ss2l4jz6iucsucGJyFN5wLI
 IiDFyRozwDP46HbVtTMFIRm7BpqMk30qqefpyg4xsxp9KhA6PXM5Xf8whazWL0cJ1t5BjHpyw
 PSWD3tBZEN2iRs=
Subject: [Buildroot] [PATCH v1] package/binutils: add upstream patch for
 v2.37 fixing linking of thin archives
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
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream patch ([1]) for v2.37 fixing linkig of thin archives (see [2] for
details).

Fixes:

  .../host/bin/arm-buildroot-linux-gnueabihf-g++ [...] -o libQt5WebEngineCore.so.5.15.2 [...]
  .../arm-buildroot-linux-gnueabihf/bin/ld: .../build/qt5webengine-5.15.2/src/core/release/obj/third_party/boringssl/libboringssl.a: error adding symbols: malformed archive
  collect2: error: ld returned 1 exit status
  make[5]: *** [Makefile.core_module:90: ../../lib/libQt5WebEngineCore.so.5.15.2] Error 1
  make[4]: *** [Makefile:124: sub-core_module-pro-make_first] Error 2
  make[3]: *** [Makefile:79: sub-core-make_first] Error 2
  make[2]: *** [Makefile:49: sub-src-make_first] Error 2
  make[1]: *** [package/pkg-generic.mk:295: .../build/qt5webengine-5.15.2/.stamp_built] Error 2
  make: *** [Makefile:23: _all] Error 2

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=28138

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - maybe the same failure as

    http://autobuild.buildroot.net/results/55c3c66c6c909853d47a470e0bbbab7186c83793

    .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/11.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: src/intel/dev/libintel_dev.a: error adding symbols: malformed archive

    with BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
---
 ...le-descriptor-if-there-is-no-archive.patch | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch

diff --git a/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch b/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
new file mode 100644
index 0000000000..46697cc5c8
--- /dev/null
+++ b/package/binutils/2.37/0006-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
@@ -0,0 +1,236 @@
+From 1c611b40e6bfc8029bff7696814330b5bc0ee5c0 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 26 Jul 2021 05:59:55 -0700
+Subject: [PATCH] bfd: Close the file descriptor if there is no archive fd
+
+Close the file descriptor if there is no archive plugin file descriptor
+to avoid running out of file descriptors on thin archives with many
+archive members.
+
+bfd/
+
+	PR ld/28138
+	* plugin.c (bfd_plugin_close_file_descriptor): Close the file
+	descriptor there is no archive plugin file descriptor.
+
+ld/
+
+	PR ld/28138
+	* testsuite/ld-plugin/lto.exp: Run tmpdir/pr28138 only for
+	native build.
+
+	PR ld/28138
+	* testsuite/ld-plugin/lto.exp: Run ld/28138 tests.
+	* testsuite/ld-plugin/pr28138.c: New file.
+	* testsuite/ld-plugin/pr28138-1.c: Likewise.
+	* testsuite/ld-plugin/pr28138-2.c: Likewise.
+	* testsuite/ld-plugin/pr28138-3.c: Likewise.
+	* testsuite/ld-plugin/pr28138-4.c: Likewise.
+	* testsuite/ld-plugin/pr28138-5.c: Likewise.
+	* testsuite/ld-plugin/pr28138-6.c: Likewise.
+	* testsuite/ld-plugin/pr28138-7.c: Likewise.
+
+(cherry picked from commit 5a98fb7513b559e20dfebdbaa2a471afda3b4742)
+(cherry picked from commit 7dc37e1e1209c80e0bab784df6b6bac335e836f2)
+
+[Upstream:
+ https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ bfd/plugin.c                       |  8 +++++++
+ ld/testsuite/ld-plugin/lto.exp     | 34 ++++++++++++++++++++++++++++++
+ ld/testsuite/ld-plugin/pr28138-1.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-2.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-3.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-4.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-5.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-6.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-7.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138.c   | 20 ++++++++++++++++++
+ 10 files changed, 104 insertions(+)
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-1.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-2.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-3.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-4.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-5.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-6.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-7.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138.c
+
+diff --git a/bfd/plugin.c b/bfd/plugin.c
+index 6cfa2b66470..3bab8febe88 100644
+--- a/bfd/plugin.c
++++ b/bfd/plugin.c
+@@ -291,6 +291,14 @@ bfd_plugin_close_file_descriptor (bfd *abfd, int fd)
+ 	     && !bfd_is_thin_archive (abfd->my_archive))
+ 	abfd = abfd->my_archive;
+ 
++      /* Close the file descriptor if there is no archive plugin file
++	 descriptor.  */
++      if (abfd->archive_plugin_fd == -1)
++	{
++	  close (fd);
++	  return;
++	}
++
+       abfd->archive_plugin_fd_open_count--;
+       /* Dup the archive plugin file descriptor for later use, which
+ 	 will be closed by _bfd_archive_close_and_cleanup.  */
+diff --git a/ld/testsuite/ld-plugin/lto.exp b/ld/testsuite/ld-plugin/lto.exp
+index def69e43ab3..999d911ce6a 100644
+--- a/ld/testsuite/ld-plugin/lto.exp
++++ b/ld/testsuite/ld-plugin/lto.exp
+@@ -687,6 +687,40 @@ if { [is_elf_format] && [check_lto_shared_available] } {
+     }
+ }
+ 
++run_cc_link_tests [list \
++    [list \
++	"Build pr28138.a" \
++	"-T" "" \
++	{pr28138-1.c pr28138-2.c pr28138-3.c pr28138-4.c pr28138-5.c \
++	 pr28138-6.c pr28138-7.c} {} "pr28138.a" \
++    ] \
++    [list \
++	"Build pr28138.o" \
++	"" "" \
++	{pr28138.c} {} \
++    ] \
++]
++
++set exec_output [run_host_cmd "sh" \
++			      "-c \"ulimit -n 20; \
++			      $CC -Btmpdir/ld -o tmpdir/pr28138 \
++			      tmpdir/pr28138.o tmpdir/pr28138.a\""]
++set exec_output [prune_warnings $exec_output]
++if [string match "" $exec_output] then {
++    if { [isnative] } {
++	set exec_output [run_host_cmd "tmpdir/pr28138" ""]
++	if [string match "PASS" $exec_output] then {
++	    pass "PR ld/28138"
++	} else {
++	    fail "PR ld/28138"
++	}
++    } else {
++	pass "PR ld/28138"
++    }
++} else {
++    fail "PR ld/28138"
++}
++
+ set testname "Build liblto-11.a"
+ remote_file host delete "tmpdir/liblto-11.a"
+ set catch_output [run_host_cmd "$ar" "rc $plug_opt tmpdir/liblto-11.a tmpdir/lto-11a.o tmpdir/lto-11b.o tmpdir/lto-11c.o"]
+diff --git a/ld/testsuite/ld-plugin/pr28138-1.c b/ld/testsuite/ld-plugin/pr28138-1.c
+new file mode 100644
+index 00000000000..51d119e1642
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-1.c
+@@ -0,0 +1,6 @@
++extern int a0(void);
++int
++a1(void)
++{
++  return 1 + a0();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-2.c b/ld/testsuite/ld-plugin/pr28138-2.c
+new file mode 100644
+index 00000000000..1120cd797e9
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-2.c
+@@ -0,0 +1,6 @@
++extern int a1(void);
++int
++a2(void)
++{
++  return 1 + a1();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-3.c b/ld/testsuite/ld-plugin/pr28138-3.c
+new file mode 100644
+index 00000000000..ec464947ee6
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-3.c
+@@ -0,0 +1,6 @@
++extern int a2(void);
++int
++a3(void)
++{
++  return 1 + a2();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-4.c b/ld/testsuite/ld-plugin/pr28138-4.c
+new file mode 100644
+index 00000000000..475701b2c5c
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-4.c
+@@ -0,0 +1,6 @@
++extern int a3(void);
++int
++a4(void)
++{
++  return 1 + a3();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-5.c b/ld/testsuite/ld-plugin/pr28138-5.c
+new file mode 100644
+index 00000000000..e24f86c363e
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-5.c
+@@ -0,0 +1,6 @@
++extern int a4(void);
++int
++a5(void)
++{
++  return 1 + a4();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-6.c b/ld/testsuite/ld-plugin/pr28138-6.c
+new file mode 100644
+index 00000000000..b5b938bdb21
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-6.c
+@@ -0,0 +1,6 @@
++extern int a5(void);
++int
++a6(void)
++{
++  return 1 + a5();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-7.c b/ld/testsuite/ld-plugin/pr28138-7.c
+new file mode 100644
+index 00000000000..4ef75bf0f0c
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-7.c
+@@ -0,0 +1,6 @@
++extern int a6(void);
++int
++a7(void)
++{
++  return 1 + a6();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138.c b/ld/testsuite/ld-plugin/pr28138.c
+new file mode 100644
+index 00000000000..68252c9f382
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138.c
+@@ -0,0 +1,20 @@
++#include <stdio.h>
++
++extern int a7(void);
++
++int
++a0(void)
++{
++  return 0;
++}
++
++int
++main()
++{
++  if (a7() == 7)
++    {
++      printf ("PASS\n");
++      return 0;
++    }
++  return 1;
++}
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
