From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 18:36:39 +0200
Subject: [Buildroot] [git commit] binutils: drop *.texi* hunks from xtensa
	trampolines patches
Message-ID: <20140405163644.82F009C5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c09b2bfaeaa165ccd732da787c9e28536605dc15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebuilding as.info with makeinfo version 5.2 results in a build error,
even with pristine binutils source. Dropping hunks that change *.texi*
files avoids documentation rebuild.

Reported-by: Vincent Stehl?? <vincent.stehle@freescale.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/2.22/900-xtensa-trampolines.patch |  131 --------------------
 .../binutils/2.23.1/900-xtensa-trampolines.patch   |  131 --------------------
 .../binutils/2.23.2/900-xtensa-trampolines.patch   |  131 --------------------
 package/binutils/2.24/900-xtensa-trampolines.patch |  131 --------------------
 4 files changed, 0 insertions(+), 524 deletions(-)

diff --git a/package/binutils/2.22/900-xtensa-trampolines.patch b/package/binutils/2.22/900-xtensa-trampolines.patch
index 824cf44..b5b934f 100644
--- a/package/binutils/2.22/900-xtensa-trampolines.patch
+++ b/package/binutils/2.22/900-xtensa-trampolines.patch
@@ -37,8 +37,6 @@ Changes to Changelog files are dropped.
 
  gas/config/tc-xtensa.c                | 558 +++++++++++++++++++++++++++++++++-
  gas/config/tc-xtensa.h                |   5 +
- gas/doc/as.texinfo                    |   1 +
- gas/doc/c-xtensa.texi                 |  92 ++++++
  gas/frags.c                           |  15 +
  gas/frags.h                           |   3 +
  gas/testsuite/gas/xtensa/all.exp      |   1 +
@@ -727,135 +725,6 @@ index 0bf1240..4672bc6 100644
    RELAX_NONE
  };
  
