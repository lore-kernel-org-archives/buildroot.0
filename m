From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 18:53:47 +0100
Subject: [Buildroot] [git commit] boot/gummiboot: fix linking for non-host
 compatible targets
Message-ID: <20190326175043.7C54384059@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2423aeef2dff6c4ce2fe46cf8be16c0f90b7ee08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-linking-for-non-host-compatible-targets.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/boot/gummiboot/0002-Fix-linking-for-non-host-compatible-targets.patch b/boot/gummiboot/0002-Fix-linking-for-non-host-compatible-targets.patch
new file mode 100644
index 0000000000..7104a581e2
--- /dev/null
+++ b/boot/gummiboot/0002-Fix-linking-for-non-host-compatible-targets.patch
@@ -0,0 +1,54 @@
+From fc05ced797b87286b8ec7303fe32bf200a072972 Mon Sep 17 00:00:00 2001
+From: Esben Haabendal <esben@haabendal.dk>
+Date: Mon, 18 Mar 2019 11:14:31 +0100
+Subject: [PATCH] Fix linking for non-host compatible targets
+
+Without this, gummiboot build system will use host 'ld' when linking
+target binary, which is obviously not a good idea.
+
+Signed-off-by: Esben Haabendal <esben@haabendal.dk>
+---
+ Makefile.am  | 4 ++--
+ configure.ac | 4 ++++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6568a355ed74..9051dd44edd9 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -142,7 +142,7 @@ $(top_builddir)/src/efi/%.o: $(top_srcdir)/src/efi/%.c $(addprefix $(top_srcdir)
+ 	$(AM_V_CC)$(EFI_CC) $(efi_cppflags) $(efi_cflags) -c $< -o $@
+ 
+ $(gummiboot_solib): $(gummiboot_objects)
+-	$(AM_V_CCLD)$(LD) $(efi_ldflags) $(gummiboot_objects) \
++	$(AM_V_CCLD)$(EFI_LD) $(efi_ldflags) $(gummiboot_objects) \
+ 		-o $@ -lefi -lgnuefi $(shell $(CC) -print-libgcc-file-name); \
+ 	nm -D -u $@ | grep ' U ' && exit 1 || :
+ .DELETE_ON_ERROR: $(gummboot_solib)
+@@ -177,7 +177,7 @@ $(top_builddir)/src/efi/%.o: $(top_srcdir)/src/efi/%.c $(addprefix $(top_srcdir)
+ 	$(AM_V_CC)$(EFI_CC) $(efi_cppflags) $(efi_cflags) -c $< -o $@
+ 
+ $(stub_solib): $(stub_objects)
+-	$(AM_V_CCLD)$(LD) $(efi_ldflags) $(stub_objects) \
++	$(AM_V_CCLD)$(EFI_LD) $(efi_ldflags) $(stub_objects) \
+ 		-o $@ -lefi -lgnuefi $(shell $(CC) -print-libgcc-file-name); \
+ 	nm -D -u $@ | grep ' U ' && exit 1 || :
+ .DELETE_ON_ERROR: $(gummboot_solib)
+diff --git a/configure.ac b/configure.ac
+index 27bbe1d73396..b948696c220b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,6 +40,10 @@ dnl Don't try to use things like -std=c99 for efi compilation
+ EFI_CC=$CC
+ AC_SUBST([EFI_CC])
+ 
++dnl Allow specifying linker compatible with the compiler
++EFI_LD=$LD
++AC_SUBST([EFI_LD])
++
+ AC_PROG_CC_C99
+ AM_PROG_CC_C_O
+ AC_PROG_GCC_TRADITIONAL
+-- 
+2.21.0
+
