From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 09:52:55 +0100
Subject: [Buildroot] [git commit] libpfm4: needs thread support
Message-ID: <20131204093549.892429BF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09100a37507d2534503c0a1ac3857fc4571304e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/73d736dd3c8a70358ef4b19a63dda46178cf8bf1/

Note that the propagation of the thread dependency to the oprofile
package is a little bit non standard, because oprofile selects libpfm4
only on the PowerPC architecture. So we ensure the thread dependency
is only enforced on PowerPC, and a separate comment is displayed when
thread support is not available, but the PowerPC architecture is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpfm4/Config.in  |    4 ++++
 package/oprofile/Config.in |    6 ++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
index 3908e78..1c2fbdc 100644
--- a/package/libpfm4/Config.in
+++ b/package/libpfm4/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBPFM4
 	bool "libpfm4"
 	depends on !BR2_avr32 # no perf_event_open
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A helper library to help encode Performance Events to use with
 	  Operating system kernels performance monitoring interfaces.
 
 	  http://perfmon2.sourceforge.net/
+
+comment "libpfm4 needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 2847a91..dff2a8c 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_aarch64 # binutils
+	# libpfm4 is needed on PowerPC, and requires thread support
+	depends on BR2_TOOLCHAIN_HAS_THREADS || !BR2_powerpc
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
@@ -25,3 +27,7 @@ config BR2_PACKAGE_OPROFILE
 comment "oprofile needs a toolchain w/ C++"
 	depends on BR2_USE_MMU && !BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "oprofile needs a toolchain w/ threads on PPC"
+	depends on BR2_USE_MMU && BR2_powerpc
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
