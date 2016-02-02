From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 2 Feb 2016 16:03:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/lvm2: fix musl build
In-Reply-To: <1453847201-19076-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453847201-19076-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0C539.1000200@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 26/01/2016 23:26, Bernd Kuhls a ?crit :
> Fixes
> http://autobuild.buildroot.net/results/b25/b25847e1b8eddac6104c5777a8137e419eaefe64/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lvm2/0001-fix-stdio-usage.patch | 118 ++++++++++++++++++++++++++++++++
>  package/lvm2/0002-mallinfo.patch        |  18 +++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 package/lvm2/0001-fix-stdio-usage.patch
>  create mode 100644 package/lvm2/0002-mallinfo.patch
> 
> diff --git a/package/lvm2/0001-fix-stdio-usage.patch b/package/lvm2/0001-fix-stdio-usage.patch
> new file mode 100644
> index 0000000..a06ca7c
> --- /dev/null
> +++ b/package/lvm2/0001-fix-stdio-usage.patch
> @@ -0,0 +1,118 @@
> +Fix musl build
> +
> +Downloaded from
> +http://git.alpinelinux.org/cgit/aports/plain/main/lvm2/fix-stdio-usage.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +--- LVM2.2.02.103.orig/lib/commands/toolcontext.c
> ++++ LVM2.2.02.103/lib/commands/toolcontext.c
> +@@ -1336,7 +1336,10 @@
> + /*
> +  * Close and reopen stream on file descriptor fd.
> +  */
> +-static int _reopen_stream(FILE *stream, int fd, const char *mode, const char *name, FILE **new_stream)
> ++#ifdef __GLIBC__
> ++#define _reopen_stream(stream, fd, mode, name) __reopen_stream(stream, fd, mode, name, &stream)
> ++
> ++static int __reopen_stream(FILE *stream, int fd, const char *mode, const char *name, FILE **new_stream)
> + {
> + 	int fd_copy, new_fd;
> + 
> +@@ -1363,6 +1366,9 @@
> + 
> + 	return 1;
> + }
> ++#else
> ++#define _reopen_stream(stream, fd, mode, name) (freopen(NULL, mode, stream) != NULL)
> ++#endif

I'm just wondering why not use freopen() directly and remove __reopen_stream() ?


