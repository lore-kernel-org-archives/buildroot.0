From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Apr 2021 21:07:35 +0200
Subject: [Buildroot] [git commit] package/quickjs: disable on nios2
Message-ID: <20210415185143.5DB0F83B62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b147af911aff8362a7c4c1d597f39bf9560aed4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

quickjs unconditionally uses FE_{DOWN,UP}WARD and so fails to build on
nios2 since its addition in commit
5d50793659acb95050c110d5fc05399df20ce30b

Fixes:
 - http://autobuild.buildroot.org/results/69e280a7f478d1b16be989c7bd559f766053134b
 - http://autobuild.buildroot.org/results/f2c3ef7e3bbe30ac24710288336adabebd8b83a6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/quickjs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index 5c3b068c3a..dc466241ba 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QUICKJS
 	bool "quickjs"
+	depends on !BR2_nios2 # fenv.h lacks FE_{DOWN,UP}WARD on nios2
 	depends on !BR2_STATIC_LIBS
 	# No way to check for fenv support.
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
@@ -14,6 +15,7 @@ config BR2_PACKAGE_QUICKJS
 	  https://bellard.org/quickjs/
 
 comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
+	depends on !BR2_nios2
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_4_9
