From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] host-mkpasswd: new package
Message-ID: <20130831213336.D6F1E9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59e0692095078ec94d85f58e90aee981b5225306
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the addition of root password setting support in buildroot, there have
been a few bug reports in this area ([1], [2]). In these cases, the system
mkpasswd did either not work, or did not provide the options we expect, like
-m <method>.

This patch adds a mkpasswd host package, based on the sources from whois. When
a non-empty root password is set, this package is used as a dependency.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

[1] http://lists.busybox.net/pipermail/buildroot/2013-July/075771.html
[2] http://lists.busybox.net/pipermail/buildroot/2013-July/075869.html

[Thomas P: use $(INSTALL) instead of install, put -lcrypt at the end
of build command line to allow gcc to find the crypt() function in
lcrypt.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mkpasswd/config.h            |   95 +++++++
 package/mkpasswd/mkpasswd.c          |  456 ++++++++++++++++++++++++++++++++++
 package/mkpasswd/mkpasswd.mk         |   25 ++
 package/mkpasswd/utils.c             |   96 +++++++
 package/mkpasswd/utils.h             |   56 ++++
 support/dependencies/dependencies.sh |    8 -
 system/system.mk                     |   10 +-
 7 files changed, 734 insertions(+), 12 deletions(-)

diff --git a/package/mkpasswd/config.h b/package/mkpasswd/config.h
new file mode 100644
index 0000000..f345074
--- /dev/null
+++ b/package/mkpasswd/config.h
@@ -0,0 +1,95 @@
+/* Program version */
+#define VERSION "5.0.26"
+
+/* Configurable features */
+
+/* Always hide legal disclaimers */
+#undef ALWAYS_HIDE_DISCL
+
+/* Default server */
+#define DEFAULTSERVER   "whois.arin.net"
+
+/* Configuration file */
+/*
+#define CONFIG_FILE "/etc/whois.conf"
+*/
+
+
+/* autoconf in cpp macros */
+#ifdef linux
+# define ENABLE_NLS
+#endif
+
+#ifdef __FreeBSD__
+/* which versions? */
+# define HAVE_GETOPT_LONG
+# define HAVE_GETADDRINFO
+# define ENABLE_NLS
+# ifndef LOCALEDIR
+#  define LOCALEDIR "/usr/local/share/locale"
+# endif
+#endif
+
+/* needs unistd.h */
+#if defined _POSIX_C_SOURCE && _POSIX_C_SOURCE >= 200112L
+# define HAVE_GETADDRINFO
+# define HAVE_REGEXEC
+#endif
+
+#if defined __APPLE__ && defined __MACH__
+# define HAVE_GETOPT_LONG
+# define HAVE_GETADDRINFO
+#endif
+
+#if defined __GLIBC__
+# define HAVE_GETOPT_LONG
+# if __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1
+#  define HAVE_GETADDRINFO
+# endif
+# if __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 7
+#  define HAVE_SHA_CRYPT
+# endif
+#endif
+
+/* Unknown versions of Solaris */
+#if defined __SVR4 && defined __sun
+# define HAVE_SHA_CRYPT
+# define HAVE_SOLARIS_CRYPT_GENSALT
+#endif
+
+/* FIXME: which systems lack this? */
+#define HAVE_GETTIMEOFDAY
+/* FIXME: disabled because it does not parse addresses with a netmask length.
+ * The code using it needs to be either fixed or removed.
+#define HAVE_INET_PTON
+*/
+
+/*
+ * Please send patches to correctly ignore old releases which lack a RNG
+ * and add more systems which have one.
+ */
+#ifdef RANDOM_DEVICE
+#elif defined __GLIBC__ \
+	|| defined __FreeBSD__ || defined __NetBSD__ || defined __OpenBSD__ \
+	/* AIX >= 5.2? */ \
+	|| defined _AIX52 \
+	/* HP-UX >= B.11.11.09? */ \
+	|| defined  __hpux \
+	/* OS X: */ \
+	|| (defined __APPLE__ && defined __MACH__) \
+	/* Solaris >= 9 (this is >= 7): */ \
+	|| (defined __SVR4 && defined __sun && defined SUSv2) \
+	/* Tru64 UNIX >= 5.1B? */ \
+	|| defined __osf
+# define RANDOM_DEVICE "/dev/urandom"
+#endif
+
+#ifdef ENABLE_NLS
+# ifndef NLS_CAT_NAME
+#  define NLS_CAT_NAME   "whois"
+# endif
+# ifndef LOCALEDIR
+#  define LOCALEDIR     "/usr/share/locale"
+# endif
+#endif
+
diff --git a/package/mkpasswd/mkpasswd.c b/package/mkpasswd/mkpasswd.c
new file mode 100644
index 0000000..5820f32
--- /dev/null
+++ b/package/mkpasswd/mkpasswd.c
@@ -0,0 +1,456 @@
+/*
+ * Copyright (C) 2001-2008  Marco d'Itri
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+/* for crypt, snprintf and strcasecmp */
+#define _XOPEN_SOURCE
+#define _BSD_SOURCE
+
+/* System library */
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include "config.h"
+#ifdef HAVE_GETOPT_LONG
+#include <getopt.h>
+#endif
+#include <fcntl.h>
+#include <string.h>
+#include <time.h>
+#include <sys/types.h>
+#ifdef HAVE_XCRYPT
+#include <xcrypt.h>
+#include <sys/stat.h>
+#endif
+#ifdef HAVE_LINUX_CRYPT_GENSALT
+#define _OW_SOURCE
+#include <crypt.h>
+#endif
+#ifdef HAVE_GETTIMEOFDAY
+#include <sys/time.h>
+#endif
+
+/* Application-specific */
+#include "utils.h"
+
+/* Global variables */
+#ifdef HAVE_GETOPT_LONG
+static const struct option longopts[] = {
+    {"method",		optional_argument,	NULL, 'm'},
+    /* for backward compatibility with versions < 4.7.25 (< 20080321): */
+    {"hash",		optional_argument,	NULL, 'H'},
+    {"help",		no_argument,		NULL, 'h'},
+    {"password-fd",	required_argument,	NULL, 'P'},
+    {"stdin",		no_argument,		NULL, 's'},
+    {"salt",		required_argument,	NULL, 'S'},
+    {"rounds",		required_argument,	NULL, 'R'},
+    {"version",		no_argument,		NULL, 'V'},
+    {NULL,		0,			NULL, 0  }
+};
+#else
+extern char *optarg;
+extern int optind;
+#endif
+
+static const char valid_salts[] = "abcdefghijklmnopqrstuvwxyz"
+"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789./";
+
+struct crypt_method {
+    const char *method;		/* short name used by the command line option */
+    const char *prefix;		/* salt prefix */
+    const unsigned int minlen;	/* minimum salt length */
+    const unsigned int maxlen;	/* maximum salt length */
+    const unsigned int rounds;	/* supports a variable number of rounds */
+    const char *desc;		/* long description for the methods list */
+};
+
+static const struct crypt_method methods[] = {
+    /* method		prefix	minlen,	maxlen	rounds description */
+    { "des",		"",	2,	2,	0,
+	N_("standard 56 bit DES-based crypt(3)") },
+    { "md5",		"$1$",	8,	8,	0, "MD5" },
+#if defined OpenBSD || defined FreeBSD || (defined __SVR4 && defined __sun)
+    { "bf",		"$2a$", 22,	22,	1, "Blowfish" },
+#endif
+#if defined HAVE_LINUX_CRYPT_GENSALT
+    { "bf",		"$2a$", 22,	22,	1, "Blowfish, system-specific on 8-bit chars" },
+    /* algorithm 2y fixes CVE-2011-2483 */
+    { "bfy",		"$2y$", 22,	22,	1, "Blowfish, correct handling of 8-bit chars" },
+#endif
+#if defined FreeBSD
+    { "nt",		"$3$",  0,	0,	0, "NT-Hash" },
+#endif
+#if defined HAVE_SHA_CRYPT
+    /* http://people.redhat.com/drepper/SHA-crypt.txt */
+    { "sha-256",	"$5$",	8,	16,	1, "SHA-256" },
+    { "sha-512",	"$6$",	8,	16,	1, "SHA-512" },
+#endif
+    /* http://www.crypticide.com/dropsafe/article/1389 */
+    /*
+     * Actually the maximum salt length is arbitrary, but Solaris by default
+     * always uses 8 characters:
+     * http://cvs.opensolaris.org/source/xref/onnv/onnv-gate/ \
+     *   usr/src/lib/crypt_modules/sunmd5/sunmd5.c#crypt_gensalt_impl
+     */
+#if defined __SVR4 && defined __sun
+    { "sunmd5",		"$md5$", 8,	8,	1, "SunMD5" },
+#endif
+    { NULL,		NULL,	0,	0,	0, NULL }
+};
+
+void generate_salt(char *const buf, const unsigned int len);
+void *get_random_bytes(const int len);
+void display_help(int error);
+void display_version(void);
+void display_methods(void);
+
+int main(int argc, char *argv[])
+{
+    int ch, i;
+    int password_fd = -1;
+    unsigned int salt_minlen = 0;
+    unsigned int salt_maxlen = 0;
+    unsigned int rounds_support = 0;
+    const char *salt_prefix = NULL;
+    const char *salt_arg = NULL;
+    unsigned int rounds = 0;
+    char *salt = NULL;
+    char rounds_str[30];
+    char *password = NULL;
+
+#ifdef ENABLE_NLS
+    setlocale(LC_ALL, "");
+    bindtextdomain(NLS_CAT_NAME, LOCALEDIR);
+    textdomain(NLS_CAT_NAME);
+#endif
+
+    /* prepend options from environment */
+    argv = merge_args(getenv("MKPASSWD_OPTIONS"), argv, &argc);
+
+    while ((ch = GETOPT_LONGISH(argc, argv, "hH:m:5P:R:sS:V", longopts, 0))
+	    > 0) {
+	switch (ch) {
+	case '5':
+	    optarg = (char *) "md5";
+	    /* fall through */
+	case 'm':
+	case 'H':
+	    if (!optarg || strcaseeq("help", optarg)) {
+		display_methods();
+		exit(0);
+	    }
+	    for (i = 0; methods[i].method != NULL; i++)
+		if (strcaseeq(methods[i].method, optarg)) {
+		    salt_prefix = methods[i].prefix;
+		    salt_minlen = methods[i].minlen;
+		    salt_maxlen = methods[i].maxlen;
+		    rounds_support = methods[i].rounds;
+		    break;
+		}
+	    if (!salt_prefix) {
+		fprintf(stderr, _("Invalid method '%s'.\n"), optarg);
+		exit(1);
+	    }
+	    break;
+	case 'P':
+	    {
+		char *p;
+		password_fd = strtol(optarg, &p, 10);
+		if (p == NULL || *p != '\0' || password_fd < 0) {
+		    fprintf(stderr, _("Invalid number '%s'.\n"), optarg);
+		    exit(1);
+		}
+	    }
+	    break;
+	case 'R':
+	    {
+		char *p;
+		rounds = strtol(optarg, &p, 10);
+		if (p == NULL || *p != '\0' || rounds < 0) {
+		    fprintf(stderr, _("Invalid number '%s'.\n"), optarg);
+		    exit(1);
+		}
+	    }
+	    break;
+	case 's':
+	    password_fd = 0;
+	    break;
+	case 'S':
+	    salt_arg = optarg;
+	    break;
+	case 'V':
+	    display_version();
+	    exit(0);
+	case 'h':
+	    display_help(EXIT_SUCCESS);
+	default:
+	    fprintf(stderr, _("Try '%s --help' for more information.\n"),
+		    argv[0]);
+	    exit(1);
+	}
+    }
+    argc -= optind;
+    argv += optind;
+
+    if (argc == 2 && !salt_arg) {
+	password = argv[0];
+	salt_arg = argv[1];
+    } else if (argc == 1) {
+	password = argv[0];
+    } else if (argc == 0) {
+    } else {
+	display_help(EXIT_FAILURE);
+    }
+
+    /* default: DES password */
+    if (!salt_prefix) {
+	salt_minlen = methods[0].minlen;
+	salt_maxlen = methods[0].maxlen;
+	salt_prefix = methods[0].prefix;
+    }
+
+    if (streq(salt_prefix, "$2a$") || streq(salt_prefix, "$2y$")) {
+	/* OpenBSD Blowfish and derivatives */
+	if (rounds <= 5)
+	    rounds = 5;
+	/* actually for 2a/2y it is the logarithm of the number of rounds */
+	snprintf(rounds_str, sizeof(rounds_str), "%02u$", rounds);
+    } else if (rounds_support && rounds)
+	snprintf(rounds_str, sizeof(rounds_str), "rounds=%u$", rounds);
+    else
+	rounds_str[0] = '\0';
+
+    if (salt_arg) {
+	unsigned int c = strlen(salt_arg);
+	if (c < salt_minlen || c > salt_maxlen) {
+	    if (salt_minlen == salt_maxlen)
+		fprintf(stderr, ngettext(
+			"Wrong salt length: %d byte when %d expected.\n",
+			"Wrong salt length: %d bytes when %d expected.\n", c),
+			c, salt_maxlen);
+	    else
+		fprintf(stderr, ngettext(
+			"Wrong salt length: %d byte when %d <= n <= %d"
+			" expected.\n",
+			"Wrong salt length: %d bytes when %d <= n <= %d"
+			" expected.\n", c),
+			c, salt_minlen, salt_maxlen);
+	    exit(1);
+	}
+	while (c-- > 0) {
+	    if (strchr(valid_salts, salt_arg[c]) == NULL) {
+		fprintf(stderr, _("Illegal salt character '%c'.\n"),
+			salt_arg[c]);
+		exit(1);
+	    }
+	}
+
+	salt = NOFAIL(malloc(strlen(salt_prefix) + strlen(rounds_str)
+		+ strlen(salt_arg) + 1));
+	*salt = '\0';
+	strcat(salt, salt_prefix);
+	strcat(salt, rounds_str);
+	strcat(salt, salt_arg);
+    } else {
+#ifdef HAVE_SOLARIS_CRYPT_GENSALT
+#error "This code path is untested on Solaris. Please send a patch."
+	salt = crypt_gensalt(salt_prefix, NULL);
+	if (!salt)
+		perror(stderr, "crypt_gensalt");
+#elif defined HAVE_LINUX_CRYPT_GENSALT
+	void *entropy = get_random_bytes(64);
+
+	salt = crypt_gensalt(salt_prefix, rounds, entropy, 64);
+	if (!salt) {
+		fprintf(stderr, "crypt_gensalt failed.\n");
+		exit(2);
+	}
+	free(entropy);
+#else
+	unsigned int salt_len = salt_maxlen;
+
+	if (salt_minlen != salt_maxlen) { /* salt length can vary */
+	    srand(time(NULL) + getpid());
+	    salt_len = rand() % (salt_maxlen - salt_minlen + 1) + salt_minlen;
+	}
+
+	salt = NOFAIL(malloc(strlen(salt_prefix) + strlen(rounds_str)
+		+ salt_len + 1));
+	*salt = '\0';
+	strcat(salt, salt_prefix);
+	strcat(salt, rounds_str);
+	generate_salt(salt + strlen(salt), salt_len);
+#endif
+    }
+
+    if (password) {
+    } else if (password_fd != -1) {
+	FILE *fp;
+	char *p;
+
+	if (isatty(password_fd))
+	    fprintf(stderr, _("Password: "));
+	password = NOFAIL(malloc(128));
+	fp = fdopen(password_fd, "r");
+	if (!fp) {
+	    perror("fdopen");
+	    exit(2);
+	}
+	if (!fgets(password, 128, fp)) {
+	    perror("fgets");
+	    exit(2);
+	}
+
+	p = strpbrk(password, "\n\r");
+	if (p)
+	    *p = '\0';
+    } else {
+	password = getpass(_("Password: "));
+	if (!password) {
+	    perror("getpass");
+	    exit(2);
+	}
+    }
+
+    {
+	const char *result;
+	result = crypt(password, salt);
+	/* xcrypt returns "*0" on errors */
+	if (!result || result[0] == '*') {
+	    fprintf(stderr, "crypt failed.\n");
+	    exit(2);
+	}
+	/* yes, using strlen(salt_prefix) on salt. It's not
+	 * documented whether crypt_gensalt may change the prefix */
+	if (!strneq(result, salt, strlen(salt_prefix))) {
+	    fprintf(stderr, _("Method not supported by crypt(3).\n"));
+	    exit(2);
+	}
+	printf("%s\n", result);
+    }
+
+    exit(0);
+}
+
+#ifdef RANDOM_DEVICE
+void* get_random_bytes(const int count)
+{
+    char *buf;
+    int fd;
+
+    buf = NOFAIL(malloc(count));
+    fd = open(RANDOM_DEVICE, O_RDONLY);
+    if (fd < 0) {
+	perror("open(" RANDOM_DEVICE ")");
+	exit(2);
+    }
+    if (read(fd, buf, count) != count) {
+	if (count < 0)
+	    perror("read(" RANDOM_DEVICE ")");
+	else
+	    fprintf(stderr, "Short read of %s.\n", RANDOM_DEVICE);
+	exit(2);
+    }
+    close(fd);
+
+    return buf;
+}
+#endif
+
+#ifdef RANDOM_DEVICE
+
+void generate_salt(char *const buf, const unsigned int len)
+{
+    unsigned int i;
+
+    unsigned char *entropy = get_random_bytes(len * sizeof(unsigned char));
+    for (i = 0; i < len; i++)
+	buf[i] = valid_salts[entropy[i] % (sizeof valid_salts - 1)];
+    buf[i] = '\0';
+}
+
+#else /* RANDOM_DEVICE */
+
+void generate_salt(char *const buf, const unsigned int len)
+{
+    unsigned int i;
+
+# ifdef HAVE_GETTIMEOFDAY
+    struct timeval tv;
+
+    gettimeofday(&tv, NULL);
+    srand(tv.tv_sec ^ tv.tv_usec);
+
+# else /* HAVE_GETTIMEOFDAY */
+#  warning "This system lacks a strong enough random numbers generator!"
+
+    /*
+     * The possible values of time over one year are 31536000, which is
+     * two orders of magnitude less than the allowed entropy range (2^32).
+     */
+    srand(time(NULL) + getpid());
+
+# endif /* HAVE_GETTIMEOFDAY */
+
+    for (i = 0; i < len; i++)
+	buf[i] = valid_salts[rand() % (sizeof valid_salts - 1)];
+    buf[i] = '\0';
+}
+
+#endif /* RANDOM_DEVICE */
+
+void display_help(int error)
+{
+    fprintf((EXIT_SUCCESS == error) ? stdout : stderr,
+	    _("Usage: mkpasswd [OPTIONS]... [PASSWORD [SALT]]\n"
+	    "Crypts the PASSWORD using crypt(3).\n\n"));
+    fprintf(stderr, _(
+"      -m, --method=TYPE     select method TYPE\n"
+"      -5                    like --method=md5\n"
+"      -S, --salt=SALT       use the specified SALT\n"
+"      -R, --rounds=NUMBER   use the specified NUMBER of rounds\n"
+"      -P, --password-fd=NUM read the password from file descriptor NUM\n"
+"                            instead of /dev/tty\n"
+"      -s, --stdin           like --password-fd=0\n"
+"      -h, --help            display this help and exit\n"
+"      -V, --version         output version information and exit\n"
+"\n"
+"If PASSWORD is missing then it is asked interactively.\n"
+"If no SALT is specified, a random one is generated.\n"
+"If TYPE is 'help', available methods are printed.\n"
+"\n"
+"Report bugs to %s.\n"), "<md+whois@linux.it>");
+    exit(error);
+}
+
+void display_version(void)
+{
+    printf("mkpasswd %s\n\n", VERSION);
+    puts("Copyright (C) 2001-2008 Marco d'Itri\n"
+"This is free software; see the source for copying conditions.  There is NO\n"
+"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.");
+}
+
+void display_methods(void)
+{
+    unsigned int i;
+
+    printf(_("Available methods:\n"));
+    for (i = 0; methods[i].method != NULL; i++)
+	printf("%s\t%s\n", methods[i].method, methods[i].desc);
+}
+
diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
new file mode 100644
index 0000000..dc6de19
--- /dev/null
+++ b/package/mkpasswd/mkpasswd.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# mkpasswd
+#
+################################################################################
+
+# source included in buildroot, taken from
+# https://github.com/rfc1036/whois/blob/master/
+# at revision 5a0f08500fa51608b6d3b73ee338be38c692eadb
+HOST_MKPASSWD_SOURCE =
+HOST_MKPASSWD_LICENSE = GPLv2+
+
+define HOST_MKPASSWD_BUILD_CMDS
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		package/mkpasswd/mkpasswd.c package/mkpasswd/utils.c \
+		-o $(@D)/mkpasswd -lcrypt
+endef
+
+define HOST_MKPASSWD_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/mkpasswd $(HOST_DIR)/usr/bin/mkpasswd
+endef
+
+$(eval $(host-generic-package))
+
+MKPASSWD = $(HOST_DIR)/usr/bin/mkpasswd
diff --git a/package/mkpasswd/utils.c b/package/mkpasswd/utils.c
new file mode 100644
index 0000000..254bf2a
--- /dev/null
+++ b/package/mkpasswd/utils.c
@@ -0,0 +1,96 @@
+/*
+ * Copyright 1999-2008 by Marco d'Itri <md@linux.it>.
+ *
+ * do_nofail and merge_args come from the module-init-tools package.
+ * Copyright 2001 by Rusty Russell.
+ * Copyright 2002, 2003 by Rusty Russell, IBM Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ */
+
+/* for strdup */
+#define _XOPEN_SOURCE 500
+
+/* System library */
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <errno.h>
+
+/* Application-specific */
+#include "utils.h"
+
+void *do_nofail(void *ptr, const char *file, const int line)
+{
+    if (ptr)
+	return ptr;
+
+    err_quit("Memory allocation failure at %s:%d.", file, line);
+}
+
+/* Prepend options from a string. */
+char **merge_args(char *args, char *argv[], int *argc)
+{
+    char *arg, *argstring;
+    char **newargs = NULL;
+    unsigned int i, num_env = 0;
+
+    if (!args)
+	return argv;
+
+    argstring = NOFAIL(strdup(args));
+    for (arg = strtok(argstring, " "); arg; arg = strtok(NULL, " ")) {
+	num_env++;
+	newargs = NOFAIL(realloc(newargs,
+		    sizeof(newargs[0]) * (num_env + *argc + 1)));
+	newargs[num_env] = arg;
+    }
+
+    if (!newargs)
+	return argv;
+
+    /* Append commandline args */
+    newargs[0] = argv[0];
+    for (i = 1; i <= *argc; i++)
+	newargs[num_env + i] = argv[i];
+
+    *argc += num_env;
+    return newargs;
+}
+
+/* Error routines */
+void err_sys(const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vfprintf(stderr, fmt, ap);
+    fprintf(stderr, ": %s\n", strerror(errno));
+    va_end(ap);
+    exit(2);
+}
+
+void err_quit(const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vfprintf(stderr, fmt, ap);
+    fputs("\n", stderr);
+    va_end(ap);
+    exit(2);
+}
+
diff --git a/package/mkpasswd/utils.h b/package/mkpasswd/utils.h
new file mode 100644
index 0000000..0f226ae
--- /dev/null
+++ b/package/mkpasswd/utils.h
@@ -0,0 +1,56 @@
+#ifndef WHOIS_UTILS_H
+#define WHOIS_UTILS_H
+
+/* Convenience macros */
+#define streq(a, b) (strcmp(a, b) == 0)
+#define strcaseeq(a, b) (strcasecmp(a, b) == 0)
+#define strneq(a, b, n) (strncmp(a, b, n) == 0)
+#define strncaseeq(a, b, n) (strncasecmp(a, b, n) == 0)
+
+#define NOFAIL(ptr) do_nofail((ptr), __FILE__, __LINE__)
+
+/* Portability macros */
+#ifdef __GNUC__
+# define NORETURN __attribute__((noreturn))
+#else
+# define NORETURN
+#endif
+
+#ifndef AI_IDN
+# define AI_IDN 0
+#endif
+
+#ifndef AI_ADDRCONFIG
+# define AI_ADDRCONFIG 0
+#endif
+
+#ifdef HAVE_GETOPT_LONG
+# define GETOPT_LONGISH(c, v, o, l, i) getopt_long(c, v, o, l, i)
+#else
+# define GETOPT_LONGISH(c, v, o, l, i) getopt(c, v, o)
+#endif
+
+#ifdef ENABLE_NLS
+# include <libintl.h>
+# include <locale.h>
+# define _(a) (gettext(a))
+# ifdef gettext_noop
+#  define N_(a) gettext_noop(a)
+# else
+#  define N_(a) (a)
+# endif
+#else
+# define _(a) (a)
+# define N_(a) (a)
+# define ngettext(a, b, c) ((c==1) ? (a) : (b))
+#endif
+
+
+/* Prototypes */
+void *do_nofail(void *ptr, const char *file, const int line);
+char **merge_args(char *args, char *argv[], int *argc);
+
+void err_quit(const char *fmt, ...) NORETURN;
+void err_sys(const char *fmt, ...) NORETURN;
+
+#endif
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 61a4140..bce5cc6 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -173,14 +173,6 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BUILDROOT_CONFIG ; then
     done
 fi
 
-if grep -E '^BR2_TARGET_GENERIC_ROOT_PASSWD=".+"$' $BUILDROOT_CONFIG > /dev/null 2>&1; then
-    if ! which mkpasswd > /dev/null 2>&1; then
-        /bin/echo -e "\nYou need the 'mkpasswd' utility to set the root password\n"
-        /bin/echo -e "(in Debian/ubuntu, 'mkpasswd' provided by the whois package)\n"
-        exit 1
-    fi
-fi
-
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
     if test ! -f /lib/ld-linux.so.2 ; then
 	/bin/echo -e "\nYour Buildroot configuration uses pre-built tools for the x86 architecture,"
diff --git a/system/system.mk b/system/system.mk
index df8c802..b4ddc3e 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -2,9 +2,6 @@ TARGET_GENERIC_HOSTNAME := $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE := $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_ROOT_PASSWD := $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
 TARGET_GENERIC_PASSWD_METHOD := $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
-ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
-TARGET_GENERIC_ROOT_PASSWD_HASH = $(shell mkpasswd -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
-endif
 TARGET_GENERIC_GETTY := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 TARGET_GENERIC_GETTY_TERM := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
@@ -23,8 +20,13 @@ target-generic-issue:
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
 
+ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
+target-root-passwd: host-mkpasswd
+endif
 target-root-passwd:
-	$(SED) 's,^root:[^:]*:,root:$(TARGET_GENERIC_ROOT_PASSWD_HASH):,' $(TARGET_DIR)/etc/shadow
+	[ -n "$(TARGET_GENERIC_ROOT_PASSWD)" ] && \
+		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
+	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
 
 target-generic-getty-busybox:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
