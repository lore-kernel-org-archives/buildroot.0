Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B20EC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E10E813EB;
	Tue,  7 Feb 2023 11:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E10E813EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjK-mRd1bXJr; Tue,  7 Feb 2023 11:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75302813C4;
	Tue,  7 Feb 2023 11:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75302813C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 318C61BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14193813B9
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14193813B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id utjF3ymY7k3h for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:47:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEF04813EB
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEF04813EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF4E18408C; Tue,  7 Feb 2023 11:47:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 12:47:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b63e155e5fb7104e6660aa0570befa9498259cd7
X-Git-Newrev: 12d85e9646ed89552c732775de000ad0b436a139
X-Patchwork-Hint: ignore
Message-Id: <20230207114725.BF4E18408C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bash: fix strtoimax builtin
 inclusion logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=12d85e9646ed89552c732775de000ad0b436a139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport fixes from upstream to fix an issue where the strtoimax builtin
got built when not necessary.

This resolves bash static builds issues when using musl and uClibc.

We fix both the m4 file and configure in that order, to be safe andnot
trigger an automatic autoreconf (even though bash does not have a rule
to automatically regenerate configure if an m4 file changes).

Fixes:
 http://autobuild.buildroot.org/results/f8c/f8cb91f7f9ac6a46bb2ecfc22c1e42cf699f28d3//
 http://autobuild.buildroot.org/results/b0e/b0e5fcab9eeb799e31bca27fcb7280b728349bc6//

Upstream:
  https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=43e861c2cd840946a81dfd0386966eb4f3a17ce9

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
[yann.morin.1998@free.fr:
  - patch configure after the m4 file
  - add blurb in commit log to explain that
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...re-invert-condition-for-strtoimax-builtin.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch b/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
new file mode 100644
index 0000000000..c412dcfce2
--- /dev/null
+++ b/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
@@ -0,0 +1,62 @@
+From 754e0d1edc1c01b18f4890de7c58f7610e589d76 Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@gmail.com>
+Date: Tue, 7 Feb 2023 03:55:28 -0600
+Subject: [PATCH] configure: invert condition for strtoimax builtin
+
+Previously, bash would attempt to build a replacement for strtoimax if
+it found that the C library had the function already declared.
+
+This caused build errors when linking against static libraries that did
+not define the function as a weak alias but, in reality, was a logic
+error since bash should only provide it's own implementation if one is
+not provided by the C library.
+
+Now, fix this by inverting the logic.
+
+Upstream:
+  https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=43e861c2cd840946a81dfd0386966eb4f3a17ce9
+
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[yann.morin.1998@free.fr: patch configure after the m file]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure       | 6 +++++-
+ m4/strtoimax.m4 | 5 ++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/m4/strtoimax.m4 b/m4/strtoimax.m4
+index 30985723..fa43ac7b 100644
+--- a/m4/strtoimax.m4
++++ b/m4/strtoimax.m4
+@@ -29,7 +29,10 @@ AC_CACHE_VAL(bash_cv_func_strtoimax,
+   fi
+ ])
+ AC_MSG_RESULT($bash_cv_func_strtoimax)
+-if test $bash_cv_func_strtoimax = yes; then
++if test "$ac_cv_have_decl_strtoimax" = "yes" ; then
++AC_DEFINE([HAVE_DECL_STRTOIMAX], [1])
++fi
++if test $bash_cv_func_strtoimax = no; then
+ AC_LIBOBJ(strtoimax)
+ fi
+ ])
+diff --git a/configure b/configure
+index 47313753..6039cee7 100755
+--- a/configure
++++ b/configure
+@@ -20443,7 +20443,11 @@ fi
+ 
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $bash_cv_func_strtoimax" >&5
+ printf "%s\n" "$bash_cv_func_strtoimax" >&6; }
+-if test $bash_cv_func_strtoimax = yes; then
++if test "$ac_cv_have_decl_strtoimax" = "yes" ; then
++printf "%s\n" "#define HAVE_DECL_STRTOIMAX 1" >>confdefs.h
++
++fi
++if test $bash_cv_func_strtoimax = no; then
+ case " $LIBOBJS " in
+   *" strtoimax.$ac_objext "* ) ;;
+   *) LIBOBJS="$LIBOBJS strtoimax.$ac_objext"
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
