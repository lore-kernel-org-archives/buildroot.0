Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE93C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3944C402D1;
	Tue,  7 Feb 2023 11:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3944C402D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mezk3ax0g7b; Tue,  7 Feb 2023 11:26:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288B240278;
	Tue,  7 Feb 2023 11:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 288B240278
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A81661BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F47840275
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F47840275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtO0R9fDVDHD for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:26:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 354B24023F
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 354B24023F
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:26:47 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 0BF5D20758;
 Tue,  7 Feb 2023 05:26:46 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 05:26:44 -0600
Message-Id: <20230207112644.2467564-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1675769206; bh=HxI4kbS6dNB2BQAIQFI60j0TEPIV3xMvoTb2Dspgn7E=;
 h=From:To:Cc:Subject:Date:From;
 b=yagr8tgK/WGVD3qUQkTIfnlV6sdohzVkCZZyjmdRUIgT4UnzGMhuei4zwCuCiaz4Q
 pJMgQ1vVWvRf6jYM5rOT5lSz7bxAMdW03o7DJvulMc9DAraVmEmrGSiP+/3VOHqFpP
 QD/F3/7ggH0UHCecMUuO2pNhuZXF3/Iil1YbfEbw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=yagr8tgK
Subject: [Buildroot] [PATCH 1/1] package/bash: fix strtoimax builtin
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
Cc: Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Backport fixes from upstream to fix an issue where the strtoimax builtin
got built when not necessary.

This resolves bash static builds issues when using musl and uClibc.

Fixes:
 http://autobuild.buildroot.org/results/f8c/f8cb91f7f9ac6a46bb2ecfc22c1e42cf699f28d3//
 http://autobuild.buildroot.org/results/b0e/b0e5fcab9eeb799e31bca27fcb7280b728349bc6//

Upstream:
  https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=43e861c2cd840946a81dfd0386966eb4f3a17ce9

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 ...vert-condition-for-strtoimax-builtin.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch

diff --git a/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch b/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
new file mode 100644
index 0000000000..2ee9e1ad5a
--- /dev/null
+++ b/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
@@ -0,0 +1,60 @@
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
+---
+ configure       | 6 +++++-
+ m4/strtoimax.m4 | 5 ++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
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
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
