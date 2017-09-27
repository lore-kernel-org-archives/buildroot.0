From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:56:11 +0200
Subject: [Buildroot] [git commit] package/glibc: needs kernel headers >=
	3.10 on powerpc64le
Message-ID: <20170927205502.D60D07FEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e6c82f48dc8df4223d353126f2ebed391ad1433
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since glibc 2.26, kernel headers >= 3.10 are needed on powerpc64le [1].
In order to prepare the glibc bump to this version, we don't allow to
build a Buildroot toolchain with kernel headers older than 3.10.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=c2ff5ec13fca1bdd1cd646a0260808386d7bd7ff

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-buildroot/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index f47001f..ac6017f 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -51,6 +51,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on !BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
@@ -65,6 +66,11 @@ comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 3.2"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
+# glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
+comment "glibc on powerpc64le needs a toolchain w/ headers >= 3.10"
+	depends on BR2_powerpc64le
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_aarch64	  || BR2_arm     || BR2_armeb     || BR2_i386 || \
