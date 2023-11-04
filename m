Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02387C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B306382206;
	Sat,  4 Nov 2023 21:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B306382206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glQj1NgsiwCw; Sat,  4 Nov 2023 21:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E741B821F6;
	Sat,  4 Nov 2023 21:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E741B821F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21DF61BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49F11418FE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49F11418FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJOKEGSfRsIs for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D93F41935
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D93F41935
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5798C8677A; Sat,  4 Nov 2023 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:37:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bf73cce2b5c48149b2807354c323ebf6861d07a
X-Git-Newrev: b04ef9c6d2b15b542f1d8fac40b77ab797fb18da
X-Patchwork-Hint: ignore
Message-Id: <20231104213844.5798C8677A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iptables: use
 sysconfig.get_path instead of get_python_lib
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

commit: https://git.buildroot.net/buildroot/commit/?id=b04ef9c6d2b15b542f1d8fac40b77ab797fb18da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

distutils is removed in Python 3.12.0. Switch to using sysconfig.get_path to
facilitate the migration.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...config-get_path-instead-of-get_python_lib.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch b/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
new file mode 100644
index 0000000000..2a4de3daf2
--- /dev/null
+++ b/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
@@ -0,0 +1,40 @@
+From fd415a3613fad872062fb7cb4e271ac1476402ef Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 24 Oct 2023 08:47:12 +0200
+Subject: [PATCH] use sysconfig.get_path instead of get_python_lib
+
+Distutils has been removed from python 3.12.0. Use sysconfig.get_path instead
+of get_python_lib.
+
+Upstream: https://github.com/ldx/python-iptables/pull/340
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ iptc/util.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/iptc/util.py b/iptc/util.py
+index 04fe905..94befc5 100644
+--- a/iptc/util.py
++++ b/iptc/util.py
+@@ -3,7 +3,7 @@ import os
+ import sys
+ import ctypes
+ import ctypes.util
+-from distutils.sysconfig import get_python_lib
++import sysconfig
+ from itertools import product
+ from subprocess import Popen, PIPE
+ from sys import version_info
+@@ -64,7 +64,7 @@ def _do_find_library(name):
+ 
+     # probably we have been installed in a virtualenv
+     try:
+-        lib = ctypes.CDLL(os.path.join(get_python_lib(), name),
++        lib = ctypes.CDLL(os.path.join(sysconfig.get_path("purelib"), name),
+                           mode=ctypes.RTLD_GLOBAL)
+         return lib
+     except:
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
