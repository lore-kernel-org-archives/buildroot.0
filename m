Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7351C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 17:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DF404094B;
	Sat, 22 Jan 2022 17:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRzfSd3nyxxO; Sat, 22 Jan 2022 17:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CD4410C8;
	Sat, 22 Jan 2022 17:40:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF101BF2C0
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEF34401A3
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jblGaV4PbXqv for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 17:39:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7BEF400CE
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 17:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9547982A06; Sat, 22 Jan 2022 17:33:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 18:31:59 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a29088b78d06e066ba3c743d85c09f25e1c5fd51
X-Git-Newrev: 6ec2241856579b7de135c699288a8d449fe551dd
X-Patchwork-Hint: ignore
Message-Id: <20220122173310.9547982A06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libqmi: fix build
 with help2man
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ec2241856579b7de135c699288a8d449fe551dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix the following build failure raised with help2man since bump to
version 1.30.0 in commit 50c5495f81d3418a0f63fc642dc6beb41cd316e0:

FAILED: docs/man/qmicli.1
/usr/bin/help2man --output=docs/man/qmicli.1 '--name=Control QMI devices' '--help-option="--help-all"' /home/peko/autobuild/instance-1/output-1/build/libqmi-1.30.2/build/src/qmicli/qmicli
help2man: can't get `"--help-all"' info from /home/peko/autobuild/instance-1/output-1/build/libqmi-1.30.2/build/src/qmicli/qmicli
Try `--no-discard-stderr' if option outputs to stderr

Fixes:
 - http://autobuild.buildroot.org/results/15818b6de7378cd75c59b1d6dc732ed9a20c092a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7f38ce2103bbb01128dd00f102d0834d03343c2f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uild-add-an-option-to-not-build-man-pages.patch | 65 ++++++++++++++++++++++
 package/libqmi/libqmi.mk                           |  1 +
 2 files changed, 66 insertions(+)

diff --git a/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch b/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
new file mode 100644
index 0000000000..d9053de537
--- /dev/null
+++ b/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
@@ -0,0 +1,65 @@
+From 295b75e9c8dc895e281e36b1e8121d09fd556af0 Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@aleksander.es>
+Date: Wed, 3 Nov 2021 10:57:51 +0100
+Subject: [PATCH] build: add an option to not build man pages
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
+Based on the same fix done in libmbim by Nicolas Cavallari, see
+https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40
+
+Fixes https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/issues/75
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/295b75e9c8dc895e281e36b1e8121d09fd556af0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build       | 8 +++++++-
+ meson_options.txt | 1 +
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index e88b43a1..c7312146 100644
+--- a/meson.build
++++ b/meson.build
+@@ -223,8 +223,8 @@ if enable_gtk_doc
+   subdir('docs/reference/libqmi-glib')
+ endif
+ 
+-help2man = find_program('help2man', required: false)
+-if help2man.found()
++enable_man = get_option('man')
++if enable_man
+   subdir('docs/man')
+ endif
+ 
+@@ -237,6 +242,7 @@ summary({
+ output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
+ output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
+ output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
++output += '    man pages:             ' + enable_man.to_string() + '\n\n'
+ output += '  System paths\n'
+ output += '    prefix:                ' + qmi_prefix + '\n'
+ output += '    udev base directory:   ' + qmi_username + '\n\n'
+diff --git a/meson_options.txt b/meson_options.txt
+index 4d4f913d..bee5daac 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -16,5 +16,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
+ 
+ option('introspection', type: 'boolean', value: 'auto', description: 'build introspection support')
+ option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
++option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
+ 
+ option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
+-- 
+GitLab
+
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index cd2c2719f9..a4839f1efb 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -12,6 +12,7 @@ LIBQMI_CPE_ID_VENDOR = libqmi_project
 LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
+LIBQMI_CONF_OPTS = -Dman=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBQMI_DEPENDENCIES += gobject-introspection
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
