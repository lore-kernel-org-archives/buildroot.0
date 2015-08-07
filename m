From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 11:08:12 +0200
Subject: [Buildroot] [git commit] libsigsegv: not available on SuperH with
	uClibc
Message-ID: <20150807090926.C95038083A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38454e10589993e5c7877f2fd904ba07f5865357
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like PowerPC, the uClibc port on SuperH doesn't implement ucontext, so
we can't build libsigsegv in such a configuration. Therefore this
commit marks libsigsegv as not available on SuperH/uClibc.

Fixes:

  http://autobuild.buildroot.net/results/2128a3507e57e707ee5c726f1ccfddadb7b19112/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigsegv/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 35f6d67..e5224da 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -3,12 +3,12 @@ config BR2_PACKAGE_LIBSIGSEGV
 	depends on !BR2_xtensa
 	depends on !BR2_arc # no ucontext_i.sym file
 	depends on !BR2_microblaze
-	# No ucontext support in uclibc for powerpc
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	# No ucontext support in uclibc for powerpc and superh
+	depends on !((BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
 	  Library for handling page faults in user mode.
 
 	  http://libsigsegv.sourceforge.net/
 
 comment "libsigsegv needs an (e)glibc toolchain"
-	depends on BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC
+	depends on (BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC
