From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:35:21 +0200
Subject: [Buildroot] [git commit] Makefile.in: add -mtext-section-literals
	to xtensa ABI
Message-ID: <20140403193845.1D5D09A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6277e4b3130543308222d1ebc9c2916b9eed1a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Collecting literals into separate section can be advantageous if that
section is placed into DTCM at link time. This is applicable for code
running on bare metal, but makes no sense under linux, where userspace
is isolated from the physical memory details. OTOH placing literals into
separate section breaks build of huge source files, because l32r
instruction can only access literals in 256 KBytes range.

Add -mtext-section-literals into xtensa ABI to fix build issues of
packages with huge sources.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 454f614..986760c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -72,8 +72,17 @@ endif
 # and is required for some packages. While this option can degrade both
 # code size and performance, the linker can usually optimize away the
 # overhead when a call ends up within a certain range.
+#
+# Use text-section-literals for Xtensa globally.
+# Collecting literals into separate section can be advantageous if that
+# section is placed into DTCM at link time. This is applicable for code
+# running on bare metal, but makes no sense under linux, where userspace
+# is isolated from the physical memory details. OTOH placing literals into
+# separate section breaks build of huge source files, because l32r
+# instruction can only access literals in 256 KBytes range.
+#
 ifeq ($(BR2_xtensa),y)
-TARGET_ABI += -mlongcalls
+TARGET_ABI += -mlongcalls -mtext-section-literals
 endif
 
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
