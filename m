From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Jun 2018 20:15:14 +0200
Subject: [Buildroot] [PATCH 1/1] cc-tool: depends on BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20180605181514.2081-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

options_description class from boost's program_options needs
__sync_fetch_and_add_4 / __sync_fetch_and_sub_4:

Extract from config.log:
/home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libboost_program_options.a(options_description.o):
In function
`boost::program_options::options_description_easy_init::operator()(char
const*, boost::program_options::value_semantic const*, char const*)':
options_description.cpp:(.text+0x4240): undefined reference to
`__sync_fetch_and_add_4'
options_description.cpp:(.text+0x42ca): undefined reference to
`__sync_fetch_and_sub_4'
options_description.cpp:(.text+0x42d8): undefined reference to
`__sync_fetch_and_sub_4

Fixes:
 - http://autobuild.buildroot.net/results/5677a3fd96217cbb0966063de048401cf1ccf16b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cc-tool/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index b2cf97969b..32250db3af 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CC_TOOL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # boost-filesystem
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
@@ -18,4 +19,5 @@ config BR2_PACKAGE_CC_TOOL
 	  http://sourceforge.net/projects/cctool/
 
 comment "cc-tool needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.14.1
