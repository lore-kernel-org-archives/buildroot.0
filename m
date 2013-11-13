From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Nov 2013 00:12:24 +0100
Subject: [Buildroot] [PATCH 1/2] util-linux: nommu: Add patch to use
 vfork in nommu arch.
In-Reply-To: <1384165765-23210-1-git-send-email-Sonic.adi@gmail.com>
References: <1384165765-23210-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <52840758.10104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Sonic,

  Some of my comments to Aaron apply to this patch as well.

  Also, please remember to send your patch upstream, to 
util-linux at vger.kernel.org

On 11/11/13 11:29, sonic.adi at gmail.com wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>   package/util-linux/util-linux-nommu.patch | 591 ++++++++++++++++++++++++++++++
>   1 file changed, 591 insertions(+)
>   create mode 100644 package/util-linux/util-linux-nommu.patch
>
> diff --git a/package/util-linux/util-linux-nommu.patch b/package/util-linux/util-linux-nommu.patch
> new file mode 100644
> index 0000000..b09783c
> --- /dev/null
> +++ b/package/util-linux/util-linux-nommu.patch
> @@ -0,0 +1,591 @@

  Patch should have a comment + signed-off-by, like a commit message.

  Also, the patch description should be a lot more verbose, and explain 
why each of the fork calls can be replaced in the way it is replaced.

