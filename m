Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C2C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 22:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CE4042F5C;
	Wed,  7 Feb 2024 22:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6D852wBTYqG; Wed,  7 Feb 2024 22:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 921CC42F57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 921CC42F57;
	Wed,  7 Feb 2024 22:51:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 839B51BF82C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 22:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F4B741B6D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 22:51:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9Xm2tFT82P5 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 22:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E50941A45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E50941A45
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E50941A45
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 22:51:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BAE0A13F88D;
 Wed,  7 Feb 2024 23:51:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 23:51:00 +0100
Message-ID: <20240207225100.1320837-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707346267;
 bh=zfrY2SXrMU/QbQ0UAGxslbHYgIwAbk5RwpmJj6GAvZ0=;
 h=From:To:Cc:Subject:Date:From;
 b=eKnsSnOs9hmTaFEqi7/aPXoCbYTEPk/prkDyy/cwdCl+yWHXU2IxT6lFvFjweK6k1
 apxKzvx6QGShaUEtpW0lUn72a51qPc3OQcHLr18vSUzsU6mKZ0EvVtnVlv6LKAIyQP
 jiTThku5l2KOA6Kqemep63EhFGmAM4gKkanM2AABsLigSDk46LRuxBtAdttE52iaHE
 7V2mUVNiBbxMUH/N5ZTlEy43qxwmPZFIzDd9dKAo2LEuc4HxO6gY1Yqg9QSn1TLnhE
 p2tpprw8xeT+JcvxZ31Fn2vDw7GWHcIb1Omct1I6iGFcHokvETqfAGX9bPo84v3/IZ
 bEa0YDe1yj6lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eKnsSnOs
