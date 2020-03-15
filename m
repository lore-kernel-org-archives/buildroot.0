From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 09:40:10 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/elf2flt: remove
 backported patch
Message-ID: <20200315082821.96BAF83D9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ede3dd0cabfe0d3f531c589d212fdf6f4189898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

The patch added by [1] to fix a segfault with elf2flt when binutils
2.33.1 is used on ARM, introduce a regression with previous binutils
version on m68k and ARM.

Theses issues has been reported upstream [2] [3] but there is no
definitive solution.

The binutils 2.33.1 has been disabled for configurations using
BR2_BINFMT_FLAT by the previous commit, so we can safely remove
the patch.

Fixes:
[acpica-20191018]
http://autobuild.buildroot.net/results/81ee33eb606062a62765d95b66a26f130d280c53
[augeas-1.12.0]
http://autobuild.buildroot.net/results/4e1f7f335d2c853e2a5e6ad96c14157ba8f003c7
[cairo-1.16.0]
http://autobuild.buildroot.net/results/976d99bc9b052f8d9429e666ac7fff7768ffff6b
[fontconfig-2.13.1]
http://autobuild.buildroot.net/results/4a5a8cb6411d709acb7ea8c83b3c8e45fdc0a10b
[gptfdisk-1.0.4]
http://autobuild.buildroot.net/results/6db5f9d8663730a54b04c1e624438095598b2573
[libopenssl-1.1.1d]
http://autobuild.buildroot.net/results/acf87e81130e85e7fb05edf5f6dedf095f16e226
[mimic-1.1.0]
http://autobuild.buildroot.net/results/61f53630ed85ee0d0d6dbf71012db77f4d7986ad
Maybe more...

[1] 2b064f86b6a0fd683f307b51f12d9d919fcaa386
[2] https://github.com/uclinux-dev/elf2flt/pull/16
[3] https://github.com/uclinux-dev/elf2flt/issues/12

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aa3622758bb08fa517a3054076fca89f7697e550)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lf2flt-fix-relocations-for-read-only-data.patch | 58 ----------------------
 1 file changed, 58 deletions(-)

diff --git a/package/elf2flt/0002-elf2flt-fix-relocations-for-read-only-data.patch b/package/elf2flt/0002-elf2flt-fix-relocations-for-read-only-data.patch
deleted file mode 100644
index 6cb3a55433..0000000000
--- a/package/elf2flt/0002-elf2flt-fix-relocations-for-read-only-data.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 6006e8d789f7a1129414fb3a8c930b094af0cafa Mon Sep 17 00:00:00 2001
-From: Greg Ungerer <gerg@kernel.org>
-Date: Wed, 6 Nov 2019 21:19:24 +0100
-Subject: [PATCH] elf2flt: fix relocations for read-only data
-
-Readonly data sections are mapped into the "text" section in the
-elf2flt.ld linker script. The relocation generation code is not handling
-that case properly though, and is actually mapping any data section type
-into the "data" section of the target binary.
-
-This problem case has been detected with elf2flt core dumping when used
-with binutils-2.33.1 (on ARM architecture targets). See thread at:
-
-   https://sourceware.org/ml/binutils/2019-10/msg00132.html
-
-Tested by Christophe Priouzeau [1]
-
-* binutils 2.33.1
-* buildroot 2019.11-rc1
-* patch on top of elf2flt (patch available on this thread)
-* configuration: stm32f469-disco with initramfs configuration on buildroot
-
-Result:
-Build: OK, all the binaries are generated
-Runtime test on stm32f469-disco: OK
-
-[1] https://github.com/uclinux-dev/elf2flt/issues/12
-
-Signed-off-by: Greg Ungerer <gerg@kernel.org>
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
----
- elf2flt.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index 67f720a..8973cef 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -418,10 +418,12 @@ output_relocs (
- //		continue;
- 
- 	/*
--	 *	Only relocate things in the data sections if we are PIC/GOT.
--	 *	otherwise do text as well
-+	 * Only relocate things in the writable data sections if we are PIC/GOT.
-+	 * Otherwise do text (and read only data) as well.
- 	 */
--	if ((!pic_with_got || ALWAYS_RELOC_TEXT) && (a->flags & SEC_CODE))
-+	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
-+	    ((a->flags & SEC_CODE) ||
-+	    ((a->flags & (SEC_DATA | SEC_READONLY)) == (SEC_DATA | SEC_READONLY))))
- 		sectionp = text + (a->vma - text_vma);
- 	else if (a->flags & SEC_DATA)
- 		sectionp = data + (a->vma - data_vma);
--- 
-2.21.0
-
