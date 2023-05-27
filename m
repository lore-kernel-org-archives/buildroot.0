Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3895DC77B73
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 10:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE0CF61142;
	Sat, 27 May 2023 10:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE0CF61142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBs4A6AD3_47; Sat, 27 May 2023 10:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF09760F56;
	Sat, 27 May 2023 10:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF09760F56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A39621BF34B
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89D1F429CB
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 10:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D1F429CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xeXTk9rl48OO for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 10:02:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE2CC426F1
 for <buildroot@buildroot.org>; Sat, 27 May 2023 10:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2CC426F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A2738663A; Sat, 27 May 2023 10:02:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 12:01:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ac1458e8162ab9d3ac3c5354c874a00bdf36d57
X-Git-Newrev: d3a93df9e84a65bfdbf5748692f4d9241363c025
X-Patchwork-Hint: ignore
Message-Id: <20230527100222.9A2738663A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crudini: fix python 3.10+ warning
 due to pipes import
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3a93df9e84a65bfdbf5748692f4d9241363c025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The TestCrudiniPy3 test fail due to a python 3.10 warning due to pipes
import in crudini.

Indeed, pipes is deprecated since python 3.10 and slated for removal
in python 3.13.

Backport an upstream patch fixing the warning.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819049

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/crudini/0001-prefer-shlex-over-pipes.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/crudini/0001-prefer-shlex-over-pipes.patch b/package/crudini/0001-prefer-shlex-over-pipes.patch
new file mode 100644
index 0000000000..16296f619f
--- /dev/null
+++ b/package/crudini/0001-prefer-shlex-over-pipes.patch
@@ -0,0 +1,41 @@
+From d81b703f3e8e29c1547386135c7e9ca539c1f054 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 2 Aug 2022 14:40:37 +0100
+Subject: [PATCH] prefer shlex over pipes
+
+pipes is deprecated since python 3.10
+and slated for removal in python 3.13
+
+[Romain backport to 0.9.3]
+Upstream: https://github.com/pixelb/crudini/commit/e1650941054822faad4cda788bff6fe364eb4ca3
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ crudini | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/crudini b/crudini
+index 669596b..a136241 100755
+--- a/crudini
++++ b/crudini
+@@ -17,15 +17,17 @@ import getopt
+ import hashlib
+ import iniparse
+ import os
+-import pipes
++import re
+ import shutil
+ import string
+ import tempfile
+ 
+ if sys.version_info[0] >= 3:
++    import shlex as pipes
+     from io import StringIO
+     import configparser
+ else:
++    import pipes
+     from cStringIO import StringIO
+     import ConfigParser as configparser
+ 
+-- 
+2.34.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
