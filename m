From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 19:32:42 +0100
Subject: [Buildroot] [git commit] samba4: remove dependency on specific C
	libraries
Message-ID: <20160201224709.8085A7F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a2225427522be13bf8287e2a4fcf4897884c0fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba4 relies on the $ORIGIN feature of the dynamic linker, which used
to not be implemented in old uClibc versions. However:

 - this feature is supported by glibc
 - this feature is supported by uClibc-ng, which is the only uClibc
   version we are going to support
 - this feature is supported by musl

Consequently, we can completely remove the dependency of samba4 on
certain C libraries.

Note that despite this commit, samba4 still cannot be chosen when the
musl C library is used, because samba4 requires native RPC support,
which musl doesn't provide.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 1411b08..c53adba 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,6 +1,5 @@
-comment "samba4 needs an (e)glibc or uClibc-ng toolchain w/ RPC, wchar, dynamic library, threads"
-	depends on (!BR2_TOOLCHAIN_USES_GLIBC && !BR2_UCLIBC_VERSION_NG) \
-		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC \
+comment "samba4 needs a toolchain w/ RPC, wchar, dynamic library, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 
@@ -12,8 +11,6 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python -> libffi
 	depends on !BR2_STATIC_LIBS # python
-	# needs $ORIGIN support
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_UCLIBC_VERSION_NG
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
