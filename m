From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 27 Apr 2016 22:15:01 +0200
Subject: [Buildroot] [PATCH v4 1/3] toolchain-external: add a check for
	unsupported toolchains
Message-ID: <1461788103-12163-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchain can't be used by Buildroot due to sysroot location
issue, so the $(ARCH)-linux-gnu-gcc -print-file-name=libc.a command
return only "libc.a"

This lead to an error during the header check version helper,
so these toolchains can't be imported into Buildroot.

cc1: fatal error: $PWD/libc.a/usr/include/linux/version.h: No such file or directory
compilation terminated.
support/scripts/check-kernel-headers.sh: line 38: /tmp/check-headers.4V5PPF: Permission denied

This issue happen with the first linaro 2015.11 [1] release and
CodeSourcery standard edition [2].

Here is the sysroot directory tree for linaro 2015.11:
$ ls libc/arm-linux-gnueabihf
etc  lib  sbin  usr  var

Here is the sysroot directory tree for CodeSourcery standard:
$ ls libc/sgxx-glibc
etc  lib  lib64  sbin  usr  var

Add a check to error out with an explicit error message

The check don't use toolchain_find_libc_a function directly since
"realpath -f" is used internally and return an absolute path.

[1] https://bugs.linaro.org/show_bug.cgi?id=1995#c7
[2] http://lists.busybox.net/pipermail/buildroot/2014-October/110696.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
v4: rebase on master
v3: rename non_existent_sysroot to libc_a_path (ThomasP)
v2: move the check to check_unusable_toolchain helper
    use unsupported toolchain instead of broken toolchains (ThomasP)
---
 toolchain/helpers.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index eeac7d2..8aaad67 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -371,6 +371,11 @@ check_unusable_toolchain = \
 		echo "and contain a lot of pre-built libraries that would conflict with"; \
 		echo "the ones Buildroot wants to build."; \
 		exit 1; \
+	fi; \
+	libc_a_path=`$${__CROSS_CC} -print-file-name=libc.a` ; \
+	if test "$${libc_a_path}" = "libc.a" ; then \
+		echo "Unable to detect the toolchain sysroot, Buildroot cannot use this toolchain." ; \
+		exit 1 ; \
 	fi
 
 #
-- 
2.5.5
