Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58865CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186F6418B7;
	Wed,  3 Apr 2024 21:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdFoBCmdXgOz; Wed,  3 Apr 2024 21:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA5F41899
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA5F41899;
	Wed,  3 Apr 2024 21:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 149FD1BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D77040543
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJpPmYc5Y18L for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:18:09 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF1614042B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF1614042B
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF1614042B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:18:08 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 8ED3820283;
 Wed,  3 Apr 2024 16:18:07 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 16:18:05 -0500
Message-Id: <20240403211805.3100506-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] [PATCH 1/1] package/python3: fix cross builds when host
 and target use the same SOABI
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When python performs a cross compile, it uses a host interpreter to run
steps on behalf of the foreign architecture to finalize the build.

When performing these steps, foreign modules may be loaded if the SOABI
matches that of the host. This can lead to issues if the modules are
linked against a libc not available on the host or if the binaries
include instructions unsupported by the host.

For now, patch the foreign libraries out of PYTHONPATH and explicitly
define the path to sysconfigdata so builds can complete without error.

This method currently passes all upstream CI pipelines [0] and should
also work (with some modifications) for the migration to 3.12 [1].

Fixes: http://autobuild.buildroot.net/results/c854080e003e9a7d525325073190b472a8f982aa/
[0]: https://github.com/python/cpython/pull/116294
[1]: https://lists.buildroot.org/pipermail/buildroot/2024-February/685369.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 ...oss-compiles-when-host-and-target-us.patch | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch

