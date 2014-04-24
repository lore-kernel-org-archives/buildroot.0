From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 11:13:32 +0200
Subject: [Buildroot] [git commit] samba4: bump to version 4.1.7 and improve
	cross build
Message-ID: <20140424091343.6F97C9C9B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=002aeba3de481d8d304b5d3d301cc7047073705a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest 4.1.7 version and improve the cross-build logic.
With the new patches the build is basically architecture-agnostic making
it possible to ditch the arch-specific cache to use a generic one.
Some toolchains might not be too happy with samba4 because of bitrot,
hopefully we'll find and fix or blacklist those with autobuilder help.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/Config.in                           |    3 -
 package/samba4/arm-cache.txt                       |   65 --------
 package/samba4/powerpc-cache.txt                   |   65 --------
 ...ld-don-t-execute-statfs-and-f_fsid-checks.patch |   10 +-
 ...line-switch-to-new-style-readline-typedef.patch |   32 ----
 ...4-0007-build-find-blkcnt_t-size-via-array.patch |   52 ++++++
 ...ba4-0008-build-unify-and-fix-endian-tests.patch |  163 ++++++++++++++++++++
 ...fsamba-CHECK_SIZEOF-cross-compile-friendl.patch |   66 ++++++++
 ...mba4-0010-build-tweak-SIZEOF-utmp-ut_line.patch |   31 ++++
 package/samba4/samba4-cache.txt                    |   37 +++++
 package/samba4/samba4.mk                           |    5 +-
 package/samba4/x86_64-cache.txt                    |   65 --------
 12 files changed, 356 insertions(+), 238 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index bea26cb..c9a4712 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_USE_WCHAR # e2fsprogs
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # talloc python threads
-	# Supported architectures only limited by the cached answers
-	depends on BR2_arm || BR2_powerpc || BR2_x86_64
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_PYTHON
@@ -20,6 +18,5 @@ config BR2_PACKAGE_SAMBA4
 	  http://www.samba.org/
 
 comment "samba4 needs a toolchain w/ IPv6, wchar, largfile, threads"