-diff --git a/gas/doc/as.texinfo b/gas/doc/as.texinfo
-index 5c8b000..dc97175 100644
---- a/gas/doc/as.texinfo
-+++ b/gas/doc/as.texinfo
-@@ -543,6 +543,7 @@ gcc(1), ld(1), and the Info entries for @file{binutils} and @file{ld}.
-  [@b{--[no-]target-align}] [@b{--[no-]longcalls}]
-  [@b{--[no-]transform}]
-  [@b{--rename-section} @var{oldname}=@var{newname}]
-+ [@b{--[no-]trampolines}]
- @end ifset
- 
- @ifset Z80
-diff --git a/gas/doc/c-xtensa.texi b/gas/doc/c-xtensa.texi
-index 406e635..e763e36 100644
---- a/gas/doc/c-xtensa.texi
-+++ b/gas/doc/c-xtensa.texi
-@@ -91,6 +91,16 @@ instruction operands to be errors.
- @kindex --rename-section
- Rename the @var{oldname} section to @var{newname}.  This option can be used
- multiple times to rename multiple sections.
-+
-+ at item --trampolines | --no-trampolines
-+ at kindex --trampolines
-+ at kindex --no-trampolines
-+Enable or disable transformation of jump instructions to allow jumps
-+across a greater range of addresses.  @xref{Xtensa Jump Relaxation,
-+,Jump Trampolines}.  This option should be used when jump targets can
-+potentially be out of range.  In the absence of such jumps this option
-+does not affect code size or performance.  The default is
-+ at samp{--trampolines}.
- @end table
- 
- @c man end
-@@ -311,6 +321,7 @@ fields.
- @menu
- * Xtensa Branch Relaxation::        Relaxation of Branches.
- * Xtensa Call Relaxation::          Relaxation of Function Calls.
-+* Xtensa Jump Relaxation::          Relaxation of Jumps.
- * Xtensa Immediate Relaxation::     Relaxation of other Immediate Fields.
- @end menu
- 
-@@ -398,6 +409,87 @@ and some of the calls are out of range, function call relaxation can be
- enabled using the @samp{--longcalls} command-line option or the
- @code{longcalls} directive (@pxref{Longcalls Directive, ,longcalls}).
- 
-+ at node Xtensa Jump Relaxation
-+ at subsection Jump Relaxation
-+ at cindex relaxation of jump instructions
-+ at cindex jump instructions, relaxation
-+
-+Jump instruction may require relaxation because the Xtensa jump instruction
-+(@code{J}) provide a PC-relative offset of only 128 Kbytes in either
-+direction.  One option is to use jump long (@code{J.L}) instruction, which
-+depending on jump distance may be assembled as jump (@code{J}) or indirect
-+jump (@code{JX}).  However it needs a free register.  When there's no spare
-+register it is possible to plant intermediate jump sites (trampolines)
-+between the jump instruction and its target.  These sites may be located in
-+areas unreachable by normal code execution flow, in that case they only
-+contain intermediate jumps, or they may be inserted in the middle of code
-+block, in which case there's an additional jump from the beginning of the
-+trampoline to the instruction past its end.  So, for example:
-+
-+ at smallexample
-+ at group
-+    j 1f
-+    ...
-+    retw
-+    ...
-+    mov a10, a2
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+might be relaxed to:
-+
-+ at smallexample
-+ at group
-+    j .L0_TR_1
-+    ...
-+    retw
-+.L0_TR_1:
-+    j 1f
-+    ...
-+    mov a10, a2
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+or to:
-+
-+ at smallexample
-+ at group
-+    j .L0_TR_1
-+    ...
-+    retw
-+    ...
-+    mov a10, a2
-+    j .L0_TR_0
-+.L0_TR_1:
-+    j 1f
-+.L0_TR_0:
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+The Xtensa assempler uses trampolines with jump around only when it cannot
-+find suitable unreachable trampoline.  There may be multiple trampolines
-+between the jump instruction and its target.
-+
-+This relaxation does not apply to jumps to undefined symbols, assuming they
-+will reach their targets once resolved.
-+
-+Jump relaxation is enabled by default because it does not affect code size
-+or performance while the code itself is small.  This relaxation may be
-+disabled completely with @samp{--no-trampolines} or @samp{--no-transform}
-+command-line options (@pxref{Xtensa Options, ,Command Line Options}).
-+
- @node Xtensa Immediate Relaxation
- @subsection Other Immediate Field Relaxation
- @cindex immediate fields, relaxation
 diff --git a/gas/frags.c b/gas/frags.c
 index 5f68480..e14099d 100644
 --- a/gas/frags.c
diff --git a/package/binutils/2.23.1/900-xtensa-trampolines.patch b/package/binutils/2.23.1/900-xtensa-trampolines.patch
index 824cf44..b5b934f 100644
--- a/package/binutils/2.23.1/900-xtensa-trampolines.patch
+++ b/package/binutils/2.23.1/900-xtensa-trampolines.patch
@@ -37,8 +37,6 @@ Changes to Changelog files are dropped.
 
  gas/config/tc-xtensa.c                | 558 +++++++++++++++++++++++++++++++++-
  gas/config/tc-xtensa.h                |   5 +
- gas/doc/as.texinfo                    |   1 +
- gas/doc/c-xtensa.texi                 |  92 ++++++
  gas/frags.c                           |  15 +
  gas/frags.h                           |   3 +
  gas/testsuite/gas/xtensa/all.exp      |   1 +
@@ -727,135 +725,6 @@ index 0bf1240..4672bc6 100644
    RELAX_NONE
  };
  