diff --git a/package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch b/package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
new file mode 100644
index 0000000000..4d5afeb3cb
--- /dev/null
+++ b/package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
@@ -0,0 +1,140 @@
+From 8d8cc9087fd44c097775ca0a9ebb6c877605baec Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <5265893+vfazio@users.noreply.github.com>
+Date: Wed, 28 Feb 2024 13:55:04 -0600
+Subject: [PATCH] gh-115382: Fix cross compiles when host and target use same
+ SOABI
+
+Previously, when a build was configured to use a host interpreter via
+--with-build-python, the PYTHON_FOR_BUILD config value included a path
+in PYTHONPATH that pointed to the target's built external modules.
+
+For "normal" foreign architecture cross compiles, when loading compiled
+external libraries, the target libraries were processed first due to
+their precedence in sys.path. These libraries were then ruled out due to
+a mismatch in the SOABI so the import mechanism continued searching
+until it found the host's native modules.
+
+However, if the host interpreter and the target python were on the same
+version + SOABI combination, the host interpreter would attempt to load
+the target's external modules due to their precedence in sys.path.
+
+Despite the "match", the target build may have been linked against a
+different libc or may include unsupported instructions so loading or
+executing the target's external modules can lead to crashes.
+
+Now, the path to the target's external modules is no longer defined in
+PYTHONPATH to prevent accidentally loading these foreign modules.
+
+One caveat is that during certain build stages, the target's sysconfig
+module requires higher precedence than the host's version in order to
+accurately query the target build's configuration.
+
+This worked previously due to the target's sysconfig data module having
+precedence over the host's (see above). In order to keep this desired
+behavior, a new environment variable, _PYTHON_SYSCONFIGDATA_PATH, has
+been defined so sysconfig can search this directory for the target's
+sysconfig data.
+
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+Upstream-issue: https://github.com/python/cpython/issues/115382
+Upstream: https://github.com/python/cpython/pull/116294
+---
+ Lib/sysconfig.py             | 15 ++++++++++++++-
+ Lib/test/libregrtest/main.py |  1 +
+ Lib/test/pythoninfo.py       |  1 +
+ Tools/scripts/run_tests.py   |  1 +
+ configure                    |  2 +-
+ configure.ac                 |  2 +-
+ 6 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index 6328ec41af..744f715fe2 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -535,7 +535,20 @@ def _init_posix(vars):
+     """Initialize the module as appropriate for POSIX systems."""
+     # _sysconfigdata is generated at build time, see _generate_posix_vars()
+     name = _get_sysconfigdata_name()
+-    _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
++
++    # For cross builds, the path to the target's sysconfigdata must be specified
++    # so it can be imported. It cannot be in PYTHONPATH, as foreign modules in
++    # sys.path can cause crashes when loaded by the host interpreter.
++    # Rely on truthiness as a valueless env variable is still an empty string.
++    # See OS X note in _generate_posix_vars re _sysconfigdata.
++    if (path := os.environ.get('_PYTHON_SYSCONFIGDATA_PATH')):
++        from importlib.machinery import FileFinder, SourceFileLoader, SOURCE_SUFFIXES
++        from importlib.util import module_from_spec
++        spec = FileFinder(path, (SourceFileLoader, SOURCE_SUFFIXES)).find_spec(name)
++        _temp = module_from_spec(spec)
++        spec.loader.exec_module(_temp)
++    else:
++        _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
+     build_time_vars = _temp.build_time_vars
+     vars.update(build_time_vars)
+ 
+diff --git a/Lib/test/libregrtest/main.py b/Lib/test/libregrtest/main.py
+index a9725fa967..121e2e7393 100644
+--- a/Lib/test/libregrtest/main.py
++++ b/Lib/test/libregrtest/main.py
+@@ -519,6 +519,7 @@ def _add_cross_compile_opts(self, regrtest_opts):
+                 '_PYTHON_PROJECT_BASE',
+                 '_PYTHON_HOST_PLATFORM',
+                 '_PYTHON_SYSCONFIGDATA_NAME',
++                "_PYTHON_SYSCONFIGDATA_PATH",
+                 'PYTHONPATH'
+             }
+             old_environ = os.environ
+diff --git a/Lib/test/pythoninfo.py b/Lib/test/pythoninfo.py
+index 74ebb5e5b8..fa7fbca34e 100644
+--- a/Lib/test/pythoninfo.py
++++ b/Lib/test/pythoninfo.py
+@@ -326,6 +326,7 @@ def format_groups(groups):
+         "_PYTHON_HOST_PLATFORM",
+         "_PYTHON_PROJECT_BASE",
+         "_PYTHON_SYSCONFIGDATA_NAME",
++        "_PYTHON_SYSCONFIGDATA_PATH",
+         "__PYVENV_LAUNCHER__",
+ 
+         # Sanitizer options
+diff --git a/Tools/scripts/run_tests.py b/Tools/scripts/run_tests.py
+index 445a34ae3e..4077a83424 100644
+--- a/Tools/scripts/run_tests.py
++++ b/Tools/scripts/run_tests.py
+@@ -42,6 +42,7 @@ def main(regrtest_args):
+             '_PYTHON_PROJECT_BASE',
+             '_PYTHON_HOST_PLATFORM',
+             '_PYTHON_SYSCONFIGDATA_NAME',
++            "_PYTHON_SYSCONFIGDATA_PATH",
+             'PYTHONPATH'
+         }
+         environ = {
+diff --git a/configure b/configure
+index a1ad0ae251..0657162d1a 100755
+--- a/configure
++++ b/configure
+@@ -3262,7 +3262,7 @@ fi
+     fi
+         ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
+     PYTHON_FOR_FREEZE="$with_build_python"
+-    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
++    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) _PYTHON_SYSCONFIGDATA_PATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`) '$with_build_python
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $with_build_python" >&5
+ $as_echo "$with_build_python" >&6; }
+ 
+diff --git a/configure.ac b/configure.ac
+index e5fb8bd99e..d444f5ec09 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -162,7 +162,7 @@ AC_ARG_WITH(
+     dnl Build Python interpreter is used for regeneration and freezing.
+     ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
+     PYTHON_FOR_FREEZE="$with_build_python"
+-    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
++    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) _PYTHON_SYSCONFIGDATA_PATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`) '$with_build_python
+     AC_MSG_RESULT([$with_build_python])
+   ], [
+     AS_VAR_IF([cross_compiling], [yes],
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
