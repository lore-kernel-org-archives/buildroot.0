From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 23:34:28 +0200
Subject: [Buildroot] [git commit] poco: not available for all architectures
Message-ID: <20130523213805.366669A4E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c3afe4bc14a55aa491be270c24f31d1c5d4d8f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missing defines for:
aarch64, arc, blackfin, microblaze & xtensa.
Not properly supported: mips - only defines generic mips as BE, doesn't
know about mipsel (LE) thus assuming it's BE.
Fixes:
http://autobuild.buildroot.net/results/9847702b046bed59b07f0e075a58b1f31e9236ce/

This should be pretty straightforward to fix in
Foundation/include/Poco/Platform.h for interested parties since it only
cares about endianness.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/poco/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index b823071..402f96d 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_POCO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !(BR2_aarch64 || BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -61,3 +62,4 @@ endif # BR2_PACKAGE_POCO
 comment "poco requires a toolchain with WCHAR, threads, and C++ support"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !(BR2_aarch64 || BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
