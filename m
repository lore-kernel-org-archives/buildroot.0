Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A882BC52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F5660897;
	Tue,  6 Aug 2024 22:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpPbIZrDiaah; Tue,  6 Aug 2024 22:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ADD0608A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ADD0608A3;
	Tue,  6 Aug 2024 22:45:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3681BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8F2F6061C
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89JrP0jpVPAv for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB423606F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB423606F1
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C80DD84349; Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 00:37:22 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 65fc31a8ecd9ed7866f26353dac97c9fc9769e9c
X-Git-Newrev: 6c6f6eb44a12ac56a596bd030620465bdd45cd11
X-Patchwork-Hint: ignore
Message-Id: <20240806224505.C80DD84349@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] utils/check-package:
 check linux-tools
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6c6f6eb44a12ac56a596bd030620465bdd45cd11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Each linux tool uses a fragment of a .mk file, named, for instance:
package/linux-tools/linux-tool-cpupower.mk.in
So currently check-package does not check these files.

Add the support in check-package script.
At the same time, factor out a function to derive package prefix from
the filename being checked, so the fix (calling os.path.splitext twice)
can be applied in a single place.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: add docstring and explain double splitext to
         get_package_prefix_from_filename]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ccc12c0f244de23672300b5837b473292c8db931)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/check-package                  |  3 ++-
 utils/checkpackagelib/lib_mk.py      | 30 +++++++++++++++------------
 utils/checkpackagelib/test_lib_mk.py | 40 ++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 14 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index cbb3613e19..3741a2ccdc 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -126,6 +126,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
 DO_NOT_CHECK_INTREE = re.compile(r"|".join([
     r"boot/barebox/barebox\.mk$",
     r"fs/common\.mk$",
+    r"package/alchemy/atom.mk.in$",
     r"package/doc-asciidoc\.mk$",
     r"package/pkg-\S*\.mk$",
     r"support/dependencies/[^/]+\.mk$",
@@ -163,7 +164,7 @@ def get_lib_from_filename(fname):
         return checkpackagelib.lib_defconfig
     if fname.endswith(".hash"):
         return checkpackagelib.lib_hash
-    if fname.endswith(".mk"):
+    if fname.endswith(".mk") or fname.endswith(".mk.in"):
         return checkpackagelib.lib_mk
     if fname.endswith(".patch"):
         return checkpackagelib.lib_patch
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 4d97571f50..1e6bd708a5 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -49,6 +49,18 @@ class Ifdef(_CheckFunction):
                     text]
 
 
+def get_package_prefix_from_filename(filename):
+    """Return a tuple (pkgname, PKGNAME) with the package name derived from the file name"""
+    # Double splitext to support .mk.in
+    package = os.path.splitext(os.path.splitext(os.path.basename(filename))[0])[0]
+    # linux tools do not use LINUX_TOOL_ prefix for variables
+    package = package.replace("linux-tool-", "")
+    # linux extensions do not use LINUX_EXT_ prefix for variables
+    package = package.replace("linux-ext-", "")
+    package_upper = package.replace("-", "_").upper()
+    return package, package_upper
+
+
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
     CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
@@ -207,12 +219,10 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
     packages_that_may_contain_default_source = ["binutils", "gcc", "gdb"]
 
     def before(self):
-        package, _ = os.path.splitext(os.path.basename(self.filename))
-        package_upper = package.replace("-", "_").upper()
-        self.package = package
+        self.package, package_upper = get_package_prefix_from_filename(self.filename)
         self.FIND_SOURCE = re.compile(
             r"^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
-            .format(package_upper, package, package_upper))
+            .format(package_upper, self.package, package_upper))
 
     def check_line(self, lineno, text):
         if self.FIND_SOURCE.search(text):
@@ -282,16 +292,10 @@ class TypoInPackageVariable(_CheckFunction):
     VARIABLE = re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")
 
     def before(self):
-        package, _ = os.path.splitext(os.path.basename(self.filename))
-        package = package.replace("-", "_").upper()
-        # linux tools do not use LINUX_TOOL_ prefix for variables
-        package = package.replace("LINUX_TOOL_", "")
-        # linux extensions do not use LINUX_EXT_ prefix for variables
-        package = package.replace("LINUX_EXT_", "")
-        self.package = package
-        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
+        _, self.package = get_package_prefix_from_filename(self.filename)
+        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(self.package))
         self.FIND_VIRTUAL = re.compile(
-            r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
+            r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(self.package))
         self.virtual = []
 
     def check_line(self, lineno, text):
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 11fecdd5cf..208b1ecdc2 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -74,6 +74,40 @@ def test_Ifdef(testname, filename, string, expected):
     assert warnings == expected
 
 
+get_package_prefix_from_filename = [
+    ('linux extension',
+     'linux/linux-ext-aufs.mk',
+     ['aufs', 'AUFS']),
+    ('linux tool',
+     'package/linux-tools/linux-tool-gpio.mk.in',
+     ['gpio', 'GPIO']),
+    ('boot',
+     'boot/binaries-marvell/binaries-marvell.mk',
+     ['binaries-marvell', 'BINARIES_MARVELL']),
+    ('toolchain',
+     'toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk',
+     ['toolchain-external-bootlin', 'TOOLCHAIN_EXTERNAL_BOOTLIN']),
+    ('package, underscore, subfolder',
+     'package/x11r7/xapp_bitmap/xapp_bitmap.mk',
+     ['xapp_bitmap', 'XAPP_BITMAP']),
+    ('package, starting with number',
+     'package/4th/4th.mk',
+     ['4th', '4TH']),
+    ('package, long name',
+     'package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk',
+     ['perl-mojolicious-plugin-authentication', 'PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION']),
+    ('package, case sensitive',
+     'package/libeXosip2/libeXosip2.mk',
+     ['libeXosip2', 'LIBEXOSIP2']),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,expected', get_package_prefix_from_filename)
+def test_get_package_prefix_from_filename(testname, filename, expected):
+    prefix_lower, prefix_upper = m.get_package_prefix_from_filename(filename)
+    assert [prefix_lower, prefix_upper] == expected
+
+
 Indent = [
     ('ignore comment at beginning of line',
      'any',
@@ -567,6 +601,12 @@ TypoInPackageVariable = [
      'OTHERS_VAR = \n',
      [['any.mk:2: possible typo: OTHERS_VAR -> *ANY*',
        'OTHERS_VAR = \n']]),
+    ('linux tool',
+     'package/linux-tools/linux-tool-cpupower.mk.in',
+     'CPUPOWER_DEPENDENCIES =\n'
+     'POWER_DEPENDENCIES +=\n',
+     [['package/linux-tools/linux-tool-cpupower.mk.in:2: possible typo: POWER_DEPENDENCIES -> *CPUPOWER*',
+       'POWER_DEPENDENCIES +=\n']]),
     ]
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
