Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D02AC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B74F8237B;
	Wed,  7 Feb 2024 15:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Umq3s5B90cif; Wed,  7 Feb 2024 15:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F178238A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F178238A;
	Wed,  7 Feb 2024 15:22:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 938971BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 810B38237B
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GZyWU4AKB67 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C5B82372
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83C5B82372
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:22:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A128875D1; Wed,  7 Feb 2024 15:22:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 16:19:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc25b8d99f812777294b5e188d7975c0e36dd5ef
X-Git-Newrev: 3118b7e222e8a56847daa17aae5ea1c2bb083837
X-Patchwork-Hint: ignore
Message-Id: <20240207152251.3A128875D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump version to 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3118b7e222e8a56847daa17aae5ea1c2bb083837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The meson upgrade from 1.1.1 to 1.2.0 have been reverted because
host-qemu (version v8.0.3) was searching libraries in the build machine
instead of buildroot host directory [1].

    $ grep -r LINK_ARGS  * | grep "\-L/usr"
    build.ninja: LINK_ARGS =
        -L/usr/lib/gcc/x86_64-linux-gnu/10 \
        -L/usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu -L/usr/lib/x86_64-linux-gnu \
        -L/usr/lib/gcc/x86_64-linux-gnu/10/../../../../lib -L/usr/lib \
        -L/lib/x86_64-linux-gnu \
        -L/lib/../lib \
        -L/usr/lib/../lib \
        -L/usr/lib/gcc/x86_64-linux-gnu/10/../../.. \
        -L/lib \
        -I/[...]/host/include \
        -L/[...]/host/lib \
        -I/[...]/host/include/libfdt \
        ...

Upgrading qemu to version v8.1.0 solves the problem:

    $ grep -r LINK_ARGS  * | grep "\-L/usr"
    build.ninja: LINK_ARGS =
        -I/[...]/host/include \
        -L/[...]/host/lib \
        -I/[...]/host/include/libfdt \
        ...

Those two tests were done with the same buildroot version (2023.08) on
the same machine were the bug appeared. Using, git bisect, in this
environment, it was found that the problem was fixed in qemu by the
commit [2].

Thus, it is possible that the problem was introduced by improper use of
meson by qemu <= v8.0.3. Also, meson has been updated to version 1.2.1
and 1.3.0 in yocto and it doesn't seem to create any issue. [3]

The original problem is no longer present and some projects require
meson > 1.1.1 (e.g. rusticl requires meson 1.2.0 since mesa 23.3.0 and
meson 1.3.1 since mesa 24.0.0).

"pkgconfig" field is deprecated by meson 1.3.0 and replaced by
"pkg-config". See: [4]

The patch that adds the pkg_config_static property has been rebased.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/acfdf21f0b752e844a33c70a0fd2f82f4534a5a0
[2] https://gitlab.com/qemu-project/qemu/-/commit/Fc9a809e0d28417fa1e7f7efc19f845bda4c1be9
[3] https://github.com/yoctoproject/poky/commits/master/meta/recipes-devtools/meson
[4] https://mesonbuild.com/Release-notes-for-1-3-0.html#machine-files-pkgconfig-field-deprecated-and-replaced-by-pkgconfig

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
[yann.morin.1998@free.fr:
  - keep our formatting in the patch
  - reflow commit log (to keep busy while test-building!)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...dependencies-base.py-add-pkg_config_stati.patch | 30 ++++++++++++----------
 package/meson/meson.hash                           |  4 +--
 package/meson/meson.mk                             |  2 +-
 support/misc/cross-compilation.conf.in             |  2 +-
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
index 8e15d3210c..8b95dc7592 100644
--- a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
+++ b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
@@ -1,4 +1,4 @@
-From 3d6a2db2270346236dd6247e0648ea0c949ba468 Mon Sep 17 00:00:00 2001
+From 59934e2116e025ecfe23baf6febc4a0eb85f60cd Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 15 Feb 2020 15:13:59 +0100
 Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
@@ -20,24 +20,26 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [Rebased on 0.57.1]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[rebased on 1.3.0]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
 ---
- mesonbuild/dependencies/pkgconfig.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ mesonbuild/dependencies/pkgconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mesonbuild/dependencies/pkgconfig.py b/mesonbuild/dependencies/pkgconfig.py
-index 1e8d9132e..d902ba215 100644
+index e86206b88..94888657d 100644
 --- a/mesonbuild/dependencies/pkgconfig.py
 +++ b/mesonbuild/dependencies/pkgconfig.py
-@@ -338,7 +338,8 @@ class PkgConfigDependency(ExternalDependency):
-         env = None
-         libcmd = ['--libs']
- 
--        if self.static:
-+        if self.static or \
+@@ -169,7 +169,8 @@ class PkgConfigCLI(PkgConfigInterface):
+             env['PKG_CONFIG_ALLOW_SYSTEM_LIBS'] = '1'
+         args: T.List[str] = []
+         args += self._define_variable_args(define_variable)
+-        if static:
++        if static or \
 +            (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
-             libcmd.append('--static')
- 
-         libcmd.append(self.name)
--- 
+             args.append('--static')
+         args += ['--libs', name]
+         ret, out, err = self._call_pkgbin(args, env=env)
+--
 2.25.1
 
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index cb36b674fa..150fd6d1bb 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.1.1/meson-1.1.1.tar.gz.asc
-sha256  d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c  meson-1.1.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.3.1/meson-1.3.1.tar.gz.asc
+sha256  6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7  meson-1.3.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 503aca8c25..467569d28b 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.1.1
+MESON_VERSION = 1.3.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 7053df472b..a58ab553d0 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -10,7 +10,7 @@ ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
 cmake = '@BR2_CMAKE@'
 fortran = '@TARGET_FC@'
-pkgconfig = '@PKGCONF_HOST_BINARY@'
+pkg-config = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
