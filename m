Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECE2C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6891783BCA;
	Wed,  7 Feb 2024 16:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zwmrsck4FzV; Wed,  7 Feb 2024 16:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3433883B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3433883B38;
	Wed,  7 Feb 2024 16:07:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB6CD1BF3DF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4B40403E7
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Rk527fItG7U for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5469E400CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5469E400CB
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:07:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39F598760C; Wed,  7 Feb 2024 16:07:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:07:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33ac66e792b559bcbf31d69c58750a97b188933c
X-Git-Newrev: 3641347ff13267fe8a7f45d0207d333dac9ca38a
X-Patchwork-Hint: ignore
Message-Id: <20240207160746.39F598760C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: fix libiconv (intl)
 support
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
Content-Type: multipart/mixed; boundary="===============2555774408404570016=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2555774408404570016==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3641347ff13267fe8a7f45d0207d333dac9ca38a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libglib2 can compile without localization support, but still depends
on libiconv, which is selected in Config.in.

This fallback support was broken, and is fixed in this upstream commit:
https://gitlab.gnome.org/GNOME/glib/-/commit/a497d5be122f193dcf8679334308333bbbc14a71,
which partially reverts commits that were brought through merge commit
4a8120ec22be0b63705c1ed28b47920b99388087, that landed in 2.74.0 (as
the first stable release).

The other patch is purely added to avoid merge conflicts while
cherry-picking.

Fixes:

  http://autobuild.buildroot.org/results/04d9a17e64503e0bece7bad33549ef3ad4b237c9/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...etection-of-a-system-provided-proxy-libin.patch | 53 ++++++++++++++++++++++
 .../0005-meson-try-iconv-in-libintl-lookup.patch   | 53 ++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch b/package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
new file mode 100644
index 0000000000..57404705d0
--- /dev/null
+++ b/package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
@@ -0,0 +1,53 @@
+From 2ca9f53327308e85e376bcbef7f8259a6331a453 Mon Sep 17 00:00:00 2001
+From: Nirbheek Chauhan <nirbheek@centricular.com>
+Date: Thu, 8 Sep 2022 02:36:33 +0530
+Subject: [PATCH] meson: Fix detection of a system-provided proxy-libintl
+
+proxy-libintl defines ngettext() as a define in the header that points
+to the actual symbol in the library which is g_libintl_ngettext().
+Same with bind_textdomain_codeset().
+
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/32249a22fc39319651e7c23442d37ec837f05764
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 0cbc9689f..de0bee5a3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2089,6 +2089,7 @@ libz_dep = dependency('zlib')
+ # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
+ # implementations. This could be extended if issues are found in some platforms.
+ libintl_deps = []
++libintl_prefix = '#include <libintl.h>'
+ libintl = dependency('intl', required: false, allow_fallback: false)
+ if libintl.found()
+   # libintl supports different threading APIs, which may not
+@@ -2100,11 +2101,11 @@ if libintl.found()
+   #
+   # Meson's builtin dependency lookup as of 0.60.0 doesn't check for
+   # pthread, so we do this manually here.
+-  if cc.has_function('ngettext', dependencies : libintl)
++  if cc.has_function('ngettext', dependencies : libintl, prefix: libintl_prefix)
+     libintl_deps += [libintl]
+   else
+     libintl_pthread = cc.find_library('pthread', required : false)
+-    if libintl_pthread.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_pthread])
++    if libintl_pthread.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_pthread], prefix: libintl_prefix)
+       libintl_deps += [libintl, libintl_pthread]
+     else
+       libintl = disabler()
+@@ -2113,7 +2114,7 @@ if libintl.found()
+ endif
+ 
+ if libintl.found()
+-  have_bind_textdomain_codeset = cc.has_function('bind_textdomain_codeset', dependencies: libintl_deps)
++  have_bind_textdomain_codeset = cc.has_function('bind_textdomain_codeset', dependencies: libintl_deps, prefix: libintl_prefix)
+ else
+   libintl = dependency('intl', allow_fallback: true)
+   assert(libintl.type_name() == 'internal')
+-- 
+2.34.1
+
diff --git a/package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch b/package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
new file mode 100644
index 0000000000..a342ee95d6
--- /dev/null
+++ b/package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
@@ -0,0 +1,53 @@
+From fe7f54d4f339b7948c961b60729f620f2eaec716 Mon Sep 17 00:00:00 2001
+From: Jan200101 <sentrycraft123@gmail.com>
+Date: Tue, 23 May 2023 23:42:37 +0200
+Subject: [PATCH] meson: try iconv in libintl lookup
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This was originally removed in !2734 but still appears to be required for
+some MinGW setups, such as the `x86_64-w64-mingw32.static` target in
+[mxe](https://github.com/mxe/mxe).
+
+Currently, this configuration fails the libintl internal assert on line
+2128, as on this platform `ngettext()` is only found inside libiconv.
+
+This commit will look up iconv potentially twice, once as `libiconv` and
+potentially once as `libintl_iconv`. This is what the code did before
+!2734 landed, so it’s known to work reliably on a number of platforms.
+
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/a497d5be122f193dcf8679334308333bbbc14a71
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index de0bee5a3..653f9eddf 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2104,11 +2104,16 @@ if libintl.found()
+   if cc.has_function('ngettext', dependencies : libintl, prefix: libintl_prefix)
+     libintl_deps += [libintl]
+   else
+-    libintl_pthread = cc.find_library('pthread', required : false)
+-    if libintl_pthread.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_pthread], prefix: libintl_prefix)
+-      libintl_deps += [libintl, libintl_pthread]
++    libintl_iconv = cc.find_library('iconv', required : false)
++    if libintl_iconv.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_iconv])
++      libintl_deps += [libintl, libintl_iconv]
+     else
+-      libintl = disabler()
++      libintl_pthread = cc.find_library('pthread', required : false)
++      if libintl_pthread.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_pthread], prefix: libintl_prefix)
++        libintl_deps += [libintl, libintl_pthread]
++      else
++        libintl = disabler()
++      endif
+     endif
+   endif
+ endif
+-- 
+2.34.1
+

--===============2555774408404570016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2555774408404570016==--
