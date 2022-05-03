Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB1EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E8661058;
	Tue,  3 May 2022 20:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDQ9Oo2nznnM; Tue,  3 May 2022 20:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB9661059;
	Tue,  3 May 2022 20:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBD731BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD98E4171C
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0N1VvMIaAlJ for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB30D416B5
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 51D65854F2; Tue,  3 May 2022 20:20:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:19:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b89d63326decda74d4ce2731d7d117e71e7e0b92
X-Git-Newrev: 6c4abd0e6151bf568a2c9bd6dbbfd87f65995410
X-Patchwork-Hint: ignore
Message-Id: <20220503202054.51D65854F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zchunk: fix unsafe header/library
 path
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c4abd0e6151bf568a2c9bd6dbbfd87f65995410
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch from upstream to fix:
unsafe header/library path used in cross-compilation: '-I/usr/include'

Fixes:
 - http://autobuild.buildroot.net/results/825/82517abd49dcf82c17fabaf9680353d5a6cc4279

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...fix-argp-standalone-wrap-and-find_library.patch | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch b/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
new file mode 100644
index 0000000000..6c9cdba3ad
--- /dev/null
+++ b/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
@@ -0,0 +1,106 @@
+From 473c97cda44b95f5cea08a0cdd566e602df564db Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 21 Apr 2022 14:24:01 -0600
+Subject: [PATCH] meson: fix argp-standalone wrap and find_library
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+473c97cda44b95f5cea08a0cdd566e602df564db]
+---
+ .github/workflows/main.yml       | 27 ---------------------------
+ meson.build                      |  6 +++---
+ subprojects/argp-standalone.wrap |  7 +++++++
+ 3 files changed, 10 insertions(+), 30 deletions(-)
+ create mode 100644 subprojects/argp-standalone.wrap
+
+diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
+index c49806f..35667af 100644
+--- a/.github/workflows/main.yml
++++ b/.github/workflows/main.yml
+@@ -35,25 +35,11 @@ jobs:
+     steps:
+       - uses: actions/checkout@v2
+ 
+-      - uses: actions/checkout@v2
+-        with:
+-          repository: wolfv/argp-standalone
+-          path: argp-standalone
+-
+       - name: Install mamba
+         uses: mamba-org/provision-with-micromamba@main
+         with:
+           environment-file: .github/environment.yml
+ 
+-      - name: Compile argp-standalone
+-        shell: cmd /C CALL {0}
+-        run: |
+-          CALL micromamba activate zchunk_test_env
+-          cd argp-standalone
+-          meson setup builddir
+-          meson compile -C builddir --prefix=%CONDA_PREFIX%\Library
+-          meson install -C builddir
+-
+       - name: Compile zchunk
+         shell: cmd /C CALL {0}
+         run: |
+@@ -75,11 +61,6 @@ jobs:
+     steps:
+       - uses: actions/checkout@v2
+ 
+-      - uses: actions/checkout@v2
+-        with:
+-          repository: wolfv/argp-standalone
+-          path: argp-standalone
+-
+       - uses: actions/setup-python@v1
+         with:
+           python-version: '3.x'
+@@ -87,14 +68,6 @@ jobs:
+       - name: Install meson and ninja
+         run: pip install meson ninja
+ 
+-      - name: Compile argp-standalone
+-        shell: cmd /C CALL {0}
+-        run: |
+-          cd argp-standalone
+-          meson setup builddir
+-          meson compile -C builddir
+-          meson install -C builddir
+-
+       - name: Compile zchunk
+         shell: cmd /C CALL {0}
+         run: |
+diff --git a/meson.build b/meson.build
+index 1c6b32d..aa7dd25 100644
+--- a/meson.build
++++ b/meson.build
+@@ -58,10 +58,10 @@ endif
+ 
+ # argp-standalone dependency (if required)
+ if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
+-    if fs.is_dir(join_paths([get_option('prefix'), 'include']))
+-        inc += include_directories(join_paths([get_option('prefix'), 'include']))
++    argplib = cc.find_library('argp', has_headers : ['argp.h'], required: false)
++    if not argplib.found()
++        argplib = dependency('argp-standalone')
+     endif
+-    argplib = cc.find_library('argp', dirs : join_paths([get_option('prefix'), 'lib']))
+ else
+     argplib = dependency('', required : false)
+ endif
+diff --git a/subprojects/argp-standalone.wrap b/subprojects/argp-standalone.wrap
+new file mode 100644
+index 0000000..14c0b63
+--- /dev/null
++++ b/subprojects/argp-standalone.wrap
+@@ -0,0 +1,7 @@
++[wrap-git]
++directory = argp-standalone-1.4.1
++url = https://github.com/argp-standalone/argp-standalone.git
++revision = 21855f34ec9997c37e1a08cd69497336513a5800
++
++[provide]
++dependency_names = argp-standalone
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
