From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Nov 2017 21:09:52 +0100
Subject: [Buildroot] [git commit] uboot-tools: use local libfdt.h
Message-ID: <20171106201938.4AA1780FCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a965d628a557530b78c40d5ed53e3c8ae38de4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The use of libfdt.h by u-boot is using the
<system-path>.  The libfdt part of uboot
is expriencing a lot of change and this patch
should be overcome by events post uboot-2017.11
release.

Jan submitted the following upstream
https://patchwork.ozlabs.org/patch/833760/

Resolves:
http://autobuild.buildroot.net/results/347cde4b5c0e6ca76d354396385be4ec1294da73
http://autobuild.buildroot.net/results/2b429f82bed1f03d69021e0f959da4e2db2b5a0b
http://autobuild.buildroot.net/results/b18012963926682ba192b9176bd3e35fb07cdf56

CC: Jan Kundr??t <jan.kundrat@cesnet.cz>
CC: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-not-attempt-to-use-the-systemwide-libfdt.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/uboot-tools/0005-Do-not-attempt-to-use-the-systemwide-libfdt.patch b/package/uboot-tools/0005-Do-not-attempt-to-use-the-systemwide-libfdt.patch
new file mode 100644
index 0000000..abeef65
--- /dev/null
+++ b/package/uboot-tools/0005-Do-not-attempt-to-use-the-systemwide-libfdt.patch
@@ -0,0 +1,56 @@
+From 477ecb8d9ffa7b90d8bec0d8317b7e464e906f7c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
+Date: Fri, 3 Nov 2017 03:06:35 +0100
+Subject: [PATCH] Do not attempt to use the systemwide libfdt
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+U-Boot bundles a patched copy of libfdt, so it's wrong to attempt to
+include it <like/this>. This breaks the build for me when I have dtc
+fully installed in my host -- as happened earlier tonight with
+Buildroot, for example.
+
+There are several other occurrences throughout the code where '<libfdt'
+matches. I'm not modifying these because I have no clue why the
+<systemwide> include style is being used -- IMHO wrongly.
+
+Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
+---
+ include/fdt.h    | 2 +-
+ include/libfdt.h | 2 +-
+ tools/fdtgrep.c  | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/fdt.h b/include/fdt.h
+index 7ead62e..f40b56c 100644
+--- a/include/fdt.h
++++ b/include/fdt.h
+@@ -1 +1 @@
+-#include <../lib/libfdt/fdt.h>
++#include "../lib/libfdt/fdt.h"
+diff --git a/include/libfdt.h b/include/libfdt.h
+index 10296a2..7ba13e6 100644
+--- a/include/libfdt.h
++++ b/include/libfdt.h
+@@ -1 +1 @@
+-#include <../lib/libfdt/libfdt.h>
++#include "../lib/libfdt/libfdt.h"
+diff --git a/tools/fdtgrep.c b/tools/fdtgrep.c
+index f51f5f1..5897b6d 100644
+--- a/tools/fdtgrep.c
++++ b/tools/fdtgrep.c
+@@ -16,8 +16,8 @@
+ #include <string.h>
+ #include <unistd.h>
+ 
+-#include <../include/libfdt.h>
+-#include <libfdt_internal.h>
++#include "../include/libfdt.h"
++#include "libfdt_internal.h"
+ 
+ /* Define DEBUG to get some debugging output on stderr */
+ #ifdef DEBUG
+-- 
+2.14.2
+
