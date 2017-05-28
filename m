From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 14:56:02 +0200
Subject: [Buildroot] [git commit] package/elf2flt: bump version
Message-ID: <20170601202857.DAB6382641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32c52fa87dd00b19ce3da9565e303e9842fc47b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/uclinux-dev/elf2flt/commit/a87f68ae9e879360a9624f2a02999e67cfbe5a2f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-relocation-support-for-R_ARM_TARGET-type.patch | 34 ----------------------
 package/elf2flt/elf2flt.hash                       |  2 +-
 package/elf2flt/elf2flt.mk                         |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/elf2flt/0001-elf2flt-fix-relocation-support-for-R_ARM_TARGET-type.patch b/package/elf2flt/0001-elf2flt-fix-relocation-support-for-R_ARM_TARGET-type.patch
deleted file mode 100644
index b9615ab..0000000
--- a/package/elf2flt/0001-elf2flt-fix-relocation-support-for-R_ARM_TARGET-type.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dedce8765d203c1c162a57e6259375e0b457173f Mon Sep 17 00:00:00 2001
-From: Greg Ungerer <gerg@linux-m68k.org>
-Date: Fri, 19 Aug 2016 23:49:51 +1000
-Subject: [PATCH] elf2flt: fix relocation support for R_ARM_TARGET types
-
-R_ARM_TARGET1 (and I think R_ARM_TARGET2) relocation types should be
-treated in the same way as R_ARM_ABS32. Fix them to write out the addend
-to the flat binary in network byte order.
-
-Signed-off-by: Greg Ungerer <gerg@uclinux.org>
-Tested-by: Waldemar Brodkorb <wbx@openadk.org>
-
----
- elf2flt.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index 5ae7dd9..3f31569 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -1505,7 +1505,9 @@ DIS29_RELOCATION:
- 					(((*p)->howto->type != R_ARM_PC24) &&
- 					((*p)->howto->type != R_ARM_PLT32)))
- 					tmp.c[i3] = (hl >> 24) & 0xff;
--				if ((*p)->howto->type == R_ARM_ABS32)
-+				if (((*p)->howto->type == R_ARM_ABS32) ||
-+				    ((*p)->howto->type == R_ARM_TARGET1) ||
-+				    ((*p)->howto->type == R_ARM_TARGET2))
- 					*(uint32_t *)r_mem = htonl(hl);
- 				else
- 					*(uint32_t *)r_mem = tmp.l;
--- 
-1.9.1
-
diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index 9c18ba5..40df62c 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6a45a787a08da64f0f3036d3ae1865bc13f8f40d13f07511a2bf1b736acc4808 elf2flt-9dbc458c6122c495bbdec8dc975a15c9d39e5ff2.tar.gz
+sha256 7713bd1debd24a94b795b7fc698dc97e306e7cbcc1d0580856c79fe70aac9c45  elf2flt-6d80ab6c93409e796f85da404bde84b841231531.tar.gz
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 1829b10..995dfed 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 9dbc458c6122c495bbdec8dc975a15c9d39e5ff2
+ELF2FLT_VERSION = 6d80ab6c93409e796f85da404bde84b841231531
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
