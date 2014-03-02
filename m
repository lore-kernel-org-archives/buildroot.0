From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 15:20:47 +0100
Subject: [Buildroot] [git commit] samba4: new package
Message-ID: <20140302142224.1E6FC9936E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dee1cf0cdf9db351fd94ccd864e09b3f1ec122f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Samba 4.1.x uses the waf build system which isn't very cross-compile
friendly, and also some tests are formulated in a way that isn't
cross-build friendly either by needing to run them.

For this reason the samba4 build system includes a way to define
answers for many of the tests, but this support isn't complete
and some tests still want to be executed.

Samba 4.1.x also requires a proper answers file for each architecture,
and at the moment i've only tested for ARM and PowerPC so only those
architectures are supported to begin with. To add support for another
architecture basically copy one of the cache files to the proper name,
enable it in Config.in and adjust endianess and all of the "size of"
answers. I'm in the process of automating the sizeof and endianess
answers within the samba build system to make them cross friendly
to simplify the answers file to just one generic linux variant.
The 3.6.x branch is still security supported for the forseeable future.

I'm currently working with samba upstream to solve many of these
issues but this will probably happen with the yet unreleased
4.2 branch only.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/samba4/Config.in                           |   24 ++++
 package/samba4/S91smb                              |   56 ++++++++++
 package/samba4/arm-cache.txt                       |   65 +++++++++++
 package/samba4/powerpc-cache.txt                   |   65 +++++++++++
 ...-0001-build-don-t-execute-tests-summary.c.patch |   69 ++++++++++++
 ...ld-don-t-execute-statfs-and-f_fsid-checks.patch |   33 ++++++
 ...003-build-find-FILE_OFFSET_BITS-via-array.patch |   56 ++++++++++
 ...uild-allow-some-python-variable-overrides.patch |   47 ++++++++
 ...amba4-0005-builtin-heimdal-external-tools.patch |   42 +++++++
 package/samba4/samba4.mk                           |  113 ++++++++++++++++++++
 11 files changed, 571 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e6fe6aa..6edf18e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -956,6 +956,7 @@ source "package/rsync/Config.in"
 source "package/rtorrent/Config.in"
 source "package/rtptools/Config.in"
 source "package/samba/Config.in"
