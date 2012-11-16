From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 17:01:04 +0100
Subject: [Buildroot] [git commit] kexec: disable on unsupported architectures
Message-ID: <20121116160138.8EB049A048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3116742e8f0c45e5ca06b32f91e481763356e03e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kexec only supports the following architectures.

  i?86
  powerpc
  powerpc64
  arm*
  s390x|s390
  sh4|sh4a|sh3|sh
  mips*
  cris
  crisv32
  ia64
  x86_64
  alpha

The Buildroot kexec package is available when an unsupported target
architecture is selected, leading to autobuild failures like the following.

  http://autobuild.buildroot.net/results/e706b08abb4fd1987fc4aa970d6be50fc92dc1fa/build-end.log

This patch makes the kexec package available only for the supported
architectures.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kexec/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index e59a07b..886144f 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
-	depends on !BR2_avr32
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
+		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
+		BR2_powerpc || BR2_sh4 || BR2_sh4a || BR2_sh3
 	help
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
