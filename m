Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3624EE83EE7
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 08:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A73FE40B02;
	Wed,  4 Feb 2026 08:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzzvgjnLhgqD; Wed,  4 Feb 2026 08:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E6640B28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770193560;
	bh=55aErgjFabHunb30j9PWVFGoR6M+8dbmFamoMqyzpI8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V55a+/H0EtjkLbU4EI041sAC4G+6xRYsD/6LJTZRJwBLbKnIXnSq8WQD+glNaMJxo
	 OOP/epnB7+FGzkOvAB3JwbYBpPUffb/ebhvED/9v4GyMur8zR5f6RdXgKMDxo3mcDf
	 LOxGUwHguIaRMMQwTPI1GAzbb0PUR4z4ywksj269qwvci5JyXg20LbzArRne2MbihH
	 GkCK60pYiaH2cWghDpZbw9sHDeBTvGnrnLWDBYuMSOLK/g80nuTW1/fKMtdEeIbW7h
	 BvZcl9ezUKmIx/VXaEnEmdZkqzVET6rBdr3ArHOnJNJGUZ5NMHMO1gRVE67RhPjAWa
	 UgF6Dk5dyajJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E6640B28;
	Wed,  4 Feb 2026 08:26:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38C23F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33065402EA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdRZWXKZemRE for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 08:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 449D4403ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 449D4403ED
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:25:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A43186773; Wed,  4 Feb 2026 08:25:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 09:19:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 533dd663554e413fb1823697933d3f0e9a2c9bbe
X-Git-Newrev: e9f426aa527d279c078d234ffa3c4c8c052369ff
X-Patchwork-Hint: ignore
Message-Id: <20260204082558.2A43186773@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix
 RuntimeError with python 3.14 asyncio
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9f426aa527d279c078d234ffa3c4c8c052369ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When running "make pkg-stats" on a host with Python 3.14 (e.g.
Fedora 43 for example), the execution fails with the error:

    Checking URL status
    Traceback (most recent call last):
      File "/buildroot/support/scripts/pkg-stats", line 1387, in <module>
        __main__()
        ~~~~~~~~^^
      File "/buildroot/support/scripts/pkg-stats", line 1368, in __main__
        loop = asyncio.get_event_loop()
      File "/usr/lib64/python3.14/asyncio/events.py", line 715, in get_event_loop
        raise RuntimeError('There is no current event loop in thread %r.'
                           % threading.current_thread().name)
    RuntimeError: There is no current event loop in thread 'MainThread'.

This is due to a breaking change introduced in Python 3.14
asyncio.get_event_loop(). See [1]. Before Python 3.14, this call was
creating and setting an event loop if there was none. This situation
is now a runtime error.

In order to fix this issue with newer Python version, while keeping
backward compatibility, this commit replaces the code:

    loop = asyncio.get_event_loop()

by an explicit event loop creation:

    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)

This commit was tested on a Fedora 43 host with Python-3.14.2, and
with the Buildroot Docker image plus the python3-aiohttp package
which is a Debian 12 with Python-3.11.2.

[1] https://docs.python.org/3.14/library/asyncio-eventloop.html#asyncio.get_event_loop

Signed-off-by: Julien Olivain <ju.o@free.fr>
Tested-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7d9170e30f..d2d36257d9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1365,11 +1365,13 @@ def __main__():
         pkg.set_developers(developers)
     if "url" not in args.disable:
         print("Checking URL status")
-        loop = asyncio.get_event_loop()
+        loop = asyncio.new_event_loop()
+        asyncio.set_event_loop(loop)
         loop.run_until_complete(check_package_urls(packages, verbose=args.verbose))
     if "upstream" not in args.disable:
         print("Getting latest versions ...")
-        loop = asyncio.get_event_loop()
+        loop = asyncio.new_event_loop()
+        asyncio.set_event_loop(loop)
         loop.run_until_complete(check_package_latest_version(packages, verbose=args.verbose))
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
