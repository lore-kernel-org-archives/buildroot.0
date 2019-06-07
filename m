From: Esben Haabendal <esben@geanix.com>
Date: Fri,  7 Jun 2019 14:53:13 +0200
Subject: [Buildroot] [PATCH 2/2] arch: Add support for Westmere targets
In-Reply-To: <20190607125313.20376-1-esben@geanix.com>
References: <20190607125313.20376-1-esben@geanix.com>
Message-ID: <20190607125313.20376-2-esben@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The westmere line of x86_64 targets lies between nehalem (corei7) and
sandybridge (corei7-avx).  Allowing use of -march=westmere enables use of AES
instruction set on these targets.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/Config.in.x86         | 10 ++++++++++
 package/openblas/Config.in |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 3f6983ac1b63..26496b8d08e9 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -101,6 +101,15 @@ config BR2_x86_corei7
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+config BR2_x86_westmere
+	bool "westmere"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_corei7_avx
 	bool "corei7-avx"
 	select BR2_X86_CPU_HAS_MMX
@@ -235,6 +244,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_nocona && BR2_i386
 	default "i686"		if BR2_x86_core2 && BR2_i386
 	default "i686"		if BR2_x86_corei7 && BR2_i386
+	default "i686"		if BR2_x86_westmere && BR2_i386
 	default "i686"		if BR2_x86_corei7_avx && BR2_i386
 	default "i686"		if BR2_x86_core_avx2 && BR2_i386
 	default "i686"		if BR2_x86_atom && BR2_i386
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 8e71a43f982c..c8a516bb9f93 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
 	default "BANIAS"       if BR2_x86_pentium_m
 	default "CORE2"        if BR2_x86_core2
-	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont
+	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_westmere || BR2_x86_silvermont
 	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
 	default "HASWELL"      if BR2_x86_core_avx2
 	default "ATOM"         if BR2_x86_atom
-- 
2.21.0
