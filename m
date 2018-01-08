From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 21:06:56 +0100
Subject: [Buildroot] [git commit] libopenssl: do not leak the compiler path
 (reproducible builds)
Message-ID: <20180108200841.87D9D83BDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d6b8ea78db57b836e103b9daa3617484b3c7009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...roducible-build-do-not-leak-compiler-path.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
new file mode 100644
index 0000000..eff72c5
--- /dev/null
+++ b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
@@ -0,0 +1,26 @@
+From 875fcad2ad84877763cba86c1265b57679b878b0 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 24 Oct 2017 16:58:32 +0200
+Subject: [PATCH] Reproducible build: do not leak compiler path
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ crypto/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 7869996..7e63291 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -55,7 +55,7 @@ top:
+ all: shared
+ 
+ buildinf.h: ../Makefile
+-	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
++	$(PERL) $(TOP)/util/mkbuildinf.pl "$$(basename $(CC)) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
+ 
+ x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
+ 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
+-- 
+2.11.0
+
