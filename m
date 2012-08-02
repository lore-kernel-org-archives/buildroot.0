From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:57 -0000
Subject: [Buildroot] [git commit branch/next] target: add symbols for
	i386/x86_64 cpu features
Message-ID: <20120802195250.6E27B96FF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fed07d3a4a83dc64eaa0c31369ee0fbae2aa9d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Selecting the target subarchitecture variant automatically selects the
appropriated set of features.

[thomas.petazzoni at free-electrons.com:
  removed depends on inside hidden options, not needed.
  removed SSE41/SSE42 options, not used.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |   88 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index bad0f4c..64c6dea 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -322,6 +322,19 @@ endchoice
 # gcc builds libstdc++ differently depending on the
 # host tuplet given to it, so let people choose
 #
+
+# i386/x86_64 cpu features
+config BR2_X86_CPU_HAS_MMX
+	bool
+config BR2_X86_CPU_HAS_SSE
+	bool
+config BR2_X86_CPU_HAS_SSE2
+	bool
+config BR2_X86_CPU_HAS_SSE3
+	bool
+config BR2_X86_CPU_HAS_SSSE3
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_i386
@@ -341,46 +354,95 @@ config BR2_x86_pentiumpro
 	bool "pentium pro"
 config BR2_x86_pentium_mmx
 	bool "pentium MMX"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_pentium_m
 	bool "pentium mobile"
 config BR2_x86_pentium2
 	bool "pentium2"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_pentium3
 	bool "pentium3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
 config BR2_x86_pentium4
 	bool "pentium4"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
 config BR2_x86_prescott
 	bool "prescott"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_nocona
 	bool "nocona"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_core2
 	bool "core2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_atom
 	bool "atom"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_k6
 	bool "k6"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_k6_2
 	bool "k6-2"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_athlon
 	bool "athlon"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_athlon_4
 	bool "athlon-4"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
 config BR2_x86_opteron
 	bool "opteron"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
 config BR2_x86_opteron_sse3
 	bool "opteron w/ SSE3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_barcelona
 	bool "barcelona"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_geode
 	bool "geode"
+	# Don't include MMX support because there several variant of geode
+	# processor, some with MMX support, some without.
+	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_c32
 	bool "Via C3-2 (Nehemiah cores)"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
 config BR2_x86_winchip_c6
 	bool "IDT Winchip C6"
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_winchip2
 	bool "IDT Winchip 2"
+	select BR2_X86_CPU_HAS_MMX
 endchoice
 
 choice
@@ -394,16 +456,42 @@ config BR2_x86_64_generic
 	bool "generic"
 config BR2_x86_64_barcelona
 	bool "barcelona"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_3DNOW
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_64_opteron_sse3
 	bool "opteron w/ sse3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_64_opteron
 	bool "opteron"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
 config BR2_x86_64_nocona
 	bool "nocona"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
 config BR2_x86_64_core2
 	bool "core2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_64_atom
 	bool "atom"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 endchoice
 
 choice
