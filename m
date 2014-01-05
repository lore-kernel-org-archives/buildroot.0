From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  5 Jan 2014 11:06:00 +0200
Subject: [Buildroot] [PATCH] libpfm4: disable when pthreads barrier support
	in missing
Message-ID: <5362ef85438d1b221bae6d02434d54d2a486d973.1388912760.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old linuxthreads pthreads implementation does not support barriers.
Disable libpfm4 for arches that don't have either NPTL or new linuxthreads
pthreads implementation.

Fixes
http://autobuild.buildroot.net/results/ea5/ea594807b891cbe1f0eddad7f89d34af160636c4/.

Also, add missing comment arches dependency.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpfm4/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
index 1c2fbdcb0ec8..86ca8f6b2bae 100644
--- a/package/libpfm4/Config.in
+++ b/package/libpfm4/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBPFM4
 	bool "libpfm4"
 	depends on !BR2_avr32 # no perf_event_open
+	depends on !BR2_xtensa && !BR2_bfin # no nptl or linuxthreads (new)
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A helper library to help encode Performance Events to use with
@@ -10,3 +11,4 @@ config BR2_PACKAGE_LIBPFM4
 
 comment "libpfm4 needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32 && !BR2_xtensa && !BR2_bfin
-- 
1.8.5.2