+source "package/samba4/Config.in"
 source "package/sconeserver/Config.in"
 source "package/ser2net/Config.in"
 source "package/smcroute/Config.in"
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
new file mode 100644
index 0000000..b8d4154
--- /dev/null
+++ b/package/samba4/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_SAMBA4
+	bool "samba4"
+	depends on !BR2_PACKAGE_SAMBA
+	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # e2fsprogs
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # talloc python threads
+	# Supported architectures only limited by the cached answers
+	depends on BR2_arm || BR2_powerpc
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_ZLIB
+	help
+	  Provides secure, stable and fast file and print services
+	  for all clients using the SMB/CIFS protocol, such as all
+	  versions of DOS, Windows, OS/2, Linux and many others.
+
+	  http://www.samba.org/
+
+comment "samba4 needs a toolchain w/ IPv6, wchar, largfile, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
+		!BR2_USE_WCHAR || !BR2_INET_IPV6
diff --git a/package/samba4/S91smb b/package/samba4/S91smb
new file mode 100644
index 0000000..0cd0057
--- /dev/null
+++ b/package/samba4/S91smb
@@ -0,0 +1,56 @@
+#!/bin/sh
+
+[ -f /etc/samba/smb.conf ] || exit 0
+
+mkdir -p /var/log/samba
+
+start() {
+	echo -n "Starting SMB services: "
+	smbd -D
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+
+	echo -n "Starting NMB services: "
+	nmbd -D
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	echo -n "Shutting down SMB services: "
+	kill -9 `pidof smbd`
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+
+	echo -n "Shutting down NMB services: "
+	kill -9 `pidof nmbd`
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+	stop
+	start
+}
+
+reload() {
+        echo -n "Reloading smb.conf file: "
+	kill -HUP `pidof smbd`
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+  start)
+  	start
+	;;
+  stop)
+  	stop
+	;;
+  restart)
+  	restart
+	;;
+  reload)
+  	reload
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/samba4/arm-cache.txt b/package/samba4/arm-cache.txt
new file mode 100644
index 0000000..70b19e3
--- /dev/null
+++ b/package/samba4/arm-cache.txt
@@ -0,0 +1,65 @@
+Checking simple C program: OK
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking for large file support without additional flags: OK
+Checking for -D_LARGE_FILES: OK
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: OK
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: OK
+Checking for HAVE_LITTLE_ENDIAN - runtime: OK
+Checking for HAVE_BIG_ENDIAN - runtime: NO
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether setreuid is available: OK
+Checking whether setresuid is available: OK
+Checking whether seteuid is available: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking whether POSIX capabilities are available: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking uname sysname type: "Linux"
+Checking uname machine type: "arm"
+Checking uname release type: "3.0.0"
+Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
+Checking for WORDS_BIGENDIAN: NO
+Checking size of bool: "1"
+Checking size of char: "1"
+Checking size of int: "4"
+Checking size of long long: "8"
+Checking size of long: "4"
+Checking size of short: "2"
+Checking size of size_t: "4"
+Checking size of ssize_t: "4"
+Checking size of int8_t: "1"
+Checking size of uint8_t: "1"
+Checking size of int16_t: "2"
+Checking size of uint16_t: "2"
+Checking size of int32_t: "4"
+Checking size of uint32_t: "4"
+Checking size of int64_t: "8"
+Checking size of uint64_t: "8"
+Checking size of void*: "4"
+Checking size of off_t: "8"
+Checking size of dev_t: "8"
+Checking size of ino_t: "8"
+Checking size of time_t: "4"
+Checking size of ((struct utmp *)NULL)->ut_line: "32"
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
diff --git a/package/samba4/powerpc-cache.txt b/package/samba4/powerpc-cache.txt
new file mode 100644
index 0000000..2872d1d
--- /dev/null
+++ b/package/samba4/powerpc-cache.txt
@@ -0,0 +1,65 @@
+Checking simple C program: OK
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking for large file support without additional flags: OK
+Checking for -D_LARGE_FILES: OK
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: OK
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: OK
+Checking for HAVE_LITTLE_ENDIAN - runtime: NO
+Checking for HAVE_BIG_ENDIAN - runtime: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether setreuid is available: OK
+Checking whether setresuid is available: OK
+Checking whether seteuid is available: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking whether POSIX capabilities are available: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking uname sysname type: "Linux"
+Checking uname machine type: "powerpc"
+Checking uname release type: "3.0.0"
+Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
+Checking for WORDS_BIGENDIAN: OK
+Checking size of bool: "1"
+Checking size of char: "1"
+Checking size of int: "4"
+Checking size of long long: "8"
+Checking size of long: "4"
+Checking size of short: "2"
+Checking size of size_t: "4"
+Checking size of ssize_t: "4"
+Checking size of int8_t: "1"
+Checking size of uint8_t: "1"
+Checking size of int16_t: "2"
+Checking size of uint16_t: "2"
+Checking size of int32_t: "4"
+Checking size of uint32_t: "4"
+Checking size of int64_t: "8"
+Checking size of uint64_t: "8"
+Checking size of void*: "4"
+Checking size of off_t: "8"
+Checking size of dev_t: "8"
+Checking size of ino_t: "8"
+Checking size of time_t: "4"
+Checking size of ((struct utmp *)NULL)->ut_line: "32"
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
diff --git a/package/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch b/package/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch
new file mode 100644
index 0000000..d504e5c
--- /dev/null
+++ b/package/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch
@@ -0,0 +1,69 @@
+From 960d710ee5410a5c03815a5ce6837203be00d218 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 30 Jan 2014 11:14:27 -0300
+Subject: [PATCH 1/3] build: don't execute tests/summary.c
+
+tests/summary.c will never be able to be executed when cross compiling.
+Use #error and #warning directives to fail or warn accordingly when
+compiling it.
+
+Status: upstream for next branch.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ tests/summary.c | 14 +++++---------
+ wscript         |  1 -
+ 2 files changed, 5 insertions(+), 10 deletions(-)
+
+diff --git a/tests/summary.c b/tests/summary.c
+index 27f7d4d..0843ee2 100644
+--- a/tests/summary.c
++++ b/tests/summary.c
+@@ -5,27 +5,23 @@ void exit(int);
+ int main()
+ {
+ #if !defined(HAVE_FCNTL_LOCK)
+-	printf("ERROR: No locking available. Running Samba would be unsafe\n");
+-	exit(1);
++#error "ERROR: No locking available. Running Samba would be unsafe"
+ #endif
+ 
+ #if !(defined(HAVE_IFACE_GETIFADDRS) || defined(HAVE_IFACE_IFCONF) || defined(HAVE_IFACE_IFREQ) || defined(HAVE_IFACE_AIX))
+-	printf("WARNING: No automated network interface determination\n");
++#warning "WARNING: No automated network interface determination"
+ #endif
+ 
+ #if !(defined(USE_SETEUID) || defined(USE_SETREUID) || defined(USE_SETRESUID) || defined(USE_SETUIDX) || defined(USE_LINUX_THREAD_CREDENTIALS))
+-	printf("ERROR: no seteuid method available\n");
+-	exit(1);
++#error "ERROR: no seteuid method available"
+ #endif
+ 
+ #if !(defined(STAT_STATVFS) || defined(STAT_STATFS3_OSF1) || defined(STAT_STATFS2_BSIZE) || defined(STAT_STATFS4) || defined(STAT_STATFS2_FSIZE) || defined(STAT_STATFS2_FS_DATA))
+-	printf("ERROR: No disk free routine!\n");
+-	exit(1);
++#error "ERROR: No disk free routine!"
+ #endif
+ 
+ #if !((defined(HAVE_RANDOM) || defined(HAVE_RAND)) && (defined(HAVE_SRANDOM) || defined(HAVE_SRAND)))
+-    printf("ERROR: No random or srandom routine!\n");
+-    exit(1);
++#error "ERROR: No random or srandom routine!"
+ #endif
+ 
+ 	exit(0);
+diff --git a/wscript b/wscript
+index 47b7b50..26431a4 100644
+--- a/wscript
++++ b/wscript
+@@ -170,7 +170,6 @@ def configure(conf):
+     if not conf.CHECK_CODE('#include "tests/summary.c"',
+                            define='SUMMARY_PASSES',
+                            addmain=False,
+-                           execute=True,
+                            msg='Checking configure summary'):
+         raise Utils.WafError('configure summary failed')
+     
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch b/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
new file mode 100644
index 0000000..ec46650
--- /dev/null
+++ b/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
@@ -0,0 +1,33 @@
+From 3c16a171c008b584ed427988dde73c1d9a9de4ad Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 20 Jan 2014 10:17:19 -0300
+Subject: [PATCH 2/3] build: don't execute statfs and f_fsid checks
+
+There's no need to execute the statfs and statfs.f_fsid checks, the
+return value is of no consequence since it's undefined in some
+platforms and prevents cross-compiling.
+
+Status: sent, not yet upstream pending more testing.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ source3/wscript | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/source3/wscript b/source3/wscript
+index 501707b..2d0a62e 100644
+--- a/source3/wscript
++++ b/source3/wscript
+@@ -468,8 +468,7 @@ return acl_get_perm_np(permset_d, perm);
+     conf.CHECK_CODE('struct statfs fsd; fsid_t fsid = fsd.f_fsid; return statfs(".", &fsd);',
+                     'HAVE_STATFS_F_FSID',
+                     msg="vfs_fileid: checking for statfs() and struct statfs.f_fsid",
+-                    headers='sys/types.h sys/statfs.h',
+-                    execute=True)
++                    headers='sys/types.h sys/statfs.h')
+ 
+     if conf.CONFIG_SET('HAVE_FALLOCATE'):
+         conf.CHECK_CODE('''
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch b/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
new file mode 100644
index 0000000..9187cd2
--- /dev/null
+++ b/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
@@ -0,0 +1,56 @@
+From 16d88e7813a7739c070a7a1cf6388fd4f236fd99 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 31 Jan 2014 06:45:18 -0300
+Subject: [PATCHv2] build: find FILE_OFFSET_BITS via array
+
+This makes cross-compiling happy, use a trick similar to autoconf's
+AC_CHECK_SIZEOF macro.
+Basically we make an array:
+
+static int array[1 - 2 * !(((long int)(sizeof(off_t))) < 8)];
+
+This gives -1 multiplied by the negation of the condition
+(sizeof(off_t) < 8) cast to a long int.
+So if the condition is true it gives array[(-1 * 0)] (remember the
+condition is cast and negated) thus passing a build test with a 0-sized
+array.
+If it's false it gives array[(-1 * 1)] thus failing with a
+negative-sized array.
+
+Status: upstream for next branch.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/ccan/wscript | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/ccan/wscript b/lib/ccan/wscript
+index 59b8205..81039d0 100644
+--- a/lib/ccan/wscript
++++ b/lib/ccan/wscript
+@@ -127,15 +127,18 @@ def configure(conf):
+     # Only check for FILE_OFFSET_BITS=64 if off_t is normally small:
+     # use raw routines because wrappers include previous _GNU_SOURCE
+     # or _FILE_OFFSET_BITS defines.
++    # The math for these tests is:
++    # array[-1 * !((int)(condition)) ] (condition is true) = array[0] = builds
++    # array[-1 * !((int)(condition)) ] (condition is false) = array[-1] = fails
+     conf.check(fragment="""#include <sys/types.h>
+-               int main(void) { return !(sizeof(off_t) < 8); }""",
+-               execute=True, msg='Checking for small off_t',
++               int main(void) { static int test_array[1 - 2 * !(((long int)(sizeof(off_t))) < 8)]; }""",
++               msg='Checking for small off_t',
+                define_name='SMALL_OFF_T')
+     # Unreliable return value above, hence use define.
+     if conf.CONFIG_SET('SMALL_OFF_T'):
+         conf.check(fragment="""#include <sys/types.h>
+-                   int main(void) { return !(sizeof(off_t) >= 8); }""",
+-                   execute=True, msg='Checking for -D_FILE_OFFSET_BITS=64',
++		   int main(void) { static int test_array[1 - 2 * !(((long int)(sizeof(off_t))) >= 8)]; }""",
++                   msg='Checking for -D_FILE_OFFSET_BITS=64',
+                    ccflags='-D_FILE_OFFSET_BITS=64',
+                    define_name='HAVE_FILE_OFFSET_BITS')
+ 
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch b/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
new file mode 100644
index 0000000..53ba53c
--- /dev/null
+++ b/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
@@ -0,0 +1,47 @@
+From fdbdf04a9ab3f3a204e95106c4f8f6729d0bab1a Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 4 Feb 2014 14:11:52 -0300
+Subject: [PATCH] build: allow some python variable overrides
+
+The python variables (settings) are fetched from a running python
+interpreter which usually isn't the target one when cross compiling,
+hence libraries and flags aren't the same and can pollute the target
+build.
+Allow some of these variables to be redefined via environment variables
+in order to aid cross-compiling.
+According to testing python_LDFLAGS and python_LIBDIR should be enough.
+
+Status: upstream for next branch.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ buildtools/wafadmin/Tools/python.py | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/buildtools/wafadmin/Tools/python.py b/buildtools/wafadmin/Tools/python.py
+index ab1e817..35c61c2 100644
+--- a/buildtools/wafadmin/Tools/python.py
++++ b/buildtools/wafadmin/Tools/python.py
+@@ -193,6 +193,19 @@ MACOSX_DEPLOYMENT_TARGET = %r
+ """ % (python, python_prefix, python_SO, python_SYSLIBS, python_LDFLAGS, python_SHLIBS,
+ 	python_LIBDIR, python_LIBPL, INCLUDEPY, Py_ENABLE_SHARED, python_MACOSX_DEPLOYMENT_TARGET))
+ 
++	# Allow some python overrides from env vars for cross-compiling
++	os_env = dict(os.environ)
++
++	override_python_LDFLAGS = os_env.get('python_LDFLAGS', None)
++	if override_python_LDFLAGS is not None:
++		conf.log.write("python_LDFLAGS override from environment = %r\n" % (override_python_LDFLAGS))
++		python_LDFLAGS = override_python_LDFLAGS
++
++	override_python_LIBDIR = os_env.get('python_LIBDIR', None)
++	if override_python_LIBDIR is not None:
++		conf.log.write("python_LIBDIR override from environment = %r\n" % (override_python_LIBDIR))
++		python_LIBDIR = override_python_LIBDIR
++
+ 	if python_MACOSX_DEPLOYMENT_TARGET:
+ 		conf.env['MACOSX_DEPLOYMENT_TARGET'] = python_MACOSX_DEPLOYMENT_TARGET
+ 		conf.environ['MACOSX_DEPLOYMENT_TARGET'] = python_MACOSX_DEPLOYMENT_TARGET
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4-0005-builtin-heimdal-external-tools.patch b/package/samba4/samba4-0005-builtin-heimdal-external-tools.patch
new file mode 100644
index 0000000..bf0a715
--- /dev/null
+++ b/package/samba4/samba4-0005-builtin-heimdal-external-tools.patch
@@ -0,0 +1,42 @@
+Force external asn1_compile and compile_et binaries.
+At the moment the samba bundled heimdal fails to build the tools for the host
+when cross-compiling, and it can't link to an external heimdal either.
+
+Status: working with samba upstream on a proper way to cross-compile
+the bundled heimdal.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura samba-4.1.3.orig/source4/heimdal_build/wscript_build samba-4.1.3.heimdal.cross/source4/heimdal_build/wscript_build
+--- samba-4.1.3.orig/source4/heimdal_build/wscript_build	2013-12-12 16:45:46.951965484 -0300
++++ samba-4.1.3.heimdal.cross/source4/heimdal_build/wscript_build	2013-12-18 22:01:24.323429945 -0300
+@@ -925,6 +925,8 @@
+         install=False
+     )
+     bld.env['ASN1_COMPILE'] = os.path.join(bld.env['BUILD_DIRECTORY'], 'asn1_compile')
++else:
++    bld.env['ASN1_COMPILE'] = 'asn1_compile'
+ 
+ 
+ if not bld.CONFIG_SET('USING_SYSTEM_COMPILE_ET'):
+@@ -939,6 +941,8 @@
+         install=False
+         )
+     bld.env['COMPILE_ET'] = os.path.join(bld.env['BUILD_DIRECTORY'], 'compile_et')
++else:
++    bld.env['COMPILE_ET'] = 'compile_et'
+ 
+ HEIMDAL_BINARY('samba4kinit',
+     'kuser/kinit.c',
+diff -Nura samba-4.1.3.orig/source4/heimdal_build/wscript_configure samba-4.1.3.heimdal.cross/source4/heimdal_build/wscript_configure
+--- samba-4.1.3.orig/source4/heimdal_build/wscript_configure	2013-12-12 16:45:46.951965484 -0300
++++ samba-4.1.3.heimdal.cross/source4/heimdal_build/wscript_configure	2013-12-18 21:55:08.813653187 -0300
+@@ -162,6 +162,8 @@
+ conf.define('HAVE_KRB5_PRINCIPAL_GET_NUM_COMP', 1)
+ conf.define('HAVE_GSSAPI_GSSAPI_SPNEGO_H', 1)
+ conf.define('HAVE_FLAGS_IN_KRB5_CREDS', 1)
++conf.define('USING_SYSTEM_ASN1_COMPILE', 1)
++conf.define('USING_SYSTEM_COMPILE_ET', 1)
+ 
+ heimdal_includedirs = []
+ heimdal_libdirs = []
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
new file mode 100644
index 0000000..452c694
--- /dev/null
+++ b/package/samba4/samba4.mk
@@ -0,0 +1,113 @@
+################################################################################
+#
+# samba4
+#
+################################################################################
+
+SAMBA4_VERSION = 4.1.5
+SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
+SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
+SAMBA4_LICENSE = GPLv3+
+SAMBA4_LICENSE_FILES = COPYING
+SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
+	$(if $(BR2_PACKAGE_LIBCAP),libcap)
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+	SAMBA4_CONF_OPT += --with-acl-support
+	SAMBA4_DEPENDENCIES += acl
+else
+	SAMBA4_CONF_OPT += --without-acl-support
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAIO),y)
+	SAMBA4_CONF_OPT += --with-aio-support
+	SAMBA4_DEPENDENCIES += libaio
+else
+	SAMBA4_CONF_OPT += --without-aio-support
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
+	SAMBA4_CONF_OPT += --enable-avahi
+	SAMBA4_DEPENDENCIES += avahi
+else
+	SAMBA4_CONF_OPT += --disable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_GAMIN),y)
+	SAMBA4_CONF_OPT += --with-fam
+	SAMBA4_DEPENDENCIES += gamin
+else
+	SAMBA4_CONF_OPT += --without-fam
+endif
+
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+	SAMBA4_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
+	SAMBA4_DEPENDENCIES += gettext
+else
+	SAMBA4_CONF_OPT += --without-gettext
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+	SAMBA4_CONF_OPT += --enable-gnutls
+	SAMBA4_DEPENDENCIES += gnutls
+else
+	SAMBA4_CONF_OPT += --disable-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM)$(BR2_PACKAGE_NCURSES_TARGET_MENU)$(BR2_PACKAGE_NCURSES_TARGET_PANEL),yyy)
+	SAMBA4_DEPENDENCIES += ncurses
+else
+	SAMBA4_CONF_OPT += --without-regedit
+endif
+
+define SAMBA4_CONFIGURE_CMDS
+	cp package/samba4/$(call qstrip,$(BR2_ARCH))-cache.txt $(@D)/cache.txt;
+	(cd $(@D); \
+		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
+		python_LDFLAGS="" \
+		python_LIBDIR="" \
+		$(TARGET_CONFIGURE_OPTS) \
+		./buildtools/bin/waf configure \
+			--prefix=/usr \
+			--sysconfdir=/etc \
+			--localstatedir=/var \
+			--with-libiconv=$(STAGING_DIR)/usr \
+			--enable-fhs \
+			--cross-compile \
+			--cross-answers=$(@D)/cache.txt \
+			--hostcc=gcc \
+			--disable-rpath \
+			--disable-rpath-install \
+			--disable-cups \
+			--disable-iprint \
+			--without-pam \
+			--without-dmapi \
+			--disable-glusterfs \
+			--without-ldap \
+			--without-cluster-support \
+			--without-ads \
+			$(SAMBA4_CONF_OPT) \
+	)
+endef
+
+define SAMBA4_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define SAMBA4_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define SAMBA4_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/samba4/S91smb \
+		$(TARGET_DIR)/etc/init.d/S91smb
+endef
+
+# uClibc-based builds don't like libtalloc in /usr/lib/samba
+define SAMBA4_MOVE_TALLOC
+	mv -f $(TARGET_DIR)/usr/lib/samba/libtalloc* $(TARGET_DIR)/usr/lib
+endef
+
+SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_MOVE_TALLOC
+
+$(eval $(generic-package))
