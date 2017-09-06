From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 14:57:07 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/binutils: fix
	crash caused by buggy xtensa overlay
Message-ID: <20170906125044.29EF481D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c357dd607b403c2b016e51d8fc4609f854e41fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

In some xtensa configurations there may be system/user registers in
xtensa-modules with negative index. ISA initialization for such config
may clobber heap and result in program termination.
Don't update lookup table entries for register with negative indices.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...a-fix-memory-corruption-by-broken-sysregs.patch | 42 ++++++++++++++++++++++
 ...a-fix-memory-corruption-by-broken-sysregs.patch | 42 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/package/binutils/2.25.1/131-xtensa-fix-memory-corruption-by-broken-sysregs.patch b/package/binutils/2.25.1/131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
new file mode 100644
index 0000000..30103ee
--- /dev/null
+++ b/package/binutils/2.25.1/131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
@@ -0,0 +1,42 @@
+From 3c8788dbb70b40e737d4b8e30cab81406e5c5091 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Wed, 2 Aug 2017 00:36:05 -0700
+Subject: [PATCH] xtensa: fix memory corruption by broken sysregs
+
+In some xtensa configurations there may be system/user registers in
+xtensa-modules with negative index. ISA initialization for such config
+may clobber heap and result in program termination.
+Don't update lookup table entries for register with negative indices.
+They are not directly accessible via RSR/WSR/XSR or RUR/WUR, so this
+change should not affect processing of valid assembly/binary code.
+
+bfd/
+2017-08-02  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* xtensa-isa.c (xtensa_isa_init): Don't update lookup table
+	entries for sysregs with negative indices.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: d84ed528d4817b0ff854006b65a9f6ec75f0407a
+
+ bfd/xtensa-isa.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/xtensa-isa.c b/bfd/xtensa-isa.c
+index 8da75bea8109..8c6ee88fdeae 100644
+--- a/bfd/xtensa-isa.c
++++ b/bfd/xtensa-isa.c
+@@ -292,7 +292,8 @@ xtensa_isa_init (xtensa_isa_status *errno_p, char **error_msg_p)
+       xtensa_sysreg_internal *sreg = &isa->sysregs[n];
+       is_user = sreg->is_user;
+ 
+-      isa->sysreg_table[is_user][sreg->number] = n;
++      if (sreg->number >= 0)
++	isa->sysreg_table[is_user][sreg->number] = n;
+     }
+ 
+   /* Set up the interface lookup table.  */
+-- 
+2.1.4
+
diff --git a/package/binutils/2.26.1/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch b/package/binutils/2.26.1/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
new file mode 100644
index 0000000..30103ee
--- /dev/null
+++ b/package/binutils/2.26.1/0131-xtensa-fix-memory-corruption-by-broken-sysregs.patch
@@ -0,0 +1,42 @@
+From 3c8788dbb70b40e737d4b8e30cab81406e5c5091 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Wed, 2 Aug 2017 00:36:05 -0700
+Subject: [PATCH] xtensa: fix memory corruption by broken sysregs
+
+In some xtensa configurations there may be system/user registers in
+xtensa-modules with negative index. ISA initialization for such config
+may clobber heap and result in program termination.
+Don't update lookup table entries for register with negative indices.
+They are not directly accessible via RSR/WSR/XSR or RUR/WUR, so this
+change should not affect processing of valid assembly/binary code.
+
+bfd/
+2017-08-02  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* xtensa-isa.c (xtensa_isa_init): Don't update lookup table
+	entries for sysregs with negative indices.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: d84ed528d4817b0ff854006b65a9f6ec75f0407a
+
+ bfd/xtensa-isa.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/xtensa-isa.c b/bfd/xtensa-isa.c
+index 8da75bea8109..8c6ee88fdeae 100644
+--- a/bfd/xtensa-isa.c
++++ b/bfd/xtensa-isa.c
+@@ -292,7 +292,8 @@ xtensa_isa_init (xtensa_isa_status *errno_p, char **error_msg_p)
+       xtensa_sysreg_internal *sreg = &isa->sysregs[n];
+       is_user = sreg->is_user;
+ 
+-      isa->sysreg_table[is_user][sreg->number] = n;
++      if (sreg->number >= 0)
++	isa->sysreg_table[is_user][sreg->number] = n;
+     }
+ 
+   /* Set up the interface lookup table.  */
+-- 
+2.1.4
+
