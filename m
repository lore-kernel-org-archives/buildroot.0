Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47157C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 17:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B236940A5B;
	Thu, 13 Jan 2022 17:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7JoGv4YzX9h; Thu, 13 Jan 2022 17:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7A0040146;
	Thu, 13 Jan 2022 17:38:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4F01BF4DA
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E79683E7A
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqYZ9a8RIn-L for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 17:38:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF87383E12
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:38:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A82798352F; Thu, 13 Jan 2022 17:31:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 18:37:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: feb9185fc185c1f76e3789b0dc521e3cf98c1ebb
X-Git-Newrev: 6dda369e7e8a4bb77b4449818a16b13c4f530e07
X-Patchwork-Hint: ignore
Message-Id: <20220113173150.A82798352F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: add upstream patch to fix
 vapigen support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dda369e7e8a4bb77b4449818a16b13c4f530e07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import an upstream patch which fixes a typo in the Meson source code
which caused a wrong command line option to be passed to the vapigen
program. This fixes the build for all packages which use Meson and
provide API bindings generated using said tool.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...me-fix-typo-in-vapigen-option-metadatadir.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch b/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
new file mode 100644
index 0000000000..3788ee0f11
--- /dev/null
+++ b/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
@@ -0,0 +1,33 @@
+From 9952446a2a28ea2b009f4b8b2a14ad50f0878bdd Mon Sep 17 00:00:00 2001
+From: Michal Vasilek <michal.vasilek@nic.cz>
+Date: Mon, 10 Jan 2022 21:27:30 +0100
+Subject: [PATCH] gnome: fix typo in vapigen option metadatadir
+
+This typo was introduced in 9ef36fa80bf4483bcd837ea3985a51ab533c7972 and
+can cause a build failure, because --metadatdir is not a valid vapigen
+option.
+
+[aperez@igalia.com: backport from upstream]
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[yann.morin.1998@free.fr: make it an actual backport]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ mesonbuild/modules/gnome.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index 1125e56e7..dfc66c2e3 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -1934,7 +1934,7 @@ class GnomeModule(ExtensionModule):
+         cmd: T.List[T.Union[str, 'ExternalProgram']]
+         cmd = [state.find_program('vapigen'), '--quiet', f'--library={library}', f'--directory={build_dir}']
+         cmd.extend([f'--vapidir={d}' for d in kwargs['vapi_dirs']])
+-        cmd.extend([f'--metadatdir={d}' for d in kwargs['metadata_dirs']])
++        cmd.extend([f'--metadatadir={d}' for d in kwargs['metadata_dirs']])
+         cmd.extend([f'--girdir={d}' for d in kwargs['gir_dirs']])
+         cmd += pkg_cmd
+         cmd += ['--metadatadir=' + source_dir]
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