-diff --git a/gas/doc/as.texinfo b/gas/doc/as.texinfo
-index 5c8b000..dc97175 100644
---- a/gas/doc/as.texinfo
-+++ b/gas/doc/as.texinfo
-@@ -543,6 +543,7 @@ gcc(1), ld(1), and the Info entries for @file{binutils} and @file{ld}.
-  [@b{--[no-]target-align}] [@b{--[no-]longcalls}]
-  [@b{--[no-]transform}]
-  [@b{--rename-section} @var{oldname}=@var{newname}]
-+ [@b{--[no-]trampolines}]
- @end ifset
- 
- @ifset Z80
-diff --git a/gas/doc/c-xtensa.texi b/gas/doc/c-xtensa.texi
-index 406e635..e763e36 100644
---- a/gas/doc/c-xtensa.texi
-+++ b/gas/doc/c-xtensa.texi
-@@ -91,6 +91,16 @@ instruction operands to be errors.
- @kindex --rename-section
- Rename the @var{oldname} section to @var{newname}.  This option can be used
- multiple times to rename multiple sections.
-+
-+ at item --trampolines | --no-trampolines
-+ at kindex --trampolines
-+ at kindex --no-trampolines
-+Enable or disable transformation of jump instructions to allow jumps
-+across a greater range of addresses.  @xref{Xtensa Jump Relaxation,
-+,Jump Trampolines}.  This option should be used when jump targets can
-+potentially be out of range.  In the absence of such jumps this option
-+does not affect code size or performance.  The default is
-+ at samp{--trampolines}.
- @end table
- 
- @c man end
-@@ -311,6 +321,7 @@ fields.
- @menu
- * Xtensa Branch Relaxation::        Relaxation of Branches.
- * Xtensa Call Relaxation::          Relaxation of Function Calls.
-+* Xtensa Jump Relaxation::          Relaxation of Jumps.
- * Xtensa Immediate Relaxation::     Relaxation of other Immediate Fields.
- @end menu
- 
-@@ -398,6 +409,87 @@ and some of the calls are out of range, function call relaxation can be
- enabled using the @samp{--longcalls} command-line option or the
- @code{longcalls} directive (@pxref{Longcalls Directive, ,longcalls}).
- 
-+ at node Xtensa Jump Relaxation
-+ at subsection Jump Relaxation
-+ at cindex relaxation of jump instructions
-+ at cindex jump instructions, relaxation
-+
-+Jump instruction may require relaxation because the Xtensa jump instruction
-+(@code{J}) provide a PC-relative offset of only 128 Kbytes in either
-+direction.  One option is to use jump long (@code{J.L}) instruction, which
-+depending on jump distance may be assembled as jump (@code{J}) or indirect
-+jump (@code{JX}).  However it needs a free register.  When there's no spare
-+register it is possible to plant intermediate jump sites (trampolines)
-+between the jump instruction and its target.  These sites may be located in
-+areas unreachable by normal code execution flow, in that case they only
-+contain intermediate jumps, or they may be inserted in the middle of code
-+block, in which case there's an additional jump from the beginning of the
-+trampoline to the instruction past its end.  So, for example:
-+
-+ at smallexample
-+ at group
-+    j 1f
-+    ...
-+    retw
-+    ...
-+    mov a10, a2
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+might be relaxed to:
-+
-+ at smallexample
-+ at group
-+    j .L0_TR_1
-+    ...
-+    retw
-+.L0_TR_1:
-+    j 1f
-+    ...
-+    mov a10, a2
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+or to:
-+
-+ at smallexample
-+ at group
-+    j .L0_TR_1
-+    ...
-+    retw
-+    ...
-+    mov a10, a2
-+    j .L0_TR_0
-+.L0_TR_1:
-+    j 1f
-+.L0_TR_0:
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+The Xtensa assempler uses trampolines with jump around only when it cannot
-+find suitable unreachable trampoline.  There may be multiple trampolines
-+between the jump instruction and its target.
-+
-+This relaxation does not apply to jumps to undefined symbols, assuming they
-+will reach their targets once resolved.
-+
-+Jump relaxation is enabled by default because it does not affect code size
-+or performance while the code itself is small.  This relaxation may be
-+disabled completely with @samp{--no-trampolines} or @samp{--no-transform}
-+command-line options (@pxref{Xtensa Options, ,Command Line Options}).
-+
- @node Xtensa Immediate Relaxation
- @subsection Other Immediate Field Relaxation
- @cindex immediate fields, relaxation
 diff --git a/gas/frags.c b/gas/frags.c
 index 5f68480..e14099d 100644
 --- a/gas/frags.c
