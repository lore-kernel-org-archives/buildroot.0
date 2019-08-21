From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 21 Aug 2019 23:50:33 +0200
Subject: [Buildroot] [git commit] package/gcc: allow uclibc only for gcc
 or1k (5.x)
Message-ID: <20190821215149.66C978429D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=295307700b49bada3f6e638716f00dd418a71b04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc doesn't build with the upstream binutils 2.32.x and gcc or1k
port due to the following error:

LD libuClibc-1.0.31.so
/opt/openrisc--uclibc--bleeding-edge-1/lib/gcc/or1k-buildroot-linux-uclibc/9.2.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
libc/libc_so.a(or1k_clone.os): pc-relative relocation against dynamic symbol
__syscall_error

See:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/270854456

This error message come from a new check in binutils 2.32.x:

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=f2c1801f6255a3f9f483ae2f07c7d7da0ddae4af

This issue has been reported on the uClibc-ng mailing list:
https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001885.html

Since gcc 9.1 needs binutils 2.32.x or later to build successfully for
or1k, there is no binutils version left that can build gcc 9.1 and
uClibc.

For now, disable uClibc if gcc 9.1 is used for or1k.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
[Arnout: invert the logic, like in the rest of the file]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b435614330..4425be9df3 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -62,6 +62,9 @@ config BR2_GCC_VERSION_9_X
 	# or1k needs binutils >= 2.32
 	depends on !(BR2_or1k && \
 		(BR2_BINUTILS_VERSION_2_30_X || BR2_BINUTILS_VERSION_2_31_X))
+	# uClibc doesn't build with upstream or1k gcc
+	# https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001885.html
+	depends on !(BR2_or1k && BR2_TOOLCHAIN_USES_UCLIBC)
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
