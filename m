From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:34:32 +0200
Subject: [Buildroot] [git commit] glog: disable on blackfin external
	toolchains
Message-ID: <20150628133439.C7A9580DE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b198722a5cfdf2ad5fd5a243aaa5f9f730b0101
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glog/Config.in |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