diff --git a/package/binutils/2.23.2/900-xtensa-trampolines.patch b/package/binutils/2.23.2/900-xtensa-trampolines.patch
index 824cf44..b5b934f 100644
--- a/package/binutils/2.23.2/900-xtensa-trampolines.patch
+++ b/package/binutils/2.23.2/900-xtensa-trampolines.patch
@@ -37,8 +37,6 @@ Changes to Changelog files are dropped.
 
  gas/config/tc-xtensa.c                | 558 +++++++++++++++++++++++++++++++++-
  gas/config/tc-xtensa.h                |   5 +
- gas/doc/as.texinfo                    |   1 +
- gas/doc/c-xtensa.texi                 |  92 ++++++
  gas/frags.c                           |  15 +
  gas/frags.h                           |   3 +
  gas/testsuite/gas/xtensa/all.exp      |   1 +
@@ -727,135 +725,6 @@ index 0bf1240..4672bc6 100644
    RELAX_NONE
  };
  
-diff --git a/gas/doc/as.texinfo b/gas/doc/as.texinfo
-index 5c8b000..dc97175 100644
---- a/gas/doc/as.texinfo
-+++ b/gas/doc/as.texinfo
-@@ -543,6 +543,7 @@ gcc(1), ld(1), and the Info entries for @file{binutils} and @file{ld}.
-  [@b{--[no-]target-align}] [@b{--[no-]longcalls}]
-  [@b{--[no-]transform}]
-  [@b{--rename-section} @var{oldname}=@var{newname}]
-+ [@b{--[no-]trampolines}]
- @end ifset
- 
- @ifset Z80
-diff --git a/gas/doc/c-xtensa.texi b/gas/doc/c-xtensa.texi
-index 406e635..e763e36 100644
---- a/gas/doc/c-xtensa.texi
-+++ b/gas/doc/c-xtensa.texi
-@@ -91,6 +91,16 @@ instruction operands to be errors.
- @kindex --rename-section
- Rename the @var{oldname} section to @var{newname}.  This option can be used
- multiple times to rename multiple sections.
-+
-+ at item --trampolines | --no-trampolines
-+ at kindex --trampolines
-+ at kindex --no-trampolines
-+Enable or disable transformation of jump instructions to allow jumps
-+across a greater range of addresses.  @xref{Xtensa Jump Relaxation,
-+,Jump Trampolines}.  This option should be used when jump targets can
-+potentially be out of range.  In the absence of such jumps this option
-+does not affect code size or performance.  The default is
-+ at samp{--trampolines}.
- @end table
- 
- @c man end
-@@ -311,6 +321,7 @@ fields.
- @menu
- * Xtensa Branch Relaxation::        Relaxation of Branches.
- * Xtensa Call Relaxation::          Relaxation of Function Calls.
-+* Xtensa Jump Relaxation::          Relaxation of Jumps.
- * Xtensa Immediate Relaxation::     Relaxation of other Immediate Fields.
- @end menu
- 
-@@ -398,6 +409,87 @@ and some of the calls are out of range, function call relaxation can be
- enabled using the @samp{--longcalls} command-line option or the
- @code{longcalls} directive (@pxref{Longcalls Directive, ,longcalls}).
- 
-+ at node Xtensa Jump Relaxation
-+ at subsection Jump Relaxation
-+ at cindex relaxation of jump instructions
-+ at cindex jump instructions, relaxation
-+
-+Jump instruction may require relaxation because the Xtensa jump instruction
-+(@code{J}) provide a PC-relative offset of only 128 Kbytes in either
-+direction.  One option is to use jump long (@code{J.L}) instruction, which
-+depending on jump distance may be assembled as jump (@code{J}) or indirect
-+jump (@code{JX}).  However it needs a free register.  When there's no spare
-+register it is possible to plant intermediate jump sites (trampolines)
-+between the jump instruction and its target.  These sites may be located in
-+areas unreachable by normal code execution flow, in that case they only
-+contain intermediate jumps, or they may be inserted in the middle of code
-+block, in which case there's an additional jump from the beginning of the
-+trampoline to the instruction past its end.  So, for example:
-+
-+ at smallexample
-+ at group
-+    j 1f
-+    ...
-+    retw
-+    ...
-+    mov a10, a2
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+might be relaxed to:
-+
-+ at smallexample
-+ at group
-+    j .L0_TR_1
-+    ...
-+    retw
-+.L0_TR_1:
-+    j 1f
-+    ...
-+    mov a10, a2
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+or to:
-+
-+ at smallexample
-+ at group
-+    j .L0_TR_1
-+    ...
-+    retw
-+    ...
-+    mov a10, a2
-+    j .L0_TR_0
-+.L0_TR_1:
-+    j 1f
-+.L0_TR_0:
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+The Xtensa assempler uses trampolines with jump around only when it cannot
-+find suitable unreachable trampoline.  There may be multiple trampolines
-+between the jump instruction and its target.
-+
-+This relaxation does not apply to jumps to undefined symbols, assuming they
-+will reach their targets once resolved.
-+
-+Jump relaxation is enabled by default because it does not affect code size
-+or performance while the code itself is small.  This relaxation may be
-+disabled completely with @samp{--no-trampolines} or @samp{--no-transform}
-+command-line options (@pxref{Xtensa Options, ,Command Line Options}).
-+
- @node Xtensa Immediate Relaxation
- @subsection Other Immediate Field Relaxation
- @cindex immediate fields, relaxation
 diff --git a/gas/frags.c b/gas/frags.c
 index 5f68480..e14099d 100644
 --- a/gas/frags.c
