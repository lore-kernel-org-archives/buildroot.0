From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 10:23:39 +0200
Subject: [Buildroot] [git commit] gcc: fix sparcv8 compile issue
Message-ID: <20170810090958.654577F9A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c624d2eef8f9b709cd80d384c11cd840f6bddc76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix compile issue with gcc 7.1.0:
/tmp/ccxalnSf.s: Assembler messages:
/tmp/ccxalnSf.s:12: Error: Architecture mismatch on "rd %tick,%o1".
/tmp/ccxalnSf.s:12: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
/tmp/ccxalnSf.s:13: Error: Architecture mismatch on "srlx %o1,32,%o0".
/tmp/ccxalnSf.s:13: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
/tmp/ccxalnSf.s:30: Error: Architecture mismatch on "rd %ccr,%g0".
/tmp/ccxalnSf.s:30: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
/tmp/ccxalnSf.s:33: Error: Architecture mismatch on "rd %ccr,%g0".
/tmp/ccxalnSf.s:33: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
/tmp/ccxalnSf.s:36: Error: Architecture mismatch on "rd %ccr,%g0".
/tmp/ccxalnSf.s:36: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
/tmp/ccxalnSf.s:39: Error: Architecture mismatch on "rd %ccr,%g0".
/tmp/ccxalnSf.s:39: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
Makefile:684: recipe for target 'os-unix-sysdep.lo' failed

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/gcc-final/gcc-final.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 8ca9847..213f3d7 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -78,6 +78,11 @@ ifeq ($(BR2_bfin),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-symvers
 endif
 
+# libcilkrts does not support v8
+ifeq ($(BR2_sparc),y)
+HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
+endif
+
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 # In that case also disable libcilkrts as there is no static version
 ifeq ($(BR2_STATIC_LIBS),y)