-	depends on BR2_arm || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6
diff --git a/package/samba4/arm-cache.txt b/package/samba4/arm-cache.txt
deleted file mode 100644
index 70b19e3..0000000
--- a/package/samba4/arm-cache.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Checking simple C program: OK
-rpath library support: OK
--Wl,--version-script support: OK
-Checking getconf LFS_CFLAGS: NO
-Checking for large file support without additional flags: OK
-Checking for -D_LARGE_FILES: OK
-Checking correct behavior of strtoll: NO
-Checking for working strptime: OK
-Checking for C99 vsnprintf: OK
-Checking for HAVE_SHARED_MMAP: OK
-Checking for HAVE_MREMAP: OK
-Checking for HAVE_INCOHERENT_MMAP: NO
-Checking for HAVE_SECURE_MKSTEMP: OK
-Checking for HAVE_IFACE_GETIFADDRS: OK
-Checking for HAVE_LITTLE_ENDIAN - runtime: OK
-Checking for HAVE_BIG_ENDIAN - runtime: NO
-Checking for kernel change notify support: OK
-Checking for Linux kernel oplocks: OK
-Checking for kernel share modes: OK
-Checking whether blkcnt_t is 32 bit: NO
-Checking whether blkcnt_t is 64 bit: OK
-Checking if can we convert from CP850 to UCS-2LE: OK
-Checking if can we convert from UTF-8 to UCS-2LE: OK
-Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
-Checking whether we can use Linux thread-specific credentials: OK
-Checking whether setreuid is available: OK
-Checking whether setresuid is available: OK
-Checking whether seteuid is available: OK
-Checking whether fcntl locking is available: OK
-Checking for the maximum value of the 'time_t' type: OK
-Checking whether the realpath function allows a NULL argument: OK
-Checking whether POSIX capabilities are available: OK
-Checking for ftruncate extend: OK
-getcwd takes a NULL argument: OK
-Checking uname sysname type: "Linux"
-Checking uname machine type: "arm"
-Checking uname release type: "3.0.0"
-Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
-Checking for WORDS_BIGENDIAN: NO
-Checking size of bool: "1"
-Checking size of char: "1"
-Checking size of int: "4"
-Checking size of long long: "8"
-Checking size of long: "4"
-Checking size of short: "2"
-Checking size of size_t: "4"
-Checking size of ssize_t: "4"
-Checking size of int8_t: "1"
-Checking size of uint8_t: "1"
-Checking size of int16_t: "2"
-Checking size of uint16_t: "2"
-Checking size of int32_t: "4"
-Checking size of uint32_t: "4"
-Checking size of int64_t: "8"
-Checking size of uint64_t: "8"
-Checking size of void*: "4"
-Checking size of off_t: "8"
-Checking size of dev_t: "8"
-Checking size of ino_t: "8"
-Checking size of time_t: "4"
-Checking size of ((struct utmp *)NULL)->ut_line: "32"
-Checking value of NSIG: "65"
-Checking value of _NSIG: "65"
-Checking value of SIGRTMAX: "64"
-Checking value of SIGRTMIN: "34"
diff --git a/package/samba4/powerpc-cache.txt b/package/samba4/powerpc-cache.txt
deleted file mode 100644
index 2872d1d..0000000
--- a/package/samba4/powerpc-cache.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Checking simple C program: OK
-rpath library support: OK
--Wl,--version-script support: OK
-Checking getconf LFS_CFLAGS: NO
-Checking for large file support without additional flags: OK
-Checking for -D_LARGE_FILES: OK
-Checking correct behavior of strtoll: NO
-Checking for working strptime: OK
-Checking for C99 vsnprintf: OK
-Checking for HAVE_SHARED_MMAP: OK
-Checking for HAVE_MREMAP: OK
-Checking for HAVE_INCOHERENT_MMAP: NO
-Checking for HAVE_SECURE_MKSTEMP: OK
-Checking for HAVE_IFACE_GETIFADDRS: OK
-Checking for HAVE_LITTLE_ENDIAN - runtime: NO
-Checking for HAVE_BIG_ENDIAN - runtime: OK
-Checking for kernel change notify support: OK
-Checking for Linux kernel oplocks: OK
-Checking for kernel share modes: OK
-Checking whether blkcnt_t is 32 bit: NO
-Checking whether blkcnt_t is 64 bit: OK
-Checking if can we convert from CP850 to UCS-2LE: OK
-Checking if can we convert from UTF-8 to UCS-2LE: OK
-Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
-Checking whether we can use Linux thread-specific credentials: OK
-Checking whether setreuid is available: OK
-Checking whether setresuid is available: OK
-Checking whether seteuid is available: OK
-Checking whether fcntl locking is available: OK
-Checking for the maximum value of the 'time_t' type: OK
-Checking whether the realpath function allows a NULL argument: OK
-Checking whether POSIX capabilities are available: OK
-Checking for ftruncate extend: OK
-getcwd takes a NULL argument: OK
-Checking uname sysname type: "Linux"
-Checking uname machine type: "powerpc"
-Checking uname release type: "3.0.0"
-Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
-Checking for WORDS_BIGENDIAN: OK
-Checking size of bool: "1"
-Checking size of char: "1"
-Checking size of int: "4"
-Checking size of long long: "8"
-Checking size of long: "4"
-Checking size of short: "2"
-Checking size of size_t: "4"
-Checking size of ssize_t: "4"
-Checking size of int8_t: "1"
-Checking size of uint8_t: "1"
-Checking size of int16_t: "2"
-Checking size of uint16_t: "2"
-Checking size of int32_t: "4"
-Checking size of uint32_t: "4"
-Checking size of int64_t: "8"
-Checking size of uint64_t: "8"
-Checking size of void*: "4"
-Checking size of off_t: "8"
-Checking size of dev_t: "8"
-Checking size of ino_t: "8"
-Checking size of time_t: "4"
-Checking size of ((struct utmp *)NULL)->ut_line: "32"
-Checking value of NSIG: "65"
-Checking value of _NSIG: "65"
-Checking value of SIGRTMAX: "64"
-Checking value of SIGRTMIN: "34"
diff --git a/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch b/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
index ec46650..9dc3185 100644
--- a/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
+++ b/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
@@ -1,24 +1,22 @@
-From 3c16a171c008b584ed427988dde73c1d9a9de4ad Mon Sep 17 00:00:00 2001
+From 5e0bafd6504916dd7de5b1ae90e7253d11498435 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Mon, 20 Jan 2014 10:17:19 -0300
-Subject: [PATCH 2/3] build: don't execute statfs and f_fsid checks
+Subject: [PATCH 1/5] build: don't execute statfs and f_fsid checks
 
 There's no need to execute the statfs and statfs.f_fsid checks, the
 return value is of no consequence since it's undefined in some
 platforms and prevents cross-compiling.
 
