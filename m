From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 08:08:04 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump to version
 20190930
Message-ID: <20191002060608.6B617840EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c7c85c1a544d44c034578f5668b0303067e59cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 2 patches accepted in this release, add new one
(no need to autoreconf any more).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-net-multicast-Remove-mc_gethost.patch     | 187 ---------------------
 ...clibc-build-caused-by-conflicting-signatu.patch |  67 ++++++++
 ...d-autotools-check-for-getdents-getdents64.patch |  80 ---------
 package/ltp-testsuite/ltp-testsuite.hash           |   4 +-
 package/ltp-testsuite/ltp-testsuite.mk             |   4 +-
 5 files changed, 70 insertions(+), 272 deletions(-)

diff --git a/package/ltp-testsuite/0002-net-multicast-Remove-mc_gethost.patch b/package/ltp-testsuite/0002-net-multicast-Remove-mc_gethost.patch
deleted file mode 100644
index 2281e6da32..0000000000
--- a/package/ltp-testsuite/0002-net-multicast-Remove-mc_gethost.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-From 5a07ccea50eb99e89226ed5f5a5896d2d28e1063 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Mon, 29 Jul 2019 13:12:24 +0200
-Subject: [PATCH] net/multicast: Remove mc_gethost
-
-mc_gethost was used in multicast tests, which were migrated to use
-tst_net.sh in the past. Last mc_member use was removed in bed22a78c.
-
-Fixes: ("bed22a78c network: mc_member: use tst_ipaddr(), cleanup")
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-[Retrieved from:
-https://github.com/linux-test-project/ltp/commit/5a07ccea50eb99e89226ed5f5a5896d2d28e1063]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- testcases/network/.gitignore                  |   1 -
- testcases/network/multicast/Makefile          |   4 -
- .../network/multicast/mc_gethost/Makefile     |  22 ----
- .../network/multicast/mc_gethost/mc_gethost.c | 105 ------------------
- 4 files changed, 132 deletions(-)
- delete mode 100644 testcases/network/multicast/mc_gethost/Makefile
- delete mode 100644 testcases/network/multicast/mc_gethost/mc_gethost.c
-
-diff --git a/testcases/network/.gitignore b/testcases/network/.gitignore
-index e952f6f9f2..dab2bc34e7 100644
---- a/testcases/network/.gitignore
-+++ b/testcases/network/.gitignore
-@@ -7,7 +7,6 @@
- /lib6/getaddrinfo_01
- /lib6/in6_01
- /lib6/in6_02
--/multicast/mc_gethost/mc_gethost
- /multicast/mc_commo/mc_recv
- /multicast/mc_commo/mc_send
- /multicast/mc_member/mc_member_test
-diff --git a/testcases/network/multicast/Makefile b/testcases/network/multicast/Makefile
-index 6ade5e5b7c..590f41e39b 100644
---- a/testcases/network/multicast/Makefile
-+++ b/testcases/network/multicast/Makefile
-@@ -24,8 +24,4 @@ top_srcdir		?= ../../..
- 
- include $(top_srcdir)/include/mk/env_pre.mk
- 
--ifeq ($(ANDROID),1)
--FILTER_OUT_DIRS		+= mc_gethost
--endif
--
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
-diff --git a/testcases/network/multicast/mc_gethost/Makefile b/testcases/network/multicast/mc_gethost/Makefile
-deleted file mode 100644
-index d5eaf8480f..0000000000
---- a/testcases/network/multicast/mc_gethost/Makefile
-+++ /dev/null
-@@ -1,22 +0,0 @@
--#
--#    Copyright (C) 2013, Linux Test Project
--#
--#    This program is free software; you can redistribute it and/or modify
--#    it under the terms of the GNU General Public License as published by
--#    the Free Software Foundation; either version 2 of the License, or
--#    (at your option) any later version.
--#
--#    This program is distributed in the hope that it will be useful,
--#    but WITHOUT ANY WARRANTY; without even the implied warranty of
--#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--#    GNU General Public License for more details.
--#
--#    You should have received a copy of the GNU General Public License along
--#    with this program; if not, write to the Free Software Foundation, Inc.,
--#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--#
--
--top_srcdir		?= ../../../..
--
--include $(top_srcdir)/include/mk/testcases.mk
--include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
-deleted file mode 100644
-index 9cc15d086b..0000000000
---- a/testcases/network/multicast/mc_gethost/mc_gethost.c
-+++ /dev/null
-@@ -1,105 +0,0 @@
--/* host - print information about a host
-- * originally written by Paul Vixie @DEC WRL, January 1989
-- */
--
--/* DECWRL Header: host.c,v 1.1 89/04/05 15:41:12 vixie Locked $ */
--
--#include <sys/param.h>
--#include <sys/socket.h>
--#include <netinet/in.h>
--#include <arpa/inet.h>
--#include <arpa/nameser.h>
--
--#include <stdio.h>
--#include <resolv.h>
--#include <netdb.h>
--#include <syslog.h>
--#include <string.h>
--#include <stdlib.h>
--
--#ifndef LOG_PERROR
--#define LOG_PERROR 0
--#endif
--
--int main(int argc, char **argv)
--{
--	unsigned char b_addr[IN6ADDRSZ];
--	struct hostent *host;
--	char **ap, **cp, *arg;
--	const char *prog = "amnesia";
--	int af = AF_INET;
--	int size = INADDRSZ;
--	int force = 0;
--
--	if (argc < 1) {
--usage:
--		printf("usage:  %s [-d] [-6] [-f] (hostname|ipaddr)\n", prog);
--		exit(1);
--	}
--	prog = *argv++;
--	argc--;
--#ifdef LOG_USER
--	openlog(prog, LOG_PERROR, LOG_USER);
--#else
--	openlog(prog, LOG_PERROR);
--#endif
--	res_init();
--
--	if (argc >= 1 && !strcmp(*argv, "-d")) {
--		_res.options |= RES_DEBUG;
--		argv++, argc--;
--	}
--	if (argc >= 1 && !strcmp(*argv, "-6")) {
--		af = AF_INET6, size = IN6ADDRSZ;
--		_res.options |= RES_USE_INET6;
--		argv++, argc--;
--	}
--	if (argc >= 1 && !strcmp(*argv, "-f")) {
--		force++;
--		argv++, argc--;
--	}
--
--	if (argc < 1)
--		goto usage;
--	arg = *argv++;
--	argc--;
--
--	if (inet_pton(af, arg, b_addr)) {
--		char p[sizeof "ffff:ffff:ffff:ffff:ffff:ffff:255.255.255.255"];
--
--		printf("[%s]\n", inet_ntop(af, b_addr, p, sizeof p));
--		if (!(host = gethostbyaddr((char *)b_addr, size, af))) {
--			herror("gethostbyaddr");
--			exit(1);
--		}
--	} else {
--		printf("{%s}\n", arg);
--		if (force)
--			host = gethostbyname2(arg, af);
--		else
--			host = gethostbyname(arg);
--		if (!host) {
--			herror("gethostbyname*");
--			exit(1);
--		}
--	}
--	printf("name: %s\n", host->h_name);
--	if (host->h_aliases && *host->h_aliases) {
--		printf("aliases:");
--		for (cp = (char **)host->h_aliases; *cp; cp++)
--			printf(" %s", *cp);
--		printf("\n");
--	}
--	if (host->h_addr_list && *host->h_addr_list) {
--		printf("addresses:");
--		for (ap = host->h_addr_list; *ap; ap++) {
--			char p[sizeof
--			       "ffff:ffff:ffff:ffff:ffff:ffff:255.255.255.255"];
--
--			printf(" %s", inet_ntop(host->h_addrtype,
--						*ap, p, sizeof p));
--		}
--		printf("\n");
--	}
--	exit(0);
--}
diff --git a/package/ltp-testsuite/0002-pkeys-Fix-uclibc-build-caused-by-conflicting-signatu.patch b/package/ltp-testsuite/0002-pkeys-Fix-uclibc-build-caused-by-conflicting-signatu.patch
new file mode 100644
index 0000000000..730be1e871
--- /dev/null
+++ b/package/ltp-testsuite/0002-pkeys-Fix-uclibc-build-caused-by-conflicting-signatu.patch
@@ -0,0 +1,67 @@
+From 69341008e0a34b81a498ce02ab1cba4679096bb1 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Tue, 1 Oct 2019 14:46:22 +0200
+Subject: [PATCH] pkeys: Fix uclibc build caused by conflicting signature
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Removing static fixes the problem.
+
+uClibc defines pkey_{alloc,free,mprotect} signatures in
+<bits/mman-shared.h>, which is included by <bits/mman-linux.h>.  Because
+it does not implement them, our implementation signature conflicts, as
+it uses static.
+
+Fixed build error:
+In file included from pkey01.c:32:0:
+pkey.h:18:19: error: static declaration of ???pkey_mprotect??? follows non-static declaration
+ static inline int pkey_mprotect(void *addr, size_t len, int prot, int pkey)
+                   ^
+In file included from /opt/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/mman-linux.h:115:0,
+                 from /opt/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/mman.h:40,
+                 from /opt/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/mman.h:41,
+                 from pkey01.c:29:
+/opt/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/mman-shared.h:73:5: note: previous declaration of ???pkey_mprotect??? was here
+ int pkey_mprotect (void *__addr, size_t __len, int __prot, int __pkey) __THROW;
+     ^
+In file included from pkey01.c:32:0:
+
+Found with test-pkg tool from Buildroot distribution.
+
+Fixes: 90c2dc89f ("pkey: add test for memory protection keys")
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status: https://patchwork.ozlabs.org/patch/1170133/]
+---
+ testcases/kernel/syscalls/pkeys/pkey.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/pkeys/pkey.h b/testcases/kernel/syscalls/pkeys/pkey.h
+index d623244eb..19c8447eb 100644
+--- a/testcases/kernel/syscalls/pkeys/pkey.h
++++ b/testcases/kernel/syscalls/pkeys/pkey.h
+@@ -15,17 +15,17 @@
+ #endif
+ 
+ #ifndef HAVE_PKEY_MPROTECT
+-static inline int pkey_mprotect(void *addr, size_t len, int prot, int pkey)
++inline int pkey_mprotect(void *addr, size_t len, int prot, int pkey)
+ {
+ 	return tst_syscall(__NR_pkey_mprotect, addr, len, prot, pkey);
+ }
+ 
+-static inline int pkey_alloc(unsigned int flags, unsigned int access_rights)
++inline int pkey_alloc(unsigned int flags, unsigned int access_rights)
+ {
+ 	return tst_syscall(__NR_pkey_alloc, flags, access_rights);
+ }
+ 
+-static inline int pkey_free(int pkey)
++inline int pkey_free(int pkey)
+ {
+ 	return tst_syscall(__NR_pkey_free, pkey);
+ }
+-- 
+2.23.0
+
diff --git a/package/ltp-testsuite/0003-syscalls-getdents-Add-autotools-check-for-getdents-getdents64.patch b/package/ltp-testsuite/0003-syscalls-getdents-Add-autotools-check-for-getdents-getdents64.patch
deleted file mode 100644
index 8e05b5872c..0000000000
--- a/package/ltp-testsuite/0003-syscalls-getdents-Add-autotools-check-for-getdents-getdents64.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 6d9de5f0cd4eacf4037770fc3a2ad1ad373bf0c4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Jul 2019 11:25:23 -0700
-Subject: [PATCH] syscalls/getdents: Add autotools check for
- getdents/getdents64
-
-glibc 2.30 has added wrapper for getdents64, this will help in detecting
-right condition to use fallback.
-
-Check for getdents API as well while here.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-[Retrieved from:
-https://github.com/linux-test-project/ltp/commit/6d9de5f0cd4eacf4037770fc3a2ad1ad373bf0c4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac                                  |  2 ++
- testcases/kernel/syscalls/getdents/getdents.h | 12 ++++++++++--
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f7d1afc405..5a882a3412 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -69,6 +69,8 @@ AC_CHECK_FUNCS([ \
-     fallocate \
-     fchownat \
-     fstatat \
-+    getdents \
-+    getdents64 \
-     kcmp \
-     mkdirat \
-     mknodat \
-diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
-index 702b0bd28f..c24ed6c996 100644
---- a/testcases/kernel/syscalls/getdents/getdents.h
-+++ b/testcases/kernel/syscalls/getdents/getdents.h
-@@ -23,7 +23,7 @@
- #include <stdint.h>
- #include "test.h"
- #include "lapi/syscalls.h"
--
-+#include "config.h"
- /*
-  * See fs/compat.c struct compat_linux_dirent
-  */
-@@ -34,12 +34,17 @@ struct linux_dirent {
- 	char            d_name[];
- };
- 
-+#if HAVE_GETDENTS
-+#include <unistd.h>
-+#else
- static inline int
- getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
- {
- 	return ltp_syscall(__NR_getdents, fd, dirp, size);
- }
- 
-+#endif /* HAVE_GETDENTS */
-+
- struct linux_dirent64 {
- 	uint64_t	d_ino;
- 	int64_t		d_off;
-@@ -48,10 +53,13 @@ struct linux_dirent64 {
- 	char		d_name[];
- };
- 
-+#if HAVE_GETDENTS64
-+#include <unistd.h>
-+#else
- static inline int
- getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
- {
- 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
- }
--
-+#endif /* HAVE_GETDENTS64 */
- #endif /* GETDENTS_H */
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 01111a8a30..4725f7b5b6 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20190517/ltp-full-20190517.tar.xz.sha1
-sha1 464d09ee1d3b43eecd0d78a9818596e6e1f2234e  ltp-full-20190517.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20190930/ltp-full-20190930.tar.xz.sha1
+sha1 9b58720b33d17d1c635d5d8b5abd9fc6eec07374  ltp-full-20190930.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ed7a14a6c8..2276b75f8c 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20190517
+LTP_TESTSUITE_VERSION = 20190930
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
-# We're patching configure.ac
-LTP_TESTSUITE_AUTORECONF = YES
 
 LTP_TESTSUITE_CONF_OPTS += \
 	--with-realtime-testsuite --with-open-posix-testsuite
