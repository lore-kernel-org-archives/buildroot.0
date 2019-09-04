From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Sep 2019 23:32:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with glibc
 2.30
Message-ID: <20190904213256.20303-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e8b72f5d93d3565d41364a52c0024a0292a06b41

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0002-net-multicast-Remove-mc_gethost.patch | 187 ++++++++++++++++++
 ...otools-check-for-getdents-getdents64.patch |  80 ++++++++
 package/ltp-testsuite/ltp-testsuite.mk        |   2 +
 3 files changed, 269 insertions(+)
 create mode 100644 package/ltp-testsuite/0002-net-multicast-Remove-mc_gethost.patch
 create mode 100644 package/ltp-testsuite/0003-syscalls-getdents-Add-autotools-check-for-getdents-getdents64.patch

diff --git a/package/ltp-testsuite/0002-net-multicast-Remove-mc_gethost.patch b/package/ltp-testsuite/0002-net-multicast-Remove-mc_gethost.patch
new file mode 100644
index 0000000000..2281e6da32
--- /dev/null
+++ b/package/ltp-testsuite/0002-net-multicast-Remove-mc_gethost.patch
@@ -0,0 +1,187 @@
+From 5a07ccea50eb99e89226ed5f5a5896d2d28e1063 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 29 Jul 2019 13:12:24 +0200
+Subject: [PATCH] net/multicast: Remove mc_gethost
+
+mc_gethost was used in multicast tests, which were migrated to use
+tst_net.sh in the past. Last mc_member use was removed in bed22a78c.
+
+Fixes: ("bed22a78c network: mc_member: use tst_ipaddr(), cleanup")
+
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+[Retrieved from:
+https://github.com/linux-test-project/ltp/commit/5a07ccea50eb99e89226ed5f5a5896d2d28e1063]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ testcases/network/.gitignore                  |   1 -
+ testcases/network/multicast/Makefile          |   4 -
+ .../network/multicast/mc_gethost/Makefile     |  22 ----
+ .../network/multicast/mc_gethost/mc_gethost.c | 105 ------------------
+ 4 files changed, 132 deletions(-)
+ delete mode 100644 testcases/network/multicast/mc_gethost/Makefile
+ delete mode 100644 testcases/network/multicast/mc_gethost/mc_gethost.c
+
+diff --git a/testcases/network/.gitignore b/testcases/network/.gitignore
+index e952f6f9f2..dab2bc34e7 100644
+--- a/testcases/network/.gitignore
++++ b/testcases/network/.gitignore
+@@ -7,7 +7,6 @@
+ /lib6/getaddrinfo_01
+ /lib6/in6_01
+ /lib6/in6_02
+-/multicast/mc_gethost/mc_gethost
+ /multicast/mc_commo/mc_recv
+ /multicast/mc_commo/mc_send
+ /multicast/mc_member/mc_member_test
+diff --git a/testcases/network/multicast/Makefile b/testcases/network/multicast/Makefile
+index 6ade5e5b7c..590f41e39b 100644
+--- a/testcases/network/multicast/Makefile
++++ b/testcases/network/multicast/Makefile
+@@ -24,8 +24,4 @@ top_srcdir		?= ../../..
+ 
+ include $(top_srcdir)/include/mk/env_pre.mk
+ 
+-ifeq ($(ANDROID),1)
+-FILTER_OUT_DIRS		+= mc_gethost
+-endif
+-
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+diff --git a/testcases/network/multicast/mc_gethost/Makefile b/testcases/network/multicast/mc_gethost/Makefile
+deleted file mode 100644
+index d5eaf8480f..0000000000
+--- a/testcases/network/multicast/mc_gethost/Makefile
++++ /dev/null
+@@ -1,22 +0,0 @@
+-#
+-#    Copyright (C) 2013, Linux Test Project
+-#
+-#    This program is free software; you can redistribute it and/or modify
+-#    it under the terms of the GNU General Public License as published by
+-#    the Free Software Foundation; either version 2 of the License, or
+-#    (at your option) any later version.
+-#
+-#    This program is distributed in the hope that it will be useful,
+-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
+-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-#    GNU General Public License for more details.
+-#
+-#    You should have received a copy of the GNU General Public License along
+-#    with this program; if not, write to the Free Software Foundation, Inc.,
+-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+-#
+-
+-top_srcdir		?= ../../../..
+-
+-include $(top_srcdir)/include/mk/testcases.mk
+-include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
+deleted file mode 100644
+index 9cc15d086b..0000000000
+--- a/testcases/network/multicast/mc_gethost/mc_gethost.c
++++ /dev/null
+@@ -1,105 +0,0 @@
+-/* host - print information about a host
+- * originally written by Paul Vixie @DEC WRL, January 1989
+- */
+-
+-/* DECWRL Header: host.c,v 1.1 89/04/05 15:41:12 vixie Locked $ */
+-
+-#include <sys/param.h>
+-#include <sys/socket.h>
+-#include <netinet/in.h>
+-#include <arpa/inet.h>
+-#include <arpa/nameser.h>
+-
+-#include <stdio.h>
+-#include <resolv.h>
+-#include <netdb.h>
+-#include <syslog.h>
+-#include <string.h>
+-#include <stdlib.h>
+-
+-#ifndef LOG_PERROR
+-#define LOG_PERROR 0
+-#endif
+-
+-int main(int argc, char **argv)
+-{
+-	unsigned char b_addr[IN6ADDRSZ];
+-	struct hostent *host;
+-	char **ap, **cp, *arg;
+-	const char *prog = "amnesia";
+-	int af = AF_INET;
+-	int size = INADDRSZ;
+-	int force = 0;
+-
+-	if (argc < 1) {
+-usage:
+-		printf("usage:  %s [-d] [-6] [-f] (hostname|ipaddr)\n", prog);
+-		exit(1);
+-	}
+-	prog = *argv++;
+-	argc--;
+-#ifdef LOG_USER
+-	openlog(prog, LOG_PERROR, LOG_USER);
+-#else
+-	openlog(prog, LOG_PERROR);
+-#endif
+-	res_init();
+-
+-	if (argc >= 1 && !strcmp(*argv, "-d")) {
+-		_res.options |= RES_DEBUG;
+-		argv++, argc--;
+-	}
+-	if (argc >= 1 && !strcmp(*argv, "-6")) {
+-		af = AF_INET6, size = IN6ADDRSZ;
+-		_res.options |= RES_USE_INET6;
+-		argv++, argc--;
+-	}
+-	if (argc >= 1 && !strcmp(*argv, "-f")) {
+-		force++;
+-		argv++, argc--;
+-	}
+-
+-	if (argc < 1)
+-		goto usage;
+-	arg = *argv++;
+-	argc--;
+-
+-	if (inet_pton(af, arg, b_addr)) {
+-		char p[sizeof "ffff:ffff:ffff:ffff:ffff:ffff:255.255.255.255"];
+-
+-		printf("[%s]\n", inet_ntop(af, b_addr, p, sizeof p));
+-		if (!(host = gethostbyaddr((char *)b_addr, size, af))) {
+-			herror("gethostbyaddr");
+-			exit(1);
+-		}
+-	} else {
+-		printf("{%s}\n", arg);
+-		if (force)
+-			host = gethostbyname2(arg, af);
+-		else
+-			host = gethostbyname(arg);
+-		if (!host) {
+-			herror("gethostbyname*");
+-			exit(1);
+-		}
+-	}
+-	printf("name: %s\n", host->h_name);
+-	if (host->h_aliases && *host->h_aliases) {
+-		printf("aliases:");
+-		for (cp = (char **)host->h_aliases; *cp; cp++)
+-			printf(" %s", *cp);
+-		printf("\n");
+-	}
+-	if (host->h_addr_list && *host->h_addr_list) {
+-		printf("addresses:");
+-		for (ap = host->h_addr_list; *ap; ap++) {
+-			char p[sizeof
+-			       "ffff:ffff:ffff:ffff:ffff:ffff:255.255.255.255"];
+-
+-			printf(" %s", inet_ntop(host->h_addrtype,
+-						*ap, p, sizeof p));
+-		}
+-		printf("\n");
+-	}
+-	exit(0);
+-}
diff --git a/package/ltp-testsuite/0003-syscalls-getdents-Add-autotools-check-for-getdents-getdents64.patch b/package/ltp-testsuite/0003-syscalls-getdents-Add-autotools-check-for-getdents-getdents64.patch
new file mode 100644
index 0000000000..8e05b5872c
--- /dev/null
+++ b/package/ltp-testsuite/0003-syscalls-getdents-Add-autotools-check-for-getdents-getdents64.patch
@@ -0,0 +1,80 @@
+From 6d9de5f0cd4eacf4037770fc3a2ad1ad373bf0c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Jul 2019 11:25:23 -0700
+Subject: [PATCH] syscalls/getdents: Add autotools check for
+ getdents/getdents64
+
+glibc 2.30 has added wrapper for getdents64, this will help in detecting
+right condition to use fallback.
+
+Check for getdents API as well while here.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+[Retrieved from:
+https://github.com/linux-test-project/ltp/commit/6d9de5f0cd4eacf4037770fc3a2ad1ad373bf0c4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac                                  |  2 ++
+ testcases/kernel/syscalls/getdents/getdents.h | 12 ++++++++++--
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f7d1afc405..5a882a3412 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -69,6 +69,8 @@ AC_CHECK_FUNCS([ \
+     fallocate \
+     fchownat \
+     fstatat \
++    getdents \
++    getdents64 \
+     kcmp \
+     mkdirat \
+     mknodat \
+diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
+index 702b0bd28f..c24ed6c996 100644
+--- a/testcases/kernel/syscalls/getdents/getdents.h
++++ b/testcases/kernel/syscalls/getdents/getdents.h
+@@ -23,7 +23,7 @@
+ #include <stdint.h>
+ #include "test.h"
+ #include "lapi/syscalls.h"
+-
++#include "config.h"
+ /*
+  * See fs/compat.c struct compat_linux_dirent
+  */
+@@ -34,12 +34,17 @@ struct linux_dirent {
+ 	char            d_name[];
+ };
+ 
++#if HAVE_GETDENTS
++#include <unistd.h>
++#else
+ static inline int
+ getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
+ {
+ 	return ltp_syscall(__NR_getdents, fd, dirp, size);
+ }
+ 
++#endif /* HAVE_GETDENTS */
++
+ struct linux_dirent64 {
+ 	uint64_t	d_ino;
+ 	int64_t		d_off;
+@@ -48,10 +53,13 @@ struct linux_dirent64 {
+ 	char		d_name[];
+ };
+ 
++#if HAVE_GETDENTS64
++#include <unistd.h>
++#else
+ static inline int
+ getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
+ {
+ 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
+ }
+-
++#endif /* HAVE_GETDENTS64 */
+ #endif /* GETDENTS_H */
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 173c3bfe8c..ed7a14a6c8 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -9,6 +9,8 @@ LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
+# We're patching configure.ac
+LTP_TESTSUITE_AUTORECONF = YES
 
 LTP_TESTSUITE_CONF_OPTS += \
 	--with-realtime-testsuite --with-open-posix-testsuite
-- 
2.23.0.rc1
