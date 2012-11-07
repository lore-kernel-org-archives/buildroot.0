From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Nov 2012 21:33:11 +0100
Subject: [Buildroot] [PATCH] sstrip preserve permissions
In-Reply-To: <1338083152-2359-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sat, 26 May 2012 21:45:52 -0400")
References: <1338083152-2359-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87hap1cfw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Unlike "strip", the "sstrip" does not preserve the file permissions
 Danomi> of its target.  So if you have a package that sets special permissions,
 Danomi> such as the setuid bit, sstrip will remove it.  This patch adds some
 Danomi> minimal lines to preserve the permissions of stripped files.

What is the use case for this? From a quick look it seems sstrip just
truncates the source file, so permissions shouldn't change.

setuid (to root) doesn't make much sense as we're building as non-root
and fixing up permissions at the end using fakeroot (E.G. see
BUSYBOX_PERMISSIONS).


 Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 Danomi> ---
 Danomi>  .../sstrip/sstrip-20154-preserve-permissions.patch |   43 ++++++++++++++++++++
 Danomi>  1 file changed, 43 insertions(+)
 Danomi>  create mode 100644 package/sstrip/sstrip-20154-preserve-permissions.patch

 Danomi> diff --git a/package/sstrip/sstrip-20154-preserve-permissions.patch b/package/sstrip/sstrip-20154-preserve-permissions.patch
 Danomi> new file mode 100644
 Danomi> index 0000000..0bd9162
 Danomi> --- /dev/null
 Danomi> +++ b/package/sstrip/sstrip-20154-preserve-permissions.patch
 Danomi> @@ -0,0 +1,43 @@
 Danomi> +diff -urN sstrip.ORIG/src/sstrip.c sstrip/src/sstrip.c
 Danomi> +--- sstrip.ORIG/src/sstrip.c	2010-12-11 23:59:51.464374000 -0500
 Danomi> ++++ sstrip/src/sstrip.c	2012-02-21 11:58:56.320295827 -0500
 Danomi> +@@ -60,6 +60,10 @@
 Danomi> + #include	<fcntl.h>
 Danomi> + #include	<elf.h>
 Danomi> + 
 Danomi> ++#include <sys/types.h>
 Danomi> ++#include <sys/stat.h>
 Danomi> ++#include <unistd.h>
 Danomi> ++
 Danomi> + #ifndef TRUE
 Danomi> + #define	TRUE		1
 Danomi> + #define	FALSE		0
 Danomi> +@@ -427,6 +431,7 @@
 Danomi> + 
 Danomi> + 	for (arg = argv + 1 ; *arg != NULL ; ++arg) {
 Danomi> + 		filename = *arg;
 Danomi> ++		struct stat sb;
 Danomi> + 
 Danomi> + 		fd = open(*arg, O_RDWR);
 Danomi> + 		if (fd < 0) {
 Danomi> +@@ -435,6 +440,9 @@
 Danomi> + 			continue;
 Danomi> + 		}
 Danomi> + 
 Danomi> ++		/* Get original file's permissions */
 Danomi> ++		if (fstat(fd, &sb) == -1) { perror("fstat"); sb.st_mode = 0; }
 Danomi> ++
 Danomi> + 		switch (readelfheaderident(fd, &e.ehdr32)) {
 Danomi> + 			case ELFCLASS32:
 Danomi> + 				if (!(readelfheader32(fd, &e.ehdr32)					&&
 Danomi> +@@ -458,6 +466,10 @@
 Danomi> + 				++failures;
 Danomi> + 				break;
 Danomi> + 		}
 Danomi> ++
 Danomi> ++		/* Set original file's permissions, including setuid */
 Danomi> ++		if (sb.st_mode != 0) { fchmod(fd, sb.st_mode & 07777); }
 Danomi> ++
 Danomi> + 		close(fd);
 Danomi> + 	}
 Danomi> + 
 Danomi> -- 
 Danomi> 1.7.9.5

 Danomi> _______________________________________________
 Danomi> buildroot mailing list
 Danomi> buildroot at busybox.net
 Danomi> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