-Status: sent, not yet upstream pending more testing.
-
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  source3/wscript | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/source3/wscript b/source3/wscript
-index 501707b..2d0a62e 100644
+index 4fe49fa..e81a47b 100644
 --- a/source3/wscript
 +++ b/source3/wscript
-@@ -468,8 +468,7 @@ return acl_get_perm_np(permset_d, perm);
+@@ -476,8 +476,7 @@ return acl_get_perm_np(permset_d, perm);
      conf.CHECK_CODE('struct statfs fsd; fsid_t fsid = fsd.f_fsid; return statfs(".", &fsd);',
                      'HAVE_STATFS_F_FSID',
                      msg="vfs_fileid: checking for statfs() and struct statfs.f_fsid",
diff --git a/package/samba4/samba4-0006-smbreadline-switch-to-new-style-readline-typedef.patch b/package/samba4/samba4-0006-smbreadline-switch-to-new-style-readline-typedef.patch
deleted file mode 100644
index 65d0950..0000000
--- a/package/samba4/samba4-0006-smbreadline-switch-to-new-style-readline-typedef.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0d4f18b88c3e687b83dcbe4c27f74424cf2f2043 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 3 Mar 2014 07:57:24 -0300
-Subject: [PATCH] smbreadline: switch to new-style readline typedef
-
-Function, CPFunction, CPPFunction and VFunction typedefs are considered
-old-style (deprecated) starting from readline 4.2.
-Compatibility typedefs have been in place up to readline 6.2 but were
-removed with the 6.3 release thus causing builds to break.
-Swtich to the new-style specific prototyped typedef.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- libcli/smbreadline/smbreadline.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcli/smbreadline/smbreadline.c b/libcli/smbreadline/smbreadline.c
-index cff25a7..80e10b0 100644
---- a/libcli/smbreadline/smbreadline.c
-+++ b/libcli/smbreadline/smbreadline.c
-@@ -141,7 +141,7 @@ char *smb_readline(const char *prompt, void (*callback)(void),
- 
- #if HAVE_DECL_RL_EVENT_HOOK
- 	if (callback)
--		rl_event_hook = (Function *)callback;
-+		rl_event_hook = (rl_hook_func_t *)callback;
- #endif
- 	ret = readline(prompt);
- 	if (ret && *ret)
--- 
-1.8.3.2
-
diff --git a/package/samba4/samba4-0007-build-find-blkcnt_t-size-via-array.patch b/package/samba4/samba4-0007-build-find-blkcnt_t-size-via-array.patch
new file mode 100644
index 0000000..f7e9c23
--- /dev/null
+++ b/package/samba4/samba4-0007-build-find-blkcnt_t-size-via-array.patch
@@ -0,0 +1,52 @@
+From 934f8c8e9439de4f15b2e61016d5d29233d8d5fa Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 16 Apr 2014 08:01:36 -0300
+Subject: [PATCH 5/5] build: find blkcnt_t size via array
+
+Using the same trick as commit 0d9bb86293c9d39298786df095c73a6251b08b7e
+find blkcnt_t size via an array so that it can be determined via build
+rather than running it.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ source3/wscript | 22 ++++++++++++----------
+ 1 file changed, 12 insertions(+), 10 deletions(-)
+
+diff --git a/source3/wscript b/source3/wscript
+index aade503..6a5728f 100644
+--- a/source3/wscript
++++ b/source3/wscript
+@@ -277,18 +277,20 @@ int main(int argc, char **argv)
+                                 headers='sys/types.h sys/stat.h unistd.h')
+ 
+     if "HAVE_BLKCNT_T" in conf.env:
+-	conf.CHECK_CODE('''
+-	return sizeof(blkcnt_t) == 4 ? 0 : 1''',
+-		'SIZEOF_BLKCNT_T_4', execute=True,
+-		headers='replace.h sys/types.h sys/stat.h unistd.h',
+-		msg="Checking whether blkcnt_t is 32 bit")
++        conf.CHECK_CODE('''
++        static int test_array[1 - 2 * !(((long int)(sizeof(blkcnt_t))) <= 4)];''',
++                'SIZEOF_BLKCNT_T_4',
++                headers='replace.h sys/types.h sys/stat.h unistd.h',
++                msg="Checking whether blkcnt_t is 32 bit")
+ 
++    # If sizeof is 4 it can't be 8
+     if "HAVE_BLKCNT_T" in conf.env:
+-	conf.CHECK_CODE('''
+-	return sizeof(blkcnt_t) == 8 ? 0 : 1''',
+-		'SIZEOF_BLKCNT_T_8', execute=True,
+-		headers='replace.h sys/types.h sys/stat.h unistd.h',
+-		msg="Checking whether blkcnt_t is 64 bit")
++        if not conf.CONFIG_SET('SIZEOF_BLKCNT_T_4'):
++            conf.CHECK_CODE('''
++            static int test_array[1 - 2 * !(((long int)(sizeof(blkcnt_t))) <= 8)];''',
++                    'SIZEOF_BLKCNT_T_8',
++                    headers='replace.h sys/types.h sys/stat.h unistd.h',
++                    msg="Checking whether blkcnt_t is 64 bit")
+ 
+     # Check for POSIX capability support
+     conf.CHECK_FUNCS_IN('cap_get_proc', 'cap', headers='sys/capability.h')
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4-0008-build-unify-and-fix-endian-tests.patch b/package/samba4/samba4-0008-build-unify-and-fix-endian-tests.patch
new file mode 100644
index 0000000..4797e4c
--- /dev/null
+++ b/package/samba4/samba4-0008-build-unify-and-fix-endian-tests.patch
@@ -0,0 +1,163 @@
+From ee4e06b7223fb2925bc887c89216a66029d44862 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 1 Apr 2014 06:41:47 -0300
+Subject: [PATCH 2/5] build: unify and fix endian tests
+
+Unify the endian tests out of lib/ccan/wscript into wafsamba since
+they're almost cross-compile friendly.
+While at it fix them to be so by moving the preprocessor directives out
+of main scope since that will fail.
+And keep the WORDS_BIGENDIAN, HAVE_LITTLE_ENDIAN and HAVE_BIG_ENDIAN
+defines separate because of different codebases.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ buildtools/wafsamba/wscript | 65 ++++++++++++++++++++++++++++++++++++++++++---
+ lib/ccan/wscript            | 55 --------------------------------------
+ 2 files changed, 62 insertions(+), 58 deletions(-)
+
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 7984227..1a2cfe6 100755
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -390,9 +390,68 @@ def configure(conf):
+     else:
+         conf.define('SHLIBEXT', "so", quote=True)
+ 
+-    conf.CHECK_CODE('long one = 1; return ((char *)(&one))[0]',
+-                    execute=True,
+-                    define='WORDS_BIGENDIAN')
++    # First try a header check for cross-compile friendlyness
++    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
++                        #define B __BYTE_ORDER
++                        #elif defined(BYTE_ORDER)
++                        #define B BYTE_ORDER
++                        #endif
++
++                        #ifdef __LITTLE_ENDIAN
++                        #define LITTLE __LITTLE_ENDIAN
++                        #elif defined(LITTLE_ENDIAN)
++                        #define LITTLE LITTLE_ENDIAN
++                        #endif
++
++                        #if !defined(LITTLE) || !defined(B) || LITTLE != B
++                        #error Not little endian.
++                        #endif
++                        int main(void) { return 0; }""",
++                            addmain=False,
++                            headers="endian.h sys/endian.h",
++                            define="HAVE_LITTLE_ENDIAN")
++    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
++                        #define B __BYTE_ORDER
++                        #elif defined(BYTE_ORDER)
++                        #define B BYTE_ORDER
++                        #endif
++
++                        #ifdef __BIG_ENDIAN
++                        #define BIG __BIG_ENDIAN
++                        #elif defined(BIG_ENDIAN)
++                        #define BIG BIG_ENDIAN
++                        #endif
++
++                        #if !defined(BIG) || !defined(B) || BIG != B
++                        #error Not big endian.
++                        #endif
++                        int main(void) { return 0; }""",
++                            addmain=False,
++                            headers="endian.h sys/endian.h",
++                            define="HAVE_BIG_ENDIAN")
++
++    if not conf.CONFIG_SET("HAVE_BIG_ENDIAN") and not conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
++        # That didn't work!  Do runtime test.
++        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
++            u.i = 0x01020304;
++            return u.c[0] == 0x04 && u.c[1] == 0x03 && u.c[2] == 0x02 && u.c[3] == 0x01 ? 0 : 1;""",
++                          addmain=True, execute=True,
++                          define='HAVE_LITTLE_ENDIAN',
++                          msg="Checking for HAVE_LITTLE_ENDIAN - runtime")
++        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
++            u.i = 0x01020304;
++            return u.c[0] == 0x01 && u.c[1] == 0x02 && u.c[2] == 0x03 && u.c[3] == 0x04 ? 0 : 1;""",
++                          addmain=True, execute=True,
++                          define='HAVE_BIG_ENDIAN',
++                          msg="Checking for HAVE_BIG_ENDIAN - runtime")
++
++    # Extra sanity check.
++    if conf.CONFIG_SET("HAVE_BIG_ENDIAN") == conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
++        Logs.error("Failed endian determination.  The PDP-11 is back?")
++	sys.exit(1)
++    else:
++        if conf.CONFIG_SET("HAVE_BIG_ENDIAN"):
++            conf.DEFINE('WORDS_BIGENDIAN', 1)
+ 
+     # check if signal() takes a void function
+     if conf.CHECK_CODE('return *(signal (0, 0)) (0) == 1',
+diff --git a/lib/ccan/wscript b/lib/ccan/wscript
+index 1c5f337..0e540db 100644
+--- a/lib/ccan/wscript
++++ b/lib/ccan/wscript
+@@ -25,61 +25,6 @@ def configure(conf):
+     conf.CHECK_CODE('int __attribute__((used)) func(int x) { return x; }',
+                     addmain=False, link=False, cflags=conf.env['WERROR_CFLAGS'],
+                     define='HAVE_ATTRIBUTE_USED')
+-    # We try to use headers for a compile-time test.
+-    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
+-                        #define B __BYTE_ORDER
+-                        #elif defined(BYTE_ORDER)
+-                        #define B BYTE_ORDER
+-                        #endif
+-
+-                        #ifdef __LITTLE_ENDIAN
+-                        #define LITTLE __LITTLE_ENDIAN
+-                        #elif defined(LITTLE_ENDIAN)
+-                        #define LITTLE LITTLE_ENDIAN
+-                        #endif
+-
+-                        #if !defined(LITTLE) || !defined(B) || LITTLE != B
+-                        #error Not little endian.
+-                        #endif""",
+-                           headers="endian.h sys/endian.h",
+-                           define="HAVE_LITTLE_ENDIAN")
+-    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
+-                        #define B __BYTE_ORDER
+-                        #elif defined(BYTE_ORDER)
+-                        #define B BYTE_ORDER
+-                        #endif
+-
+-                        #ifdef __BIG_ENDIAN
+-                        #define BIG __BIG_ENDIAN
+-                        #elif defined(BIG_ENDIAN)
+-                        #define BIG BIG_ENDIAN
+-                        #endif
+-
+-                        #if !defined(BIG) || !defined(B) || BIG != B
+-                        #error Not big endian.
+-                        #endif""",
+-                           headers="endian.h sys/endian.h",
+-                           define="HAVE_BIG_ENDIAN")
+-
+-    if not conf.CONFIG_SET("HAVE_BIG_ENDIAN") and not conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
+-        # That didn't work!  Do runtime test.
+-        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
+-	  u.i = 0x01020304;
+-	  return u.c[0] == 0x04 && u.c[1] == 0x03 && u.c[2] == 0x02 && u.c[3] == 0x01 ? 0 : 1;""",
+-                        addmain=True, execute=True,
+-                        define='HAVE_LITTLE_ENDIAN',
+-                        msg="Checking for HAVE_LITTLE_ENDIAN - runtime")
+-        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
+-	  u.i = 0x01020304;
+-	  return u.c[0] == 0x01 && u.c[1] == 0x02 && u.c[2] == 0x03 && u.c[3] == 0x04 ? 0 : 1;""",
+-                        addmain=True, execute=True,
+-                        define='HAVE_BIG_ENDIAN',
+-                        msg="Checking for HAVE_BIG_ENDIAN - runtime")
+-
+-    # Extra sanity check.
+-    if conf.CONFIG_SET("HAVE_BIG_ENDIAN") == conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
+-        Logs.error("Failed endian determination.  The PDP-11 is back?")
+-        sys.exit(1)
+ 
+     conf.CHECK_CODE('return __builtin_choose_expr(1, 0, "garbage");',
+                     link=True,
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4-0009-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch b/package/samba4/samba4-0009-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
new file mode 100644
index 0000000..aac8bb6
--- /dev/null
+++ b/package/samba4/samba4-0009-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
@@ -0,0 +1,66 @@
+From fd3eb1e9f712e4c96c0b55d4203745afb2bcc8c2 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 9 Apr 2014 10:21:59 -0300
+Subject: [PATCH 3/5] build: make wafsamba CHECK_SIZEOF cross-compile friendly
+
+Use the same trick as commit 0d9bb86293c9d39298786df095c73a6251b08b7e
+We do the same array trick iteratively starting from 1 (byte) by powers
+of 2 up to 32.
+
+The new 'critical' option is used to make the invocation die or not
+according to each test.
+The default is True since normally it's expected to find a proper
+result and should error out if not.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ buildtools/wafsamba/samba_autoconf.py | 28 ++++++++++++++++------------
+ 1 file changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/samba_autoconf.py
+index 59d9e79..f60ce9d 100644
+--- a/buildtools/wafsamba/samba_autoconf.py
++++ b/buildtools/wafsamba/samba_autoconf.py
+@@ -304,23 +304,27 @@ def CHECK_FUNCS(conf, list, link=True, lib=None, headers=None):
+ 
+ 
+ @conf
+-def CHECK_SIZEOF(conf, vars, headers=None, define=None):
++def CHECK_SIZEOF(conf, vars, headers=None, define=None, critical=True):
+     '''check the size of a type'''
+-    ret = True
+     for v in TO_LIST(vars):
+         v_define = define
++        ret = False
+         if v_define is None:
+             v_define = 'SIZEOF_%s' % v.upper().replace(' ', '_')
+-        if not CHECK_CODE(conf,
+-                          'printf("%%u", (unsigned)sizeof(%s))' % v,
+-                          define=v_define,
+-                          execute=True,
+-                          define_ret=True,
+-                          quote=False,
+-                          headers=headers,
+-                          local_include=False,
+-                          msg="Checking size of %s" % v):
+-            ret = False
++        for size in list((1, 2, 4, 8, 16, 32)):
++            if CHECK_CODE(conf,
++                      'static int test_array[1 - 2 * !(((long int)(sizeof(%s))) <= %d)];' % (v, size),
++                      define=v_define,
++                      quote=False,
++                      headers=headers,
++                      local_include=False,
++                      msg="Checking if size of %s == %d" % (v, size)):
++                conf.DEFINE(v_define, size)
++                ret = True
++                break
++        if not ret and critical:
++            Logs.error("Couldn't determine size of '%s'" % v)
++            sys.exit(1)
+     return ret
+ 
+ @conf
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4-0010-build-tweak-SIZEOF-utmp-ut_line.patch b/package/samba4/samba4-0010-build-tweak-SIZEOF-utmp-ut_line.patch
new file mode 100644
index 0000000..c90f025
--- /dev/null
+++ b/package/samba4/samba4-0010-build-tweak-SIZEOF-utmp-ut_line.patch
@@ -0,0 +1,31 @@
+From 1a7f4f5e3fbbe83e147fffdfe00d7f37181a8ec1 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 9 Apr 2014 10:39:06 -0300
+Subject: [PATCH 4/5] build: tweak SIZEOF utmp->ut_line
+
+Set the critical parameter of CHECK_SIZEOF utmp->ut_line to False since
+it's used to find out if utmp support should be enabled.
+This is necessary with the introduction of the cross-compile aware
+CHECK_SIZEOF.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ source3/wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source3/wscript b/source3/wscript
+index e81a47b..aade503 100644
+--- a/source3/wscript
++++ b/source3/wscript
+@@ -812,7 +812,7 @@ msg.msg_acctrightslen = sizeof(fd);
+                         'PUTUTLINE_RETURNS_UTMP', headers='utmp.h',
+                         msg="Checking whether pututline returns pointer")
+         conf.CHECK_SIZEOF(['((struct utmp *)NULL)->ut_line'], headers='utmp.h',
+-                          define='SIZEOF_UTMP_UT_LINE')
++                          define='SIZEOF_UTMP_UT_LINE', critical=False)
+         if not conf.CONFIG_SET('SIZEOF_UTMP_UT_LINE'):
+             conf.env.with_utmp = False
+         elif int(conf.env.SIZEOF_UTMP_UT_LINE) < 15:
+-- 
+1.8.3.2
+
diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
new file mode 100644
index 0000000..8e97d42
--- /dev/null
+++ b/package/samba4/samba4-cache.txt
@@ -0,0 +1,37 @@
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
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
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
+Checking uname release type: "3.0.0"
+Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 939cf0c..bd3d598 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.6
+SAMBA4_VERSION = 4.1.7
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
@@ -62,7 +62,8 @@ else
 endif
 
 define SAMBA4_CONFIGURE_CMDS
