From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 22 Feb 2020 00:57:28 +0100
Subject: [Buildroot] [PATCH] package/elf2flt: fix relocations for readonly
 .eh_frame section
Message-ID: <20200221235728.592613-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch added to fix a efl2flt segfault on ARM Cortex-m4
introduced some regressions on m68k and ARM [2].

While debuging, we can notice the flags value (0x12f) for .eh_frame
just before the crash.

RELOCS: .eh_frame [0x2185c20]: flags=0x12f vma=0x84384

    /* bug case: flags = 0x12f (m68k)
     * SEC_HAS_CONTENTS 0x100
     * SEC_DATA         0x020
     * SEC_READONLY     0x008
     * SEC_RELOC        0x004
     * SEC_LOAD         0x002
     * SEC_ALLOC        0x001
     */

On ARM cortex-m4, we have the same flags:
RELOCS: .ARM.exidx [0x9ac5b0]: flags=0x12f vma=0x4b4ec

So due to the new condition introduced by [1] the .eh_frame
section located in a readonly data section will be moved to
the "text" section.

Looking at the gcc code for m68k [3]:

"Because .eh_frame refers to both code and data, it follows that
.eh_frame must be in the data segment itself.
[...]
In theory, we could create a read-only .eh_frame [...]. However,
gcc currently handles indirect references using a per-TU constant
pool. This means that if a function and its eh_frame are removed
by the linker, the eh_frame's indirect references to the removed
function will not be removed, leading to an unresolved symbol
error."

Fix this crash by checking the section name and move
.eh_frame section even if it is located in readonly data.

Upstream status: under review [4]

Build tested on m68k and ARM w/ host-binutils 2.33.1.

[1] 2b064f86b6a0fd683f307b51f12d9d919fcaa386
[2] http://lists.busybox.net/pipermail/buildroot/2020-February/274593.html
[3] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/m68k/m68k.h;h=fc65e524b139a6d43e528956a788b9110aebaf2e;hb=a0c06cc27d2146b7d86758ffa236516c6143d62c#l785
[4] https://github.com/uclinux-dev/elf2flt/issues/12

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...cations-for-read-only-.eh_frame-sect.patch | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 package/elf2flt/0003-elf2flt-fix-relocations-for-read-only-.eh_frame-sect.patch

diff --git a/package/elf2flt/0003-elf2flt-fix-relocations-for-read-only-.eh_frame-sect.patch b/package/elf2flt/0003-elf2flt-fix-relocations-for-read-only-.eh_frame-sect.patch
new file mode 100644
index 0000000000..7b7daccdbb
--- /dev/null
+++ b/package/elf2flt/0003-elf2flt-fix-relocations-for-read-only-.eh_frame-sect.patch
@@ -0,0 +1,81 @@
+From 9cab9b546359eba9ac4391f64626714f0534da0b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Fri, 21 Feb 2020 23:31:55 +0100
+Subject: [PATCH] elf2flt: fix relocations for read-only .eh_frame section
+
+The commit [1] moved readonly data sections to "text" section.
+This was needed to fix a elf2flt segfault on ARM architectures with
+Binutils >= 2.33.1.
+
+After this patch was applied to Buildroot's elf2flt package,
+new segfault appear while building several packages
+(acpica, augeas, binutils, cairo, fontconfig, gptfdisk, libopenssl,
+mimic...) [2].
+
+We can reproduce the issue manually from the binutils build directory:
+
+'output/host/m68k-buildroot-uclinux-uclibc/bin/elf2flt' '-a' '-o' 'readelf' '-r' 'readelf.gdb'
+
+While debuging, we can notice the flags value (0x12f) for .eh_frame
+just before the crash.
+
+RELOCS: .eh_frame [0x2185c20]: flags=0x12f vma=0x84384
+
+    /* bug case: flags = 0x12f (m68k)
+     * SEC_HAS_CONTENTS 0x100
+     * SEC_DATA         0x020
+     * SEC_READONLY     0x008
+     * SEC_RELOC        0x004
+     * SEC_LOAD         0x002
+     * SEC_ALLOC        0x001
+     */
+
+On ARM cortex-m4, we have the same flags:
+RELOCS: .ARM.exidx [0x9ac5b0]: flags=0x12f vma=0x4b4ec
+
+So due to the new condition introduced by [1] the .eh_frame
+section located in a readonly data section will be moved to
+the "text" section.
+
+Looking at the gcc code for m68k [3]:
+
+"Because .eh_frame refers to both code and data, it follows that
+.eh_frame must be in the data segment itself.
+[...]
+In theory, we could create a read-only .eh_frame [...]. However,
+gcc currently handles indirect references using a per-TU constant
+pool. This means that if a function and its eh_frame are removed
+by the linker, the eh_frame's indirect references to the removed
+function will not be removed, leading to an unresolved symbol
+error."
+
+Fix this crash by checking the section name and move
+.eh_frame section even if it is located in readonly data.
+
+[1] 73325b7f209e0f68887333385184af275531427d
+[2] http://lists.busybox.net/pipermail/buildroot/2020-February/274593.html
+[3] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/m68k/m68k.h;h=fc65e524b139a6d43e528956a788b9110aebaf2e;hb=a0c06cc27d2146b7d86758ffa236516c6143d62c#l785
+[4] https://github.com/uclinux-dev/elf2flt/issues/12
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ elf2flt.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 656e19b..30778a9 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -283,7 +283,8 @@ output_relocs (
+ 	 */
+ 	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
+ 	    ((a->flags & SEC_CODE) ||
+-	    ((a->flags & (SEC_DATA | SEC_READONLY)) == (SEC_DATA | SEC_READONLY))))
++		((a->flags & (SEC_DATA | SEC_READONLY)) == (SEC_DATA | SEC_READONLY) &&
++			(strcmp(".eh_frame", a->name) != 0))))
+ 		sectionp = text + (a->vma - text_vma);
+ 	else if (a->flags & SEC_DATA)
+ 		sectionp = data + (a->vma - data_vma);
+-- 
+2.24.1
+
-- 
2.24.1
