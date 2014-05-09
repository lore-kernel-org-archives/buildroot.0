From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 15:04:40 +0200
Subject: [Buildroot] [git commit] samba4: update to upstream patches
Message-ID: <20140509132054.986BD9C389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c94a5431372e35221ba54b462c6d160dac03cdb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the package to use patches that have been applied upstream and
update their status comment accordingly.

f_fsid checks have been fixed via upstream patch that allows the cache
to work properly on the result.

Builtin heimdal tools can be worked around via the --bundled-libraries
option to disable those components (even if they are not libraries it
can be done that way).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-0001-build-don-t-execute-tests-summary.c.patch |    2 +-
 ...a4-0002-Minor-typo-fix-in-source3-wscript.patch |   35 ++++++++++++++++
 ...ld-don-t-execute-statfs-and-f_fsid-checks.patch |   31 --------------
 ...003-build-find-FILE_OFFSET_BITS-via-array.patch |    2 +-
 ...uild-allow-some-python-variable-overrides.patch |    2 +-
 ...-0005-build-find-blkcnt_t-size-via-array.patch} |    2 +
 ...amba4-0005-builtin-heimdal-external-tools.patch |   42 --------------------
 ...a4-0006-build-unify-and-fix-endian-tests.patch} |    2 +
 ...samba-CHECK_SIZEOF-cross-compile-friendl.patch} |    2 +
 ...ba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch} |    2 +
 package/samba4/samba4-cache.txt                    |    1 +
 package/samba4/samba4.mk                           |    1 +
 12 files changed, 48 insertions(+), 76 deletions(-)

diff --git a/package/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch b/package/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch
index d504e5c..8302487 100644
--- a/package/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch
+++ b/package/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch
@@ -7,7 +7,7 @@ tests/summary.c will never be able to be executed when cross compiling.
 Use #error and #warning directives to fail or warn accordingly when
 compiling it.
 
