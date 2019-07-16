From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 17 Jul 2019 00:50:01 +0300
Subject: [Buildroot] [PATCH] package/gcc: arc-2019.03/9.1.0: Fix compilation
 of glibc
Message-ID: <20190716215001.9181-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When storing a TLS symbol to memory, always use an intermediate register
to load it. Otherwise compiler generates instruction which couldn't be
encoded and we see:
----------------------------->8---------------------------
In file included from gethstent_r.c:34:
../nss/getXXent_r.c: In function '__gethostent_r':
../nss/getXXent_r.c:168:1: error: unrecognizable insn:
 }
 ^
(insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
                (const_int 16 [0x10])) [0  S4 A32])
        (plus:SI (reg:SI 25 r25)
            (reg:SI 174))) "../nss/getXXent_r.c":160 -1
     (nil))
during RTL pass: vregs
../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
In file included from getnetent_r.c:34:
../nss/getXXent_r.c: In function '__getnetent_r':
../nss/getXXent_r.c:168:1: error: unrecognizable insn:
 }
 ^
(insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
                (const_int 16 [0x10])) [0  S4 A32])
        (plus:SI (reg:SI 25 r25)
            (reg:SI 174))) "../nss/getXXent_r.c":160 -1
     (nil))
during RTL pass: vregs
../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
----------------------------->8---------------------------

Note this patch is not yet submitted to the GCC's master and gcc-9-branch but
will be submitted soon. That said with bump of GCC for ARC this patch won't be
needed any longer.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Evgeniy Didin <didin@synopsys.com>
---
 .../9.1.0/0002-ARC-Fix-emitting-TLS-symbols.patch  | 61 ++++++++++++++++++++++
 .../0002-ARC-Fix-emitting-TLS-symbols.patch        | 61 ++++++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 package/gcc/9.1.0/0002-ARC-Fix-emitting-TLS-symbols.patch
 create mode 100644 package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch

diff --git a/package/gcc/9.1.0/0002-ARC-Fix-emitting-TLS-symbols.patch b/package/gcc/9.1.0/0002-ARC-Fix-emitting-TLS-symbols.patch
new file mode 100644
index 0000000000..15df921290
--- /dev/null
+++ b/package/gcc/9.1.0/0002-ARC-Fix-emitting-TLS-symbols.patch
@@ -0,0 +1,61 @@
+From d17cd0f88ed986be4046b2eb70240dc95b2958cd Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Wed, 26 Jun 2019 17:53:51 +0300
+Subject: [PATCH 2/2] [ARC] Fix emitting TLS symbols.
+
+When storing a TLS symbol to memory, always use an intermediate register
+to load it. Otherwise compiler generates instruction which couldn't be
+encoded and we see:
+----------------------------->8---------------------------
+In file included from gethstent_r.c:34:
+../nss/getXXent_r.c: In function '__gethostent_r':
+../nss/getXXent_r.c:168:1: error: unrecognizable insn:
+ }
+ ^
+(insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
+                (const_int 16 [0x10])) [0  S4 A32])
+        (plus:SI (reg:SI 25 r25)
+            (reg:SI 174))) "../nss/getXXent_r.c":160 -1
+     (nil))
+during RTL pass: vregs
+../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
+In file included from getnetent_r.c:34:
+../nss/getXXent_r.c: In function '__getnetent_r':
+../nss/getXXent_r.c:168:1: error: unrecognizable insn:
+ }
+ ^
+(insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
+                (const_int 16 [0x10])) [0  S4 A32])
+        (plus:SI (reg:SI 25 r25)
+            (reg:SI 174))) "../nss/getXXent_r.c":160 -1
+     (nil))
+during RTL pass: vregs
+../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
+----------------------------->8---------------------------
+
+Note this patch is not yet submitted to the GCC's master and gcc-9-branch but
+will be submitted soon. That said with bump of GCC this patch won't be
+needed any longer.
+
+Signed-off-by: Claudiu Zissulescu  <claziss@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gcc/config/arc/arc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index daacc79d0cb..ee1f70bbb51 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -8951,7 +8951,7 @@ prepare_move_operands (rtx *operands, machine_mode mode)
+   if (GET_CODE (operands[1]) == SYMBOL_REF)
+     {
+       enum tls_model model = SYMBOL_REF_TLS_MODEL (operands[1]);
+-      if (MEM_P (operands[0]) && flag_pic)
++      if (MEM_P (operands[0]))
+ 	operands[1] = force_reg (mode, operands[1]);
+       else if (model)
+ 	operands[1] = arc_legitimize_tls_address (operands[1], model);
+-- 
+2.16.2
+
diff --git a/package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch b/package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch
new file mode 100644
index 0000000000..b6e5c0ee83
--- /dev/null
+++ b/package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch
@@ -0,0 +1,61 @@
+From a971faaf8fb48acbf48ca800634fc78a27581517 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Wed, 26 Jun 2019 17:53:51 +0300
+Subject: [PATCH] [ARC] Fix emitting TLS symbols.
+
+When storing a TLS symbol to memory, always use an intermediate register
+to load it. Otherwise compiler generates instruction which couldn't be
+encoded and we see:
+----------------------------->8---------------------------
+In file included from gethstent_r.c:34:
+../nss/getXXent_r.c: In function '__gethostent_r':
+../nss/getXXent_r.c:168:1: error: unrecognizable insn:
+ }
+ ^
+(insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
+                (const_int 16 [0x10])) [0  S4 A32])
+        (plus:SI (reg:SI 25 r25)
+            (reg:SI 174))) "../nss/getXXent_r.c":160 -1
+     (nil))
+during RTL pass: vregs
+../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
+In file included from getnetent_r.c:34:
+../nss/getXXent_r.c: In function '__getnetent_r':
+../nss/getXXent_r.c:168:1: error: unrecognizable insn:
+ }
+ ^
+(insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
+                (const_int 16 [0x10])) [0  S4 A32])
+        (plus:SI (reg:SI 25 r25)
+            (reg:SI 174))) "../nss/getXXent_r.c":160 -1
+     (nil))
+during RTL pass: vregs
+../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
+----------------------------->8---------------------------
+
+Note this patch is not yet submitted to the GCC's master and gcc-9-branch but
+will be submitted soon. That said with bump of GCC for ARC this patch won't be
+needed any longer.
+
+Signed-off-by: Claudiu Zissulescu  <claziss@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gcc/config/arc/arc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index 8b544efaa11..989bec703df 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -9068,7 +9068,7 @@ prepare_move_operands (rtx *operands, machine_mode mode)
+   if (GET_CODE (operands[1]) == SYMBOL_REF)
+     {
+       enum tls_model model = SYMBOL_REF_TLS_MODEL (operands[1]);
+-      if (MEM_P (operands[0]) && flag_pic)
++      if (MEM_P (operands[0]))
+ 	operands[1] = force_reg (mode, operands[1]);
+       else if (model)
+ 	operands[1] = arc_legitimize_tls_address (operands[1], model);
+-- 
+2.16.2
+
-- 
2.16.2
