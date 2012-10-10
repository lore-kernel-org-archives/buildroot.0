From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Wed, 10 Oct 2012 10:27:18 +0200
Subject: [Buildroot] [PATCH v3] at91bootstrap: fix gcc-4.6.x overlap linker
 issue
Message-ID: <50753166.5010507@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Things always happen in threes...
This patch fixes an issue detected in the linking stage of the at91bootstraploader from gcc-4.6.x release.
Indeed from this gcc release the linking stage fails due to an overlap between text.startup and data section.
To fix this issue we need to modify the linker script in order to add the text.startup input section into the text output section.


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 ...at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch

diff --git a/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
new file mode 100644
index 0000000..4222b6c
--- /dev/null
+++ b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
@@ -0,0 +1,26 @@
+From 1a26120767aed8a2660fe840955d5d66d3469ce2 Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Wed, 10 Oct 2012 08:45:46 +0200
+Subject: [PATCH] at91bootstrap: fix overlap linker issue
+
+
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ elf32-littlearm.lds |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/elf32-littlearm.lds b/elf32-littlearm.lds
+index a33952f..4f3ba25 100644
+--- a/elf32-littlearm.lds
++++ b/elf32-littlearm.lds
+@@ -7,6 +7,7 @@ SECTIONS
+ 	.text : { + 		_stext = .;
+ 		*(.text)
++		*(.text*)
+ 		*(.rodata)                 /* read-only data (constants) */
+ 		*(.rodata*)
+ 		. = ALIGN(4);
+-- +1.7.9.5
+
-- 
1.7.9.5
