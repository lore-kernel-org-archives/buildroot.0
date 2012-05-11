From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 10:33:59 -0300
Subject: [Buildroot] [PATCH 5/5] openocd: fix breakage with newer autotools
In-Reply-To: <1336743239-6368-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336743239-6368-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336743239-6368-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openocd/openocd-0006-automake-compat.patch |   40 ++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 package/openocd/openocd-0006-automake-compat.patch

diff --git a/package/openocd/openocd-0006-automake-compat.patch b/package/openocd/openocd-0006-automake-compat.patch
new file mode 100644
index 0000000..cdc6c92
--- /dev/null
+++ b/package/openocd/openocd-0006-automake-compat.patch
@@ -0,0 +1,40 @@
+Backport from openocd commit 737a52d7b22b1774acc5d20f9bd25000a70ac116
+Fix for automake 1.11.2+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura openocd-0.5.0/src/jtag/drivers/Makefile.am openocd-0.5.0.automake/src/jtag/drivers/Makefile.am
+--- openocd-0.5.0/src/jtag/drivers/Makefile.am	2011-08-09 02:34:19.000000000 -0300
++++ openocd-0.5.0.automake/src/jtag/drivers/Makefile.am	2012-05-01 13:57:01.007561480 -0300
+@@ -5,7 +5,8 @@
+ libocdjtagdrivers_la_SOURCES = \
+ 	$(DRIVERFILES)
+ 
+-nobase_dist_pkglib_DATA =
++ocddatadir = $(pkglibdir)
++nobase_dist_ocddata_DATA =
+ 
+ ULINK_FIRMWARE = $(srcdir)/OpenULINK
+ 
+@@ -64,7 +65,7 @@
+ endif
+ if ULINK
+ DRIVERFILES += ulink.c
+-nobase_dist_pkglib_DATA += $(ULINK_FIRMWARE)/ulink_firmware.hex
++nobase_dist_ocddata_DATA += $(ULINK_FIRMWARE)/ulink_firmware.hex
+ endif
+ if VSLLINK
+ DRIVERFILES += vsllink.c
+diff -Nura openocd-0.5.0/src/target/Makefile.am openocd-0.5.0.automake/src/target/Makefile.am
+--- openocd-0.5.0/src/target/Makefile.am	2011-08-09 02:34:19.000000000 -0300
++++ openocd-0.5.0.automake/src/target/Makefile.am	2012-05-01 13:57:01.934567076 -0300
+@@ -165,7 +165,7 @@
+ 	avr32_mem.h \
+ 	avr32_regs.h
+ 
+-nobase_dist_pkglib_DATA =
+-nobase_dist_pkglib_DATA += ecos/at91eb40a.elf
++ocddatadir = $(pkglibdir)
++nobase_dist_ocddata_DATA = ecos/at91eb40a.elf
+ 
+ MAINTAINERCLEANFILES = $(srcdir)/Makefile.in
-- 
1.7.3.4
