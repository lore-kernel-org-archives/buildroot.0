From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:26:51 +0200
Subject: [Buildroot] [git commit] elf2flt: fix threading apps on ARM noMMU
	systems
Message-ID: <20160825132655.4BD64821AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=405fb22c5cb6e473a82a5073126657fff77f3af3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See this thread, which explains the problem in detail:
http://mailman.uclinux.org/pipermail/uclinux-dev//2016-April/052713.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-relocation-support-for-R_ARM_TARGET-type.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/elf2flt/0001-elf2flt-fix-relocation-support-for-R_ARM_TARGET-type.patch b/package/elf2flt/0001-elf2flt-fix-relocation-support-for-R_ARM_TARGET-type.patch
new file mode 100644
index 0000000..b9615ab
--- /dev/null
+++ b/package/elf2flt/0001-elf2flt-fix-relocation-support-for-R_ARM_TARGET-type.patch
@@ -0,0 +1,34 @@
+From dedce8765d203c1c162a57e6259375e0b457173f Mon Sep 17 00:00:00 2001
+From: Greg Ungerer <gerg@linux-m68k.org>
+Date: Fri, 19 Aug 2016 23:49:51 +1000
+Subject: [PATCH] elf2flt: fix relocation support for R_ARM_TARGET types
+
+R_ARM_TARGET1 (and I think R_ARM_TARGET2) relocation types should be
+treated in the same way as R_ARM_ABS32. Fix them to write out the addend
+to the flat binary in network byte order.
+
+Signed-off-by: Greg Ungerer <gerg@uclinux.org>
+Tested-by: Waldemar Brodkorb <wbx@openadk.org>
+
+---
+ elf2flt.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 5ae7dd9..3f31569 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -1505,7 +1505,9 @@ DIS29_RELOCATION:
+ 					(((*p)->howto->type != R_ARM_PC24) &&
+ 					((*p)->howto->type != R_ARM_PLT32)))
+ 					tmp.c[i3] = (hl >> 24) & 0xff;
+-				if ((*p)->howto->type == R_ARM_ABS32)
++				if (((*p)->howto->type == R_ARM_ABS32) ||
++				    ((*p)->howto->type == R_ARM_TARGET1) ||
++				    ((*p)->howto->type == R_ARM_TARGET2))
+ 					*(uint32_t *)r_mem = htonl(hl);
+ 				else
+ 					*(uint32_t *)r_mem = tmp.l;
+-- 
+1.9.1
+
