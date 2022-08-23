Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07648C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A294E8136C;
	Tue, 23 Aug 2022 20:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A294E8136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yo-mhhpw0hFo; Tue, 23 Aug 2022 20:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64C78135A;
	Tue, 23 Aug 2022 20:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C64C78135A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6027A1BF9A4
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 399064069B
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 399064069B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gry7jrK9xeM5 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 200224067C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 200224067C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DA4CD87BBC; Tue, 23 Aug 2022 20:05:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:19:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12e4f7c5c43fb7b4db6d6548b9dbabb9c1b5f875
X-Git-Newrev: b6bfa3f744d1dabd99ac74cf8008fb0cdfecdcb8
X-Patchwork-Hint: ignore
Message-Id: <20220823200511.DA4CD87BBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: dump traceback for
 unhandled exceptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6bfa3f744d1dabd99ac74cf8008fb0cdfecdcb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/genrandconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 21d4592049..4c00d67691 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -25,6 +25,7 @@ import os
 from random import randint
 import subprocess
 import sys
+import traceback
 from distutils.version import StrictVersion
 import platform
 
@@ -737,7 +738,7 @@ if __name__ == '__main__':
 
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
