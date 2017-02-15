From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 11:50:52 +0100
Subject: [Buildroot] [PATCH] musl: no SSP on i386 and PowerPC
Message-ID: <1487155852-27508-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to what appears a bug in gcc according to the musl developers, but
that the gcc developers don't want to fix, SSP support currently don't
work on i386 and PowerPC with musl.

Additional details can be found at:

  http://www.openwall.com/lists/musl/2016/12/04/2

OpenWRT and Alpine Linux both have musl and gcc patches to work around
the issue, but in the context of Buildroot, we at this point don't care
enough about SSP support specifically with musl on those architectures
to carry additional patches.

Currently, having SSP enabled with musl/i386 causes a number of build
failures in the autobuilders: cups, ipmiutil, openssh, ruby, stunnel,
sudo and mosh at least all fail to build because of this.

So we simply disable SSP support in the toolchain when musl is used on
i386 and PowerPC. The PowerPC case is not tested in the autobuilders,
but has been reproduced locally and is also fixed by this patch.

Fixes:

  mosh
  http://autobuild.buildroot.net/results/60aa12f1aed08e3b7a98f9ce7091bee3a44d692c/

  ipmi-util
  http://autobuild.buildroot.net/results/fb9a071b8739527f424cfe2886ec480f438f70ab/

  cups
  http://autobuild.buildroot.net/results/486dea944d6ecba5c4e6e8ac664261c1909f4b4c/

  openssh
  http://autobuild.buildroot.net/results/742a8bf4726de6e9ba6926e3fb6019a434454e48/

  sudo
  http://autobuild.buildroot.net/results/682531f368c4e982cafe9e625dd41f6d8c7f93f9/

  ruby
  http://autobuild.buildroot.net/results/dac660f96c7f85e933a6b82cf61edd429eeae9aa/

  stunnel
  http://autobuild.buildroot.net/results/cee52505f1ac2da2f5ba86c9ebfd1f5cd9e301be/

Thanks to Yann E. Morin for suggesting to simply disable SSP support
rather than trying to fix it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 18ae69d..adcfcc6 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_MUSL
 	depends on BR2_TOOLCHAIN_USES_MUSL
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
-	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_SSP if !BR2_i386 && !BR2_powerpc
 	# Compatibility headers: cdefs.h, queue.h
 	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
-- 
2.7.4
