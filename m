Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D0C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 756BD61152;
	Thu, 18 Aug 2022 06:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 756BD61152
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0P6-D3S3KYF; Thu, 18 Aug 2022 06:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7321A60B6B;
	Thu, 18 Aug 2022 06:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7321A60B6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 868B91BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2495483FA9
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2495483FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_aXMgZAUsjy for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:22:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4221F81372
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4221F81372
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B3DB6878F6; Thu, 18 Aug 2022 06:07:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 14:45:02 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e1b34ca02aa19a772b624292be8dd86cef54bbee
X-Git-Newrev: d6e80166a82b49245709ff81214cc3b7ad9cd3ad
X-Patchwork-Hint: ignore
Message-Id: <20220818060740.B3DB6878F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/luasyslog: fix
 build when host root directory is /usr
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6e80166a82b49245709ff81214cc3b7ad9cd3ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure when host root directory is /usr which
is raised since bump to version 2.2.0 in commit
caa32ac237909999eb6e0bd3616ef4440190970a:

 /usr/bin/install -c -m 644 syslog.lua '/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3/logging'
libtool: install: /usr/bin/install -c .libs/lsyslog.so /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.so
libtool: install: /usr/bin/install -c .libs/lsyslog.lai /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.la
libtool: warning: remember to run 'libtool --finish /usr/lib/lua/5.3'
/usr/bin/make  install-exec-hook
make[3]: Entering directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
rm -f /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.la
make[3]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
make[2]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
make[1]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
luasyslog: installs files in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target//usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1

This failure is raised because lua script directory is "found" and
"fixed" to
${prefix}/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3
because of the following test in ax_lua.m4:

       dnl Try to find a path with the prefix.
        _AX_LUA_FND_PRFX_PTH([$LUA], [$ax_lua_prefix], [package.path])
        AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
        [ dnl Fix the prefix.
          _ax_strip_prefix=`echo "$ax_lua_prefix" | sed 's|.|.|g'`
          ax_cv_lua_luadir=`echo "$ax_lua_prefixed_path" | \
            sed "s,^$_ax_strip_prefix,$LUA_PREFIX,"`
        ])

Fixes:
 - http://autobuild.buildroot.org/results/09fa6dd9844d6d4694801ec59434dad7a56bf290

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 607491354f27fc9a4922a5f4b734190acf0b8274)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...002-build-ax_lua.m4-fix-cross-compilation.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch b/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch
new file mode 100644
index 0000000000..ac7c1d97e2
--- /dev/null
+++ b/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch
@@ -0,0 +1,45 @@
+From aed16d13d881492e8558f9da21be2dffc4ab2c33 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 4 Sep 2021 17:23:58 +0200
+Subject: [PATCH] build/ax_lua.m4: fix cross-compilation
+
+Don't try to "find" and "fix" the script and module directories when
+cross-compiling as this will give unexpected results such as using
+${prefix}/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3
+instead of
+${prefix}/share/lua/5.3
+if the host machine root directory is /usr
+
+Fixes:
+ - http://autobuild.buildroot.org/results/09fa6dd9844d6d4694801ec59434dad7a56bf290
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/ax_lua.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/build/ax_lua.m4 b/build/ax_lua.m4
+index 23ca774..7c25cfd 100644
+--- a/build/ax_lua.m4
++++ b/build/ax_lua.m4
+@@ -291,7 +291,7 @@ AC_DEFUN([AX_PROG_LUA],
+ 
+         dnl Try to find a path with the prefix.
+         _AX_LUA_FND_PRFX_PTH([$LUA], [$ax_lua_prefix], [package.path])
+-        AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
++        AS_IF([test "x$ax_lua_prefixed_path" != 'x' && test "x$cross_compiling" != 'xyes'],
+         [ dnl Fix the prefix.
+           _ax_strip_prefix=`echo "$ax_lua_prefix" | sed 's|.|.|g'`
+           ax_cv_lua_luadir=`echo "$ax_lua_prefixed_path" | \
+@@ -318,7 +318,7 @@ AC_DEFUN([AX_PROG_LUA],
+         dnl Try to find a path with the prefix.
+         _AX_LUA_FND_PRFX_PTH([$LUA],
+           [$ax_lua_exec_prefix], [package.cpathd])
+-        AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
++        AS_IF([test "x$ax_lua_prefixed_path" != 'x' && test "x$cross_compiling" != 'xyes'],
+         [ dnl Fix the prefix.
+           _ax_strip_prefix=`echo "$ax_lua_exec_prefix" | sed 's|.|.|g'`
+           ax_cv_lua_luaexecdir=`echo "$ax_lua_prefixed_path" | \
+-- 
+2.32.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
