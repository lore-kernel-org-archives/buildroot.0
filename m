From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  2 Feb 2008 13:49:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080202214949.188EC120108@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-02 13:49:48 -0800 (Sat, 02 Feb 2008)
New Revision: 20936

Log:
busybox: More 1.9.0 patches


Added:
   trunk/buildroot/package/busybox/busybox-1.9.0-fsck.patch
   trunk/buildroot/package/busybox/busybox-1.9.0-mkswap.patch
   trunk/buildroot/package/busybox/busybox-1.9.0-msh.patch
   trunk/buildroot/package/busybox/busybox-1.9.0-stty.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.9.0-fsck.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.0-fsck.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.0-fsck.patch	2008-02-02 21:49:48 UTC (rev 20936)
@@ -0,0 +1,15 @@
+--- busybox-1.9.0/e2fsprogs/fsck.c	Fri Dec 21 22:00:31 2007
++++ busybox-1.9.0-fsck/e2fsprogs/fsck.c	Sat Feb  2 18:55:22 2008
+@@ -665,6 +665,12 @@
+ 	for (i = num_args+1; i < argc; i++)
+ 		free(argv[i]);
+ 
++	/* No pid, so don't record an instance */
++	if (pid < 0) {
++		free(inst);
++		return;
++	}
++
+ 	inst->pid = pid;
+ 	inst->prog = argv[0];
+ 	inst->type = xstrdup(type);

