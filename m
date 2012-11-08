From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Nov 2012 17:28:25 +0100
Subject: [Buildroot] [git commit] at91bootstrap: fix overlap linker issue
Message-ID: <20121108163030.7263399C80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d3047f28d3016b351213dc99b73e299d2310f25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linker script of the at91bootstrap package has to be modified when
built from gcc-4.6.x version. Indeed a section named text.startup is
created and has to be added into the text section.

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
new file mode 100644
index 0000000..e4ed04e
--- /dev/null
+++ b/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
@@ -0,0 +1,29 @@
+From b783d1f9bf985c0981e755bd2c13e091e9d6837f Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Tue, 6 Nov 2012 09:38:50 +0100
+Subject: [PATCH] at91bootstrap: fix overlap linker issue
+
+The linker script of the at91bootstrap package has to be modified when
+built from gcc-4.6.x version. Indeed a section named text.startup is
+created and has to be added into the text section.
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
+ 	.text : { 
+ 		_stext = .;
+ 		*(.text)
++		*(.text*)
+ 		*(.rodata)                 /* read-only data (constants) */
+ 		*(.rodata*)
+ 		. = ALIGN(4);
+-- 
+1.7.9.5
+
