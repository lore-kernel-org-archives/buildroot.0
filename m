Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A353C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 16:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52250424F8;
	Mon, 25 Jul 2022 16:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52250424F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73D3Iqx-YcOy; Mon, 25 Jul 2022 16:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE3AF424E2;
	Mon, 25 Jul 2022 16:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3AF424E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A95A1BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 16:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E755A84C5D
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 16:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E755A84C5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4EBZhz1BxIla for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 16:24:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0638284AB4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 16:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0638284AB4
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3C53A85D6E; Mon, 25 Jul 2022 16:10:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 18:23:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66d2ff25bad813659ed4541b3f4c6c2a09455bd7
X-Git-Newrev: 607491354f27fc9a4922a5f4b734190acf0b8274
X-Patchwork-Hint: ignore
Message-Id: <20220725161047.3C53A85D6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasyslog: fix build when host
 root directory is /usr
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

commit: https://git.buildroot.net/buildroot/commit/?id=607491354f27fc9a4922a5f4b734190acf0b8274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
