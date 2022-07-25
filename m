Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C78C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 07:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 571FE405D6;
	Mon, 25 Jul 2022 07:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 571FE405D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qs3z1J4fkmeO; Mon, 25 Jul 2022 07:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53F12405A6;
	Mon, 25 Jul 2022 07:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F12405A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 213721BF85D
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7D77611ED
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D77611ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGjPg_hG2wTI for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 07:57:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E102611DC
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 07:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E102611DC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 652478402B; Mon, 25 Jul 2022 07:43:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 09:53:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 321cec7b9c0b6d5aa43c0f71a52f3ddf83636399
X-Git-Newrev: c6e99c0bc6cd045cd451a1c186bae0bdd5c4a903
X-Patchwork-Hint: ignore
Message-Id: <20220725074325.652478402B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gstd: fix static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c6e99c0bc6cd045cd451a1c186bae0bdd5c4a903
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since the addition of the
package in commit 02ea01ea22e94ef353a638bf16f62f6e3ed1208e:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
display.c:(.text+0xbb5): undefined reference to `tputs'

Fixes:
 - http://autobuild.buildroot.org/results/77c/77c10947ddc749c54c7c233e3143f5cdf1edc73d/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uild-use-dependency-function-for-readline.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/gstreamer1/gstd/0005-meson.build-use-dependency-function-for-readline.patch b/package/gstreamer1/gstd/0005-meson.build-use-dependency-function-for-readline.patch
new file mode 100644
index 0000000000..51422e56d6
--- /dev/null
+++ b/package/gstreamer1/gstd/0005-meson.build-use-dependency-function-for-readline.patch
@@ -0,0 +1,51 @@
+From 3ef45c41105e61efe84c9be3a9a22988dfe10db8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 22 Oct 2021 07:33:04 +0200
+Subject: [PATCH] meson.build: use dependency function for readline
+
+Use meson dependency function to find readline instead of
+cc.find_library. This function will retrieve readline pkg-config file
+which is available since version 7 (released 5 years ago) and
+https://git.savannah.gnu.org/cgit/readline.git/commit/readline.pc.in?id=d49a9082c0e15bba8cd3d8cc0a994409cf823cac.
+readline.pc sets tinfo in Requires.Private which will avoid the
+following static build failure:
+
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
+display.c:(.text+0xbb5): undefined reference to `tputs'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/77c10947ddc749c54c7c233e3143f5cdf1edc73d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/RidgeRun/gstd-1.x/pull/261]
+---
+ meson.build | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7a8690a..44ed5c2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -32,8 +32,8 @@ systemd_required = get_option('enable-systemd').enabled()
+ systemd_dep = dependency('systemd', required : systemd_required, version : '>=232')
+ 
+ cc = meson.get_compiler('c')
+-readline = cc.find_library('readline', required: true)
+-if readline.found()
++readline_dep = dependency('readline')
++if readline_dep.found()
+   add_project_arguments('-DHAVE_LIBREADLINE', language: 'c')
+   add_project_arguments('-DHAVE_READLINE_HISTORY', language: 'c')
+   # Add arguments to the compiler command line. 
+@@ -48,8 +48,6 @@ if readline.found()
+   else
+     add_project_arguments('-DHAVE_HISTORY_H', language: 'c')
+   endif
+-  
+-  readline_dep = readline
+ endif
+ 
+ ## Dependencies
+-- 
+2.37.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
