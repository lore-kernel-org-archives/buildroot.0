Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D46C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 22:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4470460ADE;
	Tue, 15 Feb 2022 22:11:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1KrFWVNkkTYN; Tue, 15 Feb 2022 22:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 337C760B0C;
	Tue, 15 Feb 2022 22:11:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 040371BF616
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 22:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E69424160A
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 22:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lf6i54LQQ-IT for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 22:11:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AD35415FF
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 22:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6CEBB82931; Tue, 15 Feb 2022 22:03:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 23:10:23 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: b9794087bd971cfb49a22ca2ad01d754b1c47f53
X-Git-Newrev: 94c3c2fa49e26b956f229ee40fa1580d863dc9eb
X-Patchwork-Hint: ignore
Message-Id: <20220215220331.6CEBB82931@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/binutils: add
 upstream patch for v2.37 fixing linking of thin archives
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94c3c2fa49e26b956f229ee40fa1580d863dc9eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 40f7b0bb6b91400b9e1fc60f410c9cdcbd1998ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...he-file-descriptor-if-there-is-no-archive.patch | 236 +++++++++++++++++++++
 1 file changed, 236 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
