From: Romain Naour <romain.naour@smile.fr>
Date: Wed,  6 Nov 2019 22:19:13 +0100
Subject: [Buildroot] [PATCH] package/elf2flt: .ARM.exidx RO data section is
 incorrectly mapped to data
Message-ID: <20191106211913.21256-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with Binutils 2.33.1, elf2flt segfault while building busybox:
"ld (ld-elf2flt):
/opt/armv7m--uclibc--bleeding-edge-2/arm-buildroot-uclinux-uclibcgnueabi/bin/elf2flt

This was reported to the Binutils mailing list and it's seems
an elf2flt issue with .ARM.exidx RO data section as explained
by: https://sourceware.org/ml/binutils/2019-10/msg00132.html

Apply the patch provided by Greg Ungerer [1] and tested by
Christophe Priouzeau using stm32f469_disco_defconfig on
stm32f469-disco board.

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/319395300

[1] https://github.com/uclinux-dev/elf2flt/issues/12

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 ...t-fix-relocations-for-read-only-data.patch | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/elf2flt/0002-elf2flt-fix-relocations-for-read-only-data.patch

diff --git a/package/elf2flt/0002-elf2flt-fix-relocations-for-read-only-data.patch b/package/elf2flt/0002-elf2flt-fix-relocations-for-read-only-data.patch
new file mode 100644
index 0000000000..6cb3a55433
--- /dev/null
+++ b/package/elf2flt/0002-elf2flt-fix-relocations-for-read-only-data.patch
@@ -0,0 +1,58 @@
+From 6006e8d789f7a1129414fb3a8c930b094af0cafa Mon Sep 17 00:00:00 2001
+From: Greg Ungerer <gerg@kernel.org>
+Date: Wed, 6 Nov 2019 21:19:24 +0100
+Subject: [PATCH] elf2flt: fix relocations for read-only data
+
+Readonly data sections are mapped into the "text" section in the
+elf2flt.ld linker script. The relocation generation code is not handling
+that case properly though, and is actually mapping any data section type
+into the "data" section of the target binary.
+
+This problem case has been detected with elf2flt core dumping when used
+with binutils-2.33.1 (on ARM architecture targets). See thread at:
+
+   https://sourceware.org/ml/binutils/2019-10/msg00132.html
+
+Tested by Christophe Priouzeau [1]
+
+* binutils 2.33.1
+* buildroot 2019.11-rc1
+* patch on top of elf2flt (patch available on this thread)
+* configuration: stm32f469-disco with initramfs configuration on buildroot
+
+Result:
+Build: OK, all the binaries are generated
+Runtime test on stm32f469-disco: OK
+
+[1] https://github.com/uclinux-dev/elf2flt/issues/12
+
+Signed-off-by: Greg Ungerer <gerg@kernel.org>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
+---
+ elf2flt.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 67f720a..8973cef 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -418,10 +418,12 @@ output_relocs (
+ //		continue;
+ 
+ 	/*
+-	 *	Only relocate things in the data sections if we are PIC/GOT.
+-	 *	otherwise do text as well
++	 * Only relocate things in the writable data sections if we are PIC/GOT.
++	 * Otherwise do text (and read only data) as well.
+ 	 */
+-	if ((!pic_with_got || ALWAYS_RELOC_TEXT) && (a->flags & SEC_CODE))
++	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
++	    ((a->flags & SEC_CODE) ||
++	    ((a->flags & (SEC_DATA | SEC_READONLY)) == (SEC_DATA | SEC_READONLY))))
+ 		sectionp = text + (a->vma - text_vma);
+ 	else if (a->flags & SEC_DATA)
+ 		sectionp = data + (a->vma - data_vma);
+-- 
+2.21.0
+
-- 
2.21.0