> + 
> + /* Entry point */
> + struct cmd_context *create_toolcontext(unsigned is_long_lived,
> +@@ -1371,7 +1377,6 @@
> + 				       unsigned threaded)
> + {
> + 	struct cmd_context *cmd;
> +-	FILE *new_stream;
> + 	int flags;
> + 
> + #ifdef M_MMAP_MAX
> +@@ -1421,9 +1426,8 @@
> + 		if (is_valid_fd(STDIN_FILENO) &&
> + 		    ((flags = fcntl(STDIN_FILENO, F_GETFL)) > 0) &&
> + 		    (flags & O_ACCMODE) != O_WRONLY) {
> +-			if (!_reopen_stream(stdin, STDIN_FILENO, "r", "stdin", &new_stream))
> ++			if (!_reopen_stream(stdin, STDIN_FILENO, "r", "stdin"))
> + 				goto_out;
> +-			stdin = new_stream;
> + 			if (setvbuf(stdin, cmd->linebuffer, _IOLBF, linebuffer_size)) {
> + 				log_sys_error("setvbuf", "");
> + 				goto out;
> +@@ -1433,9 +1437,8 @@
> + 		if (is_valid_fd(STDOUT_FILENO) &&
> + 		    ((flags = fcntl(STDOUT_FILENO, F_GETFL)) > 0) &&
> + 		    (flags & O_ACCMODE) != O_RDONLY) {
> +-			if (!_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout", &new_stream))
> ++			if (!_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout"))
> + 				goto_out;
> +-			stdout = new_stream;
> + 			if (setvbuf(stdout, cmd->linebuffer + linebuffer_size,
> + 				     _IOLBF, linebuffer_size)) {
> + 				log_sys_error("setvbuf", "");
> +@@ -1715,7 +1718,6 @@
> + void destroy_toolcontext(struct cmd_context *cmd)
> + {
> + 	struct dm_config_tree *cft_cmdline;
> +-	FILE *new_stream;
> + 	int flags;
> + 
> + 	if (cmd->dump_filter && cmd->filter && cmd->filter->dump &&
> +@@ -1752,8 +1754,7 @@
> + 		if (is_valid_fd(STDIN_FILENO) &&
> + 		    ((flags = fcntl(STDIN_FILENO, F_GETFL)) > 0) &&
> + 		    (flags & O_ACCMODE) != O_WRONLY) {
> +-			if (_reopen_stream(stdin, STDIN_FILENO, "r", "stdin", &new_stream)) {
> +-				stdin = new_stream;
> ++			if (_reopen_stream(stdin, STDIN_FILENO, "r", "stdin")) {
> + 				setlinebuf(stdin);
> + 			} else
> + 				cmd->linebuffer = NULL;	/* Leave buffer in place (deliberate leak) */
> +@@ -1762,8 +1763,7 @@
> + 		if (is_valid_fd(STDOUT_FILENO) &&
> + 		    ((flags = fcntl(STDOUT_FILENO, F_GETFL)) > 0) &&
> + 		    (flags & O_ACCMODE) != O_RDONLY) {
> +-			if (_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout", &new_stream)) {
> +-				stdout = new_stream;
> ++			if (_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout")) {
> + 				setlinebuf(stdout);
> + 			} else
> + 				cmd->linebuffer = NULL;	/* Leave buffer in place (deliberate leak) */
> +--- LVM2.2.02.103.orig/tools/lvmcmdline.c
> ++++ LVM2.2.02.103/tools/lvmcmdline.c
> +@@ -1252,7 +1252,7 @@
> + 	int err = is_valid_fd(STDERR_FILENO);
> + 
> + 	if (!is_valid_fd(STDIN_FILENO) &&
> +-	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
> ++	    !freopen(_PATH_DEVNULL, "r", stdin)) {
> + 		if (err)
> + 			perror("stdin stream open");
> + 		else
> +@@ -1262,7 +1262,7 @@
> + 	}
> + 
> + 	if (!is_valid_fd(STDOUT_FILENO) &&
> +-	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
> ++	    !freopen(_PATH_DEVNULL, "w", stdout)) {
> + 		if (err)
> + 			perror("stdout stream open");
> + 		/* else no stdout */
> +@@ -1270,7 +1270,7 @@
> + 	}
> + 
> + 	if (!is_valid_fd(STDERR_FILENO) &&
> +-	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
> ++	    !freopen(_PATH_DEVNULL, "w", stderr)) {
> + 		printf("stderr stream open: %s\n",
> + 		       strerror(errno));
> + 		return 0;
> diff --git a/package/lvm2/0002-mallinfo.patch b/package/lvm2/0002-mallinfo.patch
> new file mode 100644
> index 0000000..e3b5f89
> --- /dev/null
> +++ b/package/lvm2/0002-mallinfo.patch
> @@ -0,0 +1,18 @@
> +Fix musl build
> +
> +Downloaded from
> +http://git.alpinelinux.org/cgit/aports/plain/main/lvm2/mallinfo.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +--- ./lib/mm/memlock.c.orig	2015-03-09 11:18:41.560028850 -0100
> ++++ ./lib/mm/memlock.c	2015-03-09 11:19:54.504373309 -0100
> +@@ -137,7 +137,7 @@
> + 
> + static void _allocate_memory(void)
> + {
> +-#ifndef VALGRIND_POOL
> ++#if !defined(VALGRIND_POOL) && defined(__GLIBC__)

Maybe use AC_CHECK_FUNCS([mallinfo]) in configure.ac and use HAVE_MALLINFO here ?

Thoughts ?

Best regards,
Romain

> + 	void *stack_mem;
> + 	struct rlimit limit;
> + 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
> 
