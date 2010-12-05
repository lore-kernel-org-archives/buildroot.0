From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 10:25:40 +0100
Subject: [Buildroot] [PATCH 13/15] toolchain: expose thread options in the
	Crosstool-NG backend
In-Reply-To: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ebd285ae70fb69572d98ea560e2180aecf57ffd7.1291541115.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-crosstool-ng/Config.in       |   32 ++++++++++++++++++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   21 ++++++++++++++
 2 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index b345297..9d8cb24 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -106,4 +106,36 @@ config BR2_TOOLCHAIN_CTNG_C_PLUS_PLUS
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
+	  Enable thread support and select thread implementation. Not
+	  all thread variants work with all versions of uClibc, the
+	  "linuxthreads (stable/old)" may be a working fallback if you
+	  need threading at all.
+
+	config BR2_TOOLCHAIN_CTNG_THREADS_NONE
+		bool "none"
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
index 1c5e864..b7f88ee 100644
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
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\# \2 is not settted:;
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
1.7.0.4
