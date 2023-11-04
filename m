Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BDEC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C4D882202;
	Sat,  4 Nov 2023 21:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C4D882202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PMc7Ape0rCL; Sat,  4 Nov 2023 21:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F42E82204;
	Sat,  4 Nov 2023 21:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F42E82204
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32E981BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 605DC4193C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 605DC4193C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBQC-LBHK6WE for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80EAD41936
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80EAD41936
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F6128677B; Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:37:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b04ef9c6d2b15b542f1d8fac40b77ab797fb18da
X-Git-Newrev: de377bd313ef673a620b8cbbda3437d3ca5ab55c
X-Patchwork-Hint: ignore
Message-Id: <20231104213844.6F6128677B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pathtools: add
 0001-replace-imp.patch
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de377bd313ef673a620b8cbbda3437d3ca5ab55c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preperation of Python 3.12.0, add a patch to python-pathtools that removes
the reliance on the imp module following the instructions found here:
https://docs.python.org/3.12/whatsnew/3.12.html#removed

Also tested with Python 3.9.2 on Debian 11.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pathtools/0001-replace-imp.patch | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/python-pathtools/0001-replace-imp.patch b/package/python-pathtools/0001-replace-imp.patch
new file mode 100644
index 0000000000..a5bc240cea
--- /dev/null
+++ b/package/python-pathtools/0001-replace-imp.patch
@@ -0,0 +1,55 @@
+From e2372bbecdf46a100b09126f2951431c1929637b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 24 Oct 2023 08:59:21 +0200
+Subject: [PATCH] Replace imp
+
+The imp module has been removed in python 3.12.0.
+
+This change has also been tested with Python 3.9.2 on Debian 11.
+
+From: https://docs.python.org/3.12/whatsnew/3.12.html#removed, follow the
+instructions to add the load_source method back into setup.py.
+
+Upstream: https://github.com/gorakhargosh/pathtools/pull/14
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ setup.py | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 4718885..1be0315 100644
+--- a/setup.py
++++ b/setup.py
+@@ -22,12 +22,25 @@
+ # THE SOFTWARE.
+ 
+ import os
+-import imp
++import importlib.util
++import importlib.machinery
+ from setuptools import setup
+ 
+ PKG_DIR = 'pathtools'
+-version = imp.load_source('version',
+-                          os.path.join(PKG_DIR, 'version.py'))
++
++# From: https://docs.python.org/3.12/whatsnew/3.12.html#removed
++def load_source(modname, filename):
++    loader = importlib.machinery.SourceFileLoader(modname, filename)
++    spec = importlib.util.spec_from_file_location(modname, filename, loader=loader)
++    module = importlib.util.module_from_spec(spec)
++    # The module is always executed and not cached in sys.modules.
++    # Uncomment the following line to cache the module.
++    # sys.modules[module.__name__] = module
++    loader.exec_module(module)
++    return module
++
++version = load_source('version',
++                      os.path.join(PKG_DIR, 'version.py'))
+ 
+ def read_file(filename):
+     """
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
