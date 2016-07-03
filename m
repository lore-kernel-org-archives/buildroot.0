From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 3 Jul 2016 19:08:19 +0200
Subject: [Buildroot] [PATCH] m68k: binfmt flat configuration fixes
Message-ID: <20160703170819.GA15135@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The situation looks like following for elf2flt and binfmt FLAT:

Only gcc for m68k implements -msep-data (BR2_BINFMT_FLAT_SEP_DATA)
so we should depend on m68k.  When the default (BR2_BINFMT_FLAT_ONE)
is used on m68k, broken binaries are produced, which mainly end up
in SIGILL, so do not use it for m68k.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 1fdd36a..92b094a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -360,11 +360,13 @@ choice
 
 config BR2_BINFMT_FLAT_ONE
 	bool "One memory region"
+	depends on !BR2_m68k
 	help
 	  All segments are linked into one memory region.
 
 config BR2_BINFMT_FLAT_SEP_DATA
 	bool "Separate data and code region"
+	depends on BR2_m68k
 	help
 	  Allow for the data and text segments to be separated and placed in
 	  different regions of memory.
-- 
2.1.4
