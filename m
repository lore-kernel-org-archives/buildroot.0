From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 17:02:57 +0200
Subject: [Buildroot] [git commit] package/mono: bump to version 4.0.1
Message-ID: <20150502150409.07F067FEEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eff7c144952863a233780b6299b0bd980c42250a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch:

* bumps mono version to 4.0.1.
* Removes no more needed patches included upstream
* Removes profile switches no more present in configure

[Thomas:
  - add Config.in.legacy handling for the removed options.
  - remove the select that ensured at least one of the .Net runtime
    version was enabled.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |   21 +++++
 .../0003-mono-context.h-fix-build-on-MIPS.patch    |   33 -------
 ...e-ppc-sigctx-monoctx-conversion-code-to-m.patch |   92 --------------------
 ...build-errors-in-mono-context.c-on-ppc64el.patch |   84 ------------------
 package/mono/Config.in                             |   23 -----
 package/mono/mono.mk                               |    9 +--
 6 files changed, 22 insertions(+), 240 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 408b5f0..46247f2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,27 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_PACKAGE_MONO_20
+	bool "2.0/3.5 .Net Runtime"
+	select BR2_LEGACY
+	help
+	  This option no longer exists, all versions of the .Net
+	  runtime are now installed.
+
+config BR2_PACKAGE_MONO_40
+	bool "4.0 .Net Runtime"
+	select BR2_LEGACY
+	help
+	  This option no longer exists, all versions of the .Net
+	  runtime are now installed.
+
+config BR2_PACKAGE_MONO_45
+	bool "4.5 .Net Runtime"
+	select BR2_LEGACY
+	help
+	  This option no longer exists, all versions of the .Net
+	  runtime are now installed.
+
 config BR2_CIVETWEB_WITH_LUA
 	bool "civetweb lua option renamed"
 	select BR2_LEGACY
diff --git a/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch b/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
deleted file mode 100644
index f60cfb9..0000000
--- a/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2a8fab27a4308335282752164bebcfc77771fd3f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 6 Feb 2015 14:56:10 +0100
-Subject: [PATCH] mono-context.h: fix build on MIPS
-
-The mono-context.h file uses definitions such as mips_fp and mips_sp,
-which are defined in <mono/arch/mips/mips-codegen.h>, but this file is
-not included, leading to build failures.
-
-This fix is similar to 4437ecea91bab3fe68ba1c30521acf75052662cd (for
-ARM).
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- mono/utils/mono-context.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/mono/utils/mono-context.h b/mono/utils/mono-context.h
-index 3b01b49..8852a63 100755
---- a/mono/utils/mono-context.h
-+++ b/mono/utils/mono-context.h
-@@ -460,6 +460,8 @@ mono_ia64_context_get_fp (MonoContext *ctx)
- 
- #elif ((defined(__mips__) && !defined(MONO_CROSS_COMPILE)) || (defined(TARGET_MIPS))) && SIZEOF_REGISTER == 4 /* defined(__ia64__) */
- 
-+#include <mono/arch/mips/mips-codegen.h>
-+
- typedef struct {
- 	mgreg_t	    sc_pc;
- 	mgreg_t		sc_regs [32];
--- 
-2.1.0
-
diff --git a/package/mono/0004-jit-Move-the-ppc-sigctx-monoctx-conversion-code-to-m.patch b/package/mono/0004-jit-Move-the-ppc-sigctx-monoctx-conversion-code-to-m.patch
deleted file mode 100644
index c3ba00a..0000000
--- a/package/mono/0004-jit-Move-the-ppc-sigctx-monoctx-conversion-code-to-m.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From bf8e3967e4809923d99159ebfa294daf897b5c29 Mon Sep 17 00:00:00 2001
-From: Zoltan Varga <vargaz@gmail.com>
-Date: Mon, 10 Nov 2014 05:22:04 -0500
-Subject: [PATCH] [jit] Move the ppc sigctx<->monoctx conversion code to
- mono-context.c.
-
-Backported from upstream commit
-7e056cd346ccab104715e19d51d0ceccd51b696d by Thomas Petazzoni
-<thomas.petazzoni@free-electrons.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- mono/mini/exceptions-ppc.c | 22 ++--------------------
- mono/utils/mono-context.c  | 26 ++++++++++++++++++++++++++
- 2 files changed, 28 insertions(+), 20 deletions(-)
-
-diff --git a/mono/mini/exceptions-ppc.c b/mono/mini/exceptions-ppc.c
-index 6c3878e..9b9dbef 100644
---- a/mono/mini/exceptions-ppc.c
-+++ b/mono/mini/exceptions-ppc.c
-@@ -600,31 +600,13 @@ mono_arch_find_jit_info (MonoDomain *domain, MonoJitTlsData *jit_tls,
- void
- mono_arch_sigctx_to_monoctx (void *ctx, MonoContext *mctx)
- {
--#ifdef MONO_CROSS_COMPILE
--	g_assert_not_reached ();
--#else
--	os_ucontext *uc = ctx;
--
--	mctx->sc_ir = UCONTEXT_REG_NIP(uc);
--	mctx->sc_sp = UCONTEXT_REG_Rn(uc, 1);
--	memcpy (&mctx->regs, &UCONTEXT_REG_Rn(uc, 13), sizeof (mgreg_t) * MONO_SAVED_GREGS);
--	memcpy (&mctx->fregs, &UCONTEXT_REG_FPRn(uc, 14), sizeof (double) * MONO_SAVED_FREGS);
--#endif
-+	return mono_sigctx_to_monoctx (ctx, mctx);
- }
- 
- void
- mono_arch_monoctx_to_sigctx (MonoContext *mctx, void *ctx)
- {
--#ifdef MONO_CROSS_COMPILE
--	g_assert_not_reached ();
--#else
--	os_ucontext *uc = ctx;
--
--	UCONTEXT_REG_NIP(uc) = mctx->sc_ir;
--	UCONTEXT_REG_Rn(uc, 1) = mctx->sc_sp;
--	memcpy (&UCONTEXT_REG_Rn(uc, 13), &mctx->regs, sizeof (mgreg_t) * MONO_SAVED_GREGS);
--	memcpy (&UCONTEXT_REG_FPRn(uc, 14), &mctx->fregs, sizeof (double) * MONO_SAVED_FREGS);
--#endif
-+	return mono_monoctx_to_sigctx (mctx, ctx);
- }
- 
- gpointer
-diff --git a/mono/utils/mono-context.c b/mono/utils/mono-context.c
-index c52d044..689bf86 100644
---- a/mono/utils/mono-context.c
-+++ b/mono/utils/mono-context.c
-@@ -421,4 +421,30 @@ mono_monoctx_to_sigctx (MonoContext *mctx, void *sigctx)
- 	}
- }
- 
-+#elif (((defined(__ppc__) || defined(__powerpc__) || defined(__ppc64__)) && !defined(MONO_CROSS_COMPILE))) || (defined(TARGET_POWERPC))
-+
-+#include <mono/utils/mono-context.h>
-+
-+void
-+mono_sigctx_to_monoctx (void *sigctx, MonoContext *mctx)
-+{
-+	os_ucontext *uc = sigctx;
-+
-+	mctx->sc_ir = UCONTEXT_REG_NIP(uc);
-+	mctx->sc_sp = UCONTEXT_REG_Rn(uc, 1);
-+	memcpy (&mctx->regs, &UCONTEXT_REG_Rn(uc, 13), sizeof (mgreg_t) * MONO_SAVED_GREGS);
-+	memcpy (&mctx->fregs, &UCONTEXT_REG_FPRn(uc, 14), sizeof (double) * MONO_SAVED_FREGS);
-+}
-+
-+void
-+mono_monoctx_to_sigctx (MonoContext *mctx, void *sigctx)
-+{
-+	os_ucontext *uc = sigctx;
-+
-+	UCONTEXT_REG_NIP(uc) = mctx->sc_ir;
-+	UCONTEXT_REG_Rn(uc, 1) = mctx->sc_sp;
-+	memcpy (&UCONTEXT_REG_Rn(uc, 13), &mctx->regs, sizeof (mgreg_t) * MONO_SAVED_GREGS);
-+	memcpy (&UCONTEXT_REG_FPRn(uc, 14), &mctx->fregs, sizeof (double) * MONO_SAVED_FREGS);
-+}
-+
- #endif /* #if defined(__i386__) */
--- 
-2.1.0
-
diff --git a/package/mono/0005-Fix-build-errors-in-mono-context.c-on-ppc64el.patch b/package/mono/0005-Fix-build-errors-in-mono-context.c-on-ppc64el.patch
deleted file mode 100644
index 423c14e..0000000
--- a/package/mono/0005-Fix-build-errors-in-mono-context.c-on-ppc64el.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From a41c322f4c6863ebfeba1740f6f3afbc0f8c71e9 Mon Sep 17 00:00:00 2001
-From: Mauricio Faria de Oliveira <mauricfo@linux.vnet.ibm.com>
-Date: Mon, 22 Dec 2014 22:08:33 -0200
-Subject: [PATCH] Fix build errors in mono-context.c on ppc64el
-
-Build error #1:
-
-	libtool: compile:  gcc <...> -c mono-context.c  -fPIC -DPIC -o .libs/mono-context.o
-	mono-context.c: In function 'mono_sigctx_to_monoctx':
-	mono-context.c:435:68: error: 'MONO_SAVED_GREGS' undeclared (first use in this function)
-	  memcpy (&mctx->regs, &UCONTEXT_REG_Rn(uc, 13), sizeof (mgreg_t) * MONO_SAVED_GREGS);
-		                                                            ^
-	mono-context.c:435:68: note: each undeclared identifier is reported only once for each function it appears in
-	mono-context.c:436:70: error: 'MONO_SAVED_FREGS' undeclared (first use in this function)
-	  memcpy (&mctx->fregs, &UCONTEXT_REG_FPRn(uc, 14), sizeof (double) * MONO_SAVED_FREGS);
-		                                                              ^
-The MONO_SAVED_GREGS and MONO_SAVED_FREGS macros are defined in mini-ppc.h.
-The problem happens because commit 7e056cd346ccab104715e19d51d0ceccd51b696d
-moved code using them from exceptions-ppc.h (which includes mini-ppc.h) to
-mono-context.c (which doesn't), where they're not #included.
-
-So, include mini-ppc.h in mono-context.c (in the existing powerpc ifdef block).
-
-Signed-off-by: Mauricio Faria de Oliveira <mauricfo@linux.vnet.ibm.com>
-
-Build error #2:
-
-Now, it turns out mini-ppc.h doesn't know MonoMethod, MonoMethodSignature, and MonoObject.
-So, include object.h (MonoObject), which includes metadata.h (MonoMethod and MonoMethodSignature),
-in mini-ppc.h.
-
-	libtool: compile: gcc <...>  -c mono-context.c  -fPIC -DPIC -o .libs/mono-context.o
-	In file included from mono-context.c:427:0:
-	../../mono/mini/mini-ppc.h:37:2: error: unknown type name 'MonoMethod'
-	  MonoMethod *method;
-	  ^
-	../../mono/mini/mini-ppc.h:306:31: error: unknown type name 'MonoMethodSignature'
-	 mono_ppc_tail_call_supported (MonoMethodSignature *caller_sig, MonoMethodSignature *callee_sig) MONO_INTERNAL;
-		                       ^
-	../../mono/mini/mini-ppc.h:306:64: error: unknown type name 'MonoMethodSignature'
-	 mono_ppc_tail_call_supported (MonoMethodSignature *caller_sig, MonoMethodSignature *callee_sig) MONO_INTERNAL;
-		                                                        ^
-	../../mono/mini/mini-ppc.h:312:27: error: unknown type name 'MonoObject'
-	 mono_ppc_throw_exception (MonoObject *exc, unsigned long eip, unsigned long esp, mgreg_t *int_regs, gdouble *fp_regs, gboolean rethrow) MONO_INTERNAL;
-		                   ^
-
-Backported from upstream commit
-55fa0a561acda220f1b363e4507cb1c3a62795a7 by Thomas Petazzoni
-<thomas.petazzoni@free-electrons.com>.
-
-Signed-off-by: Mauricio Faria de Oliveira <mauricfo@linux.vnet.ibm.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- mono/mini/mini-ppc.h      | 1 +
- mono/utils/mono-context.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/mono/mini/mini-ppc.h b/mono/mini/mini-ppc.h
-index 4b39b7a..cbf73bb 100644
---- a/mono/mini/mini-ppc.h
-+++ b/mono/mini/mini-ppc.h
-@@ -4,6 +4,7 @@
- #include <mono/arch/ppc/ppc-codegen.h>
- #include <mono/utils/mono-sigcontext.h>
- #include <mono/utils/mono-context.h>
-+#include <mono/metadata/object.h>
- #include <glib.h>
- 
- #ifdef __mono_ppc64__
-diff --git a/mono/utils/mono-context.c b/mono/utils/mono-context.c
-index 689bf86..0db9dce 100644
---- a/mono/utils/mono-context.c
-+++ b/mono/utils/mono-context.c
-@@ -424,6 +424,7 @@ mono_monoctx_to_sigctx (MonoContext *mctx, void *sigctx)
- #elif (((defined(__ppc__) || defined(__powerpc__) || defined(__ppc64__)) && !defined(MONO_CROSS_COMPILE))) || (defined(TARGET_POWERPC))
- 
- #include <mono/utils/mono-context.h>
-+#include <mono/mini/mini-ppc.h>
- 
- void
- mono_sigctx_to_monoctx (void *sigctx, MonoContext *mctx)
--- 
-2.1.0
-
diff --git a/package/mono/Config.in b/package/mono/Config.in
index 1db5df4..4445f4b 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -7,34 +7,11 @@ config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_MONO_45 if !BR2_PACKAGE_MONO_20 && !BR2_PACKAGE_MONO_40
 	help
 	  An open source, cross-platform, implementation of C#
 	  and the CLR that is binary compatible with Microsoft.NET.
 
 	  http://download.mono-project.com/sources/mono/
 
-if BR2_PACKAGE_MONO
-
-config BR2_PACKAGE_MONO_20
-	bool "2.0/3.5 .Net Runtime"
-	help
-	  This option enables the installation of the 2.0/3.5 version
-	  of the Mono .Net runtime to the target
-
-config BR2_PACKAGE_MONO_40
-	bool "4.0 .Net Runtime"
-	help
-	  This option enables the installation of the 4.0 version
-	  of the Mono .Net runtime to the target
-
-config BR2_PACKAGE_MONO_45
-	bool "4.5 .Net Runtime"
-	help
-	  This option enables the installation of the 4.5 version
-	  of the Mono .Net runtime to the target
-
-endif
-
 comment "mono needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index c9335ef..c0a0827 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 3.12.0
+MONO_VERSION = 4.0.1
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
@@ -48,13 +48,6 @@ HOST_MONO_CONF_OPTS = --disable-gtk-doc \
 	--enable-minimal=aot,profiler,debug \
 	--enable-static
 
-# These options refer to the target mono, not the host. We use the host
-# only to compile libraries, then we copy them to the target.
-HOST_MONO_CONF_OPTS += \
-	--with-profile2=$(if $(BR2_PACKAGE_MONO_20),yes,no) \
-	--with-profile4=$(if $(BR2_PACKAGE_MONO_40),yes,no) \
-	--with-profile4_5=$(if $(BR2_PACKAGE_MONO_45),yes,no)
-
 # ensure monolite is used
 HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
 
