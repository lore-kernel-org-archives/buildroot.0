From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 01:43:45 +0200
Subject: [Buildroot] [PATCH 07/12] elfutils: new package
In-Reply-To: <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
References: <y>
 <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1355960630-25089-7-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Three of the programs from elfutils package (ranlib, strings & ar)
are using posix_madvice() function.
As of version 0.9.33 uClibc does not (yet) have this functionality.
(but there is an unofficial patch floating around in the Net).
So for now, disable final linking and installing of these three
binaries.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 .../elfutils/elfutils-disable-some-programs.patch  |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/elfutils/elfutils-disable-some-programs.patch

diff --git a/package/elfutils/elfutils-disable-some-programs.patch b/package/elfutils/elfutils-disable-some-programs.patch
new file mode 100644
index 0000000..db5b275
--- /dev/null
+++ b/package/elfutils/elfutils-disable-some-programs.patch
@@ -0,0 +1,12 @@
+diff -Naur elfutils-0.155.org/src/Makefile.am elfutils-0.155/src/Makefile.am
+--- elfutils-0.155.org/src/Makefile.am	2012-12-18 22:35:53.940259428 +0200
++++ elfutils-0.155/src/Makefile.am	2012-12-18 22:36:22.418878909 +0200
+@@ -37,7 +37,7 @@
+ base_cpu = @base_cpu@
+ 
+ bin_PROGRAMS = readelf nm size strip ld elflint findtextrel addr2line \
+-	       elfcmp objdump ranlib strings ar unstrip
++	       elfcmp objdump unstrip
+ 
+ 
+ ld_dsos = libld_elf_i386_pic.a
-- 
1.7.7.6
