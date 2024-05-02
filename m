Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04BCC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFFC4074B;
	Thu,  2 May 2024 08:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hu4P2KPq47Yj; Thu,  2 May 2024 08:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B58EB410AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B58EB410AB;
	Thu,  2 May 2024 08:30:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 089361BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87984074B
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7tvg8me79ya for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56FC9410EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56FC9410EA
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:30:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30822865EC; Thu,  2 May 2024 08:30:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 10:30:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce3ce432feda336e4476eb930353fed8e3318539
X-Git-Newrev: 929bffbf4bf8fcb91bda446777f907f32c782656
X-Patchwork-Hint: ignore
Message-Id: <20240502083036.30822865EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: fix atomic handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=929bffbf4bf8fcb91bda446777f907f32c782656
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Correctly fix atomic handling to avoid the following build failure with
all users of libglib2 (e.g. gdk-pixbuf) raised since bump to version
2.76.1 in commit 3f9622fe3d85b4d9f734b879abc1d485afea19b2:

/usr/lib/libglib-2.0.a(gthread-posix.c.o): in function `g_mutex_trylock':
gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'

Fixes:
 - http://autobuild.buildroot.org/results/24a358869b98d83ab374c7c3a185ced450064d35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0005-link-with-latomic-when-needed.patch       | 45 ++++++++++++++++++++++
 package/libglib2/libglib2.mk                       |  5 ---
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/package/libglib2/0005-link-with-latomic-when-needed.patch b/package/libglib2/0005-link-with-latomic-when-needed.patch
new file mode 100644
index 0000000000..275d86032b
--- /dev/null
+++ b/package/libglib2/0005-link-with-latomic-when-needed.patch
@@ -0,0 +1,45 @@
+From d1814dbd3a88c95a43d4c9805bb4a523cf62d97b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Sep 2023 20:42:00 +0200
+Subject: [PATCH] link with -latomic when needed
+
+Some architecture such as sparc and some flavors of arm needs -latomic
+to avoid the following build failure:
+
+gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3586
+---
+ glib/meson.build | 1 +
+ meson.build      | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/glib/meson.build b/glib/meson.build
+index c26a35e42..7a761306b 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -426,6 +426,7 @@ libglib = library('glib-2.0',
+     pcre2,
+     platform_deps,
+     thread_dep,
++    atomic_dep
+   ],
+   c_args : glib_c_args,
+   objc_args : glib_c_args,
+diff --git a/meson.build b/meson.build
+index 25ae10fc2..5ae84b3b3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2130,6 +2130,8 @@ libffi_dep = dependency('libffi', version : '>= 3.0.0')
+ 
+ libz_dep = dependency('zlib')
+ 
++atomic_dep = cc.find_library('atomic', required: false)
++
+ # First check in libc, fallback to libintl, and as last chance build
+ # proxy-libintl subproject.
+ # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
+-- 
+2.40.1
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index c06ded2a5b..bffc565f11 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -64,11 +64,6 @@ ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 LIBGLIB2_DEPENDENCIES += elfutils
 endif
 
-# Uses __atomic_compare_exchange_4
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBGLIB2_LDFLAGS += -latomic
-endif
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