-Status: upstream for next branch.
+Status: Upstream.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
diff --git a/package/samba4/samba4-0002-Minor-typo-fix-in-source3-wscript.patch b/package/samba4/samba4-0002-Minor-typo-fix-in-source3-wscript.patch
new file mode 100644
index 0000000..3f5849d
--- /dev/null
+++ b/package/samba4/samba4-0002-Minor-typo-fix-in-source3-wscript.patch
@@ -0,0 +1,35 @@
+From 8dc24d4006a2e936baf73e116129d2b0a5d71ed7 Mon Sep 17 00:00:00 2001
+From: "Jose A. Rivera" <jarrpa@redhat.com>
+Date: Mon, 5 May 2014 07:29:57 -0500
+Subject: [PATCH] Minor typo fix in source3/wscript.
+
+Signed-off-by: Jose A. Rivera <jarrpa@redhat.com>
+Reviewed-by: Volker Lendecke <vl@samba.org>
+Reviewed-by: Jeremy Allison <jra@samba.org>
+
+Autobuild-User(master): Jeremy Allison <jra@samba.org>
+Autobuild-Date(master): Mon May  5 22:41:19 CEST 2014 on sn-devel-104
+
+Status: Upstream.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ source3/wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source3/wscript b/source3/wscript
+index 4fe49fa..8cbd9bc 100644
+--- a/source3/wscript
++++ b/source3/wscript
+@@ -475,7 +475,7 @@ return acl_get_perm_np(permset_d, perm);
+ 
+     conf.CHECK_CODE('struct statfs fsd; fsid_t fsid = fsd.f_fsid; return statfs(".", &fsd);',
+                     'HAVE_STATFS_F_FSID',
+-                    msg="vfs_fileid: checking for statfs() and struct statfs.f_fsid",
++                    msg="vfs_fileid checking for statfs() and struct statfs.f_fsid",
+                     headers='sys/types.h sys/statfs.h',
+                     execute=True)
+ 
+-- 
+1.8.5.5
+
diff --git a/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch b/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
deleted file mode 100644
index 9dc3185..0000000
--- a/package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5e0bafd6504916dd7de5b1ae90e7253d11498435 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 20 Jan 2014 10:17:19 -0300
-Subject: [PATCH 1/5] build: don't execute statfs and f_fsid checks
-
-There's no need to execute the statfs and statfs.f_fsid checks, the
-return value is of no consequence since it's undefined in some
-platforms and prevents cross-compiling.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- source3/wscript | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/source3/wscript b/source3/wscript
-index 4fe49fa..e81a47b 100644
---- a/source3/wscript
-+++ b/source3/wscript
-@@ -476,8 +476,7 @@ return acl_get_perm_np(permset_d, perm);
-     conf.CHECK_CODE('struct statfs fsd; fsid_t fsid = fsd.f_fsid; return statfs(".", &fsd);',
-                     'HAVE_STATFS_F_FSID',
-                     msg="vfs_fileid: checking for statfs() and struct statfs.f_fsid",
--                    headers='sys/types.h sys/statfs.h',
--                    execute=True)
-+                    headers='sys/types.h sys/statfs.h')
- 
-     if conf.CONFIG_SET('HAVE_FALLOCATE'):
-         conf.CHECK_CODE('''
--- 
-1.8.3.2
-
diff --git a/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch b/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
index 9187cd2..8dae44d 100644
--- a/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
+++ b/package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
@@ -17,7 +17,7 @@ array.
 If it's false it gives array[(-1 * 1)] thus failing with a
 negative-sized array.
 
-Status: upstream for next branch.
+Status: Upstream.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
diff --git a/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch b/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
index 53ba53c..91634b9 100644
--- a/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
+++ b/package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
@@ -11,7 +11,7 @@ Allow some of these variables to be redefined via environment variables
 in order to aid cross-compiling.
 According to testing python_LDFLAGS and python_LIBDIR should be enough.
 
-Status: upstream for next branch.
+Status: Upstream.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
diff --git a/package/samba4/samba4-0007-build-find-blkcnt_t-size-via-array.patch b/package/samba4/samba4-0005-build-find-blkcnt_t-size-via-array.patch
similarity index 99%
rename from package/samba4/samba4-0007-build-find-blkcnt_t-size-via-array.patch
rename to package/samba4/samba4-0005-build-find-blkcnt_t-size-via-array.patch
index f7e9c23..f6e4d03 100644
--- a/package/samba4/samba4-0007-build-find-blkcnt_t-size-via-array.patch
+++ b/package/samba4/samba4-0005-build-find-blkcnt_t-size-via-array.patch
@@ -7,6 +7,8 @@ Using the same trick as commit 0d9bb86293c9d39298786df095c73a6251b08b7e
 find blkcnt_t size via an array so that it can be determined via build
 rather than running it.
 
+Status: Upstream.
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  source3/wscript | 22 ++++++++++++----------
diff --git a/package/samba4/samba4-0005-builtin-heimdal-external-tools.patch b/package/samba4/samba4-0005-builtin-heimdal-external-tools.patch
deleted file mode 100644
index bf0a715..0000000
--- a/package/samba4/samba4-0005-builtin-heimdal-external-tools.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Force external asn1_compile and compile_et binaries.
-At the moment the samba bundled heimdal fails to build the tools for the host
-when cross-compiling, and it can't link to an external heimdal either.
-
-Status: working with samba upstream on a proper way to cross-compile
-the bundled heimdal.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura samba-4.1.3.orig/source4/heimdal_build/wscript_build samba-4.1.3.heimdal.cross/source4/heimdal_build/wscript_build
---- samba-4.1.3.orig/source4/heimdal_build/wscript_build	2013-12-12 16:45:46.951965484 -0300
-+++ samba-4.1.3.heimdal.cross/source4/heimdal_build/wscript_build	2013-12-18 22:01:24.323429945 -0300
-@@ -925,6 +925,8 @@
-         install=False
-     )
-     bld.env['ASN1_COMPILE'] = os.path.join(bld.env['BUILD_DIRECTORY'], 'asn1_compile')
-+else:
-+    bld.env['ASN1_COMPILE'] = 'asn1_compile'
- 
- 
- if not bld.CONFIG_SET('USING_SYSTEM_COMPILE_ET'):
-@@ -939,6 +941,8 @@
-         install=False
-         )
-     bld.env['COMPILE_ET'] = os.path.join(bld.env['BUILD_DIRECTORY'], 'compile_et')
-+else:
-+    bld.env['COMPILE_ET'] = 'compile_et'
- 
- HEIMDAL_BINARY('samba4kinit',
-     'kuser/kinit.c',
-diff -Nura samba-4.1.3.orig/source4/heimdal_build/wscript_configure samba-4.1.3.heimdal.cross/source4/heimdal_build/wscript_configure
---- samba-4.1.3.orig/source4/heimdal_build/wscript_configure	2013-12-12 16:45:46.951965484 -0300
-+++ samba-4.1.3.heimdal.cross/source4/heimdal_build/wscript_configure	2013-12-18 21:55:08.813653187 -0300
-@@ -162,6 +162,8 @@
- conf.define('HAVE_KRB5_PRINCIPAL_GET_NUM_COMP', 1)
- conf.define('HAVE_GSSAPI_GSSAPI_SPNEGO_H', 1)
- conf.define('HAVE_FLAGS_IN_KRB5_CREDS', 1)
-+conf.define('USING_SYSTEM_ASN1_COMPILE', 1)
-+conf.define('USING_SYSTEM_COMPILE_ET', 1)
- 
- heimdal_includedirs = []
- heimdal_libdirs = []
diff --git a/package/samba4/samba4-0008-build-unify-and-fix-endian-tests.patch b/package/samba4/samba4-0006-build-unify-and-fix-endian-tests.patch
similarity index 99%
rename from package/samba4/samba4-0008-build-unify-and-fix-endian-tests.patch
rename to package/samba4/samba4-0006-build-unify-and-fix-endian-tests.patch
index 4797e4c..3fdfe6e 100644
--- a/package/samba4/samba4-0008-build-unify-and-fix-endian-tests.patch
+++ b/package/samba4/samba4-0006-build-unify-and-fix-endian-tests.patch
@@ -10,6 +10,8 @@ of main scope since that will fail.
 And keep the WORDS_BIGENDIAN, HAVE_LITTLE_ENDIAN and HAVE_BIG_ENDIAN
 defines separate because of different codebases.
 
+Status: Upstream.
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  buildtools/wafsamba/wscript | 65 ++++++++++++++++++++++++++++++++++++++++++---
diff --git a/package/samba4/samba4-0009-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch b/package/samba4/samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
similarity index 99%
rename from package/samba4/samba4-0009-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
rename to package/samba4/samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
index aac8bb6..72176cb 100644
--- a/package/samba4/samba4-0009-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
+++ b/package/samba4/samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
@@ -12,6 +12,8 @@ according to each test.
 The default is True since normally it's expected to find a proper
 result and should error out if not.
 
+Status: Upstream.
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  buildtools/wafsamba/samba_autoconf.py | 28 ++++++++++++++++------------
diff --git a/package/samba4/samba4-0010-build-tweak-SIZEOF-utmp-ut_line.patch b/package/samba4/samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch
similarity index 98%
rename from package/samba4/samba4-0010-build-tweak-SIZEOF-utmp-ut_line.patch
rename to package/samba4/samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch
index c90f025..28f5f10 100644
--- a/package/samba4/samba4-0010-build-tweak-SIZEOF-utmp-ut_line.patch
+++ b/package/samba4/samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch
@@ -8,6 +8,8 @@ it's used to find out if utmp support should be enabled.
 This is necessary with the introduction of the cross-compile aware
 CHECK_SIZEOF.
 
+Status: Upstream.
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  source3/wscript | 2 +-
diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index 8e97d42..c9e34b6 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -27,6 +27,7 @@ Checking for the maximum value of the 'time_t' type: OK
 Checking whether the realpath function allows a NULL argument: OK
 Checking whether POSIX capabilities are available: OK
 Checking for ftruncate extend: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
 getcwd takes a NULL argument: OK
 Checking uname sysname type: "Linux"
 Checking uname release type: "3.0.0"
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index bd3d598..28e1458 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -88,6 +88,7 @@ define SAMBA4_CONFIGURE_CMDS
 			--without-ldap \
 			--without-cluster-support \
 			--without-ads \
+			--bundled-libraries='!asn1_compile,!compile_et' \
 			$(SAMBA4_CONF_OPT) \
 	)
 endef
