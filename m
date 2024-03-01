Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCCBC54E41
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D3083126;
	Fri,  1 Mar 2024 10:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qWyK4OJHviJb; Fri,  1 Mar 2024 10:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B55983192
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B55983192;
	Fri,  1 Mar 2024 10:55:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 174BC1BF853
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 116B46063E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWNW8BJfzYKo for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C66A60627
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C66A60627
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:55:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB4E6825B1; Fri,  1 Mar 2024 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 11:50:10 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: f3c00526a30ea02d60a613b4ea2f8f4c7195ef3e
X-Git-Newrev: 3526dea52c22d5faeb6f13c6009837ed0ae78f4d
X-Patchwork-Hint: ignore
Message-Id: <20240301105526.EB4E6825B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libglib2: fix
 libiconv (intl) support
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
Content-Type: multipart/mixed; boundary="===============9216835746765509919=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9216835746765509919==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3526dea52c22d5faeb6f13c6009837ed0ae78f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 3641347ff13267fe8a7f45d0207d333dac9ca38a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============9216835746765509919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9216835746765509919==--
