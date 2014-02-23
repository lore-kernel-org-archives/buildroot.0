From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 16:46:51 +0100
Subject: [Buildroot] [git commit] rt-tests: disable for uclibc mips
Message-ID: <20140223154754.D9C489B838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=108952af0a1f60691d4028362512664686267ec9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rt-tests is not supported by a uclibc toolchain that does not implement
_pid in struct sigevent. Currently this is all MIPS architectures
in uclibc.

Fixes:
  http://autobuild.buildroot.net/results/074/074265602bec4aba6c82d1aee389045e8ad33d4b

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 58a88a8..a8cede0 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -5,6 +5,9 @@ config BR2_PACKAGE_RT_TESTS
 	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
 	# no NPTL for these archs
 	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
+	# no _tid field in 'struct sigevent'
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
+		BR2_mips64 || BR2_mips64el)
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -27,3 +30,7 @@ comment "rt-tests needs a toolchain w/ threads"
 	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
 	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "rt-tests needs an (e)glibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
+		BR2_mips64 || BR2_mips64el)
