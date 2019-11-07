From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 22:11:15 +0100
Subject: [Buildroot] [git commit branch/next] package/samba4: bump version
 to 4.11.2
Message-ID: <20191107211939.C36528E9FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e365ff6619781813c017261b4b62978382a2688c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added patches from upstream bug tracker to fix cross-compile problems,
removed patches applied upstream and rebase remaining patches.

The dependency to gnutls is now mandatory:
https://blog.cryptomilk.org/2019/10/02/samba-and-gnutls/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-libreplace-disable-libbsd-support.patch   |   8 +-
 ...build-on-64bit-platforms-by-including-std.patch | 111 ----
 package/samba4/0002-waf-upgrade-to-2.0.18.patch    | 736 +++++++++++++++++++++
 ..._regfio.c-include-stdint.h-before-cmoka.h.patch |  38 --
 ...e-test_args-instead-of-exec_args-to-suppo.patch |  62 ++
 package/samba4/0004-cross_compile-fix.patch        |  94 ---
 ...oid-pre-forking-if-cross-compilation-is-e.patch |  40 ++
 package/samba4/0005-fix_unistd_incl.patch          |  27 -
 ...a-pass-environment-to-cross-execute-tests.patch |  36 +
 ...0006-autobuild-harden-samba-xc-test-suite.patch |  59 ++
 ...pre-built-heimdal-build-tools-in-case-of-.patch |  86 +++
 package/samba4/0008-Fix-unistd.h-include.patch     |  38 ++
 ...d-wscript_build-do-not-add-host-include-.patch} |   9 +-
 package/samba4/Config.in                           |   2 +-
 package/samba4/samba4.hash                         |   4 +-
 package/samba4/samba4.mk                           |  11 +-
 16 files changed, 1070 insertions(+), 291 deletions(-)

diff --git a/package/samba4/0001-libreplace-disable-libbsd-support.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
index ae46c447fd..a303fa6669 100644
--- a/package/samba4/0001-libreplace-disable-libbsd-support.patch
+++ b/package/samba4/0001-libreplace-disable-libbsd-support.patch
@@ -1,4 +1,4 @@
-From fc0304ba92ec7ae9a2f75fbc31d97fee39d19665 Mon Sep 17 00:00:00 2001
+From 4df82c9e03b68dc1621fe4c9ac6a29ae3e64e07e Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Wed, 7 Sep 2016 23:03:43 -0300
 Subject: [PATCH] libreplace: disable libbsd support
@@ -16,10 +16,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 15 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 6c7de5953f0..ac230d719f7 100644
+index 240d730cbee..c6d8df43c74 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -304,21 +304,6 @@ def configure(conf):
+@@ -381,21 +381,6 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -42,5 +42,5 @@ index 6c7de5953f0..ac230d719f7 100644
                  struct ucred cred;
                  socklen_t cred_len;
 -- 
-2.18.0
+2.20.1
 
