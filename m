Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A75C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B05580A4A;
	Sun, 18 Aug 2024 09:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJzMtqhBFawy; Sun, 18 Aug 2024 09:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0660180A60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0660180A60;
	Sun, 18 Aug 2024 09:19:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7201BF479
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 161676065C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Jv_9zis6IET for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:19:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4802060653
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4802060653
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:19:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33B7985FAB; Sun, 18 Aug 2024 09:19:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 11:13:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 182d3556a6838c01b0d1f4e6a36da84260605298
X-Git-Newrev: b19f8001c81753e2bf951c1076e7137fb23e099f
X-Patchwork-Hint: ignore
Message-Id: <20240818091933.33B7985FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: fix python install issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=b19f8001c81753e2bf951c1076e7137fb23e099f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the update of Python to 3.12.4 in commit
76cd14167f5eb3ffe22e131ddbbecf9bc61f2ef1 avahi fails to install
python subcomponents. The reason is that the obsolete imp
python modul is used. Add a patch to remove the imp dependency.

Fixes:
 - http://autobuild.buildroot.net/results/2bf/2bf391b93362204917a560705bc402585334ab3c

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../avahi/0002-remove-imp-from-py-compile.patch    | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/avahi/0002-remove-imp-from-py-compile.patch b/package/avahi/0002-remove-imp-from-py-compile.patch
new file mode 100644
index 0000000000..37534a3f7a
--- /dev/null
+++ b/package/avahi/0002-remove-imp-from-py-compile.patch
@@ -0,0 +1,50 @@
+Remove optional imp python module dependency.
+
+Upstream already removed py-compile entirely in their git repository,
+so the patch is not appropiate for upstream.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: not appropiate
+
+diff -Nur avahi-0.8.orig/py-compile avahi-0.8/py-compile
+--- avahi-0.8.orig/py-compile	2020-02-18 07:58:21.192417644 +0100
++++ avahi-0.8/py-compile	2024-08-17 15:03:07.328733849 +0200
+@@ -116,7 +116,7 @@
+ fi
+ 
+ $PYTHON -c "
+-import sys, os, py_compile, imp
++import sys, os, py_compile
+ 
+ files = '''$files'''
+ 
+@@ -129,15 +129,12 @@
+ 	    continue
+     sys.stdout.write(file)
+     sys.stdout.flush()
+-    if hasattr(imp, 'get_tag'):
+-        py_compile.compile(filepath, imp.cache_from_source(filepath), path)
+-    else:
+-        py_compile.compile(filepath, filepath + 'c', path)
++    py_compile.compile(filepath, filepath + 'c', path)
+ sys.stdout.write('\n')" || exit $?
+ 
+ # this will fail for python < 1.5, but that doesn't matter ...
+ $PYTHON -O -c "
+-import sys, os, py_compile, imp
++import sys, os, py_compile
+ 
+ # pypy does not use .pyo optimization
+ if hasattr(sys, 'pypy_translation_info'):
+@@ -153,10 +150,7 @@
+ 	    continue
+     sys.stdout.write(file)
+     sys.stdout.flush()
+-    if hasattr(imp, 'get_tag'):
+-        py_compile.compile(filepath, imp.cache_from_source(filepath, False), path)
+-    else:
+-        py_compile.compile(filepath, filepath + 'o', path)
++    py_compile.compile(filepath, filepath + 'o', path)
+ sys.stdout.write('\n')" 2>/dev/null || :
+ 
+ # Local Variables:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
