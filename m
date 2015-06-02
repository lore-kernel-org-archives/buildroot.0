From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 23:02:31 +0200
Subject: [Buildroot] [git commit] samba4: enable for uclibc-ng
Message-ID: <20150602210249.DB4227FB91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=110a8d43c16390f949ec9131b30c24381757b1bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc-ng has the required functionality for samba 4.2.x without the
need for any special tricks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/Config.in |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 57adadd..db8c91d 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,10 +1,16 @@
-comment "samba4 needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "samba4 needs an (e)glibc or uClibc-ng toolchain w/ RPC, wchar"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_UCLIBC_VERSION_NG
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on !BR2_PACKAGE_SAMBA
-	depends on BR2_TOOLCHAIN_USES_GLIBC # needs $ORIGIN support
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # e2fsprogs
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# needs $ORIGIN support
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_UCLIBC_VERSION_NG
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
