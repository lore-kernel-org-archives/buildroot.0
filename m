From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 15:36:16 +0100
Subject: [Buildroot] [git commit] package/firejail: mark as broken
Message-ID: <20170312143633.5949281F67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ad100fdcbf6e2bf850b4b2f528c87c74f7c93ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The firejail package does not cross-compile at all, because it is not
using automake, but a hand-written Makefile.in. So it does not use the
cross-compiler found by ./configure.

But when we fix it by passing:
    FIREJAIL_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)

it then fails to build with symbols redefinitions:

    /home/ymorin/dev/buildroot/O/host/usr/bin/arm-linux-gnueabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -ggdb  -O2 -DVERSION='"0.9.44.8"' -fstack-protector-all -D_FORTIFY_SOURCE=2 -fPIC -Wformat -Wformat-security  -c libtrace.c -o libtrace.o
    /tmpfs/cckgOLVz.s: Assembler messages:
    /tmpfs/cckgOLVz.s:1115: Error: symbol `stat64' is already defined
    /tmpfs/cckgOLVz.s:1282: Error: symbol `lstat64' is already defined
    /tmpfs/cckgOLVz.s:2296: Error: symbol `fopen64' is already defined
    /tmpfs/cckgOLVz.s:2631: Error: symbol `freopen64' is already defined
    Makefile:16: recipe for target 'libtrace.o' failed

(ditto for libtracelog)

Fixing this is not trivial, so we just mark the package as broken.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Chris Frederick <chrisf@cdf123.net>
[Thomas: also mark the Config.in comment as BROKEN.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/firejail/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/firejail/Config.in b/package/firejail/Config.in
index 1742b65..764217b 100644
--- a/package/firejail/Config.in
+++ b/package/firejail/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FIREJAIL
 	bool "firejail"
+	depends on BROKEN # does not cross-compile at all
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc: error: ???EM_ARM??? undeclared
@@ -16,4 +17,5 @@ config BR2_PACKAGE_FIREJAIL
 
 comment "firejail needs a glibc or musl toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BROKEN
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_HAS_THREADS