diff --git a/package/binutils/2.24/900-xtensa-trampolines.patch b/package/binutils/2.24/900-xtensa-trampolines.patch
index 824cf44..b5b934f 100644
--- a/package/binutils/2.24/900-xtensa-trampolines.patch
+++ b/package/binutils/2.24/900-xtensa-trampolines.patch
@@ -37,8 +37,6 @@ Changes to Changelog files are dropped.
 
  gas/config/tc-xtensa.c                | 558 +++++++++++++++++++++++++++++++++-
  gas/config/tc-xtensa.h                |   5 +
- gas/doc/as.texinfo                    |   1 +
- gas/doc/c-xtensa.texi                 |  92 ++++++
  gas/frags.c                           |  15 +
  gas/frags.h                           |   3 +
  gas/testsuite/gas/xtensa/all.exp      |   1 +
@@ -727,135 +725,6 @@ index 0bf1240..4672bc6 100644
    RELAX_NONE
  };
  
-diff --git a/gas/doc/as.texinfo b/gas/doc/as.texinfo
-index 5c8b000..dc97175 100644
---- a/gas/doc/as.texinfo
-+++ b/gas/doc/as.texinfo
-@@ -543,6 +543,7 @@ gcc(1), ld(1), and the Info entries for @file{binutils} and @file{ld}.
-  [@b{--[no-]target-align}] [@b{--[no-]longcalls}]
-  [@b{--[no-]transform}]
-  [@b{--rename-section} @var{oldname}=@var{newname}]
-+ [@b{--[no-]trampolines}]
- @end ifset
- 
- @ifset Z80
-diff --git a/gas/doc/c-xtensa.texi b/gas/doc/c-xtensa.texi
-index 406e635..e763e36 100644
---- a/gas/doc/c-xtensa.texi
-+++ b/gas/doc/c-xtensa.texi
-@@ -91,6 +91,16 @@ instruction operands to be errors.
- @kindex --rename-section
- Rename the @var{oldname} section to @var{newname}.  This option can be used
- multiple times to rename multiple sections.
-+
-+ at item --trampolines | --no-trampolines
-+ at kindex --trampolines
-+ at kindex --no-trampolines
-+Enable or disable transformation of jump instructions to allow jumps
-+across a greater range of addresses.  @xref{Xtensa Jump Relaxation,
-+,Jump Trampolines}.  This option should be used when jump targets can
-+potentially be out of range.  In the absence of such jumps this option
-+does not affect code size or performance.  The default is
-+ at samp{--trampolines}.
- @end table
- 
- @c man end
-@@ -311,6 +321,7 @@ fields.
- @menu
- * Xtensa Branch Relaxation::        Relaxation of Branches.
- * Xtensa Call Relaxation::          Relaxation of Function Calls.
-+* Xtensa Jump Relaxation::          Relaxation of Jumps.
- * Xtensa Immediate Relaxation::     Relaxation of other Immediate Fields.
- @end menu
- 
-@@ -398,6 +409,87 @@ and some of the calls are out of range, function call relaxation can be
- enabled using the @samp{--longcalls} command-line option or the
- @code{longcalls} directive (@pxref{Longcalls Directive, ,longcalls}).
- 
-+ at node Xtensa Jump Relaxation
-+ at subsection Jump Relaxation
-+ at cindex relaxation of jump instructions
-+ at cindex jump instructions, relaxation
-+
-+Jump instruction may require relaxation because the Xtensa jump instruction
-+(@code{J}) provide a PC-relative offset of only 128 Kbytes in either
-+direction.  One option is to use jump long (@code{J.L}) instruction, which
-+depending on jump distance may be assembled as jump (@code{J}) or indirect
-+jump (@code{JX}).  However it needs a free register.  When there's no spare
-+register it is possible to plant intermediate jump sites (trampolines)
-+between the jump instruction and its target.  These sites may be located in
-+areas unreachable by normal code execution flow, in that case they only
-+contain intermediate jumps, or they may be inserted in the middle of code
-+block, in which case there's an additional jump from the beginning of the
-+trampoline to the instruction past its end.  So, for example:
-+
-+ at smallexample
-+ at group
-+    j 1f
-+    ...
-+    retw
-+    ...
-+    mov a10, a2
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+might be relaxed to:
-+
-+ at smallexample
-+ at group
-+    j .L0_TR_1
-+    ...
-+    retw
-+.L0_TR_1:
-+    j 1f
-+    ...
-+    mov a10, a2
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+or to:
-+
-+ at smallexample
-+ at group
-+    j .L0_TR_1
-+    ...
-+    retw
-+    ...
-+    mov a10, a2
-+    j .L0_TR_0
-+.L0_TR_1:
-+    j 1f
-+.L0_TR_0:
-+    call8 func
-+    ...
-+1:
-+    ...
-+ at end group
-+ at end smallexample
-+
-+The Xtensa assempler uses trampolines with jump around only when it cannot
-+find suitable unreachable trampoline.  There may be multiple trampolines
-+between the jump instruction and its target.
-+
-+This relaxation does not apply to jumps to undefined symbols, assuming they
-+will reach their targets once resolved.
-+
-+Jump relaxation is enabled by default because it does not affect code size
-+or performance while the code itself is small.  This relaxation may be
-+disabled completely with @samp{--no-trampolines} or @samp{--no-transform}
-+command-line options (@pxref{Xtensa Options, ,Command Line Options}).
-+
- @node Xtensa Immediate Relaxation
- @subsection Other Immediate Field Relaxation
- @cindex immediate fields, relaxation
 diff --git a/gas/frags.c b/gas/frags.c
 index 5f68480..e14099d 100644
 --- a/gas/frags.c
