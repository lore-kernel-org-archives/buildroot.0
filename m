From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 08:19:59 +0100
Subject: [Buildroot] [git commit] libglib2: force arm mode when building
	with thumb1
Message-ID: <20151130072203.4FC84807A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26013972ce568e55a121c21a55afce45bc0675e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #8491

glib/valgrind.h contains inline asm not compatible with thumb1, so build it
in arm mode:

  CC       libglib_2_0_la-gstringchunk.lo
/tmp/ccSVEXME.s: Assembler messages:
/tmp/ccSVEXME.s:587: Error: shifts in CMP/MOV instructions are only supported
in unified syntax -- `mov r12,r12,ror#3'
/tmp/ccSVEXME.s:587: Error: shifts in CMP/MOV instructions are only supported
in unified syntax -- `mov r12,r12,ror#13'
/tmp/ccSVEXME.s:588: Error: shifts in CMP/MOV instructions are only supported
in unified syntax -- `mov r12,r12,ror#29'
/tmp/ccSVEXME.s:588: Error: shifts in CMP/MOV instructions are only supported
in unified syntax -- `mov r12,r12,ror#19'
/tmp/ccSVEXME.s:589: Error: lo register required -- `orr r10,r10,r10'
Makefile:2087: recipe for target 'libglib_2_0_la-gslice.lo' failed

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 8f6ca83..8cf055d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -85,6 +85,11 @@ else
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
 endif
 
+# glib/valgrind.h contains inline asm not compatible with thumb1
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 HOST_LIBGLIB2_CONF_OPTS = \
 	--disable-coverage \
 	--disable-dtrace \
