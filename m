From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Nov 2014 22:25:27 +0100
Subject: [Buildroot] [git commit] arc: add support of ARC HS38 core
Message-ID: <20141102212605.2CA68B2E13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f787b51af53889eab6ff02ccd807fc6bf018034d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Synopsys has recently announced its new ARC HS38 core that is capable of
running Linux -
http://www.synopsys.com/dw/ipdir.php?ds=arc-hs38-processor

ARC HS38 is based on ARCv2 ISA and requires special settings of gcc and
libc.

Also in case of HS38 atomic extensions (LLOCK/SCOND instructions) are
built-in by default, so enabling atomic extensions in Buildroot as well.

This commit adds support of the core in buildroot.

[Peter: string type, so must be in quotes as noted by Yann]
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <anton.kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arc       |    6 +++++-
 package/uclibc/Config.in |    1 +
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index b31b141..b48a90f 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -11,12 +11,15 @@ config BR2_arc750d
 config BR2_arc770d
 	bool "ARC 770D"
 
+config BR2_archs38
+	bool "ARC HS38"
+
 endchoice
 
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d
+	default y if BR2_arc770d || BR2_archs38
 
 config BR2_ARCH_HAS_ATOMICS
 	default y if BR2_ARC_ATOMIC_EXT
@@ -36,3 +39,4 @@ config BR2_ENDIAN
 config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
 	default "arc700" if BR2_arc770d
+	default "archs"	 if BR2_archs38
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 0aaefa3..37f398a 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -199,6 +199,7 @@ config BR2_UCLIBC_ARC_TYPE
 	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
 	default "ARC_CPU_700"	if BR2_arc750d
 	default "ARC_CPU_700"	if BR2_arc770d
+	default "ARC_CPU_HS"	if BR2_archs38
 
 config BR2_UCLIBC_ARM_BX
 	bool
