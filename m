From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 21:29:58 +0100
Subject: [Buildroot] [git commit branch/next] package/numactl: needs -fPIC
Message-ID: <20201117203829.E31177FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fe0298eecb50a5145bc20411af24dc22cfcf861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This will avoid the following build failure with qemu 5.0.0 and above:

/srv/storage/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-2/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libnuma.a(libnuma.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a PIE object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/616dff216a215dc0494c846d337e03e0795b2fb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/numactl/numactl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index d0dd5c26f4..cf9c759693 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -10,5 +10,6 @@ NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README.md
 NUMACTL_INSTALL_STAGING = YES
 NUMACTL_AUTORECONF = YES
+NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 $(eval $(autotools-package))
