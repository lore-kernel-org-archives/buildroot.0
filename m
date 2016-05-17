From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:43:27 +0200
Subject: [Buildroot] [git commit] glibc: disable build of glibc 2.22 with
	gcc 6.x
Message-ID: <20160517064458.DD0C680069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0af371be3a1818c2a96e86b5a92c5b9f9002403a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc-2.22 does not build with gcc 6.x. The first issues can be fixed
by:

 - Using the same 0004-gcc6.patch as we're using with glibc 2.23 since
   Buildroot commit ab8de336eb39ae1cb019a72be65bd0504c86e527.

 - Backport glibc commit 5542236837c5c41435f8282ec92799f480c36f18 to fix
   strchr() build failure.

But then, there are some more failures caused by the fact that numerous
glibc files were not using modern prototypes in the function
definitions, causing build failures such as:

../sysdeps/unix/sysv/linux/dl-openat64.c:26:1: error: 'openat64' defined as variadic function without prototype [-Werror]
 openat64 (dfd, file, oflag)
 ^~~~~~~~
In file included from ../include/fcntl.h:2:0,
                 from ../sysdeps/unix/sysv/linux/dl-openat64.c:21:
../io/fcntl.h:214:12: note: previous declaration of 'openat64' was here
 extern int openat64 (int __fd, const char *__file, int __oflag, ...)
            ^~~~~~~~

This could be fixed by backporting glibc commit
9dd346ff431fc761f1b748bd4da8bb59f7652094, but this is a large commit,
touching a significant number of files. We probably don't want to take
this path, and instead making glibc 2.22 as not available with gcc 6.x
seems like the right course of action.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 0565162..5b82170 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -38,6 +38,8 @@ config BR2_GLIBC_VERSION_2_22
 	bool "2.22"
 	# No support for pthread barriers on < v9 ISA
 	depends on !BR2_sparc
+	# Too old to build with gcc >= 6.x
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_GLIBC_VERSION_2_23
 	bool "2.23"
