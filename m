Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98650C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D6F2841B3;
	Mon, 21 Mar 2022 21:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzhGEwH1dsnu; Mon, 21 Mar 2022 21:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C2028412D;
	Mon, 21 Mar 2022 21:00:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACD381BF373
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA43C41675
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1ijY5DtinSn for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:00:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4733C41638
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:00:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E404F84C9B; Mon, 21 Mar 2022 20:51:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 21:56:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e8b01afd5d8d8af8f4ce334073df9b15497cf36
X-Git-Newrev: 2d6e5a8501ff509760dca5c1477281d3f3430ddf
X-Patchwork-Hint: ignore
Message-Id: <20220321205120.E404F84C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/odb: backport more upstream
 commits to fix build with gcc 11.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d6e5a8501ff509760dca5c1477281d3f3430ddf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ac9855e761443dee4f9d461b83e12443d37e8678 ("package/odb: fix
build with gcc 11") already fixed some gcc 11.x issues, but not all of
them. This commit backports two upstream patches fixing the remaining
issues, ensuring host-odb can be built on a gcc 11.x machine.

Fixes:

  http://autobuild.buildroot.net/results/d37c4271e66d923f7af6a4e3dbad603fcd1c8119/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/odb/0012-Adjust-to-changes-in-GCC-11.patch | 50 ++++++++++++++++
 ...e-lookup-ambiguity-causing-error-with-GCC.patch | 68 ++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/package/odb/0012-Adjust-to-changes-in-GCC-11.patch b/package/odb/0012-Adjust-to-changes-in-GCC-11.patch
new file mode 100644
index 0000000000..2959a71dea
--- /dev/null
+++ b/package/odb/0012-Adjust-to-changes-in-GCC-11.patch
@@ -0,0 +1,50 @@
+From 5a5656920c6b49902ae0da6a0da84efe6e5a66f0 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Wed, 31 Mar 2021 10:45:21 +0200
+Subject: [PATCH] Adjust to changes in GCC 11
+
+[Upstream: 61d80f051293a7449a09081f60f48b8377bfbbad]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ odb/gcc.hxx | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/odb/gcc.hxx b/odb/gcc.hxx
+index fb6a1bf..d8ad590 100644
+--- a/odb/gcc.hxx
++++ b/odb/gcc.hxx
+@@ -164,6 +164,7 @@ gcc_tree_code_name (gcc_tree_code_type tc) {return tree_code_name[tc];}
+ // In GCC 9:
+ //
+ // INCLUDED_FROM     Became linemap_included_from_linemap().
++//
+ // LAST_SOURCE_LINE  Was removed apparently as no longer used. Studying
+ //                   the line-map.h diff from 8.3 suggests that the old
+ //                   implementation should still work.
+@@ -193,4 +194,23 @@ LAST_SOURCE_LINE (const line_map_ordinary* map)
+ 
+ #endif
+ 
++// In GCC 11:
++//
++// lookup_qualified_name() has a new interface.
++//
++// DECL_IS_BUILTIN became DECL_IS_UNDECLARED_BUILTIN.
++//
++#if BUILDING_GCC_MAJOR >= 11
++
++inline tree
++lookup_qualified_name (tree scope, tree name, bool type, bool complain)
++{
++  return lookup_qualified_name (
++    scope, name, (type ? LOOK_want::TYPE : LOOK_want::NORMAL), complain);
++}
++
++#define DECL_IS_BUILTIN(decl) DECL_IS_UNDECLARED_BUILTIN(decl)
++
++#endif
++
+ #endif // ODB_GCC_HXX
+-- 
+2.34.1
+
diff --git a/package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch b/package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch
new file mode 100644
index 0000000000..79c3d982fa
--- /dev/null
+++ b/package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch
@@ -0,0 +1,68 @@
+From 60460df2a6d7b43a860a8f8b614c049ec0127ea8 Mon Sep 17 00:00:00 2001
+From: Boris Kolpackov <boris@codesynthesis.com>
+Date: Wed, 7 Jul 2021 09:26:57 +0200
+Subject: [PATCH] Resolve name lookup ambiguity causing error with GCC 11
+
+[Upstream: 47035c0f72efd99a2210cd45db6e42423fb74533]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ odb/relational/header.hxx | 2 ++
+ odb/relational/source.hxx | 8 ++++++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/odb/relational/header.hxx b/odb/relational/header.hxx
+index 63dea09..d7f78fa 100644
+--- a/odb/relational/header.hxx
++++ b/odb/relational/header.hxx
+@@ -50,6 +50,8 @@ namespace relational
+ 
+       typedef typename member_base_impl<T>::member_info member_info;
+ 
++      using member_base_impl<T>::container;
++
+       virtual bool
+       pre (member_info& mi)
+       {
+diff --git a/odb/relational/source.hxx b/odb/relational/source.hxx
+index 716aa10..7da25fc 100644
+--- a/odb/relational/source.hxx
++++ b/odb/relational/source.hxx
+@@ -1360,6 +1360,8 @@ namespace relational
+ 
+       typedef typename member_base_impl<T>::member_info member_info;
+ 
++      using member_base_impl<T>::container;
++
+       virtual bool
+       pre (member_info& mi)
+       {
+@@ -1744,6 +1746,8 @@ namespace relational
+ 
+       typedef typename member_base_impl<T>::member_info member_info;
+ 
++      using member_base_impl<T>::container;
++
+       virtual bool
+       pre (member_info& mi)
+       {
+@@ -2007,6 +2011,8 @@ namespace relational
+ 
+       typedef typename member_base_impl<T>::member_info member_info;
+ 
++      using member_base_impl<T>::container;
++
+       virtual void
+       set_null (member_info&) = 0;
+ 
+@@ -2458,6 +2464,8 @@ namespace relational
+ 
+       typedef typename member_base_impl<T>::member_info member_info;
+ 
++      using member_base_impl<T>::container;
++
+       virtual void
+       get_null (string const& var) const = 0;
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