> +diff -urN util-linux-2.23.2.old/configure.ac util-linux-2.23.2/configure.ac
> +--- util-linux-2.23.2.old/configure.ac	2013-11-11 14:34:33.550893863 +0800
> ++++ util-linux-2.23.2/configure.ac	2013-11-11 14:44:23.762438640 +0800
> +@@ -311,6 +311,7 @@
> + 	err \
> + 	errx \
> + 	fsync \
> ++	fork \
> + 	futimens \
> + 	getdomainname \
> + 	getdtablesize \
> +diff -urN util-linux-2.23.2.old/disk-utils/fsck.c util-linux-2.23.2/disk-utils/fsck.c
> +--- util-linux-2.23.2.old/disk-utils/fsck.c	2013-06-13 15:46:10.377650254 +0800
> ++++ util-linux-2.23.2/disk-utils/fsck.c	2013-11-11 14:48:48.383360534 +0800
> +@@ -606,7 +606,11 @@
> + 	/* Fork and execute the correct program. */
> + 	if (noexecute)
> + 		pid = -1;
> ++#ifndef HAVE_FORK
> ++	else if ((pid = vfork()) < 0) {
> ++#else
> + 	else if ((pid = fork()) < 0) {
> ++#endif
> + 		warn(_("fork failed"));
> + 		free(inst);
> + 		return errno;
> +@@ -755,10 +759,18 @@
> + 			 * time to set up the signal handler
> + 			 */
> + 			if (inst2->start_time.tv_sec < time(0) + 2) {
> ++#ifndef HAVE_FORK
> ++				if (vfork() == 0) {
> ++#else
> + 				if (fork() == 0) {
> ++#endif
> + 					sleep(1);
> + 					kill(inst2->pid, SIGUSR1);
> ++#ifndef HAVE_FORK
> ++					_exit(EXIT_OK);
> ++#else
> + 					exit(FSCK_EX_OK);
> ++#endif

  This is completely pointless - the parent will anyway be blocked until 
the child exits, so forking makes no sense. How about:

#ifdef HAVE_FORK
			if (inst2->start_time.tv_sec < time(0) + 2) {
				if (fork() == 0) {
					sleep(1);
					kill(inst2->pid, SIGUSR1);
					exit(FSCK_EX_OK);
				}
			} else
				kill(inst2->pid, SIGUSR1);
#else
			if (inst2->start_time.tv_sec < time(0) + 2)
				sleep(1);
			kill(inst2->pid, SIGUSR1);
#endif

> + 				}
> + 			} else
> + 				kill(inst2->pid, SIGUSR1);
> +diff -urN util-linux-2.23.2.old/fdisks/fdiskbsdlabel.h util-linux-2.23.2/fdisks/fdiskbsdlabel.h
> +--- util-linux-2.23.2.old/fdisks/fdiskbsdlabel.h	2013-07-30 16:54:15.362994206 +0800
> ++++ util-linux-2.23.2/fdisks/fdiskbsdlabel.h	2013-11-11 14:52:18.285623027 +0800
> +@@ -50,7 +50,7 @@
> +     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
> +     defined (__aarch64__) || defined(__xtensa__) || \
> +     defined (__x86_64__) || defined (__avr32__) || defined(__cris__) || \
> +-    defined (__microblaze__)
> ++    defined(__bfin__) || defined (__microblaze__)

  This is actually a blackfin change, not a nommu change, so it should be 
a separate patch.

> + #define BSD_LABELSECTOR   1
> + #define BSD_LABELOFFSET   0
> + #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
> +diff -urN util-linux-2.23.2.old/libblkid/src/topology/dm.c util-linux-2.23.2/libblkid/src/topology/dm.c
> +--- util-linux-2.23.2.old/libblkid/src/topology/dm.c	2013-06-13 15:46:10.428650690 +0800
> ++++ util-linux-2.23.2/libblkid/src/topology/dm.c	2013-11-11 15:13:11.316088170 +0800
> +@@ -61,7 +61,11 @@
> + 		goto nothing;
> + 	}
> +
> ++#ifndef HAVE_FORK
> ++	switch (vfork()) {
> ++#else
> + 	switch (fork()) {
> ++#endif
> + 	case 0:
> + 	{
> + 		char *dmargv[7], maj[16], min[16];
> +@@ -74,9 +78,9 @@
> +
> + 		/* The libblkid library could linked with setuid programs */
> + 		if (setgid(getgid()) < 0)
> +-			 exit(1);
> ++			 _exit(1);

  I would wrap this in #ifdef HAVE_FORK.

> + 		if (setuid(getuid()) < 0)
> +-			 exit(1);
> ++			 _exit(1);
> +
> + 		snprintf(maj, sizeof(maj), "%d", major(devno));
> + 		snprintf(min, sizeof(min), "%d", minor(devno));
> +@@ -92,7 +96,7 @@
> + 		execv(dmargv[0], dmargv);
> +
> + 		DBG(LOWPROBE, blkid_debug("Failed to execute %s: errno=%d", cmd, errno));
> +-		exit(1);
> ++		_exit(1);

  Same here.

> + 	}
> + 	case -1:
> + 		DBG(LOWPROBE, blkid_debug("Failed to forking: errno=%d", errno));
> +diff -urN util-linux-2.23.2.old/libblkid/src/topology/lvm.c util-linux-2.23.2/libblkid/src/topology/lvm.c
> +--- util-linux-2.23.2.old/libblkid/src/topology/lvm.c	2013-06-13 15:46:10.429650699 +0800
> ++++ util-linux-2.23.2/libblkid/src/topology/lvm.c	2013-11-11 15:14:07.483452404 +0800
> +@@ -71,7 +71,11 @@
> + 		goto nothing;
> + 	}
> +
> ++#ifndef HAVE_FORK
> ++	switch (vfork()) {
> ++#else
> + 	switch (fork()) {
> ++#endif
> + 	case 0:
> + 	{
> + 		char *lvargv[3];
> +@@ -84,9 +88,9 @@
> +
> + 		/* The libblkid library could linked with setuid programs */
> + 		if (setgid(getgid()) < 0)
> +-			 exit(1);
> ++			 _exit(1);

  Same here.

> + 		if (setuid(getuid()) < 0)
> +-			 exit(1);
> ++			 _exit(1);
> +
> + 		lvargv[0] = cmd;
> + 		lvargv[1] = devname;
> +@@ -95,7 +99,7 @@
> + 		execv(lvargv[0], lvargv);
> +
> + 		DBG(LOWPROBE, blkid_debug("Failed to execute %s: errno=%d", cmd, errno));
> +-		exit(1);
> ++		_exit(1);

  Same here.

> + 	}
> + 	case -1:
> + 		DBG(LOWPROBE, blkid_debug("Failed to forking: errno=%d", errno));
> +diff -urN util-linux-2.23.2.old/libmount/src/context_mount.c util-linux-2.23.2/libmount/src/context_mount.c
> +--- util-linux-2.23.2.old/libmount/src/context_mount.c	2013-06-13 15:46:10.432650724 +0800
> ++++ util-linux-2.23.2/libmount/src/context_mount.c	2013-11-11 14:44:33.215049590 +0800
> +@@ -499,17 +499,29 @@
> +
> + 	DBG_FLUSH;
> +
> ++#ifndef HAVE_FORK
> ++	switch (vfork()) {
> ++#else
> + 	switch (fork()) {
> ++#endif
> + 	case 0:
> + 	{
> + 		const char *args[12], *type;
> + 		int i = 0;
> +
> + 		if (setgid(getgid()) < 0)
> ++#ifndef HAVE_FORK
> ++			_exit(EXIT_FAILURE);
> ++#else
> + 			exit(EXIT_FAILURE);
> ++#endif
> +
> + 		if (setuid(getuid()) < 0)
> ++#ifndef HAVE_FORK
> ++			_exit(EXIT_FAILURE);
> ++#else
> + 			exit(EXIT_FAILURE);
> ++#endif
> +
> + 		type = mnt_fs_get_fstype(cxt->fs);
> +
> +@@ -546,7 +558,11 @@
> + #endif
> + 		DBG_FLUSH;
> + 		execv(cxt->helper, (char * const *) args);
> ++#ifndef HAVE_FORK
> ++		_exit(EXIT_FAILURE);
> ++#else
> + 		exit(EXIT_FAILURE);
> ++#endif
> + 	}
> + 	default:
> + 	{
> +@@ -1123,7 +1123,7 @@
> + 	if (mnt_context_is_child(cxt)) {
> + 		DBG(CXT, mnt_debug_h(cxt, "next-mount: child exit [rc=%d]", rc));
> + 		DBG_FLUSH;
> +-		exit(rc);
> ++		_exit(rc);

  I haven't studied it in detail, but I don't see how mnt_fork_context 
can work... So this change is probably also not needed.

  BTW I don't see a change to mnt_fork_context - so does is this patch 
incomplete?


  I don't have time to review the rest of the patch, but you get the 
spirit :-)

  Regards,
  Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
