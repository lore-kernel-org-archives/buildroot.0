From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:49:11 +0200
Subject: [Buildroot] [git commit branch/next] binutils: more fixes for
	arc-2015.06 tools
Message-ID: <20150808105649.293857FD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a484792066222550a2c5c6ba41f7b7e4a391031
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Two patches below are taken from development branch of ARC binutils,
so one the next release of ARC tools happens both patches must be removed.

These 2 patches:
 0003-ld-arc-Provide-the-.tdata-symbol.patch
 0004-Provide-.tbss-symbol.patch
fix missing .tbss and .tdata sections during linkage stage such as:
------------------------------>8---------------------------
arc-linux-g++ test.cpp
../arc-buildroot-linux-uclibc/lib/libstdc++.so: undefined reference to '.tbss'
collect2: error: ld returned 1 exit status
------------------------------>8---------------------------

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-ld-arc-Provide-the-.tdata-symbol.patch    |  145 ++++++++++++++++++++
 .../arc-2015.06/0003-Provide-.tbss-symbol.patch    |   70 ++++++++++
 2 files changed, 215 insertions(+), 0 deletions(-)

diff --git a/package/binutils/arc-2015.06/0002-ld-arc-Provide-the-.tdata-symbol.patch b/package/binutils/arc-2015.06/0002-ld-arc-Provide-the-.tdata-symbol.patch
new file mode 100644
index 0000000..40341a5
--- /dev/null
+++ b/package/binutils/arc-2015.06/0002-ld-arc-Provide-the-.tdata-symbol.patch
@@ -0,0 +1,145 @@
+From daf1ff839fc68ef31e3263780de4604a95118702 Mon Sep 17 00:00:00 2001
+From: Andrew Burgess <andrew.burgess@embecosm.com>
+Date: Thu, 23 Jul 2015 14:44:15 +0100
+Subject: [PATCH 1/2] ld/arc: Provide the .tdata symbol.
+
+When creating local dynamic tls access we rely on a .tdata symbol being
+available to link against.  Normally, this is fine, as content is placed
+into the .tdata section the linker makes a .tdata symbol available and
+all is fine.
+
+However, these linker created section symbols only exist for input
+sections, not output sections, so, when we assemble with
+-fdata-sections, and the content is placed not into '.tdata', but into
+sections like, '.tdata.variable' we end up in a situation where there is
+no input section called '.tdata', and so the linker does not create a
+symbol called '.tdata' for us, at which point the link fails.
+
+The solution it to have the linker script explicitly provide the symbol
+'.tdata', this should ensure that the symbol is always available.
+
+ld/ChangeLog:
+
+	* scripttempl/arclinux.sc (.tdata): Provide the .tdata symbol.
+
+ld/testsuite/ChangeLog:
+
+	* ld/testsuite/ld-arc/arc.exp: Run new test.
+	* ld/testsuite/ld-arc/tls-data-sections.d: New file.
+	* ld/testsuite/ld-arc/tls-data-sections.s: New file.
+---
+ ld/ChangeLog.ARC                        |  4 ++++
+ ld/scripttempl/arclinux.sc              |  2 +-
+ ld/testsuite/ChangeLog.ARC              |  6 ++++++
+ ld/testsuite/ld-arc/arc.exp             |  1 +
+ ld/testsuite/ld-arc/tls-data-sections.d | 12 ++++++++++++
+ ld/testsuite/ld-arc/tls-data-sections.s | 30 ++++++++++++++++++++++++++++++
+ 6 files changed, 54 insertions(+), 1 deletion(-)
+ create mode 100644 ld/testsuite/ld-arc/tls-data-sections.d
+ create mode 100644 ld/testsuite/ld-arc/tls-data-sections.s
+
+diff --git a/ld/ChangeLog.ARC b/ld/ChangeLog.ARC
+index fac6f48..0006bb3 100644
+--- a/ld/ChangeLog.ARC
++++ b/ld/ChangeLog.ARC
+@@ -1,3 +1,7 @@
++2015-07-23  Andrew Burgess  <andrew.burgess@embecosm.com>
++
++	* scripttempl/arclinux.sc (.tdata): Provide the .tdata symbol.
++
+ 2015-03-26: Claudiu Zissulescu <claziss@synopsys.com>
+ 
+ 	* testsuite/ld-arc/sda_relocs.d: New file.
+diff --git a/ld/scripttempl/arclinux.sc b/ld/scripttempl/arclinux.sc
+index 9d43ca3..1385b30 100644
+--- a/ld/scripttempl/arclinux.sc
++++ b/ld/scripttempl/arclinux.sc
+@@ -326,7 +326,7 @@ cat <<EOF
+   .data1        ${RELOCATING-0} : { *(.data1) }
+   /* TLS local dynamic uses .tdata as a reference point.  */
+   ${RELOCATING+${CREATE_SHLIB+PROVIDE_HIDDEN (.tdata = .);}}
+-  .tdata	${RELOCATING-0} : { *(.tdata${RELOCATING+ .tdata.* .gnu.linkonce.td.*}) }
++  .tdata	${RELOCATING-0} : { PROVIDE_HIDDEN(.tdata = .); *(.tdata${RELOCATING+ .tdata.* .gnu.linkonce.td.*}) }
+   .tbss		${RELOCATING-0} : { *(.tbss${RELOCATING+ .tbss.* .gnu.linkonce.tb.*})${RELOCATING+ *(.tcommon)} }
+   .eh_frame     ${RELOCATING-0} : { KEEP (*(.eh_frame)) }
+   .gcc_except_table ${RELOCATING-0} : { *(.gcc_except_table) }
+diff --git a/ld/testsuite/ChangeLog.ARC b/ld/testsuite/ChangeLog.ARC
+index b6d3eff..79f7ea9 100644
+--- a/ld/testsuite/ChangeLog.ARC
++++ b/ld/testsuite/ChangeLog.ARC
+@@ -1,3 +1,9 @@
++2015-07-23  Andrew Burgess  <andrew.burgess@embecosm.com>
++
++	* ld/testsuite/ld-arc/arc.exp: Run new test.
++	* ld/testsuite/ld-arc/tls-data-sections.d: New file.
++	* ld/testsuite/ld-arc/tls-data-sections.s: New file.
++
+ 2015-06-06  Andrew Burgess  <andrew.burgess@embecosm.com>
+ 
+ 	* ld-arc/unaligned-pc32.d: New file.
+diff --git a/ld/testsuite/ld-arc/arc.exp b/ld/testsuite/ld-arc/arc.exp
+index d2bfafe..74ab458 100644
+--- a/ld/testsuite/ld-arc/arc.exp
++++ b/ld/testsuite/ld-arc/arc.exp
+@@ -47,3 +47,4 @@ if {[check_shared_lib_support]} {
+ 
+ run_dump_test "sda_relocs"
+ run_dump_test "unaligned-pc32"
++run_dump_test "tls-data-sections"
+diff --git a/ld/testsuite/ld-arc/tls-data-sections.d b/ld/testsuite/ld-arc/tls-data-sections.d
+new file mode 100644
+index 0000000..9823bf0
+--- /dev/null
++++ b/ld/testsuite/ld-arc/tls-data-sections.d
+@@ -0,0 +1,12 @@
++#source: tls-data-sections.s
++#ld: --entry=main
++#objdump: -rd
++
++
++.*:     file format elf32-littlearc
++
++
++Disassembly of section \.text:
++
++00010094 <main>:
++   10094:	00 21 80 3f 00 00 08 00 	add        r0,r25,8
+diff --git a/ld/testsuite/ld-arc/tls-data-sections.s b/ld/testsuite/ld-arc/tls-data-sections.s
+new file mode 100644
+index 0000000..f0450c0
+--- /dev/null
++++ b/ld/testsuite/ld-arc/tls-data-sections.s
+@@ -0,0 +1,30 @@
++        /* This file is not intended to be real code, however, the
++           contents of the main function is real code as generated as
++           part of a local dynamic tls model access.  The purpose of
++           this test is to check that such an access will link
++           correctly.
++
++           Notice that the relocation in main references '.tdata', and
++           though we put content into '.tdata.pgsz.1362' we don't
++           create a '.tdata' section.  This is intentional, this example
++           was generated using -fdata-sections.
++
++           The '.tdata' section will be created in the linker script,
++           and we do expect to be able to reference it.  This should link.
++        */
++
++        .section ".text", "ax"
++        .global main, _start
++_start: 
++        .type   main, @function
++main:
++        add r0,pcl, at .tdata@tlsgd                ;8
++        .size   main, .-main
++
++        .section        .tdata.pgsz.1362,"awT", at progbits
++        .align 8
++        .type   pgsz.1362, @object
++        .size   pgsz.1362, 4
++
++pgsz.1362:
++        .word   1
+-- 
+2.4.3
+
diff --git a/package/binutils/arc-2015.06/0003-Provide-.tbss-symbol.patch b/package/binutils/arc-2015.06/0003-Provide-.tbss-symbol.patch
new file mode 100644
index 0000000..34bb2a2
--- /dev/null
+++ b/package/binutils/arc-2015.06/0003-Provide-.tbss-symbol.patch
@@ -0,0 +1,70 @@
+From a6014a956a4f2263c28240bb9191bee8f924b5db Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Tue, 28 Jul 2015 13:34:47 +0200
+Subject: [PATCH 2/2] Provide .tbss symbol
+
+---
+ ld/ChangeLog.ARC           | 14 +++++++++-----
+ ld/scripttempl/arclinux.sc |  2 +-
+ 2 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/ld/ChangeLog.ARC b/ld/ChangeLog.ARC
+index 0006bb3..fb5c717 100644
+--- a/ld/ChangeLog.ARC
++++ b/ld/ChangeLog.ARC
+@@ -1,8 +1,12 @@
++2015-07-28  Claudiu Zissulescu  <claziss@synopsys.com>
++
++	* scripttempl/arclinux.sc (.tbss): Provide the .tbss symbol.
++
+ 2015-07-23  Andrew Burgess  <andrew.burgess@embecosm.com>
+ 
+ 	* scripttempl/arclinux.sc (.tdata): Provide the .tdata symbol.
+ 
+-2015-03-26: Claudiu Zissulescu <claziss@synopsys.com>
++2015-03-26  Claudiu Zissulescu <claziss@synopsys.com>
+ 
+ 	* testsuite/ld-arc/sda_relocs.d: New file.
+ 	* testsuite/ld-arc/sda_relocs.ld: Likewise.
+@@ -13,21 +17,21 @@
+ 	* scripttempl/arclinux.sc: PROVIDE_HIDDEN .tdata (in case the
+ 	section won't be included).
+ 
+-2014-12-17: Claudiu Zissulescu <claziss@synopsys.com>
++2014-12-17  Claudiu Zissulescu  <claziss@synopsys.com>
+ 
+ 	* scripttempl/elfarcv2.sc: Update .startup section.
+ 
+-2014-12-08: Claudiu Zissulescu <claziss@synopsys.com>
++2014-12-08  Claudiu Zissulescu  <claziss@synopsys.com>
+ 
+ 	* emulparams/arcv2elf.sh :Add discarded sections.
+ 	* emulparams/arcv2elfb.sh: Likewise
+ 	* scripttempl/elfarcv2.sc: New sections.
+ 
+-2014-12-01: Claudiu Zissulescu <claziss@synopsys.com>
++2014-12-01  Claudiu Zissulescu  <claziss@synopsys.com>
+ 
+ 	* scripttempl/elfarcv2.sc: Align the start of the stack.
+ 
+-2014-11-27: Claudiu Zissulescu <claziss@synopsys.com>
++2014-11-27  Claudiu Zissulescu  <claziss@synopsys.com>
+ 
+ 	* Makefile.am: Add two new emulation scripts for ARCv2.
+ 	* configure.tgt: Likewise.
+diff --git a/ld/scripttempl/arclinux.sc b/ld/scripttempl/arclinux.sc
+index 1385b30..bef5336 100644
+--- a/ld/scripttempl/arclinux.sc
++++ b/ld/scripttempl/arclinux.sc
+@@ -327,7 +327,7 @@ cat <<EOF
+   /* TLS local dynamic uses .tdata as a reference point.  */
+   ${RELOCATING+${CREATE_SHLIB+PROVIDE_HIDDEN (.tdata = .);}}
+   .tdata	${RELOCATING-0} : { PROVIDE_HIDDEN(.tdata = .); *(.tdata${RELOCATING+ .tdata.* .gnu.linkonce.td.*}) }
+-  .tbss		${RELOCATING-0} : { *(.tbss${RELOCATING+ .tbss.* .gnu.linkonce.tb.*})${RELOCATING+ *(.tcommon)} }
++  .tbss		${RELOCATING-0} : { PROVIDE_HIDDEN(.tbss = .); *(.tbss${RELOCATING+ .tbss.* .gnu.linkonce.tb.*})${RELOCATING+ *(.tcommon)} }
+   .eh_frame     ${RELOCATING-0} : { KEEP (*(.eh_frame)) }
+   .gcc_except_table ${RELOCATING-0} : { *(.gcc_except_table) }
+   ${WRITABLE_RODATA+${RODATA}}
+-- 
+2.4.3
+
