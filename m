From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Mar 2016 21:02:22 +0100
Subject: [Buildroot] [PATCH] toolchain: also source the musl package
Message-ID: <1457467342-28203-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do source the glibc and uClibc packages in the toolchain menu,
because they do provide user-visible options. However, we do not so
far source the musl Config.in file

However, in 822be87 (toolchain: include C libraries in legal-info),
a Config.in file for musl was explicitly created, so that:
  - legal-info woudl work (needed at the time, probably no longer needed
    nowadays),
  - the appropriate packages are enabled, linke netbsd-queue or kernel
    headers.

Yet, we do not source musl/Config.in, which means we do not get
netbsd-queue or kernel-headers to be selected:

    $ make distclean; make menuconfig
        Toolchain  --->
          C library ---> musl
      save-and-exit
    $ grep BR2_PACKAGE_LINUX_HEADERS .config
        [nothing]
    $ grep BR2_PACKAGE_NETBSD_QUEUE .config
        [nothing]

Fix that by sourcing musl/Config.in at the same place we source glibc
and uClibc.

Normally, we do have a check in place that verifies that a package
that is not enabled is not a dependency of another package that is
enabled. However, musl is only a dependency of host-gcc-final, which
is a host package and has no corresponding BR2_PACKAGE_HOST_GCC_FINAL.
Thus host-gcc-final is not in the PACKAGES variable, and thus does not
trigger our check.

Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 37c6624..cb4fc18 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -110,6 +110,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 source "package/linux-headers/Config.in"
+source "package/musl/Config.in"
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
-- 
1.9.1
