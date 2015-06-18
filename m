From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 18 Jun 2015 18:32:35 +0530
Subject: [Buildroot] [PATCH] glog: disable on blackfin
Message-ID: <1434632555-10004-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glog fails to build on blackfin for following reasons,

1. http://autobuild.buildroot.net/results/c70/c704c70ae2f066f85dd6a5fa6a73789bc358d368/

when when BR2_BINFMT_FDPIC=y

../usr/include/bits/elf-fdpic.h: In function 'void* __reloc_pointer(void*, const elf32_fdpic_loadmap*)':
../usr/bfin-buildroot-linux-uclibc/sysroot/usr/include/bits/elf-fdpic.h:95: error: invalid use of 'void'

code snippet at line 95 in elf-fdpic.h
-------------------------------------------------------
unsigned long offset = p - (void*)map->segs[c].p_vaddr;
-------------------------------------------------------

void pointer addition and subtraction is not allowed in C++ as it has undetermined size,
however in C with language extension it is possible because sizeof void is treated
as one byte.

2. http://autobuild.buildroot.net/results/75d/75d17ceb764c2c1136047c089a0c554770ca98a4/

when BR2_BINFMT_FLAT=y

src/symbolize.cc:110:19: error: dlfcn.h: No such file or directory

with flat binary, programming interface to dynamic linker loader is not available even though
BR2_BINFMT_FLAT_SHARED is selected.

As arch doesn't support MMU and thus available file formats are FDPIC and FLAT. With either of these
selected above failure occurs. For failure 1, issue is in toolchain and for 2, arch support is not
available. So disable glog for blackfin.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/glog/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/glog/Config.in b/package/glog/Config.in
index aed0a3e..350afe2 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -2,10 +2,14 @@ config BR2_PACKAGE_GLOG
 	bool "glog"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# build issues with C++ compiler with elf-fdpic and
+	# can't use libdl with flat target binary file format
+	depends on !BR2_bfin
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
 comment "glog needs a toolchain w/ C++, threads"
+	depends on !BR2_bfin
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
