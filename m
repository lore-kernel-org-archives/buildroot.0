From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 11:02:16 +0100
Subject: [Buildroot] [git commit] libpfm4: disable when pthreads barrier
	support in missing
Message-ID: <20140105101616.7BB2F9C357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=344a1b88ee46a5b26613d4177979039379373b73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old linuxthreads pthreads implementation does not support barriers.
Disable libpfm4 for arches that don't have either NPTL or new linuxthreads
pthreads implementation.

Fixes
http://autobuild.buildroot.net/results/ea5/ea594807b891cbe1f0eddad7f89d34af160636c4/.

Also, add missing comment arches dependency.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpfm4/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
index 1c2fbdc..86ca8f6 100644
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
