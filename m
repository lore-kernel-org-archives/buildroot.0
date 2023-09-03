Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9567FC71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 07:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D576E40480;
	Sun,  3 Sep 2023 07:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D576E40480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ez-W4rfZirR6; Sun,  3 Sep 2023 07:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B8B640338;
	Sun,  3 Sep 2023 07:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B8B640338
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBEA11BF470
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 07:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9582B81FA8
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 07:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9582B81FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmRKh4yOiS8j for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 07:51:47 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9542781FA1
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 07:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9542781FA1
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E98C0352BD9A; Sun,  3 Sep 2023 09:51:43 +0200 (CEST)
Date: Sun, 3 Sep 2023 09:51:43 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZPQ7D+xaRQDl1n8L@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1693727503; bh=/qZAakN02TNz2NNFWoT2VyQsG72yKtOD7/WnPmqpXio=;
 h=Date:From:To:Subject:From;
 b=d3f/6JQu3QostZNHjFFsAXXy6awVkyEugWXaHaRhsqH528x0clH+ltj1mOyoLxEoP
 1wmJvYcjFjsWh5zhuYfNGk4i88VScWU60SbqNHJaCQ64P5Quu58REPYpXik2ahMPSM
 HWkLkDONV+XZVjYeSmA7/sjaR6y3Hto0pacq66uPuYM8QYN9dS9qbHPf9I80x4JyIv
 eYwO0eIkSKn+s6NoNcgoTgUxvQ7rriv+H/dvDO4T9wGyTWaMAXgOQtZdWqoNqdx+QI
 7yupBcZNi3sgaOj2LzztPfhDPdwEdgonKJlEQXTZzqRolmsaDto0frP1n6ZpMN0UyN
 er+AB7bE1Nj6A==
Subject: [Buildroot] [PATCH] package/xterm: fix compilation with uClibc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Compile errors out with:
./util.c: In function 'decode_wcwidth':
./util.c:5506:26: error: 'wcwidth' undeclared (first use in this function); did you mean 'mk_wcwidth'?
 5506 |             my_wcwidth = wcwidth;
      |                          ^~~~~~~
      |                          mk_wcwidth
./util.c:5506:26: note: each undeclared identifier is reported only once for each function it appears in

uClibc only exposes wcwidth when __USE_XOPEN is defined.

Fixes:
 - http://autobuild.buildroot.net/results/1c0/1c03a8016d480d9c3fc3112849b1a125df243cab

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/xterm/0001-uClibc-wcwidth.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/xterm/0001-uClibc-wcwidth.patch

diff --git a/package/xterm/0001-uClibc-wcwidth.patch b/package/xterm/0001-uClibc-wcwidth.patch
new file mode 100644
index 0000000000..ee0416ec78
--- /dev/null
+++ b/package/xterm/0001-uClibc-wcwidth.patch
@@ -0,0 +1,13 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A patch sent via email
+diff -Nur xterm-376.orig/util.c xterm-376/util.c
+--- xterm-376.orig/util.c	2022-09-25 19:46:22.000000000 +0200
++++ xterm-376/util.c	2023-09-03 09:05:36.227133537 +0200
+@@ -69,6 +69,7 @@
+ 
+ #if OPT_WIDE_CHARS
+ #if defined(HAVE_WCHAR_H) && defined(HAVE_WCWIDTH)
++#define __USE_XOPEN
+ #include <wchar.h>
+ #endif
+ #include <wcwidth.h>
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