diff --git a/package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch b/package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
deleted file mode 100644
index 450f8a2ce4..0000000000
--- a/package/samba4/0002-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From e3e9755989b158b2497d2c449db445cf7f93de56 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 28 Jan 2018 11:57:11 +0100
-Subject: [PATCH] Fix uClibc build on 64bit platforms by including stdint.h
-
-Fixes an error detected by buildroot autobuilders:
-http://autobuild.buildroot.net/results/573/573e2268e205e10d1352fa81122d8f225fdb4575/build-end.log
-
-/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27:
-error: conflicting types for 'uintptr_t'
- typedef unsigned long int uintptr_t;
-                           ^
-In file included from ../lib/ldb/tests/ldb_msg.c:17:0:
-../third_party/cmocka/cmocka.h:126:28: note: previous declaration of 'uintptr_t' was here
-       typedef unsigned int uintptr_t;
-
-The define __WORDSIZE is missing when cmocka.h decides how to
-define uintptr_t, this patch includes stdint.h when needed.
-
-Patch sent upstream:
-https://lists.samba.org/archive/samba-technical/2018-January/125306.html
-
-[updated for samba-4.8.4, v2 sent upstream
- https://lists.samba.org/archive/samba-technical/2018-August/129732.html,
- updated for samba-4.9.1 & 4.10.6]
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- lib/ldb/tests/ldb_kv_ops_test.c  | 1 +
- lib/ldb/tests/ldb_tdb_test.c     | 1 +
- lib/ldb/tests/test_ldb_dn.c      | 1 +
- lib/ldb/tests/test_ldb_qsort.c   | 1 +
- lib/util/tests/test_ms_fnmatch.c | 1 +
- source3/lib/test_tldap.c         | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/lib/ldb/tests/ldb_kv_ops_test.c b/lib/ldb/tests/ldb_kv_ops_test.c
-index d6a4dc058e5..8b230200cba 100644
---- a/lib/ldb/tests/ldb_kv_ops_test.c
-+++ b/lib/ldb/tests/ldb_kv_ops_test.c
-@@ -46,6 +46,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/ldb/tests/ldb_tdb_test.c b/lib/ldb/tests/ldb_tdb_test.c
-index 8418dbfd671..ef91ba54756 100644
---- a/lib/ldb/tests/ldb_tdb_test.c
-+++ b/lib/ldb/tests/ldb_tdb_test.c
-@@ -40,6 +40,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/ldb/tests/test_ldb_dn.c b/lib/ldb/tests/test_ldb_dn.c
-index 4965dcef575..37eeedc1d70 100644
---- a/lib/ldb/tests/test_ldb_dn.c
-+++ b/lib/ldb/tests/test_ldb_dn.c
-@@ -19,6 +19,7 @@
- 
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/ldb/tests/test_ldb_qsort.c b/lib/ldb/tests/test_ldb_qsort.c
-index 06e80d94379..663cf0e7564 100644
---- a/lib/ldb/tests/test_ldb_qsort.c
-+++ b/lib/ldb/tests/test_ldb_qsort.c
-@@ -19,6 +19,7 @@
- 
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/util/tests/test_ms_fnmatch.c b/lib/util/tests/test_ms_fnmatch.c
-index 7fe8ed05e28..d11c7bed4be 100644
---- a/lib/util/tests/test_ms_fnmatch.c
-+++ b/lib/util/tests/test_ms_fnmatch.c
-@@ -19,6 +19,7 @@
- 
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/source3/lib/test_tldap.c b/source3/lib/test_tldap.c
-index a6c2f2117cb..659c5a7371a 100644
---- a/source3/lib/test_tldap.c
-+++ b/source3/lib/test_tldap.c
-@@ -20,6 +20,7 @@
- 
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
--- 
-2.20.1
-
diff --git a/package/samba4/0002-waf-upgrade-to-2.0.18.patch b/package/samba4/0002-waf-upgrade-to-2.0.18.patch
new file mode 100644
index 0000000000..16db24c4cf
--- /dev/null
+++ b/package/samba4/0002-waf-upgrade-to-2.0.18.patch
@@ -0,0 +1,736 @@
+From 9fdae71c29e7e80f463c0205b508d52c2bb7385b Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <uri@samba.org>
+Date: Mon, 7 Oct 2019 00:36:42 +0300
+Subject: [PATCH] waf: upgrade to 2.0.18
+
+This is required to get the new test_args parameter to conf.check, which
+facilitates passing arguments to configuration test programs.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13846
+
+Signed-off-by: Uri Simchoni <uri@samba.org>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ buildtools/bin/waf                            |   2 +-
+ buildtools/wafsamba/wafsamba.py               |   2 +-
+ third_party/waf/waflib/Configure.py           |  20 +-
+ third_party/waf/waflib/Context.py             |   6 +-
+ third_party/waf/waflib/Scripting.py           |   7 +-
+ third_party/waf/waflib/TaskGen.py             |   2 +-
+ third_party/waf/waflib/Tools/asm.py           |  37 +++-
+ third_party/waf/waflib/Tools/c_aliases.py     |   6 +-
+ third_party/waf/waflib/Tools/c_config.py      |   9 +-
+ third_party/waf/waflib/Tools/c_tests.py       |   3 +-
+ third_party/waf/waflib/Tools/gas.py           |   1 +
+ third_party/waf/waflib/Tools/javaw.py         |   2 +-
+ third_party/waf/waflib/Tools/nasm.py          |   5 +
+ third_party/waf/waflib/Tools/python.py        |  27 ++-
+ third_party/waf/waflib/extras/doxygen.py      |  11 +-
+ third_party/waf/waflib/extras/fast_partial.py |  28 ++-
+ third_party/waf/waflib/extras/genpybind.py    | 194 ++++++++++++++++++
+ third_party/waf/waflib/extras/local_rpath.py  |   8 +-
+ third_party/waf/waflib/extras/objcopy.py      |   9 +-
+ 19 files changed, 329 insertions(+), 50 deletions(-)
+ create mode 100644 third_party/waf/waflib/extras/genpybind.py
+
+diff --git a/buildtools/bin/waf b/buildtools/bin/waf
+index 8413f2332b7..11ce8e7480a 100755
+--- a/buildtools/bin/waf
++++ b/buildtools/bin/waf
+@@ -32,7 +32,7 @@ POSSIBILITY OF SUCH DAMAGE.
+ 
+ import os, sys, inspect
+ 
+-VERSION="2.0.17"
++VERSION="2.0.18"
+ REVISION="x"
+ GIT="x"
+ INSTALL="x"
+diff --git a/buildtools/wafsamba/wafsamba.py b/buildtools/wafsamba/wafsamba.py
+index 76d65ebfcb6..205d5b4ac32 100644
+--- a/buildtools/wafsamba/wafsamba.py
++++ b/buildtools/wafsamba/wafsamba.py
+@@ -38,7 +38,7 @@ LIB_PATH="shared"
+ 
+ os.environ['PYTHONUNBUFFERED'] = '1'
+ 
+-if Context.HEXVERSION not in (0x2001100,):
++if Context.HEXVERSION not in (0x2001200,):
+     Logs.error('''
+ Please use the version of waf that comes with Samba, not
+ a system installed version. See http://wiki.samba.org/index.php/Waf
+diff --git a/third_party/waf/waflib/Configure.py b/third_party/waf/waflib/Configure.py
+index db09c0e3a40..5762eb66954 100644
+--- a/third_party/waf/waflib/Configure.py
++++ b/third_party/waf/waflib/Configure.py
+@@ -524,7 +524,7 @@ def run_build(self, *k, **kw):
+ 	Though this function returns *0* by default, the build may set an attribute named *retval* on the
+ 	build context object to return a particular value. See :py:func:`waflib.Tools.c_config.test_exec_fun` for example.
+ 
+-	This function also provides a limited cache. To use it, provide the following option::
++	This function also features a cache which can be enabled by the following option::
+ 
+ 		def options(opt):
+ 			opt.add_option('--confcache', dest='confcache', default=0,
+@@ -535,10 +535,21 @@ def run_build(self, *k, **kw):
+ 		$ waf configure --confcache
+ 
+ 	"""
+-	lst = [str(v) for (p, v) in kw.items() if p != 'env']
+-	h = Utils.h_list(lst)
++	buf = []
++	for key in sorted(kw.keys()):
++		v = kw[key]
++		if hasattr(v, '__call__'):
++			buf.append(Utils.h_fun(v))
++		else:
++			buf.append(str(v))
++	h = Utils.h_list(buf)
+ 	dir = self.bldnode.abspath() + os.sep + (not Utils.is_win32 and '.' or '') + 'conf_check_' + Utils.to_hex(h)
+ 
++	cachemode = kw.get('confcache', getattr(Options.options, 'confcache', None))
++
++	if not cachemode and os.path.exists(dir):
++		shutil.rmtree(dir)
++
+ 	try:
+ 		os.makedirs(dir)
+ 	except OSError:
+@@ -549,7 +560,6 @@ def run_build(self, *k, **kw):
+ 	except OSError:
+ 		self.fatal('cannot use the configuration test folder %r' % dir)
+ 
+-	cachemode = getattr(Options.options, 'confcache', None)
+ 	if cachemode == 1:
+ 		try:
+ 			proj = ConfigSet.ConfigSet(os.path.join(dir, 'cache_run_build'))
+@@ -589,7 +599,7 @@ def run_build(self, *k, **kw):
+ 		else:
+ 			ret = getattr(bld, 'retval', 0)
+ 	finally:
+-		if cachemode == 1:
++		if cachemode:
+ 			# cache the results each time
+ 			proj = ConfigSet.ConfigSet()
+ 			proj['cache_run_build'] = ret
+diff --git a/third_party/waf/waflib/Context.py b/third_party/waf/waflib/Context.py
+index d0759aada58..e3305fa3341 100644
+--- a/third_party/waf/waflib/Context.py
++++ b/third_party/waf/waflib/Context.py
+@@ -11,13 +11,13 @@ from waflib import Utils, Errors, Logs
+ import waflib.Node
+ 
+ # the following 3 constants are updated on each new release (do not touch)
+-HEXVERSION=0x2001100
++HEXVERSION=0x2001200
+ """Constant updated on new releases"""
+ 
+-WAFVERSION="2.0.17"
++WAFVERSION="2.0.18"
+ """Constant updated on new releases"""
+ 
+-WAFREVISION="6bc6cb599c702e985780e9f705b291b812123693"
++WAFREVISION="314689b8994259a84f0de0aaef74d7ce91f541ad"
+ """Git revision when the waf version is updated"""
+ 
+ ABI = 20
+diff --git a/third_party/waf/waflib/Scripting.py b/third_party/waf/waflib/Scripting.py
+index ae17a8b4503..68dccf29ce0 100644
+--- a/third_party/waf/waflib/Scripting.py
++++ b/third_party/waf/waflib/Scripting.py
+@@ -332,7 +332,12 @@ def distclean(ctx):
+ 		else:
+ 			remove_and_log(env.out_dir, shutil.rmtree)
+ 
+-		for k in (env.out_dir, env.top_dir, env.run_dir):
++		env_dirs = [env.out_dir]
++		if not ctx.options.no_lock_in_top:
++			env_dirs.append(env.top_dir)
++		if not ctx.options.no_lock_in_run:
++			env_dirs.append(env.run_dir)
++		for k in env_dirs:
+ 			p = os.path.join(k, Options.lockfile)
+ 			remove_and_log(p, os.remove)
+ 
+diff --git a/third_party/waf/waflib/TaskGen.py b/third_party/waf/waflib/TaskGen.py
+index 532b7d5cdb4..f8f92bd57c1 100644
+--- a/third_party/waf/waflib/TaskGen.py
++++ b/third_party/waf/waflib/TaskGen.py
+@@ -905,7 +905,7 @@ def process_subst(self):
+ 		# paranoid safety measure for the general case foo.in->foo.h with ambiguous dependencies
+ 		for xt in HEADER_EXTS:
+ 			if b.name.endswith(xt):
+-				tsk.ext_in = tsk.ext_in + ['.h']
++				tsk.ext_out = tsk.ext_out + ['.h']
+ 				break
+ 
+ 		inst_to = getattr(self, 'install_path', None)
+diff --git a/third_party/waf/waflib/Tools/asm.py b/third_party/waf/waflib/Tools/asm.py
+index b6f26fb3df3..a57e83bb5ec 100644
+--- a/third_party/waf/waflib/Tools/asm.py
++++ b/third_party/waf/waflib/Tools/asm.py
+@@ -34,9 +34,22 @@ Support for pure asm programs and libraries should also work::
+ 			target = 'asmtest')
+ """
+ 
+-from waflib import Task
++import re
++from waflib import Errors, Logs, Task
+ from waflib.Tools.ccroot import link_task, stlink_task
+ from waflib.TaskGen import extension
++from waflib.Tools import c_preproc
++
++re_lines = re.compile(
++	'^[ \t]*(?:%)[ \t]*(ifdef|ifndef|if|else|elif|endif|include|import|define|undef)[ \t]*(.*)\r*$',
++	re.IGNORECASE | re.MULTILINE)
++
++class asm_parser(c_preproc.c_parser):
++	def filter_comments(self, node):
++		code = node.read()
++		code = c_preproc.re_nl.sub('', code)
++		code = c_preproc.re_cpp.sub(c_preproc.repl, code)
++		return re_lines.findall(code)
+ 
+ class asm(Task.Task):
+ 	"""
+@@ -45,6 +58,28 @@ class asm(Task.Task):
+ 	color = 'BLUE'
+ 	run_str = '${AS} ${ASFLAGS} ${ASMPATH_ST:INCPATHS} ${DEFINES_ST:DEFINES} ${AS_SRC_F}${SRC} ${AS_TGT_F}${TGT}'
+ 
++	def scan(self):
++		if self.env.ASM_NAME == 'gas':
++			return c_preproc.scan(self)
++			Logs.warn('There is no dependency scanner for Nasm!')
++			return  [[], []]
++		elif self.env.ASM_NAME == 'nasm':
++			Logs.warn('The Nasm dependency scanner is incomplete!')
++
++		try:
++			incn = self.generator.includes_nodes
++		except AttributeError:
++			raise Errors.WafError('%r is missing the "asm" feature' % self.generator)
++
++		if c_preproc.go_absolute:
++			nodepaths = incn
++		else:
++			nodepaths = [x for x in incn if x.is_child_of(x.ctx.srcnode) or x.is_child_of(x.ctx.bldnode)]
++
++		tmp = asm_parser(nodepaths)
++		tmp.start(self.inputs[0], self.env)
++		return (tmp.nodes, tmp.names)
++
+ @extension('.s', '.S', '.asm', '.ASM', '.spp', '.SPP')
+ def asm_hook(self, node):
+ 	"""
+diff --git a/third_party/waf/waflib/Tools/c_aliases.py b/third_party/waf/waflib/Tools/c_aliases.py
+index c9d53692e8f..985e048bdb7 100644
+--- a/third_party/waf/waflib/Tools/c_aliases.py
++++ b/third_party/waf/waflib/Tools/c_aliases.py
+@@ -47,10 +47,12 @@ def sniff_features(**kw):
+ 		if x in exts:
+ 			feats.append('cxx')
+ 			break
+-
+ 	if 'c' in exts or 'vala' in exts or 'gs' in exts:
+ 		feats.append('c')
+ 
++	if 's' in exts or 'S' in exts:
++		feats.append('asm')
++
+ 	for x in 'f f90 F F90 for FOR'.split():
+ 		if x in exts:
+ 			feats.append('fc')
+@@ -66,7 +68,7 @@ def sniff_features(**kw):
+ 	if typ in ('program', 'shlib', 'stlib'):
+ 		will_link = False
+ 		for x in feats:
+-			if x in ('cxx', 'd', 'fc', 'c'):
++			if x in ('cxx', 'd', 'fc', 'c', 'asm'):
+ 				feats.append(x + typ)
+ 				will_link = True
+ 		if not will_link and not kw.get('features', []):
+diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf/waflib/Tools/c_config.py
+index d546be95614..80580cc9fcb 100644
+--- a/third_party/waf/waflib/Tools/c_config.py
++++ b/third_party/waf/waflib/Tools/c_config.py
+@@ -659,20 +659,21 @@ class test_exec(Task.Task):
+ 	"""
+ 	color = 'PINK'
+ 	def run(self):
++		cmd = [self.inputs[0].abspath()] + getattr(self.generator, 'test_args', [])
+ 		if getattr(self.generator, 'rpath', None):
+ 			if getattr(self.generator, 'define_ret', False):
+-				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()])
++				self.generator.bld.retval = self.generator.bld.cmd_and_log(cmd)
+ 			else:
+-				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()])
++				self.generator.bld.retval = self.generator.bld.exec_command(cmd)
+ 		else:
+ 			env = self.env.env or {}
+ 			env.update(dict(os.environ))
+ 			for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH', 'PATH'):
+ 				env[var] = self.inputs[0].parent.abspath() + os.path.pathsep + env.get(var, '')
+ 			if getattr(self.generator, 'define_ret', False):
+-				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env)
++				self.generator.bld.retval = self.generator.bld.cmd_and_log(cmd, env=env)
+ 			else:
+-				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env)
++				self.generator.bld.retval = self.generator.bld.exec_command(cmd, env=env)
+ 
+ @feature('test_exec')
+ @after_method('apply_link')
+diff --git a/third_party/waf/waflib/Tools/c_tests.py b/third_party/waf/waflib/Tools/c_tests.py
+index f858df5763c..7a4094f2450 100644
+--- a/third_party/waf/waflib/Tools/c_tests.py
++++ b/third_party/waf/waflib/Tools/c_tests.py
+@@ -224,6 +224,7 @@ def check_endianness(self):
+ 	def check_msg(self):
+ 		return tmp[0]
+ 	self.check(fragment=ENDIAN_FRAGMENT, features='c grep_for_endianness',
+-		msg='Checking for endianness', define='ENDIANNESS', tmp=tmp, okmsg=check_msg)
++		msg='Checking for endianness', define='ENDIANNESS', tmp=tmp,
++		okmsg=check_msg, confcache=None)
+ 	return tmp[0]
+ 
+diff --git a/third_party/waf/waflib/Tools/gas.py b/third_party/waf/waflib/Tools/gas.py
+index 77afed7038f..4a8745afd7e 100644
+--- a/third_party/waf/waflib/Tools/gas.py
++++ b/third_party/waf/waflib/Tools/gas.py
+@@ -16,3 +16,4 @@ def configure(conf):
+ 	conf.env.ASLNK_TGT_F = ['-o']
+ 	conf.find_ar()
+ 	conf.load('asm')
++	conf.env.ASM_NAME = 'gas'
+diff --git a/third_party/waf/waflib/Tools/javaw.py b/third_party/waf/waflib/Tools/javaw.py
+index fd1cf469abf..ceb08c28c87 100644
+--- a/third_party/waf/waflib/Tools/javaw.py
++++ b/third_party/waf/waflib/Tools/javaw.py
+@@ -246,7 +246,7 @@ def use_javac_files(self):
+ 				self.javac_task.dep_nodes.extend(tg.jar_task.outputs)
+ 			else:
+ 				if hasattr(tg, 'outdir'):
+-					base_node = tg.outdir.abspath()
++					base_node = tg.outdir
+ 				else:
+ 					base_node = tg.path.get_bld()
+ 
+diff --git a/third_party/waf/waflib/Tools/nasm.py b/third_party/waf/waflib/Tools/nasm.py
+index 411d5826b5d..9c51c18de18 100644
+--- a/third_party/waf/waflib/Tools/nasm.py
++++ b/third_party/waf/waflib/Tools/nasm.py
+@@ -24,3 +24,8 @@ def configure(conf):
+ 	conf.env.ASLNK_TGT_F = ['-o']
+ 	conf.load('asm')
+ 	conf.env.ASMPATH_ST = '-I%s' + os.sep
++	txt = conf.cmd_and_log(conf.env.AS + ['--version'])
++	if 'yasm' in txt.lower():
++		conf.env.ASM_NAME = 'yasm'
++	else:
++		conf.env.ASM_NAME = 'nasm'
+diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
+index 63a8917d7c1..7c45a76ffd2 100644
+--- a/third_party/waf/waflib/Tools/python.py
++++ b/third_party/waf/waflib/Tools/python.py
+@@ -79,14 +79,19 @@ def process_py(self, node):
+ 	"""
+ 	Add signature of .py file, so it will be byte-compiled when necessary
+ 	"""
+-	assert(hasattr(self, 'install_path')), 'add features="py"'
++	assert(hasattr(self, 'install_path')), 'add features="py" for target "%s" in "%s/wscript".' % (self.target, self.path.nice_path())
++	self.install_from = getattr(self, 'install_from', None)
++	relative_trick = getattr(self, 'relative_trick', True)
++	if self.install_from:
++		assert isinstance(self.install_from, Node.Node), \
++		'add features="py" for target "%s" in "%s/wscript" (%s).' % (self.target, self.path.nice_path(), type(self.install_from))
+ 
+ 	# where to install the python file
+ 	if self.install_path:
+ 		if self.install_from:
+-			self.add_install_files(install_to=self.install_path, install_from=node, cwd=self.install_from, relative_trick=True)
++			self.add_install_files(install_to=self.install_path, install_from=node, cwd=self.install_from, relative_trick=relative_trick)
+ 		else:
+-			self.add_install_files(install_to=self.install_path, install_from=node, relative_trick=True)
++			self.add_install_files(install_to=self.install_path, install_from=node, relative_trick=relative_trick)
+ 
+ 	lst = []
+ 	if self.env.PYC:
+@@ -96,9 +101,11 @@ def process_py(self, node):
+ 
+ 	if self.install_path:
+ 		if self.install_from:
+-			pyd = Utils.subst_vars("%s/%s" % (self.install_path, node.path_from(self.install_from)), self.env)
++			target_dir = node.path_from(self.install_from) if relative_trick else node.name
++			pyd = Utils.subst_vars("%s/%s" % (self.install_path, target_dir), self.env)
+ 		else:
+-			pyd = Utils.subst_vars("%s/%s" % (self.install_path, node.path_from(self.path)), self.env)
++			target_dir = node.path_from(self.path) if relative_trick else node.name
++			pyd = Utils.subst_vars("%s/%s" % (self.install_path, target_dir), self.env)
+ 	else:
+ 		pyd = node.abspath()
+ 
+@@ -115,7 +122,7 @@ def process_py(self, node):
+ 		tsk.pyd = pyd
+ 
+ 		if self.install_path:
+-			self.add_install_files(install_to=os.path.dirname(pyd), install_from=pyobj, cwd=node.parent.get_bld(), relative_trick=True)
++			self.add_install_files(install_to=os.path.dirname(pyd), install_from=pyobj, cwd=node.parent.get_bld(), relative_trick=relative_trick)
+ 
+ class pyc(Task.Task):
+ 	"""
+@@ -433,11 +440,11 @@ def check_python_headers(conf, features='pyembed pyext'):
+ 
+ 	# Code using the Python API needs to be compiled with -fno-strict-aliasing
+ 	if env.CC_NAME == 'gcc':
+-		env.append_value('CFLAGS_PYEMBED', ['-fno-strict-aliasing'])
+-		env.append_value('CFLAGS_PYEXT', ['-fno-strict-aliasing'])
++		env.append_unique('CFLAGS_PYEMBED', ['-fno-strict-aliasing'])
++		env.append_unique('CFLAGS_PYEXT', ['-fno-strict-aliasing'])
+ 	if env.CXX_NAME == 'gcc':
+-		env.append_value('CXXFLAGS_PYEMBED', ['-fno-strict-aliasing'])
+-		env.append_value('CXXFLAGS_PYEXT', ['-fno-strict-aliasing'])
++		env.append_unique('CXXFLAGS_PYEMBED', ['-fno-strict-aliasing'])
++		env.append_unique('CXXFLAGS_PYEXT', ['-fno-strict-aliasing'])
+ 
+ 	if env.CC_NAME == "msvc":
+ 		from distutils.msvccompiler import MSVCCompiler
+diff --git a/third_party/waf/waflib/extras/doxygen.py b/third_party/waf/waflib/extras/doxygen.py
+index 423d8455025..20cd9e1a852 100644
+--- a/third_party/waf/waflib/extras/doxygen.py
++++ b/third_party/waf/waflib/extras/doxygen.py
+@@ -85,6 +85,12 @@ class doxygen(Task.Task):
+ 		if not getattr(self, 'pars', None):
+ 			txt = self.inputs[0].read()
+ 			self.pars = parse_doxy(txt)
++
++			# Override with any parameters passed to the task generator
++			if getattr(self.generator, 'pars', None):
++				for k, v in self.generator.pars.items():
++					self.pars[k] = v
++
+ 			if self.pars.get('OUTPUT_DIRECTORY'):
+ 				# Use the path parsed from the Doxyfile as an absolute path
+ 				output_node = self.inputs[0].parent.get_bld().make_node(self.pars['OUTPUT_DIRECTORY'])
+@@ -94,11 +100,6 @@ class doxygen(Task.Task):
+ 			output_node.mkdir()
+ 			self.pars['OUTPUT_DIRECTORY'] = output_node.abspath()
+ 
+-			# Override with any parameters passed to the task generator
+-			if getattr(self.generator, 'pars', None):
+-				for k, v in self.generator.pars.items():
+-					self.pars[k] = v
+-
+ 			self.doxy_inputs = getattr(self, 'doxy_inputs', [])
+ 			if not self.pars.get('INPUT'):
+ 				self.doxy_inputs.append(self.inputs[0].parent)
+diff --git a/third_party/waf/waflib/extras/fast_partial.py b/third_party/waf/waflib/extras/fast_partial.py
+index 71b8318eecb..90a94723bb8 100644
+--- a/third_party/waf/waflib/extras/fast_partial.py
++++ b/third_party/waf/waflib/extras/fast_partial.py
+@@ -18,6 +18,7 @@ Usage::
+ 		opt.load('fast_partial')
+ 
+ Assumptions:
++* Start with a clean build (run "waf distclean" after enabling)
+ * Mostly for C/C++/Fortran targets with link tasks (object-only targets are not handled)
+   try it in the folder generated by utils/genbench.py
+ * For full project builds: no --targets and no pruning from subfolders
+@@ -131,12 +132,18 @@ class bld_proxy(object):
+ 			data[x] = getattr(self, x)
+ 		db = os.path.join(self.variant_dir, Context.DBFILE + self.store_key)
+ 
+-		try:
+-			waflib.Node.pickle_lock.acquire()
++		with waflib.Node.pickle_lock:
+ 			waflib.Node.Nod3 = self.node_class
+-			x = Build.cPickle.dumps(data, Build.PROTOCOL)
+-		finally:
+-			waflib.Node.pickle_lock.release()
++			try:
++				x = Build.cPickle.dumps(data, Build.PROTOCOL)
++			except Build.cPickle.PicklingError:
++				root = data['root']
++				for node_deps in data['node_deps'].values():
++					for idx, node in enumerate(node_deps):
++						# there may be more cross-context Node objects to fix,
++						# but this should be the main source
++						node_deps[idx] = root.find_node(node.abspath())
++				x = Build.cPickle.dumps(data, Build.PROTOCOL)
+ 
+ 		Logs.debug('rev_use: storing %s', db)
+ 		Utils.writef(db + '.tmp', x, m='wb')
+@@ -393,12 +400,17 @@ def is_stale(self):
+ 		Logs.debug('rev_use: must post %r because this is a clean build')
+ 		return True
+ 
+-	# 3. check if the configuration changed
+-	if os.stat(self.bld.bldnode.find_node('c4che/build.config.py').abspath()).st_mtime > dbstat:
++	# 3.a check if the configuration exists
++	cache_node = self.bld.bldnode.find_node('c4che/build.config.py')
++	if not cache_node:
++		return True
++
++	# 3.b check if the configuration changed
++	if os.stat(cache_node.abspath()).st_mtime > dbstat:
+ 		Logs.debug('rev_use: must post %r because the configuration has changed', self.name)
+ 		return True
+ 
+-	# 3.a any tstamp data?
++	# 3.c any tstamp data?
+ 	try:
+ 		f_deps = self.bld.f_deps
+ 	except AttributeError:
+diff --git a/third_party/waf/waflib/extras/genpybind.py b/third_party/waf/waflib/extras/genpybind.py
+new file mode 100644
+index 00000000000..ac206ee8a8b
+--- /dev/null
++++ b/third_party/waf/waflib/extras/genpybind.py
+@@ -0,0 +1,194 @@
++import os
++import pipes
++import subprocess
++import sys
++
++from waflib import Logs, Task, Context
++from waflib.Tools.c_preproc import scan as scan_impl
++# ^-- Note: waflib.extras.gccdeps.scan does not work for us,
++# due to its current implementation:
++# The -MD flag is injected into the {C,CXX}FLAGS environment variable and
++# dependencies are read out in a separate step after compiling by reading
++# the .d file saved alongside the object file.
++# As the genpybind task refers to a header file that is never compiled itself,
++# gccdeps will not be able to extract the list of dependencies.
++
++from waflib.TaskGen import feature, before_method
++
++
++def join_args(args):
++    return " ".join(pipes.quote(arg) for arg in args)
++
++
++def configure(cfg):
++    cfg.load("compiler_cxx")
++    cfg.load("python")
++    cfg.check_python_version(minver=(2, 7))
++    if not cfg.env.LLVM_CONFIG:
++        cfg.find_program("llvm-config", var="LLVM_CONFIG")
++    if not cfg.env.GENPYBIND:
++        cfg.find_program("genpybind", var="GENPYBIND")
++
++    # find clang reasource dir for builtin headers
++    cfg.env.GENPYBIND_RESOURCE_DIR = os.path.join(
++            cfg.cmd_and_log(cfg.env.LLVM_CONFIG + ["--libdir"]).strip(),
++            "clang",
++            cfg.cmd_and_log(cfg.env.LLVM_CONFIG + ["--version"]).strip())
++    if os.path.exists(cfg.env.GENPYBIND_RESOURCE_DIR):
++        cfg.msg("Checking clang resource dir", cfg.env.GENPYBIND_RESOURCE_DIR)
++    else:
++        cfg.fatal("Clang resource dir not found")
++
++
++ at feature("genpybind")
++ at before_method("process_source")
++def generate_genpybind_source(self):
++    """
++    Run genpybind on the headers provided in `source` and compile/link the
++    generated code instead.  This works by generating the code on the fly and
++    swapping the source node before `process_source` is run.
++    """
++    # name of module defaults to name of target
++    module = getattr(self, "module", self.target)
++
++    # create temporary source file in build directory to hold generated code
++    out = "genpybind-%s.%d.cpp" % (module, self.idx)
++    out = self.path.get_bld().find_or_declare(out)
++
++    task = self.create_task("genpybind", self.to_nodes(self.source), out)
++    # used to detect whether CFLAGS or CXXFLAGS should be passed to genpybind
++    task.features = self.features
++    task.module = module
++    # can be used to select definitions to include in the current module
++    # (when header files are shared by more than one module)
++    task.genpybind_tags = self.to_list(getattr(self, "genpybind_tags", []))
++    # additional include directories
++    task.includes = self.to_list(getattr(self, "includes", []))
++    task.genpybind = self.env.GENPYBIND
++
++    # Tell waf to compile/link the generated code instead of the headers
++    # originally passed-in via the `source` parameter. (see `process_source`)
++    self.source = [out]
++
++
++class genpybind(Task.Task): # pylint: disable=invalid-name
++    """
++    Runs genpybind on headers provided as input to this task.
++    Generated code will be written to the first (and only) output node.
++    """
++    quiet = True
++    color = "PINK"
++    scan = scan_impl
++
++    @staticmethod
++    def keyword():
++        return "Analyzing"
++
++    def run(self):
++        if not self.inputs:
++            return
++
++        args = self.find_genpybind() + self._arguments(
++                resource_dir=self.env.GENPYBIND_RESOURCE_DIR)
++
++        output = self.run_genpybind(args)
++
++        # For debugging / log output
++        pasteable_command = join_args(args)
++
++        # write generated code to file in build directory
++        # (will be compiled during process_source stage)
++        (output_node,) = self.outputs
++        output_node.write("// {}\n{}\n".format(
++            pasteable_command.replace("\n", "\n// "), output))
++
++    def find_genpybind(self):
++        return self.genpybind
++
++    def run_genpybind(self, args):
++        bld = self.generator.bld
++
++        kwargs = dict(cwd=bld.variant_dir)
++        if hasattr(bld, "log_command"):
++            bld.log_command(args, kwargs)
++        else:
++            Logs.debug("runner: {!r}".format(args))
++        proc = subprocess.Popen(
++            args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, **kwargs)
++        stdout, stderr = proc.communicate()
++
++        if not isinstance(stdout, str):
++            stdout = stdout.decode(sys.stdout.encoding, errors="replace")
++        if not isinstance(stderr, str):
++            stderr = stderr.decode(sys.stderr.encoding, errors="replace")
++
++        if proc.returncode != 0:
++            bld.fatal(
++                "genpybind returned {code} during the following call:"
++                "\n{command}\n\n{stdout}\n\n{stderr}".format(
++                    code=proc.returncode,
++                    command=join_args(args),
++                    stdout=stdout,
++                    stderr=stderr,
++                ))
++
++        if stderr.strip():
++            Logs.debug("non-fatal warnings during genpybind run:\n{}".format(stderr))
++
++        return stdout
++
++    def _include_paths(self):
++        return self.generator.to_incnodes(self.includes + self.env.INCLUDES)
++
++    def _inputs_as_relative_includes(self):
++        include_paths = self._include_paths()
++        relative_includes = []
++        for node in self.inputs:
++            for inc in include_paths:
++                if node.is_child_of(inc):
++                    relative_includes.append(node.path_from(inc))
++                    break
++            else:
++                self.generator.bld.fatal("could not resolve {}".format(node))
++        return relative_includes
++
++    def _arguments(self, genpybind_parse=None, resource_dir=None):
++        args = []
++        relative_includes = self._inputs_as_relative_includes()
++        is_cxx = "cxx" in self.features
++
++        # options for genpybind
++        args.extend(["--genpybind-module", self.module])
++        if self.genpybind_tags:
++            args.extend(["--genpybind-tag"] + self.genpybind_tags)
++        if relative_includes:
++            args.extend(["--genpybind-include"] + relative_includes)
++        if genpybind_parse:
++            args.extend(["--genpybind-parse", genpybind_parse])
++
++        args.append("--")
++
++        # headers to be processed by genpybind
++        args.extend(node.abspath() for node in self.inputs)
++
++        args.append("--")
++
++        # options for clang/genpybind-parse
++        args.append("-D__GENPYBIND__")
++        args.append("-xc++" if is_cxx else "-xc")
++        has_std_argument = False
++        for flag in self.env["CXXFLAGS" if is_cxx else "CFLAGS"]:
++            flag = flag.replace("-std=gnu", "-std=c")
++            if flag.startswith("-std=c"):
++                has_std_argument = True
++            args.append(flag)
++        if not has_std_argument:
++            args.append("-std=c++14")
++        args.extend("-I{}".format(n.abspath()) for n in self._include_paths())
++        args.extend("-D{}".format(p) for p in self.env.DEFINES)
++
++        # point to clang resource dir, if specified
++        if resource_dir:
++            args.append("-resource-dir={}".format(resource_dir))
++
++        return args
+diff --git a/third_party/waf/waflib/extras/local_rpath.py b/third_party/waf/waflib/extras/local_rpath.py
+index b2507e17a10..e3923d9b9d4 100644
+--- a/third_party/waf/waflib/extras/local_rpath.py
++++ b/third_party/waf/waflib/extras/local_rpath.py
+@@ -2,18 +2,20 @@
+ # encoding: utf-8
+ # Thomas Nagy, 2011 (ita)
+ 
++import copy
+ from waflib.TaskGen import after_method, feature
+ 
+ @after_method('propagate_uselib_vars')
+ @feature('cprogram', 'cshlib', 'cxxprogram', 'cxxshlib', 'fcprogram', 'fcshlib')
+ def add_rpath_stuff(self):
+-	all = self.to_list(getattr(self, 'use', []))
++	all = copy.copy(self.to_list(getattr(self, 'use', [])))
+ 	while all:
+ 		name = all.pop()
+ 		try:
+ 			tg = self.bld.get_tgen_by_name(name)
+ 		except:
+ 			continue
+-		self.env.append_value('RPATH', tg.link_task.outputs[0].parent.abspath())
+-		all.extend(self.to_list(getattr(tg, 'use', [])))
++		if hasattr(tg, 'link_task'):
++			self.env.append_value('RPATH', tg.link_task.outputs[0].parent.abspath())
++			all.extend(self.to_list(getattr(tg, 'use', [])))
+ 
+diff --git a/third_party/waf/waflib/extras/objcopy.py b/third_party/waf/waflib/extras/objcopy.py
+index 82d8359ecf7..bb7ca6ef224 100644
+--- a/third_party/waf/waflib/extras/objcopy.py
++++ b/third_party/waf/waflib/extras/objcopy.py
+@@ -15,7 +15,7 @@ objcopy_flags		  Additional flags passed to objcopy.
+ """
+ 
+ from waflib.Utils import def_attrs
+-from waflib import Task
++from waflib import Task, Options
+ from waflib.TaskGen import feature, after_method
+ 
+ class objcopy(Task.Task):
+@@ -46,5 +46,8 @@ def map_objcopy(self):
+ 		self.add_install_files(install_to=self.objcopy_install_path, install_from=task.outputs[0])
+ 
+ def configure(ctx):
+-	ctx.find_program('objcopy', var='OBJCOPY', mandatory=True)
+-
++	program_name = 'objcopy'
++	prefix = getattr(Options.options, 'cross_prefix', None)
++	if prefix:
++		program_name = '{}-{}'.format(prefix, program_name)
++	ctx.find_program(program_name, var='OBJCOPY', mandatory=True)
+-- 
+2.20.1
+
diff --git a/package/samba4/0003-test_regfio.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0003-test_regfio.c-include-stdint.h-before-cmoka.h.patch
deleted file mode 100644
index 2415d57d70..0000000000
--- a/package/samba4/0003-test_regfio.c-include-stdint.h-before-cmoka.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bed8720dce64181c188c23a28506a88cd2e1ee4f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 11 May 2019 00:07:50 +0200
-Subject: [PATCH] test_regfio.c: include stdint.h before cmoka.h
-
-This fix the following build failure on mips64el:
-/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
- typedef unsigned long int uintptr_t;
-                           ^
-In file included from ../source3/registry/tests/test_regfio.c:23:0:
-../third_party/cmocka/cmocka.h:126:28: note: previous declaration of 'uintptr_t' was here
-       typedef unsigned int uintptr_t;
-
-Fixes:
- - http://autobuild.buildroot.org/results/bae0508e84c905dc23ad7cf1153cd1e9d8e4d734
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/samba-team/samba/merge_requests/442]
----
- source3/registry/tests/test_regfio.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/source3/registry/tests/test_regfio.c b/source3/registry/tests/test_regfio.c
-index 86a217661f3..f945e653708 100644
---- a/source3/registry/tests/test_regfio.c
-+++ b/source3/registry/tests/test_regfio.c
-@@ -20,6 +20,7 @@
- #include <stdarg.h>
- #include <stddef.h>
- #include <setjmp.h>
-+#include <stdint.h>
- #include <cmocka.h>
- 
- #include <errno.h>
--- 
-2.20.1
-
diff --git a/package/samba4/0003-wafsamba-use-test_args-instead-of-exec_args-to-suppo.patch b/package/samba4/0003-wafsamba-use-test_args-instead-of-exec_args-to-suppo.patch
new file mode 100644
index 0000000000..4495f5610d
--- /dev/null
+++ b/package/samba4/0003-wafsamba-use-test_args-instead-of-exec_args-to-suppo.patch
@@ -0,0 +1,62 @@
+From 0daf4e72271951e21afa73911e304df1b046909c Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <uri@samba.org>
+Date: Mon, 7 Oct 2019 00:37:17 +0300
+Subject: [PATCH] wafsamba: use test_args instead of exec_args to support
+ cross-compilation
+
+exec_args seems to have been a custom addition to Samba's copy of waf.
+Upstream Waf has an identically-purposed parameter called test_args.
+
+This parameter is being used for addiing runtime args to test programs that
+are being run during configuration phases.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13846
+
+Signed-off-by: Uri Simchoni <uri@samba.org>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ buildtools/wafsamba/samba_autoconf.py | 6 +++---
+ buildtools/wafsamba/samba_cross.py    | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/samba_autoconf.py
+index 8e5dfb87102..62d3e20a15c 100644
+--- a/buildtools/wafsamba/samba_autoconf.py
++++ b/buildtools/wafsamba/samba_autoconf.py
+@@ -423,9 +423,9 @@ def CHECK_CODE(conf, code, define,
+     cflags.extend(ccflags)
+ 
+     if on_target:
+-        exec_args = conf.SAMBA_CROSS_ARGS(msg=msg)
++        test_args = conf.SAMBA_CROSS_ARGS(msg=msg)
+     else:
+-        exec_args = []
++        test_args = []
+ 
+     conf.COMPOUND_START(msg)
+ 
+@@ -440,7 +440,7 @@ def CHECK_CODE(conf, code, define,
+                      type=type,
+                      msg=msg,
+                      quote=quote,
+-                     exec_args=exec_args,
++                     test_args=test_args,
+                      define_ret=define_ret)
+     except Exception:
+         if always:
+diff --git a/buildtools/wafsamba/samba_cross.py b/buildtools/wafsamba/samba_cross.py
+index 8863c2c53e7..60ddf967237 100644
+--- a/buildtools/wafsamba/samba_cross.py
++++ b/buildtools/wafsamba/samba_cross.py
+@@ -139,7 +139,7 @@ class cross_Popen(Utils.subprocess.Popen):
+ 
+ @conf
+ def SAMBA_CROSS_ARGS(conf, msg=None):
+-    '''get exec_args to pass when running cross compiled binaries'''
++    '''get test_args to pass when running cross compiled binaries'''
+     if not conf.env.CROSS_COMPILE:
+         return []
+ 
+-- 
+2.20.1
+
diff --git a/package/samba4/0004-cross_compile-fix.patch b/package/samba4/0004-cross_compile-fix.patch
deleted file mode 100644
index 45655a9c4c..0000000000
--- a/package/samba4/0004-cross_compile-fix.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From a197e0cafb276a9b732f914b1f679ebb487b47f1 Mon Sep 17 00:00:00 2001
-From: pinglin <pinglin@synology.com>
-Date: Tue, 19 Mar 2019 20:46:27 +0800
-Subject: [PATCH] cross_compile argument doesn't apply
-
-reproduce:
-	./configure --cross-compile --cross-answers=XXX
-
-The output log now will show correct cross-answers.
-
-Downloaded from
-https://github.com/openwrt/packages/blob/master/net/samba4/patches/003-samba-4-10-cross_compile-fix.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- third_party/waf/waflib/Context.py        | 20 ++++++++++++++++++--
- third_party/waf/waflib/Tools/c_config.py | 11 +++++++----
- 2 files changed, 25 insertions(+), 6 deletions(-)
-
-diff --git a/third_party/waf/waflib/Context.py b/third_party/waf/waflib/Context.py
-index 3222fb1551c..d1c87512095 100644
---- a/third_party/waf/waflib/Context.py
-+++ b/third_party/waf/waflib/Context.py
-@@ -359,8 +359,16 @@ class Context(ctx):
- 
- 		encoding = kw.pop('decode_as', default_encoding)
- 
-+		exec_args = kw.pop('exec_args', [])
-+		if isinstance(cmd, str):
-+			cmd = [cmd] + exec_args
-+		elif isinstance(cmd, list):
-+			cmd = cmd + exec_args
- 		try:
--			ret, out, err = Utils.run_process(cmd, kw, cargs)
-+			if exec_args:
-+				ret, out, err = Utils.run_regular_process(cmd, kw, cargs)
-+			else:
-+				ret, out, err = Utils.run_process(cmd, kw, cargs)
- 		except Exception as e:
- 			raise Errors.WafError('Execution failure: %s' % str(e), ex=e)
- 
-@@ -438,8 +446,16 @@ class Context(ctx):
- 
- 		encoding = kw.pop('decode_as', default_encoding)
- 
-+		exec_args = kw.pop('exec_args', [])
-+		if isinstance(cmd, str):
-+			cmd = [cmd] + exec_args
-+		elif isinstance(cmd, list):
-+			cmd = cmd + exec_args
- 		try:
--			ret, out, err = Utils.run_process(cmd, kw, cargs)
-+			if exec_args:
-+				ret, out, err = Utils.run_regular_process(cmd, kw, cargs)
-+			else:
-+				ret, out, err = Utils.run_process(cmd, kw, cargs)
- 		except Exception as e:
- 			raise Errors.WafError('Execution failure: %s' % str(e), ex=e)
- 
-diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf/waflib/Tools/c_config.py
-index 76082152cd9..25e468b0844 100644
---- a/third_party/waf/waflib/Tools/c_config.py
-+++ b/third_party/waf/waflib/Tools/c_config.py
-@@ -660,20 +660,23 @@ class test_exec(Task.Task):
- 	"""
- 	color = 'PINK'
- 	def run(self):
-+		exec_args = Utils.to_list(self.generator.exec_args)
-+
- 		if getattr(self.generator, 'rpath', None):
- 			if getattr(self.generator, 'define_ret', False):
--				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()])
-+				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], exec_args=exec_args)
- 			else:
--				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()])
-+				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], exec_args=exec_args)
- 		else:
- 			env = self.env.env or {}
- 			env.update(dict(os.environ))
- 			for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH', 'PATH'):
- 				env[var] = self.inputs[0].parent.abspath() + os.path.pathsep + env.get(var, '')
-+
- 			if getattr(self.generator, 'define_ret', False):
--				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env)
-+				self.generator.bld.retval = self.generator.bld.cmd_and_log([self.inputs[0].abspath()], env=env, exec_args=exec_args)
- 			else:
--				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env)
-+				self.generator.bld.retval = self.generator.bld.exec_command([self.inputs[0].abspath()], env=env, exec_args=exec_args)
- 
- @feature('test_exec')
- @after_method('apply_link')
--- 
-2.17.1
-
diff --git a/package/samba4/0004-wafsamba-avoid-pre-forking-if-cross-compilation-is-e.patch b/package/samba4/0004-wafsamba-avoid-pre-forking-if-cross-compilation-is-e.patch
new file mode 100644
index 0000000000..5005e01508
--- /dev/null
+++ b/package/samba4/0004-wafsamba-avoid-pre-forking-if-cross-compilation-is-e.patch
@@ -0,0 +1,40 @@
+From 9c3cf5f67053124c6bbdf9c4705fa1d2d416f873 Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <uri@samba.org>
+Date: Mon, 7 Oct 2019 00:37:31 +0300
+Subject: [PATCH] wafsamba: avoid pre-forking if cross-compilation is enabled
+
+Waf supports pre-forking to run configuration tests, but this
+doesn't play well with Samba's cross-compilation support, because
+Samba monkey-patches the actual fork+exec, which doesn't happen
+in a pre-forked process pool.
+
+This patch emulates the impact of WAF_NO_PREFORK env var when
+cross-compilation is enabled.
+
+The blueprint for the solution has been suggested by Thomas Nagy
+in https://bugzilla.samba.org/show_bug.cgi?id=13846#c7 (item #2)
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13846
+
+Signed-off-by: Uri Simchoni <uri@samba.org>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ buildtools/wafsamba/samba_cross.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/buildtools/wafsamba/samba_cross.py b/buildtools/wafsamba/samba_cross.py
+index 60ddf967237..6fca470f2b7 100644
+--- a/buildtools/wafsamba/samba_cross.py
++++ b/buildtools/wafsamba/samba_cross.py
+@@ -147,6 +147,8 @@ def SAMBA_CROSS_ARGS(conf, msg=None):
+     if real_Popen is None:
+         real_Popen  = Utils.subprocess.Popen
+         Utils.subprocess.Popen = cross_Popen
++        Utils.run_process = Utils.run_regular_process
++        Utils.get_process = Utils.alloc_process_pool = Utils.nada
+ 
+     ret = []
+ 
+-- 
+2.20.1
+
diff --git a/package/samba4/0005-fix_unistd_incl.patch b/package/samba4/0005-fix_unistd_incl.patch
deleted file mode 100644
index 80467fadf6..0000000000
--- a/package/samba4/0005-fix_unistd_incl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Fix unistd.h include
-
-Fixes build error
-
-source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as different kind of symbol
- static struct et_list link = { 0, 0 };
-
-Downloaded from
-https://github.com/openwrt/packages/blob/master/net/samba4/patches/006-samba-4-10-musl_rm_unistd_incl.patch
-
-Upstream bug report: https://bugzilla.samba.org/show_bug.cgi?id=13856
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- a/lib/replace/replace.h
-+++ b/lib/replace/replace.h
-@@ -162,10 +162,6 @@
- #include <bsd/unistd.h>
- #endif
- 
--#ifdef HAVE_UNISTD_H
--#include <unistd.h>
--#endif
--
- #ifdef HAVE_STRING_H
- #include <string.h>
- #endif
diff --git a/package/samba4/0005-wafsamba-pass-environment-to-cross-execute-tests.patch b/package/samba4/0005-wafsamba-pass-environment-to-cross-execute-tests.patch
new file mode 100644
index 0000000000..7b37b0458f
--- /dev/null
+++ b/package/samba4/0005-wafsamba-pass-environment-to-cross-execute-tests.patch
@@ -0,0 +1,36 @@
+From 8a173f08d32960091d0ee9cab1b1e1e6df17c85a Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <uri@samba.org>
+Date: Mon, 7 Oct 2019 00:37:41 +0300
+Subject: [PATCH] wafsamba: pass environment to cross-execute tests
+
+This can come in handy for cross-execute scripts in general, and
+is particularly required by the samba-xc test for cross-answers /
+cross-execute, because Samba sets LD_LIBRARY_PATH during rpath
+checks, and the test program needs that in order to successfully
+run.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13846
+
+Signed-off-by: Uri Simchoni <uri@samba.org>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ buildtools/wafsamba/samba_cross.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/buildtools/wafsamba/samba_cross.py b/buildtools/wafsamba/samba_cross.py
+index 6fca470f2b7..0868a855a0d 100644
+--- a/buildtools/wafsamba/samba_cross.py
++++ b/buildtools/wafsamba/samba_cross.py
+@@ -120,7 +120,8 @@ class cross_Popen(Utils.subprocess.Popen):
+             if use_answers:
+                 p = real_Popen(newargs,
+                                stdout=Utils.subprocess.PIPE,
+-                               stderr=Utils.subprocess.PIPE)
++                               stderr=Utils.subprocess.PIPE,
++                               env=kw.get('env', {}))
+                 ce_out, ce_err = p.communicate()
+                 ans = (p.returncode, samba_utils.get_string(ce_out))
+                 add_answer(ca_file, msg, ans)
+-- 
+2.20.1
+
diff --git a/package/samba4/0006-autobuild-harden-samba-xc-test-suite.patch b/package/samba4/0006-autobuild-harden-samba-xc-test-suite.patch
new file mode 100644
index 0000000000..ddd4e136ad
--- /dev/null
+++ b/package/samba4/0006-autobuild-harden-samba-xc-test-suite.patch
@@ -0,0 +1,59 @@
+From 74e95015050ed3dd7229140f2f0f7f0b7a2d8c01 Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <uri@samba.org>
+Date: Wed, 9 Oct 2019 21:53:43 +0300
+Subject: [PATCH] autobuild: harden samba-xc test suite
+
+Add more checks which directly test the behavior of
+--cross-answers and --cross-execute.
+
+Previous test tested things in a round-about way, checking
+that running in all three modes (native, cross-execute,
+cross-answers) yields the same result. It was vulnerable
+to a degradation in which cross-compilation modes didn't
+work at all and were running native tests, which is
+what happened with the upgrade of waf.
+
+The added tests check the following:
+- That cross-excute with cross-answers sets the cross-answers file
+- That the content of cross-answers file actually affects the build
+  configuration
+- That a missing line in cross-answers fails the build
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13846
+
+Signed-off-by: Uri Simchoni <uri@samba.org>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ script/autobuild.py | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/script/autobuild.py b/script/autobuild.py
+index ef75f507add..465d1950ec2 100755
+--- a/script/autobuild.py
++++ b/script/autobuild.py
+@@ -430,12 +430,22 @@ tasks = {
+         ("configure-native", "./configure.developer --with-selftest-prefix=./bin/ab" + samba_configure_params),
+         ("configure-cross-execute", "./configure.developer --out ./bin-xe --cross-compile --cross-execute=script/identity_cc.sh" \
+             " --cross-answers=./bin-xe/cross-answers.txt --with-selftest-prefix=./bin-xe/ab" + samba_configure_params),
++        ("verify-cross-execute-output", "grep '^Checking value of NSIG' ./bin-xe/cross-answers.txt"),
+         ("configure-cross-answers", "./configure.developer --out ./bin-xa --cross-compile" \
+             " --cross-answers=./bin-xe/cross-answers.txt --with-selftest-prefix=./bin-xa/ab" + samba_configure_params),
+         ("compare-results", "script/compare_cc_results.py "
+             "./bin/c4che/default{} "
+             "./bin-xe/c4che/default{} "
+             "./bin-xa/c4che/default{}".format(*([CACHE_SUFFIX]*3))),
++        ("modify-cross-answers", "sed -i.bak -e 's/^\\(Checking value of NSIG:\\) .*/\\1 \"1234\"/' ./bin-xe/cross-answers.txt"),
++        ("configure-cross-answers-modified", "./configure.developer --out ./bin-xa2 --cross-compile" \
++            " --cross-answers=./bin-xe/cross-answers.txt --with-selftest-prefix=./bin-xa2/ab" + samba_configure_params),
++        ("verify-cross-answers", "test $(sed -n -e 's/VALUEOF_NSIG = \\(.*\\)/\\1/p' ./bin-xa2/c4che/default{})" \
++            " = \"'1234'\"".format(CACHE_SUFFIX)),
++        ("invalidate-cross-answers", "sed -i.bak -e '/^Checking value of NSIG/d' ./bin-xe/cross-answers.txt"),
++        ("configure-cross-answers-fail", "./configure.developer --out ./bin-xa3 --cross-compile" \
++            " --cross-answers=./bin-xe/cross-answers.txt --with-selftest-prefix=./bin-xa3/ab" + samba_configure_params + \
++            " ; test $? -ne 0"),
+         ],
+ 
+     # test build with -O3 -- catches extra warnings and bugs, tests the ad_dc environments
+-- 
+2.20.1
+
diff --git a/package/samba4/0007-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0007-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
new file mode 100644
index 0000000000..3405e1b0cf
--- /dev/null
+++ b/package/samba4/0007-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -0,0 +1,86 @@
+From e002d2ef2688d5433d2bd03aa4d77a0ec5ac4e63 Mon Sep 17 00:00:00 2001
+From: Uri Simchoni <uri@samba.org>
+Date: Sun, 20 Oct 2019 00:03:14 +0300
+Subject: [PATCH] build: find pre-built heimdal build tools in case of embedded
+ heimdal
+
+This patch fixes the case of finding asn1_compile and compile_et for
+building embedded heimdal, by setting
+--bundled-libraries='!asn1_compile,!compile_et' as configure flags.
+
+The Heimdal build tools compile_et and asn1_compile are needed *only*
+if we use the embedded heimdal (otherwise we don't build heimdal and
+use headers that have been generated by those tools elsewhere).
+
+For cross-compilation with embedded heimdal, it is vital to use host build
+tools, and so asn1_compile and compile_et must be supplied and not
+built. One way of doing this would be to set the COMPILE_ET and
+ASN1_COMPILE env vars to the location of supplied binaries. Another way,
+which is more commonly used, is to exclude asn1_compile and compile_et
+from bundled packages via the switch
+-bundled-libraries='!asn1_compile,!compile_et'. When this is done,
+the build script searches the path for those tools and sets the
+ASN1_COMPILE and COMPILE_ET vars accordingly. (this is admittedly
+kind of a round-about way of doing things but this has become the
+de-facto standard amongst embedded distro builders).
+
+In commit 8061983d4882f3ba3f12da71443b035d7b672eec, this process of
+finding the binaris has been moved to be carried out only in the
+system heimdal case. As explained above, we only need these tools,
+and hence the check, in bundled mode.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
+
+Signed-off-by: Uri Simchoni <uri@samba.org>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ wscript_configure_embedded_heimdal | 11 +++++++++++
+ wscript_configure_system_heimdal   | 11 -----------
+ 2 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_heimdal
+index 8c55ae2a938..4fdae8062c5 100644
+--- a/wscript_configure_embedded_heimdal
++++ b/wscript_configure_embedded_heimdal
+@@ -1 +1,12 @@
+ conf.RECURSE('source4/heimdal_build')
++
++def check_system_heimdal_binary(name):
++    if conf.LIB_MAY_BE_BUNDLED(name):
++        return False
++    if not conf.find_program(name, var=name.upper()):
++        return False
++    conf.define('USING_SYSTEM_%s' % name.upper(), 1)
++    return True
++
++check_system_heimdal_binary("compile_et")
++check_system_heimdal_binary("asn1_compile")
+diff --git a/wscript_configure_system_heimdal b/wscript_configure_system_heimdal
+index 0ff6dad2f55..f77c177442f 100644
+--- a/wscript_configure_system_heimdal
++++ b/wscript_configure_system_heimdal
+@@ -36,14 +36,6 @@ def check_system_heimdal_lib(name, functions='', headers='', onlyif=None):
+     conf.define('USING_SYSTEM_%s' % name.upper(), 1)
+     return True
+ 
+-def check_system_heimdal_binary(name):
+-    if conf.LIB_MAY_BE_BUNDLED(name):
+-        return False
+-    if not conf.find_program(name, var=name.upper()):
+-        return False
+-    conf.define('USING_SYSTEM_%s' % name.upper(), 1)
+-    return True
+-
+ check_system_heimdal_lib("com_err", "com_right_r com_err", "com_err.h")
+ 
+ if check_system_heimdal_lib("roken", "rk_socket_set_reuseaddr", "roken.h"):
+@@ -94,6 +86,3 @@ finally:
+ # With the proper checks in place we should be able to build against the system libtommath.
+ #if conf.CHECK_BUNDLED_SYSTEM('tommath', checkfunctions='mp_init', headers='tommath.h'):
+ #    conf.define('USING_SYSTEM_TOMMATH', 1)
+-
+-check_system_heimdal_binary("compile_et")
+-check_system_heimdal_binary("asn1_compile")
+-- 
+2.20.1
+
diff --git a/package/samba4/0008-Fix-unistd.h-include.patch b/package/samba4/0008-Fix-unistd.h-include.patch
new file mode 100644
index 0000000000..f01b899a18
--- /dev/null
+++ b/package/samba4/0008-Fix-unistd.h-include.patch
@@ -0,0 +1,38 @@
+From 85c33f89df8607ace0707e1360ff0f79f3e8f5f3 Mon Sep 17 00:00:00 2001
+From: Andy Walsh <andy.walsh44+github@gmail.com>
+Date: Wed, 6 Nov 2019 19:28:30 +0100
+Subject: [PATCH] Fix unistd.h include
+
+Fixes build error
+
+source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as different kind of symbol
+ static struct et_list link = { 0, 0 };
+
+Downloaded from
+https://github.com/Andy2244/openwrt-extra/blob/samba-4.10/samba4/patches/006-samba-4-10-musl_rm_unistd_incl.patch
+
+Upstream bug report: https://bugzilla.samba.org/show_bug.cgi?id=13856
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/replace/replace.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/lib/replace/replace.h b/lib/replace/replace.h
+index 1658465866e..e6768c4ae51 100644
+--- a/lib/replace/replace.h
++++ b/lib/replace/replace.h
+@@ -168,10 +168,6 @@
+ #include <bsd/unistd.h>
+ #endif
+ 
+-#ifdef HAVE_UNISTD_H
+-#include <unistd.h>
+-#endif
+-
+ #ifdef HAVE_STRING_H
+ #include <string.h>
+ #endif
+-- 
+2.20.1
+
diff --git a/package/samba4/0006-heimdal_build-wscript_build-do-not-add-host-include-.patch b/package/samba4/0009-heimdal_build-wscript_build-do-not-add-host-include-.patch
similarity index 84%
rename from package/samba4/0006-heimdal_build-wscript_build-do-not-add-host-include-.patch
rename to package/samba4/0009-heimdal_build-wscript_build-do-not-add-host-include-.patch
index 08d8382ab0..ff1f05ec4d 100644
--- a/package/samba4/0006-heimdal_build-wscript_build-do-not-add-host-include-.patch
+++ b/package/samba4/0009-heimdal_build-wscript_build-do-not-add-host-include-.patch
@@ -1,8 +1,7 @@
-From 189440643157fbc872a1670b3e30b6c459dbd930 Mon Sep 17 00:00:00 2001
+From 25a8d80820ee6713988d72cca69707b03d06e707 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sun, 21 Jul 2019 15:12:03 +0200
-Subject: [PATCH] heimdal_build/wscript_build: do not add host include
- patch
+Subject: [PATCH] heimdal_build/wscript_build: do not add host include patch
 
 Fixes cross-compile.
 
@@ -14,10 +13,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/source4/heimdal_build/wscript_build b/source4/heimdal_build/wscript_build
-index 45938b88315..e896c3e9454 100644
+index 163b622fca9..27adbc06dc6 100644
 --- a/source4/heimdal_build/wscript_build
 +++ b/source4/heimdal_build/wscript_build
-@@ -131,7 +131,7 @@ def HEIMDAL_ASN1(name, source,
+@@ -140,7 +140,7 @@ def HEIMDAL_ASN1(name, source,
              samba_cflags   = CURRENT_CFLAGS(bld, name, ''),
              depends_on     = '',
              samba_deps     = to_list('roken replace'),
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index e89289b153..a6997c13eb 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
@@ -30,7 +31,6 @@ if BR2_PACKAGE_SAMBA4
 
 config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
-	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_JANSSON
 	help
 	  Enable Active Directory Domain Controller functionality.
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 02220772f6..d4b177a45f 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.10.10.tar.asc
-sha256 700c734b51610e2feaa0d6744f9bec0c0d8917bca8cc78d5b63a4591f32866a5  samba-4.10.10.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.2.tar.asc
+sha256 d27bf1b7cf5f25fb5587896fccb73747a705f7cf7ee352b5cbab82841db09f1f  samba-4.11.2.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c7910d87c8..201328fe4b 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.10.10
+SAMBA4_VERSION = 4.11.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
@@ -12,7 +12,7 @@ SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-heimdal host-nfs-utils \
-	cmocka e2fsprogs popt zlib \
+	cmocka e2fsprogs gnutls popt zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
@@ -76,13 +76,6 @@ else
 SAMBA4_CONF_OPTS += --without-fam
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SAMBA4_CONF_OPTS += --enable-gnutls
-SAMBA4_DEPENDENCIES += gnutls
-else
-SAMBA4_CONF_OPTS += --disable-gnutls
-endif
-
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
 SAMBA4_CONF_OPTS += --with-libarchive
 SAMBA4_DEPENDENCIES += libarchive
