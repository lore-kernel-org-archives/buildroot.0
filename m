Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0FCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 17:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E643340273;
	Sat, 22 Jan 2022 17:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IjKUvcyvqb5; Sat, 22 Jan 2022 17:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A16614039D;
	Sat, 22 Jan 2022 17:44:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08B811BF2C0
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0557183004
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlpNyvq0ZLg5 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 17:44:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FAC082923
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 17:44:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EA49B82A14; Sat, 22 Jan 2022 17:37:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 18:44:04 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: d8b4e8eedcf83d91487d1dad2fd274128a1ca48e
X-Git-Newrev: f8e11dcf546062a091ac1482b2f35ff4f52965cf
X-Patchwork-Hint: ignore
Message-Id: <20220122173757.EA49B82A14@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libmbim: fix
 build with help2man
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8e11dcf546062a091ac1482b2f35ff4f52965cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix the following build failure with help2man raised since bump to
version 1.26.0 in commit be76508af2b2253f95137a28198139732be2dcb3:

FAILED: docs/man/mbimcli.1
/usr/bin/help2man --output=docs/man/mbimcli.1 '--name=Control MBIM devices' '--help-option="--help-all"' /home/peko/autobuild/instance-1/output-1/build/libmbim-1.26.0/build/src/mbimcli/mbimcli
help2man: can't get `"--help-all"' info from /home/peko/autobuild/instance-1/output-1/build/libmbim-1.26.0/build/src/mbimcli/mbimcli
Try `--no-discard-stderr' if option outputs to stderr

Fixes:
 - http://autobuild.buildroot.org/results/eaa2ba54b9c74f07292d3cad4fa96c80e6079702

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a315d7c98bb0a853e9fe84639ea15595d9dd4b85)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uild-add-an-option-to-not-build-man-pages.patch | 60 ++++++++++++++++++++++
 package/libmbim/libmbim.mk                         |  1 +
 2 files changed, 61 insertions(+)

diff --git a/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch b/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch
new file mode 100644
index 0000000000..c91756e9a6
--- /dev/null
+++ b/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch
@@ -0,0 +1,60 @@
+From 792af73ea90e9689703ab526dd444fdb1c2f8e40 Mon Sep 17 00:00:00 2001
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Date: Thu, 14 Oct 2021 12:25:46 +0200
+Subject: [PATCH] meson.build: add an option to not build man pages.
+
+When cross-compiling, the compiled binaries cannot be run on the build
+machine, unless one defines a helper (e.g. qemu) in the meson
+configuration, which is most of the time undesirable.
+
+If help2man is installed on the build machine, then the build would fail
+because of this, so add an option to disable generating the man pages.
+
+With later versions of meson, it will be possible to automatically
+detect this condition.
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build       | 8 +++++++-
+ meson_options.txt | 1 +
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1c5ee2d..59f1727 100644
+--- a/meson.build
++++ b/meson.build
+@@ -184,8 +184,8 @@ if enable_gtk_doc
+   subdir('docs/reference/libmbim-glib')
+ endif
+ 
+-help2man = find_program('help2man', required: false)
+-if help2man.found()
++enable_man = get_option('man')
++if enable_man
+   subdir('docs/man')
+ endif
+ 
+@@ -198,6 +203,7 @@ summary({
+ output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
+ output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
+ output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
++output += '    man pages:             ' + enable_man.to_string() + '\n\n'
+ output += '  System paths\n'
+ output += '    prefix:                ' + mbim_prefix + '\n'
+ output += '    udev base directory:   ' + mbim_username + '\n\n'
+diff --git a/meson_options.txt b/meson_options.txt
+index 1305957..bfa33ab 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -7,5 +7,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
+ 
+ option('introspection', type: 'boolean', value: 'true', description: 'build introspection support')
+ option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
++option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
+ 
+ option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
+-- 
+GitLab
+
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index cdc3fabedb..6737afebe8 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -12,6 +12,7 @@ LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2
+LIBMBIM_CONF_OPTS = -Dman=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBMBIM_DEPENDENCIES += gobject-introspection
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
