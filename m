From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 22:26:52 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: expose thread
	options in the Crosstool-NG backend
Message-ID: <20101213214845.7B8618E2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5eae3c577cb70f1505d4fe2b8c2f40e1bd32cd65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/Config.in       |   36 ++++++++++++++++++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   21 +++++++++++++
 2 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 82e223d..1a10416 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -106,4 +106,40 @@ config BR2_TOOLCHAIN_CTNG_CXX
 	  C++ language and you want C++ libraries to be installed on
 	  your target system.
 
+choice
+	prompt "Thread library implementation"
+	default BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD \
+		if BR2_TOOLCHAIN_CTNG_uClibc
+	default BR2_TOOLCHAIN_CTNG_THREADS_NPTL		\
+		if BR2_TOOLCHAIN_CTNG_eglibc ||		\
+		   BR2_TOOLCHAIN_CTNG_glibc
+	help
+	  Enable thread support and select thread implementation. With
+	  glibc, thread support is mandatory but several
+	  implementations are available. With uClibc, thread support
+	  is optional, and when enabled, several implementations are
+	  available. However, not all thread variants work with all
+	  versions of uClibc for all architectures, the "linuxthreads
+	  (stable/old)" may be a working fallback.
+
+	config BR2_TOOLCHAIN_CTNG_THREADS_NONE
+		bool "none"
+		depends on BR2_TOOLCHAIN_CTNG_uClibc
+
+	config BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS
+		bool "linuxthreads"
+		select BR2_TOOLCHAIN_HAS_THREADS
+
+	config BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD
+		bool "linuxthreads (stable/old)"
+		select BR2_TOOLCHAIN_HAS_THREADS
+		depends on BR2_TOOLCHAIN_CTNG_uClibc
+
+	config BR2_TOOLCHAIN_CTNG_THREADS_NPTL
+		bool "Native POSIX Threading (NPTL)"
+		select BR2_TOOLCHAIN_HAS_THREADS
+		depends on BR2_TOOLCHAIN_CTNG_eglibc || \
+			   BR2_TOOLCHAIN_CTNG_glibc
+endchoice
+
 endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 817a1f7..a38dd12 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -213,6 +213,27 @@ else
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;
 endif
 
+# Thread implementation selection
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\# \2 is not set:;
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS))$(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\2=y:;
+ ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc)),)
+  ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\2=y:;
+  else
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\2=y:;
+  endif
+ endif
+else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_NPTL)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\2=y:;
+else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_NONE)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\2=y:;
+endif
+
 #--------------
 # And the specials for paths
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(TOOLCHAIN_DIR)":;
-- 
1.7.2.2
