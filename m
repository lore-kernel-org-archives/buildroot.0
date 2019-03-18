From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:55:07 +0100
Subject: [Buildroot] [git commit] package/glibc: update glibc version for
 RISC-V 32-bit
Message-ID: <20190318215505.978A88E203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4958567284026f979f6e0056a5b98bedd77e88f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../glibc.hash                                     |  2 +-
 ...x-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch | 59 ----------------------
 ...t_t-error-that-breaks-RISC-V-architecture.patch | 39 --------------
 package/glibc/glibc.mk                             |  2 +-
 4 files changed, 2 insertions(+), 100 deletions(-)

diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
similarity index 71%
rename from package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash
rename to package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
index 3eb5e04e96..09ddc7be72 100644
--- a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/glibc.hash
+++ b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256 a40f908125135bad2cf92c18d07ad25b3091b161b3a5d3aea46c23ffd2ac90b8  glibc-4e2943456e690d89f48e6e710757dd09404b0c9a.tar.gz
+sha256 703877c0df77fce00719fe55cc62b07bb8d5f44fdb704bbb1b0bf2cf38afe10a  glibc-06983fe52cfe8e4779035c27e8cc5d2caab31531.tar.gz
 
 # Hashes for license files
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-Fix-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-Fix-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch
deleted file mode 100644
index ab157e9e7b..0000000000
--- a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-Fix-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 4909cfbbe8dd512b8fc0892859549c26e1b14d30 Mon Sep 17 00:00:00 2001
-From: Mark Corbin <mark.corbin@embecosm.com>
-Date: Sun, 21 Oct 2018 10:38:18 +0100
-Subject: [PATCH] Fix RISC-V 32-bit build of riscv-glibc 2.26
-
-This patch fixes two build errors with the 32-bit version of
-glibc-2.26 from the riscv-glibc repository.
-
-A void reference to 'refsym' has been added to dl-runtime.c to avoid
-an 'unused variable' error when building with '-Werror'.
-
-Some data types were hard-coded for 64-bit in ldsodefs.h. These have
-been modified to allow 32-bit builds.
-
-This patch was provided by Fabrice Bellard as part of his RISC-V
-Buildroot development source.
-
-Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
----
- elf/dl-runtime.c         | 1 +
- sysdeps/riscv/ldsodefs.h | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
-index 51d3819d4a..e728e8907e 100644
---- a/elf/dl-runtime.c
-+++ b/elf/dl-runtime.c
-@@ -146,6 +146,7 @@ _dl_fixup (
-   if (__glibc_unlikely (GLRO(dl_bind_not)))
-     return value;
- 
-+  (void)refsym;
-   return elf_machine_fixup_plt (l, result, refsym, sym, reloc, rel_addr, value);
- }
- 
-diff --git a/sysdeps/riscv/ldsodefs.h b/sysdeps/riscv/ldsodefs.h
-index db993df80a..91e7a8c88f 100644
---- a/sysdeps/riscv/ldsodefs.h
-+++ b/sysdeps/riscv/ldsodefs.h
-@@ -25,14 +25,14 @@ struct La_riscv_regs;
- struct La_riscv_retval;
- 
- #define ARCH_PLTENTER_MEMBERS						\
--    Elf64_Addr (*riscv_gnu_pltenter) (Elf64_Sym *, unsigned int,	\
-+    ElfW(Addr) (*riscv_gnu_pltenter) (ElfW(Sym) *, unsigned int,	\
- 				      uintptr_t *, uintptr_t *,		\
- 				      const struct La_riscv_regs *,	\
- 				      unsigned int *, const char *name,	\
- 				      long int *framesizep);
- 
- #define ARCH_PLTEXIT_MEMBERS						\
--    unsigned int (*riscv_gnu_pltexit) (Elf64_Sym *, unsigned int,	\
-+    unsigned int (*riscv_gnu_pltexit) (ElfW(Sym) *, unsigned int,	\
- 				       uintptr_t *, uintptr_t *,	\
- 				       const struct La_riscv_regs *,	\
- 				       struct La_riscv_retval *,	\
--- 
-2.17.1
-
diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch
deleted file mode 100644
index 961d5a1cb6..0000000000
--- a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 6b4520e13c2ed7fca725d5f5c879854cd7c96c19 Mon Sep 17 00:00:00 2001
-From: Mark Corbin <mark.corbin@embecosm.com>
-Date: Mon, 4 Feb 2019 10:35:27 +0000
-Subject: [PATCH] Fix mcontext_t error that breaks RISC-V architecture
- package builds
-
-The riscv-glibc repository version of glibc 2.26 will build for
-RISC-V 32bit, but when many packages are built against the resulting
-library an 'unknown type name mcontext_t' error is reported. The
-definition of mcontext_h in the ucontext.h header file needs to be
-moved outside of the '#ifdef __USE_MISC' structure to fix this
-issue.
-
-Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
----
- sysdeps/unix/sysv/linux/riscv/sys/ucontext.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h b/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
-index 8f02f09106..b9dd04564a 100644
---- a/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
-+++ b/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
-@@ -48,12 +48,11 @@ typedef greg_t gregset_t[NGREG];
- 
- /* Container for floating-point state.  */
- typedef union __riscv_fp_state fpregset_t;
-+#endif
- 
- /* Context to describe whole processor state.  */
- typedef struct sigcontext mcontext_t;
- 
--#endif
--
- /* Userlevel context.  */
- typedef struct ucontext
-   {
--- 
-2.19.1
-
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cb867d4d5b..5ee53df2b2 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,7 +8,7 @@ ifeq ($(BR2_arc),y)
 GLIBC_VERSION =  arc-2018.09-release
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
-GLIBC_VERSION = 4e2943456e690d89f48e6e710757dd09404b0c9a
+GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
 GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
