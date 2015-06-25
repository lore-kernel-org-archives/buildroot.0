From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 25 Jun 2015 19:13:24 +0530
Subject: [Buildroot] [PATCH 2/2] glog: disable on blackfin external
	toolchains
In-Reply-To: <1435239804-17119-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1435239804-17119-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1435239804-17119-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With following blackfin toolchains

BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2

when BR2_BINFMT_FDPIC=y

../usr/include/bits/elf-fdpic.h: In function 'void* __reloc_pointer(void*, const elf32_fdpic_loadmap*)':
../usr/include/bits/elf-fdpic.h:95: error: invalid use of 'void'

code snippet at line 95 in elf-fdpic.h
-------------------------------------------------------
unsigned long offset = p - (void*)map->segs[c].p_vaddr;
-------------------------------------------------------

void pointer addition and subtraction is not allowed in C++ as it has undetermined size,
however in C with language extension it is possible because sizeof void is treated
as one byte.

This is toolchain-specific issue. So disable package on these external toolchains.

fixes:
http://autobuild.buildroot.net/results/c70/c704c70ae2f066f85dd6a5fa6a73789bc358d368/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/glog/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/glog/Config.in b/package/glog/Config.in
index 534997a..3f54020 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -3,11 +3,18 @@ config BR2_PACKAGE_GLOG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	# build issues with these external toolchains
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
 comment "glog needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
-- 
1.9.1