Added: trunk/buildroot/package/busybox/busybox-1.9.0-mkswap.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.0-mkswap.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.0-mkswap.patch	2008-02-02 21:49:48 UTC (rev 20936)
@@ -0,0 +1,15 @@
+--- busybox-1.9.0/util-linux/mkswap.c	Fri Dec 21 22:00:33 2007
++++ busybox-1.9.0-mkswap/util-linux/mkswap.c	Sat Feb  2 18:55:31 2008
+@@ -64,9 +64,10 @@
+ 	// Figure out how big the device is and announce our intentions.
+ 
+ 	fd = xopen(argv[1], O_RDWR);
+-	len = fdlength(fd);
++	len = lseek(fd, 0, SEEK_END);
++	lseek(fd, 0, SEEK_SET);
+ 	pagesize = getpagesize();
+-	printf("Setting up swapspace version 1, size = %"OFF_FMT"d bytes\n",
++	printf("Setting up swapspace version 1, size = %"OFF_FMT"u bytes\n",
+ 			len - pagesize);
+ 	mkswap_selinux_setcontext(fd, argv[1]);
+ 

Added: trunk/buildroot/package/busybox/busybox-1.9.0-msh.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.0-msh.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.0-msh.patch	2008-02-02 21:49:48 UTC (rev 20936)
@@ -0,0 +1,79 @@
+--- busybox-1.9.0/include/libbb.h	Fri Dec 21 22:00:31 2007
++++ busybox-1.9.0-msh/include/libbb.h	Sat Feb  2 18:55:36 2008
+@@ -950,10 +950,9 @@
+ };
+ line_input_t *new_line_input_t(int flags);
+ /* Returns:
+- * -1 on read errors or EOF, or on bare Ctrl-D.
+- * 0  on ctrl-C,
++ * -1 on read errors or EOF, or on bare Ctrl-D,
++ * 0  on ctrl-C (the line entered is still returned in 'command'),
+  * >0 length of input string, including terminating '\n'
+- * [is this true? stores "" in 'command' if return value is 0 or -1]
+  */
+ int read_line_input(const char* prompt, char* command, int maxsize, line_input_t *state);
+ #else
+--- busybox-1.9.0/libbb/lineedit.c	Mon Dec 24 14:08:25 2007
++++ busybox-1.9.0-msh/libbb/lineedit.c	Sat Feb  2 18:55:36 2008
+@@ -1315,8 +1315,8 @@
+ #define CTRL(a) ((a) & ~0x40)
+ 
+ /* Returns:
+- * -1 on read errors or EOF, or on bare Ctrl-D.
+- * 0  on ctrl-C,
++ * -1 on read errors or EOF, or on bare Ctrl-D,
++ * 0  on ctrl-C (the line entered is still returned in 'command'),
+  * >0 length of input string, including terminating '\n'
+  */
+ int read_line_input(const char *prompt, char *command, int maxsize, line_input_t *st)
+--- busybox-1.9.0/shell/msh.c	Fri Dec 21 22:00:28 2007
++++ busybox-1.9.0-msh/shell/msh.c	Sat Feb  2 18:57:12 2008
+@@ -2825,11 +2825,13 @@
+ 
+ 	if (pin != NULL) {
+ 		xmove_fd(pin[0], 0);
+-		if (pin[1] != 0) close(pin[1]);
++		if (pin[1] != 0)
++			close(pin[1]);
+ 	}
+ 	if (pout != NULL) {
+ 		xmove_fd(pout[1], 1);
+-		if (pout[1] != 1) close(pout[0]);
++		if (pout[1] != 1)
++			close(pout[0]);
+ 	}
+ 
+ 	iopp = t->ioact;
+@@ -4162,7 +4164,7 @@
+ 		return 0;
+ 	}
+ 	if (i != 0) {
+-		waitpid(i, NULL, 0);
++		waitpid(i, NULL, 0); // safe_waitpid?
+ 		global_env.iop->argp->aword = ++cp;
+ 		close(pf[1]);
+ 		PUSHIO(afile, remap(pf[0]),
+@@ -4181,7 +4183,8 @@
+ 	 *  echo "$files" >zz
+ 	 */
+ 	xmove_fd(pf[1], 1);
+-	if (pf[0] != 1) close(pf[0]);
++	if (pf[0] != 1)
++		close(pf[0]);
+ 
+ 	argument_list[0] = (char *) DEFAULT_SHELL;
+ 	argument_list[1] = (char *) "-c";
+@@ -4834,9 +4837,11 @@
+ 		static int position = 0, size = 0;
+ 
+ 		while (size == 0 || position >= size) {
+-			read_line_input(current_prompt, filechar_cmdbuf, BUFSIZ, line_input_state);
+-			size = strlen(filechar_cmdbuf);
++			size = read_line_input(current_prompt, filechar_cmdbuf, BUFSIZ, line_input_state);
++			if (size < 0) /* Error/EOF */
++				exit(0);
+ 			position = 0;
++			/* if Ctrl-C, size == 0 and loop will repeat */
+ 		}
+ 		c = filechar_cmdbuf[position];
+ 		position++;

Added: trunk/buildroot/package/busybox/busybox-1.9.0-stty.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.0-stty.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.0-stty.patch	2008-02-02 21:49:48 UTC (rev 20936)
@@ -0,0 +1,37 @@
+--- busybox-1.9.0/coreutils/stty.c	Fri Dec 21 22:00:29 2007
++++ busybox-1.9.0-stty/coreutils/stty.c	Sat Feb  2 18:55:40 2008
+@@ -780,30 +780,14 @@
+ 
+ static const struct mode_info *find_mode(const char *name)
+ {
+-	int i = 0;
+-	const char *m = mode_name;
+-
+-	while (*m) {
+-		if (strcmp(name, m) == 0)
+-			return &mode_info[i];
+-		m += strlen(m) + 1;
+-		i++;
+-	}
+-	return NULL;
++	int i = index_in_strings(mode_name, name);
++	return i >= 0 ? &mode_info[i] : NULL;
+ }
+ 
+ static const struct control_info *find_control(const char *name)
+ {
+-	int i = 0;
+-	const char *m = mode_name;
+-
+-	while (*m) {
+-		if (strcmp(name, m) == 0)
+-			return &control_info[i];
+-		m += strlen(m) + 1;
+-		i++;
+-	}
+-	return NULL;
++	int i = index_in_strings(control_name, name);
++	return i >= 0 ? &control_info[i] : NULL;
+ }
+ 
+ enum {