Subject: [Buildroot] [PATCH v2 1/1] package/swipl: new package
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SWI-Prolog offers a comprehensive free Prolog environment. Since its
start in 1987, SWI-Prolog development has been driven by the needs of
real world applications. SWI-Prolog is widely used in research and
education as well as commercial applications.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
Updates and changes from comments by Romain Naour:
- udpate homepage URL in Config.in to match the http redirect.
- package updated from 9.0.2 to latest version 9.2.0
- runtime test updated to use basetest config
  (since it's now using glibc toolchain)
- minor runtime test style changes (use python f-strings)
- rebased DEVELOPERS entries

Patch tested on branch master at commit ae5274d with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_swipl
    ...
    OK

    ./utils/test-pkg -a -p swipl 
                         arm-aarch64 [ 1/45]: OK
               bootlin-aarch64-glibc [ 2/45]: OK
           bootlin-arcle-hs38-uclibc [ 3/45]: SKIPPED
                bootlin-armv5-uclibc [ 4/45]: SKIPPED
                 bootlin-armv7-glibc [ 5/45]: OK
               bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                  bootlin-armv7-musl [ 7/45]: OK
            bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
           bootlin-m68k-68040-uclibc [ 9/45]: SKIPPED
         bootlin-microblazeel-uclibc [10/45]: SKIPPED
            bootlin-mipsel32r6-glibc [11/45]: OK
               bootlin-mipsel-uclibc [12/45]: SKIPPED
                 bootlin-nios2-glibc [13/45]: SKIPPED
             bootlin-openrisc-uclibc [14/45]: SKIPPED
    bootlin-powerpc64le-power8-glibc [15/45]: OK
       bootlin-powerpc-e500mc-uclibc [16/45]: SKIPPED
               bootlin-riscv32-glibc [17/45]: OK
               bootlin-riscv64-glibc [18/45]: OK
                bootlin-riscv64-musl [19/45]: OK
             bootlin-s390x-z13-glibc [20/45]: OK
                  bootlin-sh4-uclibc [21/45]: SKIPPED
               bootlin-sparc64-glibc [22/45]: OK
                bootlin-sparc-uclibc [23/45]: SKIPPED
                bootlin-x86-64-glibc [24/45]: OK
                 bootlin-x86-64-musl [25/45]: OK
               bootlin-x86-64-uclibc [26/45]: SKIPPED
               bootlin-xtensa-uclibc [27/45]: SKIPPED
                        br-arm-basic [28/45]: SKIPPED
                br-arm-full-nothread [29/45]: SKIPPED
                  br-arm-full-static [30/45]: SKIPPED
               br-i386-pentium4-full [31/45]: SKIPPED
            br-i386-pentium-mmx-musl [32/45]: OK
                  br-mips64-n64-full [33/45]: SKIPPED
             br-mips64r6-el-hf-glibc [34/45]: OK
           br-powerpc-603e-basic-cpp [35/45]: SKIPPED
           br-powerpc64-power7-glibc [36/45]: OK
                   linaro-aarch64-be [37/45]: OK
                      linaro-aarch64 [38/45]: OK
                          linaro-arm [39/45]: OK
                 sourcery-arm-armv4t [40/45]: SKIPPED
                        sourcery-arm [41/45]: SKIPPED
                 sourcery-arm-thumb2 [42/45]: SKIPPED
                     sourcery-mips64 [43/45]: OK
                       sourcery-mips [44/45]: OK
                      sourcery-nios2 [45/45]: SKIPPED
45 builds, 24 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 package/swipl/Config.in                       | 38 +++++++++++++
 package/swipl/swipl.hash                      |  4 ++
 package/swipl/swipl.mk                        | 55 +++++++++++++++++++
 support/testing/tests/package/test_swipl.py   | 46 ++++++++++++++++
 .../test_swipl/rootfs-overlay/root/sudoku.pl  | 42 ++++++++++++++
 7 files changed, 189 insertions(+)
 create mode 100644 package/swipl/Config.in
 create mode 100644 package/swipl/swipl.hash
 create mode 100644 package/swipl/swipl.mk
 create mode 100644 support/testing/tests/package/test_swipl.py
 create mode 100644 support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..8d3c17c3cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1751,6 +1751,7 @@ F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
 F:	package/riscv-isa-sim/
+F:	package/swipl/
 F:	package/tinycompress/
 F:	package/z3/
 F:	package/zynaddsubfx/
@@ -1846,6 +1847,8 @@ F:	support/testing/tests/package/test_sed.py
 F:	support/testing/tests/package/test_sqlite.py
 F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
+F:	support/testing/tests/package/test_swipl.py
+F:	support/testing/tests/package/test_swipl/
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
diff --git a/package/Config.in b/package/Config.in
index 91a6f1de00..b1a9d74af1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1443,6 +1443,7 @@ endmenu
 endif
 	source "package/quickjs/Config.in"
 	source "package/ruby/Config.in"
+	source "package/swipl/Config.in"
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
 menu "Tcl libraries/modules"
diff --git a/package/swipl/Config.in b/package/swipl/Config.in
new file mode 100644
index 0000000000..f0fb2d786d
--- /dev/null
+++ b/package/swipl/Config.in
@@ -0,0 +1,38 @@
+# swipl supports arch for which libc fenv.h provides all four macros:
+# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
+# See for example in glibc https://sourceware.org/git/glibc.git
+# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
+config BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	# BR2_microblaze has only FE_TONEAREST
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# BR2_nios2 has only FE_TONEAREST
+	default y if BR2_or1k
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	# BR2_sh has only FE_{TONEAREST,TOWARDZERO}
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_x86_64
+	# BR2_xtensa supports only uclibc which does not have fenv.h
+
+config BR2_PACKAGE_SWIPL
+	bool "SWI-Prolog"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # __has_attribute()
+	depends on BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
+	# swipl needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ZLIB
+	help
+	  SWI-Prolog offers a comprehensive free Prolog
+	  environment. Since its start in 1987, SWI-Prolog development
+	  has been driven by the needs of real world
+	  applications. SWI-Prolog is widely used in research and
+	  education as well as commercial applications.
+
+	  https://www.swi-prolog.org
diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
new file mode 100644
index 0000000000..9f980654ba
--- /dev/null
+++ b/package/swipl/swipl.hash
@@ -0,0 +1,4 @@
+# From https://www.swi-prolog.org/download/stable
+sha256  10d90b15734d14d0d7972dc11a3584defd300d65a9f0b1185821af8c3896da5e  swipl-9.2.0.tar.gz
+# Locally calculated
+sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
new file mode 100644
index 0000000000..8514b9d449
--- /dev/null
+++ b/package/swipl/swipl.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# swipl
+#
+################################################################################
+
+SWIPL_VERSION = 9.2.0
+SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
+SWIPL_LICENSE = BSD-2-Clause
+SWIPL_LICENSE_FILES = LICENSE
+
+SWIPL_DEPENDENCIES = host-swipl zlib
+
+# A host-swipl is needed to compile the target prolog boot
+# boot.prl file.
+HOST_SWIPL_CONF_OPTS = \
+	-DBUILD_PDF_DOCUMENTATION=OFF \
+	-DSWIPL_PACKAGES=OFF \
+	-DUSE_GMP=OFF \
+	-DUSE_TCMALLOC=OFF
+
+# swipl uses cmake macros try_run() and check_c_source_runs(), which
+# are not suitable for cross compilation. We add results in cache to
+# avoid running those tests. The SWIPL_NATIVE_FRIEND variable, is
+# meant to point to build directory of a host native swipl, rather
+# than the binary itself. The Cmake macro will append "src/swipl" to
+# the path set to this variable. Therefore, we cannot use the host
+# "swipl" binary installed in $(HOST_DIR)/usr/bin.
+SWIPL_CONF_OPTS = \
+	-DBUILD_PDF_DOCUMENTATION=OFF \
+	-DHAVE_WEAK_ATTRIBUTE=1 \
+	-DLLROUND_OK=1 \
+	-DMODF_OK=1 \
+	-DQSORT_R_GNU=1 \
+	-DSWIPL_NATIVE_FRIEND=$(BUILD_DIR)/host-swipl-$(SWIPL_VERSION) \
+	-DSWIPL_PACKAGES=OFF \
+	-DUSE_TCMALLOC=OFF
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SWIPL_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
+ifeq ($(BR2_PACKAGE_GMP),y)
+SWIPL_CONF_OPTS += -DUSE_GMP=ON
+SWIPL_DEPENDENCIES += gmp
+else
+SWIPL_CONF_OPTS += -DUSE_GMP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+SWIPL_DEPENDENCIES += ncurses
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
new file mode 100644
index 0000000000..0839101599
--- /dev/null
+++ b/support/testing/tests/package/test_swipl.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+
+class TestSWIPL(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_swipl/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_SWIPL=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check program executes.
+        cmd = "swipl --version"
+        self.assertRunOk(cmd)
+
+        # Check swipl fails when goal is false.
+        cmd = "swipl -g false"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # Test output.
+        string = "Hello Buildroot !"
+        cmd = f"swipl -g 'writeln(\"{string}\")' -t halt"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], string)
+
+        # Check the swipl demo file works (ex: "sam" likes "pizza").
+        cmd = "swipl -g '[swi(demo/likes)]' -g 'likes(sam,pizza)' -t halt"
+        self.assertRunOk(cmd)
+
+        # Run a more complex logic program (solve a sudoku).
+        cmd = "swipl -g top -t halt /root/sudoku.pl"
+        self.assertRunOk(cmd, timeout=10)
diff --git a/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl b/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl
new file mode 100644
index 0000000000..2b68b6cc89
--- /dev/null
+++ b/support/testing/tests/package/test_swipl/rootfs-overlay/root/sudoku.pl
@@ -0,0 +1,42 @@
+% taken from:
+% https://www.swi-prolog.org/pldoc/man?section=clpfd-sudoku
+
+:- use_module(library(clpfd)).
+
+sudoku(Rows) :-
+        length(Rows, 9), maplist(same_length(Rows), Rows),
+        append(Rows, Vs), Vs ins 1..9,
+        maplist(all_distinct, Rows),
+        transpose(Rows, Columns),
+        maplist(all_distinct, Columns),
+        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
+        blocks(As, Bs, Cs),
+        blocks(Ds, Es, Fs),
+        blocks(Gs, Hs, Is).
+
+blocks([], [], []).
+blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
+        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
+        blocks(Ns1, Ns2, Ns3).
+
+problem(1, [[_,_,_,_,_,_,_,_,_],
+            [_,_,_,_,_,3,_,8,5],
+            [_,_,1,_,2,_,_,_,_],
+            [_,_,_,5,_,7,_,_,_],
+            [_,_,4,_,_,_,1,_,_],
+            [_,9,_,_,_,_,_,_,_],
+            [5,_,_,_,_,_,_,7,3],
+            [_,_,2,_,1,_,_,_,_],
+            [_,_,_,_,4,_,_,_,9]]).
+
+top :- writeln("Sudoku solution:"),
+    problem(1, Rows), sudoku(Rows), maplist(portray_clause, Rows),
+    Rows = [[9, 8, 7, 6, 5, 4, 3, 2, 1],
+            [2, 4, 6, 1, 7, 3, 9, 8, 5],
+            [3, 5, 1, 9, 2, 8, 7, 4, 6],
+            [1, 2, 8, 5, 3, 7, 6, 9, 4],
+            [6, 3, 4, 8, 9, 2, 1, 5, 7],
+            [7, 9, 5, 4, 6, 1, 8, 3, 2],
+            [5, 1, 9, 2, 8, 6, 4, 7, 3],
+            [4, 7, 2, 3, 1, 9, 5, 6, 8],
+            [8, 6, 3, 7, 4, 5, 2, 1, 9]].
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