-	cp package/samba4/$(call qstrip,$(BR2_ARCH))-cache.txt $(@D)/cache.txt;
+	cp package/samba4/samba4-cache.txt $(@D)/cache.txt;
+	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
 	(cd $(@D); \
 		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
 		python_LDFLAGS="" \
diff --git a/package/samba4/x86_64-cache.txt b/package/samba4/x86_64-cache.txt
deleted file mode 100644
index 6c98cfe..0000000
--- a/package/samba4/x86_64-cache.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Checking simple C program: OK
-rpath library support: OK
--Wl,--version-script support: OK
-Checking getconf LFS_CFLAGS: NO
-Checking for large file support without additional flags: OK
-Checking for -D_LARGE_FILES: OK
-Checking correct behavior of strtoll: NO
-Checking for working strptime: OK
-Checking for C99 vsnprintf: OK
-Checking for HAVE_SHARED_MMAP: OK
-Checking for HAVE_MREMAP: OK
-Checking for HAVE_INCOHERENT_MMAP: NO
-Checking for HAVE_SECURE_MKSTEMP: OK
-Checking for HAVE_IFACE_GETIFADDRS: OK
-Checking for HAVE_LITTLE_ENDIAN - runtime: OK
-Checking for HAVE_BIG_ENDIAN - runtime: NO
-Checking for kernel change notify support: OK
-Checking for Linux kernel oplocks: OK
-Checking for kernel share modes: OK
-Checking whether blkcnt_t is 32 bit: NO
-Checking whether blkcnt_t is 64 bit: OK
-Checking if can we convert from CP850 to UCS-2LE: OK
-Checking if can we convert from UTF-8 to UCS-2LE: OK
-Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
-Checking whether we can use Linux thread-specific credentials: OK
-Checking whether setreuid is available: OK
-Checking whether setresuid is available: OK
-Checking whether seteuid is available: OK
-Checking whether fcntl locking is available: OK
-Checking for the maximum value of the 'time_t' type: OK
-Checking whether the realpath function allows a NULL argument: OK
-Checking whether POSIX capabilities are available: OK
-Checking for ftruncate extend: OK
-getcwd takes a NULL argument: OK
-Checking uname sysname type: "Linux"
-Checking uname machine type: "x86_64"
-Checking uname release type: "3.0.0"
-Checking uname version type: "#1 Tue Nov 1 12:34:56 UTC 2013"
-Checking for WORDS_BIGENDIAN: NO
-Checking size of bool: "1"
-Checking size of char: "1"
-Checking size of int: "4"
-Checking size of long long: "8"
-Checking size of long: "8"
-Checking size of short: "2"
-Checking size of size_t: "8"
-Checking size of ssize_t: "8"
-Checking size of int8_t: "1"
-Checking size of uint8_t: "1"
-Checking size of int16_t: "2"
-Checking size of uint16_t: "2"
-Checking size of int32_t: "4"
-Checking size of uint32_t: "4"
-Checking size of int64_t: "8"
-Checking size of uint64_t: "8"
-Checking size of void*: "8"
-Checking size of off_t: "8"
-Checking size of dev_t: "8"
-Checking size of ino_t: "8"
-Checking size of time_t: "8"
-Checking size of ((struct utmp *)NULL)->ut_line: "32"
-Checking value of NSIG: "65"
-Checking value of _NSIG: "65"
-Checking value of SIGRTMAX: "64"
-Checking value of SIGRTMIN: "34"
