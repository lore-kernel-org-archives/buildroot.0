Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E652BC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 11:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F2CC84314;
	Sat, 17 Sep 2022 11:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2CC84314
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRkqtb5Kx7QP; Sat, 17 Sep 2022 11:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE8384306;
	Sat, 17 Sep 2022 11:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE8384306
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD8881BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5D3684306
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D3684306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVbK8q2HOjDE for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 11:06:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFD4C842FF
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 11:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD4C842FF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BE319841DE; Sat, 17 Sep 2022 11:06:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 13:05:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: a4435cfb55f64682d7c95a8a092deca8f6d8ab82
X-Git-Newrev: dcb4350787e41ce034150a2ecddb5af8bb2343a2
X-Patchwork-Hint: ignore
Message-Id: <20220917110616.BE319841DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] utils/genrandconfig: dump
 traceback for unhandled exceptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcb4350787e41ce034150a2ecddb5af8bb2343a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

In case of an unexpected error, we currently only print the exception as
an str(). For example, the recent issue with the glibc version check
only reported:
    TypeError: cannot use a string pattern on a bytes-like object

That does not help in fixing the issue; the exception text is also not
usually very user-friendly either anyway.

We change the reporting to print the traceback, which in the glibc
version check mentioned above, the error is reported as:

    Traceback (most recent call last):
      File "./utils/genrandconfig", line 740, in <module>
        ret = gen_config(args)
      File "./utils/genrandconfig", line 676, in gen_config
        if not is_toolchain_usable(configfile, toolchainconfig):
      File "./utils/genrandconfig", line 186, in is_toolchain_usable
        if StrictVersion('2.14') > StrictVersion(glibc_version):
      File "/usr/lib/python3.8/distutils/version.py", line 40, in __init__
        self.parse(vstring)
      File "/usr/lib/python3.8/distutils/version.py", line 135, in parse
        match = self.version_re.match(vstring)
    TypeError: cannot use a string pattern on a bytes-like object

With this, the error is much easier to pinpoint (it's the last one that
is not in a system module).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b6bfa3f744d1dabd99ac74cf8008fb0cdfecdcb8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 0de5a43ebb..f9d690b45a 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -25,6 +25,7 @@ import os
 from random import randint
 import subprocess
 import sys
+import traceback
 from distutils.version import StrictVersion
 import platform
 
@@ -684,7 +685,7 @@ if __name__ == '__main__':
 
     try:
         ret = gen_config(args)
-    except Exception as e:
-        print(str(e), file=sys.stderr)
+    except Exception:
+        traceback.print_exc()
         parser.exit(1)
     parser.exit(ret)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
