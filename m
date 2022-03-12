Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EE3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A1E40925;
	Sat, 12 Mar 2022 17:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mU8-tOTLjuJ3; Sat, 12 Mar 2022 17:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5EFF4091C;
	Sat, 12 Mar 2022 17:13:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 669BE1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A46A6401D5
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qqAMx2cbLEO for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03192403AA
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4898182AD8; Sat, 12 Mar 2022 17:01:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27cd0b5033bfe6fabc580659eb0c1f2efc7d4984
X-Git-Newrev: 4c17e3e4b9af68a84adebd26c94700274a030a79
X-Patchwork-Hint: ignore
Message-Id: <20220312170118.4898182AD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqmi: bump version to 1.30.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c17e3e4b9af68a84adebd26c94700274a030a79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0001-build-add-an-option-to-not-build-man-pages.patch
as release contains very similar commit which does autodetection:
1a474db ("build: add an option to not build man pages")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...uild-add-an-option-to-not-build-man-pages.patch | 65 ----------------------
 package/libqmi/libqmi.hash                         |  2 +-
 package/libqmi/libqmi.mk                           |  2 +-
 3 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch b/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
deleted file mode 100644
index d9053de537..0000000000
--- a/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 295b75e9c8dc895e281e36b1e8121d09fd556af0 Mon Sep 17 00:00:00 2001
-From: Aleksander Morgado <aleksander@aleksander.es>
-Date: Wed, 3 Nov 2021 10:57:51 +0100
-Subject: [PATCH] build: add an option to not build man pages
-
-When cross-compiling, the compiled binaries cannot be run on the build
-machine, unless one defines a helper (e.g. qemu) in the meson
-configuration, which is most of the time undesirable.
-
-If help2man is installed on the build machine, then the build would fail
-because of this, so add an option to disable generating the man pages.
-
-With later versions of meson, it will be possible to automatically
-detect this condition.
-
-Based on the same fix done in libmbim by Nicolas Cavallari, see
-https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40
-
-Fixes https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/issues/75
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/295b75e9c8dc895e281e36b1e8121d09fd556af0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build       | 8 +++++++-
- meson_options.txt | 1 +
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index e88b43a1..c7312146 100644
---- a/meson.build
-+++ b/meson.build
-@@ -223,8 +223,8 @@ if enable_gtk_doc
-   subdir('docs/reference/libqmi-glib')
- endif
- 
--help2man = find_program('help2man', required: false)
--if help2man.found()
-+enable_man = get_option('man')
-+if enable_man
-   subdir('docs/man')
- endif
- 
-@@ -237,6 +242,7 @@ summary({
- output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
- output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
- output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
-+output += '    man pages:             ' + enable_man.to_string() + '\n\n'
- output += '  System paths\n'
- output += '    prefix:                ' + qmi_prefix + '\n'
- output += '    udev base directory:   ' + qmi_username + '\n\n'
-diff --git a/meson_options.txt b/meson_options.txt
-index 4d4f913d..bee5daac 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -16,5 +16,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
- 
- option('introspection', type: 'boolean', value: 'auto', description: 'build introspection support')
- option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
-+option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
- 
- option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
--- 
-GitLab
-
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 1f2da45ac0..ef2da77a2a 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  2eb7c7971b91a64ad830643b0170cff692a69bf0f093ca61d72d3f466a0272d4  libqmi-1.30.2.tar.gz
+sha256  82ddd3f77c602b1e0c11d3e41d0563ede11f95036ebfcf929bc89157b13928e6  libqmi-1.30.4.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index a4839f1efb..b33e2fdc47 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.2
+LIBQMI_VERSION = 1.30.4
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
