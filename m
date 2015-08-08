From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:59 -0000
Subject: [Buildroot] [git commit branch/next] gcc: fix undefined reference
	to .tdata
Message-ID: <20150808105636.684957FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37d019e81af38af780157b078057f794d93b2046
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fix is done in development tree:
http://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/366cc86e4f8ff6f00f0b731dc6f78d22c7ac9e0a
and will be a part of the next release of ARC GNU tools.
Once that new release happens this patch must be removed.

Fixes:
http://autobuild.buildroot.net/results/8b22ac0dc9e3c1cd44f2fdbe5cc99a41cf77f454/
http://autobuild.buildroot.net/results/37e9c3c79e0a6aea5b89428c2226811ebb3fd611/
http://autobuild.buildroot.net/results/37e9c3c79e0a6aea5b89428c2226811ebb3fd611/
and many others.

Prerequisite:
"ARC: update tools to arc-2015.06 release": http://patchwork.ozlabs.org/patch/495837/

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...iate-between-a-bss-TLS-initialized-symbol.patch |   42 ++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/gcc/arc-2015.06/0001-Differentiate-between-a-bss-TLS-initialized-symbol.patch b/package/gcc/arc-2015.06/0001-Differentiate-between-a-bss-TLS-initialized-symbol.patch
new file mode 100644
index 0000000..7a86b62
--- /dev/null
+++ b/package/gcc/arc-2015.06/0001-Differentiate-between-a-bss-TLS-initialized-symbol.patch
@@ -0,0 +1,42 @@
+From 366cc86e4f8ff6f00f0b731dc6f78d22c7ac9e0a Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Tue, 7 Jul 2015 17:59:52 +0200
+Subject: [PATCH] Differentiate between a bss TLS initialized symbol.
+
+Back-port from https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/366cc86e4f8ff6f00f0b731dc6f78d22c7ac9e0a
+
+This patch fixes "undefined reference to .tdata" observed in many autobuilder
+results for ARC.
+
+Once the next release of ARC GNU tools happens this patch must be removed from
+Buildroot.
+
+---
+ gcc/config/arc/arc.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index b6eb3b5..73c3a87 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -5262,10 +5262,15 @@ arc_legitimize_tls_address (rtx addr, enum tls_model model)
+     {
+     case TLS_MODEL_LOCAL_DYNAMIC:
+       rtx base;
+-      tree base_decl; base_decl
+-	= lookup_attribute ("tls9", DECL_ATTRIBUTES (SYMBOL_REF_DECL (addr)));
++      tree base_decl, decl;
++      decl = SYMBOL_REF_DECL (addr);
++      base_decl = lookup_attribute ("tls9", DECL_ATTRIBUTES (decl));
+       const char *base_name; base_name = DTPOFF_ZERO_SYM;
+       rtvec v;
++
++      if (bss_initializer_p (decl))
++	base_name = ".tbss";
++
+       if (base_decl && TREE_VALUE (base_decl)
+ 	  && TREE_VALUE (TREE_VALUE (base_decl)))
+ 	{
+-- 
+2.4.3
+
