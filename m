From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 May 2014 22:20:35 +0200
Subject: [Buildroot] [git commit] pciutils: disallow on Blackfin
Message-ID: <20140520202721.5032D9CBFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffacbf7ec2e1011456f0994a7527491392d4d45a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though some Blackfin processors have PCI interfaces, the PCI
support is not supported by the Linux kernel: it has been marked as
broken since 2008. This means there's probably little interest for PCI
on Blackfin, and consequently little interest about getting pciutils
to build.

Fixes http://autobuild.buildroot.net/results/a27/a27ce61967ef8f780887f7681c8b0edd91656be6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iprutils/Config.in |    1 +
 package/pciutils/Config.in |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
index a7e3cb3..1bc58e8 100644
--- a/package/iprutils/Config.in
+++ b/package/iprutils/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_IPRUTILS
 	select BR2_PACKAGE_NCURSES_TARGET_MENU
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_PCIUTILS
+	depends on !BR2_bfin # pciutils
 	help
 	  System utilities for IBM Power RAID devices
 
diff --git a/package/pciutils/Config.in b/package/pciutils/Config.in
index a082f23..d46df6c 100644
--- a/package/pciutils/Config.in
+++ b/package/pciutils/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PCIUTILS
 	bool "pciutils"
+	# PCI not supported on Blackfin
+	depends on !BR2_bfin
 	help
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.
