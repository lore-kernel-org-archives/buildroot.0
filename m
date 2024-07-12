Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FECEC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A736408BD;
	Fri, 12 Jul 2024 13:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qklhP2QPQg2T; Fri, 12 Jul 2024 13:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F92417DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F92417DC;
	Fri, 12 Jul 2024 13:01:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0C11BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54DD7402C7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKrKpmJMpGy2 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D76E4043E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D76E4043E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 411D081D3A; Fri, 12 Jul 2024 13:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 15:01:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20a6d583bd2c4cbeba409a3f892422e98181e2b0
X-Git-Newrev: cc2157418dedbfb8e0bd7400e13b6964e5ee92ac
X-Patchwork-Hint: ignore
Message-Id: <20240712130125.411D081D3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack2: fix build with python 3.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc2157418dedbfb8e0bd7400e13b6964e5ee92ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with python 3.12 (which removed imp
module):

Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/./waf", line 166, in <module>
    from waflib import Scripting
  File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/waflib/Scripting.py", line 10, in <module>
    from waflib import Utils, Configure, Logs, Options, ConfigSet, Context, Errors, Build, Node
  File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/waflib/Configure.py", line 16, in <module>
    from waflib import ConfigSet, Utils, Options, Logs, Context, Build, Errors
  File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/waflib/Options.py", line 14, in <module>
    from waflib import Logs, Utils, Context, Errors
  File "/home/autobuild/autobuild/instance-7/output-1/build/jack2-1.9.22/waflib/Context.py", line 9, in <module>
    import os, re, imp, sys
ModuleNotFoundError: No module named 'imp'

Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
 - http://autobuild.buildroot.org/results/1bfe34e10ffdab80647ac01863165e93bcc9b0d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jack2/0001-Update-to-waf-2-0-26.patch | 3480 +++++++++++++++++++++++++
 1 file changed, 3480 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
