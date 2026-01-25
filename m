Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135FBE63C90
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 12:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C5A40648;
	Sun, 25 Jan 2026 12:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gl6IeF1N6Jo; Sun, 25 Jan 2026 12:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE7D840653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769344198;
	bh=I8wyj1b3zOjFHyW5iIChc0hk50sul8TnYYUuADqpuAU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qF0M0RdwAfc6kwUxADPIwEj+5DeL6JKxqk9fiNpaqIomCjPjEHbNAvhOqiiQHZSCJ
	 JGseTJQItwtTbRBwsgtu1WqkQ/uRMx+j5xrzYYHFqNLeRJ6DGBFqqEIcrISHksOH0h
	 jqzBk7Xt3JRYP1rbt/DqnEMjGWeYEhcAFa5D09vIZqnAlKvk/OMfQgf0eMGuBpS+uT
	 mOudZweTz1XPgNRMZ5GnOUF1Q3xxRUIRomeW/ir5Il+mCtVyWwnDPf+HYC8SeNFuva
	 /iGGCCIdk1LOUh4KpM4nfmRmcMrVNGHPYjz6biapna7rWfGEGUy0FYsq+mfhtk7ZiR
	 3B5yaUYVQTsWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE7D840653;
	Sun, 25 Jan 2026 12:29:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E637F11B
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA2CB815C4
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEvzfLj1si9s for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 12:29:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB88F815AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB88F815AB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB88F815AB
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:29:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id F2B3019F733;
 Sun, 25 Jan 2026 13:29:49 +0100 (CET)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 25 Jan 2026 13:29:38 +0100
Message-ID: <20260125122938.260135-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769344192;
 bh=qNjyq0LH3UYSnW3EAcUmD7yVOCQ8E3tUkBjmookNO1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=ORJIS/BXQiT5GpGkQ4s8GO5O3ARO5WvCqwkSMhdNLeQVA/b1sFCv/4SlTEdmTp9AU
 iiEkObkzhxQ2vROhbei5NG4+iIuVUSU6ymOEIbSC8121UQzVTcE2fPX9D28FzDfHUN
 xUCjJswsBTu35ol1x0imK9DWbyyeK0MtsKc/43lvspXhZphpz2pKsiHhOx6cwyEoI1
 AEuQXLXA42ZnrJasScocB4t7v2iHzyKunbz+wN72+80ma9+nsYCinsjkYQxZKcmOyP
 pQoNiQS9jfJgoBTBiMLeNMqodDNz44KBs9aRQDPe6RlmkDd9Dw8KsKWOnXnhX3STgH
 GPsrYAPqazf2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ORJIS/BX
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix RuntimeError
 with python 3.14 asyncio
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
