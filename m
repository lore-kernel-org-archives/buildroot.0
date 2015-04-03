From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:01:59 +0200
Subject: [Buildroot] [git commit] softether: add patch to fix build on
	uClibc toolchain without ifaddr support
Message-ID: <20150403120305.BC32E819BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9cf0a76db5e428692f2489901c9787b1fd30eee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to softether to make sure it doesn't use the
ifaddrs functions when they are not provided by the C library, which
can be the case with certain external uClibc toolchains.

Fixes:

  http://autobuild.buildroot.net/results/199/19992951da34a703a476dc62ea92e12927c8a02d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/softether/0007-uclibc-ai-addrconfig.patch |   27 +++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/softether/0007-uclibc-ai-addrconfig.patch b/package/softether/0007-uclibc-ai-addrconfig.patch
new file mode 100644
index 0000000..7d8f1c6
--- /dev/null
+++ b/package/softether/0007-uclibc-ai-addrconfig.patch
@@ -0,0 +1,27 @@
+Only enable getifaddrs support when available
+
+On uClibc, the ifaddrs.h support is optional. While the default
+Buildroot uClibc configuration has it enabled, some external
+toolchains may not. Therefore this patch detects that and adjusts
+softether usage of ifaddrs accordingly.
+
+Based on an initial patch from Bernd Kuhls.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Mayaqua/Mayaqua.h
+===================================================================
+--- a/src/Mayaqua/Mayaqua.h
++++ b/src/Mayaqua/Mayaqua.h
+@@ -235,9 +235,11 @@
+ #ifdef	OS_UNIX
+ #ifndef	UNIX_SOLARIS
+ #ifndef	CPU_SH4
++#if !defined(__UCLIBC__) || defined(__UCLIBC_SUPPORT_AI_ADDRCONFIG__)
+ // Getifaddrs system call is supported on UNIX other than Solaris.
+ // However, it is not supported also by the Linux on SH4 CPU
+ #define	MAYAQUA_SUPPORTS_GETIFADDRS
++#endif  // !UCLIBC || UCLIBC_SUPPORT_AI_ADDRCONFIG
+ #endif	// CPU_SH4
+ #endif	// UNIX_SOLARIS
+ #endif	// OS_UNIX
