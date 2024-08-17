Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1F4C52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 13:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07AFC4031C;
	Sat, 17 Aug 2024 13:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yza1-RwT8bwK; Sat, 17 Aug 2024 13:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B70574036E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B70574036E;
	Sat, 17 Aug 2024 13:18:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 535EA1BF267
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 13:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D52F4031C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 13:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGeB5Pzlxz-a for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 13:18:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2877C400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2877C400C6
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2877C400C6
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 13:18:54 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 919283535C1E; Sat, 17 Aug 2024 15:18:52 +0200 (CEST)
Date: Sat, 17 Aug 2024 15:18:52 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsCjPIEVSPj9R2Eo@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723900732; bh=HaHvlCPgucSYDnxaxf52aKcXAkTz5RIMl03/wfmclUs=;
 h=Date:From:To:Subject:From;
 b=Xw9kQFte9fwpEFC+NWPqgwtceAyDW+efsC91q4ic9CralMAkvvEsnt09hiCaGEQs8
 vVnLym7XI0mT7rZcNEzr5NtZYC1juOc+Xpw/yW4iDeUJmWlp3ph9IT7gStKbCAoD9o
 yA6L9OBMjuiKHlKET2IfuUffHyeawl9ikASG9aedJC9VMTAoItNqOu5cQSmLo88PQK
 jtPXjlvJAowPNabYyTJAtYXSvx43V/zwhshczxeSiExYrDlW7mPbJr97PVVyoGRN7m
 eY0WNRu7r2reVui+L2os1of6RISU6MngLZLrgBNulVVdKtTiysv1SAdXhPuDds6Al9
 NqRzL7iP5la9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Xw9kQFte
Subject: [Buildroot] [PATCH] package/avahi: fix python install issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the update of Python to 3.12.4 in commit
76cd14167f5eb3ffe22e131ddbbecf9bc61f2ef1 avahi fails to install
python subcomponents. The reason is that the obsolete imp
python modul is used. Add a patch to remove the imp dependency.

Fixes:
 - http://autobuild.buildroot.net/results/2bf/2bf391b93362204917a560705bc402585334ab3c

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0002-remove-imp-from-py-compile.patch     | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/avahi/0002-remove-imp-from-py-compile.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
