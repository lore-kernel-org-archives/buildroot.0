From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 28 Apr 2008 23:53:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080429065355.CD2433C6A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-28 23:53:55 -0700 (Mon, 28 Apr 2008)
New Revision: 21892

Log:
busybox: 1.10.1 patches


Added:
   trunk/buildroot/package/busybox/busybox-1.10.1-completion.patch
   trunk/buildroot/package/busybox/busybox-1.10.1-ioctl.patch
   trunk/buildroot/package/busybox/busybox-1.10.1-mdev.patch
   trunk/buildroot/package/busybox/busybox-1.10.1-pidof.patch
   trunk/buildroot/package/busybox/busybox-1.10.1-ssd.patch
   trunk/buildroot/package/busybox/busybox-1.10.1-taskset.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.10.1-completion.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-completion.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-completion.patch	2008-04-29 06:53:55 UTC (rev 21892)
@@ -0,0 +1,57 @@
+--- busybox-1.10.1/libbb/lineedit.c	Sat Apr 19 05:50:33 2008
++++ busybox-1.10.1-completion/libbb/lineedit.c	Thu Apr 24 06:45:39 2008
+@@ -518,8 +518,8 @@
+ 
+ 	for (i = 0; i < npaths; i++) {
+ 		dir = opendir(paths[i]);
+-		if (!dir)                       /* Don't print an error */
+-			continue;
++		if (!dir)
++			continue; /* don't print an error */
+ 
+ 		while ((next = readdir(dir)) != NULL) {
+ 			int len1;
+@@ -529,18 +529,21 @@
+ 			if (strncmp(str_found, pfind, strlen(pfind)))
+ 				continue;
+ 			/* not see .name without .match */
+-			if (*str_found == '.' && *pfind == 0) {
++			if (*str_found == '.' && *pfind == '\0') {
+ 				if (NOT_LONE_CHAR(paths[i], '/') || str_found[1])
+ 					continue;
+ 				str_found = ""; /* only "/" */
+ 			}
+ 			found = concat_path_file(paths[i], str_found);
+-			/* hmm, remover in progress? */
+-			if (lstat(found, &st) < 0)
++			/* hmm, remove in progress? */
++			/* NB: stat() first so that we see is it a directory;
++			 * but if that fails, use lstat() so that
++			 * we still match dangling links */
++			if (stat(found, &st) && lstat(found, &st))
+ 				goto cont;
+ 			/* find with dirs? */
+ 			if (paths[i] != dirbuf)
+-				strcpy(found, next->d_name);    /* only name */
++				strcpy(found, next->d_name); /* only name */
+ 
+ 			len1 = strlen(found);
+ 			found = xrealloc(found, len1 + 2);
+@@ -548,7 +551,7 @@
+ 			found[len1+1] = '\0';
+ 
+ 			if (S_ISDIR(st.st_mode)) {
+-				/* name is directory      */
++				/* name is a directory */
+ 				if (found[len1-1] != '/') {
+ 					found[len1] = '/';
+ 				}
+@@ -566,7 +569,7 @@
+ 		closedir(dir);
+ 	}
+ 	if (paths != path1) {
+-		free(paths[0]);                 /* allocated memory only in first member */
++		free(paths[0]); /* allocated memory is only in first member */
+ 		free(paths);
+ 	}
+ #undef dirbuf

Added: trunk/buildroot/package/busybox/busybox-1.10.1-ioctl.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-ioctl.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-ioctl.patch	2008-04-29 06:53:55 UTC (rev 21892)
@@ -0,0 +1,79 @@
+--- busybox-1.10.1/include/libbb.h	Sat Apr 19 05:50:36 2008
++++ busybox-1.10.1-ioctl/include/libbb.h	Thu Apr 24 06:45:03 2008
+@@ -995,16 +995,16 @@
+ /* NB: typically you want to pass fd 0, not 1. Think 'applet | grep something' */
+ int get_terminal_width_height(int fd, int *width, int *height);
+ 
+-int ioctl_or_perror(int fd, int request, void *argp, const char *fmt,...) __attribute__ ((format (printf, 4, 5)));
+-void ioctl_or_perror_and_die(int fd, int request, void *argp, const char *fmt,...) __attribute__ ((format (printf, 4, 5)));
++int ioctl_or_perror(int fd, unsigned request, void *argp, const char *fmt,...) __attribute__ ((format (printf, 4, 5)));
++void ioctl_or_perror_and_die(int fd, unsigned request, void *argp, const char *fmt,...) __attribute__ ((format (printf, 4, 5)));
+ #if ENABLE_IOCTL_HEX2STR_ERROR
+-int bb_ioctl_or_warn(int fd, int request, void *argp, const char *ioctl_name);
+-void bb_xioctl(int fd, int request, void *argp, const char *ioctl_name);
++int bb_ioctl_or_warn(int fd, unsigned request, void *argp, const char *ioctl_name);
++void bb_xioctl(int fd, unsigned request, void *argp, const char *ioctl_name);
+ #define ioctl_or_warn(fd,request,argp) bb_ioctl_or_warn(fd,request,argp,#request)
+ #define xioctl(fd,request,argp)        bb_xioctl(fd,request,argp,#request)
+ #else
+-int bb_ioctl_or_warn(int fd, int request, void *argp);
+-void bb_xioctl(int fd, int request, void *argp);
++int bb_ioctl_or_warn(int fd, unsigned request, void *argp);
++void bb_xioctl(int fd, unsigned request, void *argp);
+ #define ioctl_or_warn(fd,request,argp) bb_ioctl_or_warn(fd,request,argp)
+ #define xioctl(fd,request,argp)        bb_xioctl(fd,request,argp)
+ #endif
+--- busybox-1.10.1/libbb/xfuncs.c	Sat Apr 19 05:50:33 2008
++++ busybox-1.10.1-ioctl/libbb/xfuncs.c	Thu Apr 24 06:45:14 2008
+@@ -704,7 +704,7 @@
+ 	return ret;
+ }
+ 
+-void ioctl_or_perror_and_die(int fd, int request, void *argp, const char *fmt,...)
++void ioctl_or_perror_and_die(int fd, unsigned request, void *argp, const char *fmt,...)
+ {
+ 	va_list p;
+ 
+@@ -717,7 +717,7 @@
+ 	}
+ }
+ 
+-int ioctl_or_perror(int fd, int request, void *argp, const char *fmt,...)
++int ioctl_or_perror(int fd, unsigned request, void *argp, const char *fmt,...)
+ {
+ 	va_list p;
+ 	int ret = ioctl(fd, request, argp);
+@@ -731,7 +731,7 @@
+ }
+ 
+ #if ENABLE_IOCTL_HEX2STR_ERROR
+-int bb_ioctl_or_warn(int fd, int request, void *argp, const char *ioctl_name)
++int bb_ioctl_or_warn(int fd, unsigned request, void *argp, const char *ioctl_name)
+ {
+ 	int ret;
+ 
+@@ -740,13 +740,13 @@
+ 		bb_simple_perror_msg(ioctl_name);
+ 	return ret;
+ }
+-void bb_xioctl(int fd, int request, void *argp, const char *ioctl_name)
++void bb_xioctl(int fd, unsigned request, void *argp, const char *ioctl_name)
+ {
+ 	if (ioctl(fd, request, argp) < 0)
+ 		bb_simple_perror_msg_and_die(ioctl_name);
+ }
+ #else
+-int bb_ioctl_or_warn(int fd, int request, void *argp)
++int bb_ioctl_or_warn(int fd, unsigned request, void *argp)
+ {
+ 	int ret;
+ 
+@@ -755,7 +755,7 @@
+ 		bb_perror_msg("ioctl %#x failed", request);
+ 	return ret;
+ }
+-void bb_xioctl(int fd, int request, void *argp)
++void bb_xioctl(int fd, unsigned request, void *argp)
+ {
+ 	if (ioctl(fd, request, argp) < 0)
+ 		bb_perror_msg_and_die("ioctl %#x failed", request);

Added: trunk/buildroot/package/busybox/busybox-1.10.1-mdev.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-mdev.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-mdev.patch	2008-04-29 06:53:55 UTC (rev 21892)
@@ -0,0 +1,510 @@
+--- busybox-1.10.1/util-linux/mdev.c	Sat Apr 19 05:50:39 2008
++++ busybox-1.10.1-mdev/util-linux/mdev.c	Sat Apr 26 17:15:54 2008
+@@ -12,6 +12,8 @@
+ #include "libbb.h"
+ #include "xregex.h"
+ 
++#define ENABLE_FEATURE_MDEV_RENAME_REGEXP 1
++
+ struct globals {
+ 	int root_major, root_minor;
+ };
+@@ -21,7 +23,21 @@
+ 
+ #define MAX_SYSFS_DEPTH 3 /* prevent infinite loops in /sys symlinks */
+ 
++/* We use additional 64+ bytes in make_device() */
++#define SCRATCH_SIZE 80
++
++static char *next_field(char *s)
++{
++	char *end = skip_non_whitespace(s);
++	s = skip_whitespace(end);
++	*end = '\0';
++	if (*s == '\0')
++		s = NULL;
++	return s;
++}
++
+ /* mknod in /dev based on a path like "/sys/block/hda/hda1" */
++/* NB: "mdev -s" may call us many times, do not leak memory/fds! */
+ static void make_device(char *path, int delete)
+ {
+ 	const char *device_name;
+@@ -29,7 +45,7 @@
+ 	int mode = 0660;
+ 	uid_t uid = 0;
+ 	gid_t gid = 0;
+-	char *temp = path + strlen(path);
++	char *dev_maj_min = path + strlen(path);
+ 	char *command = NULL;
+ 	char *alias = NULL;
+ 
+@@ -42,156 +58,177 @@
+ 	 * also depend on path having writeable space after it.
+ 	 */
+ 	if (!delete) {
+-		strcat(path, "/dev");
+-		len = open_read_close(path, temp + 1, 64);
+-		*temp++ = 0;
++		strcpy(dev_maj_min, "/dev");
++		len = open_read_close(path, dev_maj_min + 1, 64);
++		*dev_maj_min++ = '\0';
+ 		if (len < 1) {
+-			if (ENABLE_FEATURE_MDEV_EXEC)
+-				/* no "dev" file, so just try to run script */
+-				*temp = 0;
+-			else
++			if (!ENABLE_FEATURE_MDEV_EXEC)
+ 				return;
++			/* no "dev" file, so just try to run script */
++			*dev_maj_min = '\0';
+ 		}
+ 	}
+ 
+ 	/* Determine device name, type, major and minor */
+ 	device_name = bb_basename(path);
+-	type = (path[5] == 'c' ? S_IFCHR : S_IFBLK);
++	/* http://kernel.org/doc/pending/hotplug.txt says that only
++	 * "/sys/block/..." is for block devices. "sys/bus" etc is not! */
++	type = (strncmp(&path[5], "block/", 6) == 0 ? S_IFBLK : S_IFCHR);
+ 
+ 	if (ENABLE_FEATURE_MDEV_CONF) {
+ 		FILE *fp;
+-		char *line, *vline;
++		char *line, *val, *next;
+ 		unsigned lineno = 0;
+ 
+-		/* If we have a config file, look up the user settings */
++		/* If we have config file, look up user settings */
+ 		fp = fopen_or_warn("/etc/mdev.conf", "r");
+ 		if (!fp)
+ 			goto end_parse;
+ 
+-		while ((vline = line = xmalloc_getline(fp)) != NULL) {
+-			int field;
++		while ((line = xmalloc_getline(fp)) != NULL) {
++			regmatch_t off[1+9*ENABLE_FEATURE_MDEV_RENAME_REGEXP];
+ 
+-			/* A pristine copy for command execution. */
+-			char *orig_line;
+-			if (ENABLE_FEATURE_MDEV_EXEC)
+-				orig_line = xstrdup(line);
+-
+ 			++lineno;
++			trim(line);
++			if (!line[0])
++				goto next_line;
+ 
+-			/* Three fields: regex, uid:gid, mode */
+-			for (field = 0; field < (3 + ENABLE_FEATURE_MDEV_RENAME + ENABLE_FEATURE_MDEV_EXEC); ++field) {
++			/* Fields: regex uid:gid mode [alias] [cmd] */
+ 
+-				/* Find a non-empty field */
+-				char *val;
+-				do {
+-					val = strtok(vline, " \t");
+-					vline = NULL;
+-				} while (val && !*val);
+-				if (!val) {
+-					if (field)
+-						break;
+-					else
+-						goto next_line;
+-				}
++			/* 1st field: regex to match this device */
++			next = next_field(line);
++			{
++				regex_t match;
++				int result;
+ 
+-				if (field == 0) {
++				/* Is this it? */
++				xregcomp(&match, line, REG_EXTENDED);
++				result = regexec(&match, device_name, ARRAY_SIZE(off), off, 0);
++				regfree(&match);
+ 
+-					/* Regex to match this device */
+-					regex_t match;
+-					regmatch_t off;
+-					int result;
++				//bb_error_msg("matches:");
++				//for (int i = 0; i < ARRAY_SIZE(off); i++) {
++				//	if (off[i].rm_so < 0) continue;
++				//	bb_error_msg("match %d: '%.*s'\n", i,
++				//		(int)(off[i].rm_eo - off[i].rm_so),
++				//		device_name + off[i].rm_so);
++				//}
+ 
+-					/* Is this it? */
+-					xregcomp(&match, val, REG_EXTENDED);
+-					result = regexec(&match, device_name, 1, &off, 0);
+-					regfree(&match);
++				/* If not this device, skip rest of line */
++				/* (regexec returns whole pattern as "range" 0) */
++				if (result || off[0].rm_so || off[0].rm_eo != strlen(device_name))
++					goto next_line;
++			}
+ 
+-					/* If not this device, skip rest of line */
+-					if (result || off.rm_so || off.rm_eo != strlen(device_name))
+-						goto next_line;
++			/* This line matches: stop parsing the file
++			 * after parsing the rest of fields */
+ 
+-				} else if (field == 1) {
++			/* 2nd field: uid:gid - device ownership */
++			if (!next) /* field must exist */
++				bb_error_msg_and_die("bad line %u", lineno);
++			val = next;
++			next = next_field(val);
++			{
++				struct passwd *pass;
++				struct group *grp;
++				char *str_uid = val;
++				char *str_gid = strchrnul(val, ':');
+ 
+-					/* uid:gid device ownership */
+-					struct passwd *pass;
+-					struct group *grp;
++				if (*str_gid)
++					*str_gid++ = '\0';
++				/* Parse UID */
++				pass = getpwnam(str_uid);
++				if (pass)
++					uid = pass->pw_uid;
++				else
++					uid = strtoul(str_uid, NULL, 10);
++				/* Parse GID */
++				grp = getgrnam(str_gid);
++				if (grp)
++					gid = grp->gr_gid;
++				else
++					gid = strtoul(str_gid, NULL, 10);
++			}
+ 
+-					char *str_uid = val;
+-					char *str_gid = strchr(val, ':');
+-					if (str_gid)
+-						*str_gid = '\0', ++str_gid;
++			/* 3rd field: mode - device permissions */
++			if (!next) /* field must exist */
++				bb_error_msg_and_die("bad line %u", lineno);
++			val = next;
++			next = next_field(val);
++			mode = strtoul(val, NULL, 8);
+ 
+-					/* Parse UID */
+-					pass = getpwnam(str_uid);
+-					if (pass)
+-						uid = pass->pw_uid;
+-					else
+-						uid = strtoul(str_uid, NULL, 10);
++			/* 4th field (opt): >alias */
++			if (ENABLE_FEATURE_MDEV_RENAME) {
++				if (!next)
++					break;
++				val = next;
++				next = next_field(val);
++				if (*val == '>') {
++#if ENABLE_FEATURE_MDEV_RENAME_REGEXP
++					/* substitute %1..9 with off[1..9], if any */
++					char *s, *p;
++					unsigned i, n;
+ 
+-					/* parse GID */
+-					grp = getgrnam(str_gid);
+-					if (grp)
+-						gid = grp->gr_gid;
+-					else
+-						gid = strtoul(str_gid, NULL, 10);
++					n = 0;
++					s = val;
++					while (*s && *s++ == '%')
++						n++;
+ 
+-				} else if (field == 2) {
+-
+-					/* Mode device permissions */
+-					mode = strtoul(val, NULL, 8);
+-
+-				} else if (ENABLE_FEATURE_MDEV_RENAME && field == 3) {
+-
+-					if (*val != '>')
+-						++field;
+-					else
+-						alias = xstrdup(val + 1);
+-
++					p = alias = xzalloc(strlen(val) + n * strlen(device_name));
++					s = val + 1;
++					while (*s) {
++						*p = *s;
++						if ('%' == *s) {
++							i = (s[1] - '0');
++							if (i <= 9 && off[i].rm_so >= 0) {
++								n = off[i].rm_eo - off[i].rm_so;
++								strncpy(p, device_name + off[i].rm_so, n);
++								p += n - 1;
++								s++;
++							}
++						}
++						p++;
++						s++;
++					}
++#else
++					alias = xstrdup(val + 1);
++#endif
+ 				}
++			}
+ 
+-				if (ENABLE_FEATURE_MDEV_EXEC && field == 3 + ENABLE_FEATURE_MDEV_RENAME) {
++			/* The rest (opt): command to run */
++			if (!next)
++				break;
++			val = next;
++			if (ENABLE_FEATURE_MDEV_EXEC) {
++				const char *s = "@$*";
++				const char *s2 = strchr(s, *val);
+ 
+-					/* Optional command to run */
+-					const char *s = "@$*";
+-					const char *s2 = strchr(s, *val);
++				if (!s2)
++					bb_error_msg_and_die("bad line %u", lineno);
+ 
+-					if (!s2) {
+-						/* Force error */
+-						field = 1;
+-						break;
+-					}
+-
+-					/* Correlate the position in the "@$*" with the delete
+-					 * step so that we get the proper behavior.
+-					 */
+-					if ((s2 - s + 1) & (1 << delete))
+-						command = xstrdup(orig_line + (val + 1 - line));
++				/* Correlate the position in the "@$*" with the delete
++				 * step so that we get the proper behavior:
++				 * @cmd: run on create
++				 * $cmd: run on delete
++				 * *cmd: run on both
++				 */
++				if ((s2 - s + 1) /*1/2/3*/ & /*1/2*/ (1 + delete)) {
++					command = xstrdup(val + 1);
+ 				}
+ 			}
+-
+-			/* Did everything parse happily? */
+-			if (field <= 2)
+-				bb_error_msg_and_die("bad line %u", lineno);
+-
++			/* end of field parsing */
++			break; /* we found matching line, stop */
+  next_line:
+ 			free(line);
+-			if (ENABLE_FEATURE_MDEV_EXEC)
+-				free(orig_line);
+-		}
++		} /* end of "while line is read from /etc/mdev.conf" */
+ 
+-		if (ENABLE_FEATURE_CLEAN_UP)
+-			fclose(fp);
+-
+- end_parse:	/* nothing */ ;
++		free(line); /* in case we used "break" to get here */
++		fclose(fp);
+ 	}
++ end_parse:
+ 
+-	if (!delete) {
+-		if (sscanf(temp, "%d:%d", &major, &minor) != 2) {
+-			if (ENABLE_FEATURE_MDEV_EXEC)
+-				goto skip_creation;
+-			else
+-				return;
+-		}
++	if (!delete && sscanf(dev_maj_min, "%u:%u", &major, &minor) == 2) {
+ 
+ 		if (ENABLE_FEATURE_MDEV_RENAME)
+ 			unlink(device_name);
+@@ -208,39 +245,44 @@
+ 			if (ENABLE_FEATURE_MDEV_RENAME && alias) {
+ 				char *dest;
+ 
+-				temp = strrchr(alias, '/');
+-				if (temp) {
+-					if (temp[1] != '\0')
+-						/* given a file name, so rename it */
+-						*temp = '\0';
++				/* ">bar/": rename to bar/device_name */
++				/* ">bar[/]baz": rename to bar[/]baz */
++				dest = strrchr(alias, '/');
++				if (dest) { /* ">bar/[baz]" ? */
++					*dest = '\0'; /* mkdir bar */
+ 					bb_make_directory(alias, 0755, FILEUTILS_RECUR);
+-					dest = concat_path_file(alias, device_name);
+-				} else
+-					dest = alias;
++					*dest = '/';
++					if (dest[1] == '\0') { /* ">bar/" => ">bar/device_name" */
++						dest = alias;
++						alias = concat_path_file(alias, device_name);
++						free(dest);
++					}
++				}
+ 
+-				rename(device_name, dest); // TODO: xrename?
+-				symlink(dest, device_name);
++				/* recreate device_name as a symlink to moved device node */
++				if (rename(device_name, alias) == 0) {
++					symlink(alias, device_name);
++				}
+ 
+-				if (alias != dest)
+-					free(alias);
+-				free(dest);
++				free(alias);
+ 			}
+ 		}
+- skip_creation: /* nothing */ ;
+ 	}
++
+ 	if (ENABLE_FEATURE_MDEV_EXEC && command) {
+-		/* setenv will leak memory, so use putenv */
++		/* setenv will leak memory, use putenv/unsetenv/free */
+ 		char *s = xasprintf("MDEV=%s", device_name);
+ 		putenv(s);
+ 		if (system(command) == -1)
+-			bb_perror_msg_and_die("cannot run %s", command);
++			bb_perror_msg_and_die("can't run '%s'", command);
+ 		s[4] = '\0';
+ 		unsetenv(s);
+ 		free(s);
+ 		free(command);
+ 	}
++
+ 	if (delete)
+-		remove_file(device_name, FILEUTILS_FORCE);
++		unlink(device_name);
+ }
+ 
+ /* File callback for /sys/ traversal */
+@@ -249,14 +291,15 @@
+                       void *userData,
+                       int depth ATTRIBUTE_UNUSED)
+ {
+-	size_t len = strlen(fileName) - 4;
++	size_t len = strlen(fileName) - 4; /* can't underflow */
+ 	char *scratch = userData;
+ 
+-	if (strcmp(fileName + len, "/dev"))
++	/* len check is for paranoid reasons */
++	if (strcmp(fileName + len, "/dev") || len >= PATH_MAX)
+ 		return FALSE;
+ 
+ 	strcpy(scratch, fileName);
+-	scratch[len] = 0;
++	scratch[len] = '\0';
+ 	make_device(scratch, 0);
+ 
+ 	return TRUE;
+@@ -287,12 +330,6 @@
+ 	int cnt;
+ 	int firmware_fd, loading_fd, data_fd;
+ 
+-	/* check for $FIRMWARE from kernel */
+-	/* XXX: dont bother: open(NULL) works same as open("no-such-file")
+-	 * if (!firmware)
+-	 *	return;
+-	 */
+-
+ 	/* check for /lib/firmware/$FIRMWARE */
+ 	xchdir("/lib/firmware");
+ 	firmware_fd = xopen(firmware, O_RDONLY);
+@@ -304,16 +341,15 @@
+ 	xchdir(sysfs_path);
+ 	for (cnt = 0; cnt < 30; ++cnt) {
+ 		loading_fd = open("loading", O_WRONLY);
+-		if (loading_fd == -1)
+-			sleep(1);
+-		else
+-			break;
++		if (loading_fd != -1)
++			goto loading;
++		sleep(1);
+ 	}
+-	if (loading_fd == -1)
+-		goto out;
++	goto out;
+ 
++ loading:
+ 	/* tell kernel we're loading by `echo 1 > /sys/$DEVPATH/loading` */
+-	if (write(loading_fd, "1", 1) != 1)
++	if (full_write(loading_fd, "1", 1) != 1)
+ 		goto out;
+ 
+ 	/* load firmware by `cat /lib/firmware/$FIRMWARE > /sys/$DEVPATH/data */
+@@ -324,9 +360,9 @@
+ 
+ 	/* tell kernel result by `echo [0|-1] > /sys/$DEVPATH/loading` */
+ 	if (cnt > 0)
+-		write(loading_fd, "0", 1);
++		full_write(loading_fd, "0", 1);
+ 	else
+-		write(loading_fd, "-1", 2);
++		full_write(loading_fd, "-1", 2);
+ 
+  out:
+ 	if (ENABLE_FEATURE_CLEAN_UP) {
+@@ -341,16 +377,14 @@
+ {
+ 	char *action;
+ 	char *env_path;
+-	RESERVE_CONFIG_BUFFER(temp,PATH_MAX);
++	RESERVE_CONFIG_BUFFER(temp, PATH_MAX + SCRATCH_SIZE);
+ 
+ 	xchdir("/dev");
+ 
+-	if (argc == 2 && !strcmp(argv[1],"-s")) {
+-
++	if (argc == 2 && !strcmp(argv[1], "-s")) {
+ 		/* Scan:
+ 		 * mdev -s
+ 		 */
+-
+ 		struct stat st;
+ 
+ 		xstat("/", &st);
+@@ -366,26 +400,27 @@
+ 			fileAction, dirAction, temp, 0);
+ 
+ 	} else {
+-
+ 		/* Hotplug:
+ 		 * env ACTION=... DEVPATH=... mdev
+ 		 * ACTION can be "add" or "remove"
+ 		 * DEVPATH is like "/block/sda" or "/class/input/mice"
+ 		 */
+-
+ 		action = getenv("ACTION");
+ 		env_path = getenv("DEVPATH");
+ 		if (!action || !env_path)
+ 			bb_show_usage();
+ 
+-		sprintf(temp, "/sys%s", env_path);
++		snprintf(temp, PATH_MAX, "/sys%s", env_path);
+ 		if (!strcmp(action, "remove"))
+ 			make_device(temp, 1);
+ 		else if (!strcmp(action, "add")) {
+ 			make_device(temp, 0);
+ 
+-			if (ENABLE_FEATURE_MDEV_LOAD_FIRMWARE)
+-				load_firmware(getenv("FIRMWARE"), temp);
++			if (ENABLE_FEATURE_MDEV_LOAD_FIRMWARE) {
++				char *fw = getenv("FIRMWARE");
++				if (fw)
++					load_firmware(fw, temp);
++			}
+ 		}
+ 	}
+ 

Added: trunk/buildroot/package/busybox/busybox-1.10.1-pidof.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-pidof.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-pidof.patch	2008-04-29 06:53:55 UTC (rev 21892)
@@ -0,0 +1,11 @@
+--- busybox-1.10.1/libbb/procps.c	Sat Apr 19 05:50:33 2008
++++ busybox-1.10.1-pidof/libbb/procps.c	Sat Apr 26 01:18:32 2008
+@@ -258,7 +258,7 @@
+ 				&sp->start_time,
+ 				&vsz,
+ 				&rss);
+-			if (n != 10)
++			if (n != 11)
+ 				break;
+ 			/* vsz is in bytes and we want kb */
+ 			sp->vsz = vsz >> 10;

Added: trunk/buildroot/package/busybox/busybox-1.10.1-ssd.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-ssd.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-ssd.patch	2008-04-29 06:53:55 UTC (rev 21892)
@@ -0,0 +1,187 @@
+--- busybox-1.10.1/debianutils/start_stop_daemon.c	Sat Apr 19 05:50:30 2008
++++ busybox-1.10.1-ssd/debianutils/start_stop_daemon.c	Tue Apr 22 03:13:13 2008
+@@ -11,7 +11,6 @@
+ /* NB: we have a problem here with /proc/NN/exe usage, similar to
+  * one fixed in killall/pidof */
+ 
+-#include <getopt.h>
+ #include <sys/resource.h>
+ 
+ /* Override ENABLE_FEATURE_PIDFILE */
+@@ -33,6 +32,7 @@
+ 	int user_id;
+ 	smallint quiet;
+ 	smallint signal_nr;
++	struct stat execstat;
+ };
+ #define G (*(struct globals*)&bb_common_bufsiz1)
+ #define found             (G.found               )
+@@ -43,6 +43,7 @@
+ #define user_id           (G.user_id             )
+ #define quiet             (G.quiet               )
+ #define signal_nr         (G.signal_nr           )
++#define execstat          (G.execstat            )
+ #define INIT_G() \
+         do { \
+ 		user_id = -1; \
+@@ -50,25 +51,21 @@
+         } while (0)
+ 
+ 
+-static int pid_is_exec(pid_t pid, const char *name)
++static int pid_is_exec(pid_t pid)
+ {
++	struct stat st;
+ 	char buf[sizeof("/proc//exe") + sizeof(int)*3];
+-	char *execbuf;
+-	int n;
+ 
+ 	sprintf(buf, "/proc/%u/exe", pid);
+-	n = strlen(name) + 1;
+-	execbuf = xzalloc(n + 1);
+-	readlink(buf, execbuf, n);
+-	/* if readlink fails because link target is longer than strlen(name),
+-	 * execbuf still contains "", and strcmp will return !0. */
+-	n = strcmp(execbuf, name);
+-	if (ENABLE_FEATURE_CLEAN_UP)
+-		free(execbuf);
+-	return !n; /* nonzero (true) if execbuf == name */
++	if (stat(buf, &st) < 0)
++		return 0;
++	if (st.st_dev == execstat.st_dev
++	 && st.st_ino == execstat.st_ino)
++		return 1;
++	return 0;
+ }
+ 
+-static int pid_is_user(int pid, int uid)
++static int pid_is_user(int pid)
+ {
+ 	struct stat sb;
+ 	char buf[sizeof("/proc/") + sizeof(int)*3];
+@@ -76,42 +73,39 @@
+ 	sprintf(buf, "/proc/%u", pid);
+ 	if (stat(buf, &sb) != 0)
+ 		return 0;
+-	return (sb.st_uid == uid);
++	return (sb.st_uid == user_id);
+ }
+ 
+-static int pid_is_cmd(pid_t pid, const char *name)
++static int pid_is_cmd(pid_t pid)
+ {
+-	char fname[sizeof("/proc//stat") + sizeof(int)*3];
+-	char *buf;
+-	int r = 0;
++	char buf[256]; /* is it big enough? */
++	char *p, *pe;
+ 
+-	sprintf(fname, "/proc/%u/stat", pid);
+-	buf = xmalloc_open_read_close(fname, NULL);
+-	if (buf) {
+-		char *p = strchr(buf, '(');
+-		if (p) {
+-			char *pe = strrchr(++p, ')');
+-			if (pe) {
+-				*pe = '\0';
+-				r = !strcmp(p, name);
+-			}
+-		}
+-		free(buf);
+-	}
+-	return r;
++	sprintf(buf, "/proc/%u/stat", pid);
++	if (open_read_close(buf, buf, sizeof(buf) - 1) < 0)
++		return 0;
++	buf[sizeof(buf) - 1] = '\0'; /* paranoia */
++	p = strchr(buf, '(');
++	if (!p)
++		return 0;
++	pe = strrchr(++p, ')');
++	if (!pe)
++		return 0;
++	*pe = '\0';
++	return !strcmp(p, cmdname);
+ }
+ 
+ static void check(int pid)
+ {
+ 	struct pid_list *p;
+ 
+-	if (execname && !pid_is_exec(pid, execname)) {
++	if (execname && !pid_is_exec(pid)) {
+ 		return;
+ 	}
+-	if (userspec && !pid_is_user(pid, user_id)) {
++	if (userspec && !pid_is_user(pid)) {
+ 		return;
+ 	}
+-	if (cmdname && !pid_is_cmd(pid, cmdname)) {
++	if (cmdname && !pid_is_cmd(pid)) {
+ 		return;
+ 	}
+ 	p = xmalloc(sizeof(*p));
+@@ -148,9 +142,16 @@
+ 	procdir = xopendir("/proc");
+ 
+ 	pid = 0;
+-	while ((entry = readdir(procdir)) != NULL) {
++	while(1) {
++		errno = 0; /* clear any previous error */
++		entry = readdir(procdir);
++// TODO: check for exact errno(s) which mean that we got stale entry
++		if (errno) /* Stale entry, process has died after opendir */
++			continue;
++		if (!entry) /* EOF, no more entries */
++			break;
+ 		pid = bb_strtou(entry->d_name, NULL, 10);
+-		if (errno)
++		if (errno) /* NaN */
+ 			continue;
+ 		check(pid);
+ 	}
+@@ -165,8 +166,6 @@
+ 	struct pid_list *p;
+ 	int killed = 0;
+ 
+-	do_procinit();
+-
+ 	if (cmdname) {
+ 		if (ENABLE_FEATURE_CLEAN_UP) what = xstrdup(cmdname);
+ 		if (!ENABLE_FEATURE_CLEAN_UP) what = cmdname;
+@@ -251,7 +250,7 @@
+ };
+ 
+ int start_stop_daemon_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+-int start_stop_daemon_main(int argc, char **argv)
++int start_stop_daemon_main(int argc ATTRIBUTE_UNUSED, char **argv)
+ {
+ 	unsigned opt;
+ 	char *signame;
+@@ -293,7 +292,7 @@
+ //		if (retry_arg)
+ //			retries = xatoi_u(retry_arg);
+ //	)
+-	argc -= optind;
++	//argc -= optind;
+ 	argv += optind;
+ 
+ 	if (userspec) {
+@@ -301,13 +300,15 @@
+ 		if (errno)
+ 			user_id = xuname2uid(userspec);
+ 	}
++	if (execname)
++		xstat(execname, &execstat);
+ 
++	do_procinit(); /* Both start and stop needs to know current processes */
++
+ 	if (opt & CTX_STOP) {
+ 		int i = do_stop();
+ 		return (opt & OPT_OKNODO) ? 0 : (i <= 0);
+ 	}
+-
+-	do_procinit();
+ 
+ 	if (found) {
+ 		if (!quiet)

Added: trunk/buildroot/package/busybox/busybox-1.10.1-taskset.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.1-taskset.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.1-taskset.patch	2008-04-29 06:53:55 UTC (rev 21892)
@@ -0,0 +1,14 @@
+--- busybox-1.10.1/miscutils/taskset.c	Sat Apr 19 06:03:13 2008
++++ busybox-1.10.1-taskset/miscutils/taskset.c	Fri Apr 25 18:58:53 2008
+@@ -94,8 +94,10 @@
+ 		unsigned i;
+ 		/* Do not allow zero mask: */
+ 		unsigned long long m = xstrtoull_range(aff, 0, 1, ULLONG_MAX);
++		enum { CNT_BIT = CPU_SETSIZE < sizeof(m)*8 ? CPU_SETSIZE : sizeof(m)*8 };
++
+ 		CPU_ZERO(&mask);
+-		for (i = 0; i < CPU_SETSIZE; i++) {
++		for (i = 0; i < CNT_BIT; i++) {
+ 			unsigned long long bit = (1ULL << i);
+ 			if (bit & m)
+ 				CPU_SET(i, &mask);
