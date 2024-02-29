Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B14CC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 17:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38CBF82265;
	Thu, 29 Feb 2024 17:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTVis7GIWY5I; Thu, 29 Feb 2024 17:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B517822E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B517822E0;
	Thu, 29 Feb 2024 17:49:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 221AC1BF2B0
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 17:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BAE041850
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 17:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bViG98GmcGJH for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 17:49:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23FB7404B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23FB7404B6
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 17:49:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0907B87CC6; Thu, 29 Feb 2024 17:49:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 18:47:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd5d1f5b6ae8d9765520728e4995897940c86b05
X-Git-Newrev: 5f253e3e04e57d72f470eead8591a2606f98d396
X-Patchwork-Hint: ignore
Message-Id: <20240229174906.0907B87CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve: fix running on older
 ijson versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f253e3e04e57d72f470eead8591a2606f98d396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 22b69455526f (support/scripts/cve.py: switch from NVD to FKIE for
the JSON files) had to change the decompressor from gz to xz, as the new
location is using xz compression.

That commit mentioned that it was spawning an external xz process to do
the decompression, on the pretence that "there is no xz decompressor in
Python stdlib."

Before version 3.1, ijson.items() only accepted a file-like object as
input (that file-like object could yield bytes() or str(), both were
supported). Starting with version 3.1, ijson.items() also accepts that
it be directly passed bytes() or str() directly. subprocess.check_output()
means we are now passing bytes() to ijson.items(), so it fails on ijson
versions before 3.1, with failures such as:

    [...]
      File "/usr/lib/python3/dist-packages/ijson/backends/python.py", line 25, in Lexer
        if type(f.read(0)) == bytetype:
    AttributeError: 'bytes' object has no attribute 'read'

Ubuntu 20.04, on which the pkg-stats run to generate the daily report,
only has ijson 2.3. More recent distros have more recent versions of
ijson, like Fedora 39 that has 3.2.3, recent enough to support being fed
bytes(). Commit 22b69455526f was tested on Fedora 39, so did not catch
the issue.

However, the reasoning in 22b69455526f is wrong: there *is* the lzma
module, at least since python 3.3 (that is, aeons ago), which is able to
read xz-compressed files; it also has an API similar to the gzip module,
and can provide a file-like object that exposes the decompressed data.

So, do just that: provide an lzma-wrapped file-like object to ijson, so
that we can eventually recover our daily reports that everything is
broken! :-]

Note that this construct still works on recent versions!

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/cve.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 1a3c307e12..7167ecbc6a 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -21,8 +21,8 @@ import datetime
 import os
 import requests  # URL checking
 import distutils.version
+import lzma
 import time
-import subprocess
 import sys
 import operator
 
@@ -134,8 +134,7 @@ class CVE:
         for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
             filename = CVE.download_nvd_year(nvd_dir, year)
             try:
-                uncompressed = subprocess.check_output(["xz", "-d", "-c", filename])
-                content = ijson.items(uncompressed, 'cve_items.item')
+                content = ijson.items(lzma.LZMAFile(filename), 'cve_items.item')
             except:  # noqa: E722
                 print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
                 raise
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
