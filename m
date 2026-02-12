Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A18EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F2B84620;
	Fri, 13 Feb 2026 19:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJDw2zOv0kUg; Fri, 13 Feb 2026 19:36:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5AC8845FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011371;
	bh=Qv8waLlkCNvrX457Ps9RkvBRyR/2Y30mcXMPhAIJOFc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gG04WQnLEJJJdtQiWfB2l6aOXT6Feo9iWNXmPExrdaRtxgr2ErA+ulhgVLndRg4tL
	 5OmS2jFKhGJn20ZxFMTZwG2wfDZA9WJ5ioyjjTfPgQPdDPfdimpmWq1fIacxl8bCSe
	 aRD71Fr+yuDIAt3ebMvhbayg/3FTf98pnqAuBCPhYjgN/Yb724RJ15LcLUBo1igkgY
	 V45oBrTwTwdZZTWxe5UpgJiicdvRuWJDOylDQJDMdrfIe1XGMPawFbyb5RmDeqZOCS
	 ZJvD8Tab72SSApDmDajyCzcmsPoNGzjCcKYdJJkLvOHUDIZqz/JVhRYwH9J44YGy9v
	 U+jagz2TqaQ4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5AC8845FA;
	Fri, 13 Feb 2026 19:36:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F39283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE7718455C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJYEdK652fUK for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0FBC844E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0FBC844E5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5C2F81EB5; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:06:27 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2fadc8245431c616ce63aebd518f9434cf6c6a78
X-Git-Newrev: 102262dbf9cf1fd8ba12133170863af411d4fb87
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.C5C2F81EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: fix RuntimeError with python 3.14 asyncio
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/102262dbf9cf1fd8ba12133170863af411d4fb87
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit e9f426aa527d279c078d234ffa3c4c8c052369ff)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
