From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 22:29:16 +0100
Subject: [Buildroot] [git commit] toolchain-buildroot: make sure glibc isn't
	chosen when BR2_PREFER_STATIC_LIB=y
Message-ID: <20131111213335.038019BBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=819da04481d17ac00e1ca4843c05dffc3599a72e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(e)glibc doesn't support a fully statically linked userspace. Even a
basic program such as Busybox fails to do authentication due to glibc
loading some libraries dynamically. Therefore, we disable the
possibility of building a glibc toolchain when
BR2_PREFER_STATIC_LIB=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 5111c74..8b37127 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -23,6 +23,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
 		   BR2_x86_64
 	depends on BR2_USE_MMU
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our eglibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -43,6 +44,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
 		   BR2_x86_64
 	select BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_PREFER_STATIC_LIB
 	# our glibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -54,6 +56,9 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 	  http://www.gnu.org/software/libc/
 
+comment "(e)glibc only available with shared lib support"
+	depends on BR2_PREFER_STATIC_LIB
+
 endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
