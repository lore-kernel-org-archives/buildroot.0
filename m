From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 18:57:31 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain-buildroot: make sure glibc isn't
	chosen when BR2_PREFER_STATIC_LIB=y
In-Reply-To: <1384192652-4203-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384192652-4203-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384192652-4203-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(e)glibc doesn't support a fully statically linked userspace. Even a
basic program such as Busybox fails to do authentication due to glibc
loading some libraries dynamically. Therefore, we disable the
possibility of building a glibc toolchain when
BR2_PREFER_STATIC_LIB=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

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
-- 
1.8.1.2
