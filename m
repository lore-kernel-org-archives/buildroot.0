From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:36:16 +0100
Subject: [Buildroot] [git commit] package/gcc: disable libitm for sparc <v9
Message-ID: <20150115083836.C92F080DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f86c71cd9a545eee5bfe7fc593fdffef4ddd2e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libitm (transactional memory) needs SPARC V9+ ISA, otherwise when
enabling C++ the toolchain fails to build:

/tmp/cclQ6hrD.s: Assembler messages:
/tmp/cclQ6hrD.s:1261: Error: Architecture mismatch on "rd".
/tmp/cclQ6hrD.s:1261:  (Requires v9|v9a|v9b; requested architecture is
v8.)
Makefile:517: recipe for target 'beginend.lo' failed
make[5]: *** [beginend.lo] Error 1

So disable it for our current (v8, leon3) support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index cdd71aa..2e8b412 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -110,6 +110,11 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --enable-target-optspace
 endif
 
+# libitm needs sparc V9+
+ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
+endif
+
 # gcc 4.6.x quadmath requires wchar
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
