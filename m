Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2892C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 739F260A57;
	Mon,  8 Jul 2024 20:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGo4zOjxLIyf; Mon,  8 Jul 2024 20:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D495B60AB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D495B60AB7;
	Mon,  8 Jul 2024 20:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7051BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47447404F6
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVeAdyEiN0YX for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CAC404D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13CAC404D1
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 001C380424; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ef2d436d4ada8c37896efdd199dd1d5066c67e5
X-Git-Newrev: c3ac14653b256ad556cdcbd633e1ee9e562e8245
X-Patchwork-Hint: ignore
Message-Id: <20240708202014.001C380424@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rygel: update the patches to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3ac14653b256ad556cdcbd633e1ee9e562e8245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, rygel fails to build with output:

    Applying 0001-meson.build-fix-g_ir_compiler-calls.patch using patch:
    patching file src/librygel-core/meson.build
    Hunk #1 succeeded at 73 (offset 3 lines).
    patching file src/librygel-renderer-gst/meson.build
    Hunk #1 succeeded at 37 (offset 1 line).
    patching file src/librygel-renderer/meson.build
    Hunk #1 FAILED at 43.
    1 out of 1 hunk FAILED -- saving rejects to file src/librygel-renderer/meson.build.rej
    patching file src/librygel-server/meson.build
    Hunk #1 FAILED at 122.
    1 out of 1 hunk FAILED -- saving rejects to file src/librygel-server/meson.build.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                      |  1 -
 .../rygel/0001-meson.build-fix-g_ir_compiler-calls.patch | 16 +++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 423046b80e..618871f98a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1321,7 +1321,6 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patc
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
-package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
diff --git a/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch b/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
index 1d8f4599f4..7b4d5a904c 100644
--- a/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
+++ b/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
@@ -20,7 +20,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: probably not upstreamable]
+Upstream: probably not upstreamable
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/librygel-core/meson.build         | 4 +++-
  src/librygel-renderer-gst/meson.build | 1 +
@@ -32,7 +34,7 @@ diff --git a/src/librygel-core/meson.build b/src/librygel-core/meson.build
 index fd43bebe..e6be2b5e 100644
 --- a/src/librygel-core/meson.build
 +++ b/src/librygel-core/meson.build
-@@ -70,7 +70,9 @@ core_gir = custom_target('RygelCore-2.6.gir',
+@@ -73,7 +73,9 @@
  # so we depend on the custom_target from that step and pass the input through
  # commandline.
  custom_target('RygelCore-2.8.typelib',
@@ -47,7 +49,7 @@ diff --git a/src/librygel-renderer-gst/meson.build b/src/librygel-renderer-gst/m
 index ad98a3a7..e8baefe1 100644
 --- a/src/librygel-renderer-gst/meson.build
 +++ b/src/librygel-renderer-gst/meson.build
-@@ -36,6 +36,7 @@ custom_target('RygelRendererGst-2.6.typelib',
+@@ -37,6 +37,7 @@
                          '--output', '@OUTPUT@',
                          '--includedir', core_girdir,
                          '--includedir', renderer_girdir,
@@ -59,25 +61,25 @@ diff --git a/src/librygel-renderer/meson.build b/src/librygel-renderer/meson.bui
 index 5f401527..821273ff 100644
 --- a/src/librygel-renderer/meson.build
 +++ b/src/librygel-renderer/meson.build
-@@ -43,6 +43,7 @@ custom_target('RygelRenderer-2.6.typelib',
+@@ -44,6 +44,7 @@
                 command: [g_ir_compiler,
                          '--output', '@OUTPUT@',
                          '--includedir', core_girdir,
 +                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
                          join_paths(meson.current_build_dir(), 'RygelRenderer-2.8.gir')],
-                output: 'RygelRenderer-2.6.typelib',
+                output: 'RygelRenderer-2.8.typelib',
                 depends: [ renderer_lib, renderer_gir, core_gir ],
 diff --git a/src/librygel-server/meson.build b/src/librygel-server/meson.build
 index a3bd77d9..6b084eb6 100644
 --- a/src/librygel-server/meson.build
 +++ b/src/librygel-server/meson.build
-@@ -122,6 +122,7 @@ custom_target('RygelServer-2.6.typelib',
+@@ -125,6 +125,7 @@
                 command: [g_ir_compiler,
                          '--output', '@OUTPUT@',
                          '--includedir', core_girdir,
 +                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
                          join_paths(meson.current_build_dir(), 'RygelServer-2.8.gir')],
-                output: 'RygelServer-2.6.typelib',
+                output: 'RygelServer-2.8.typelib',
                 depends: [ server_lib, server_gir, core_gir ],
 -- 
 2.35.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
