From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 22:14:04 +0200
Subject: [Buildroot] [git commit] strace: Disable for MIPS when using a
	uClibc toolchain
Message-ID: <20140913202314.384399D687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c97562af4b0e873dfe41baa5ae0156d3b626f46b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A change introduced in strace-4.9 makes it incompatible with MIPS
architecture when using a uClibc toolchain. This is the failure:

signal.c: In function 'printsiginfo':
signal.c:453:9: error: 'siginfo_t' has no member named 'si_timerid'
      sip->si_timerid, sip->si_overrun);
	 ^
signal.c:453:26: error: 'siginfo_t' has no member named 'si_overrun'
      sip->si_timerid, sip->si_overrun);

uClibc needs to be patched in order to fix this problem. In the meantime
we disable strace for MIPS when using a uClibc toolchain.

Fixes:

  http://autobuild.buildroot.net/results/91c/91c0413e755c365332bc15d1d69ab3d6160ae78c/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index ad8d308..bc521e0 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
 	depends on !BR2_nios2
+	depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) \
+	             && BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_LARGEFILE
 	help
 	  A useful diagnostic, instructional, and debugging tool.
@@ -11,3 +13,7 @@ config BR2_PACKAGE_STRACE
 
 comment "strace needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
+
+comment "strace is not supported on MIPS using a uClibc toolchain"
+	depends on (BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && \
+	           BR2_TOOLCHAIN_USES_UCLIBC
