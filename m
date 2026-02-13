Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C0DEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 393BE81302;
	Fri, 13 Feb 2026 19:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBklnbvQ37ch; Fri, 13 Feb 2026 19:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3A481317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011567;
	bh=CZT96DadHEOSSY0XBpI00jq6qkKKObYF8jOGin1gF9A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gXeTkOOwjZ/Fst/71VCZDBY8b3vLyTuxwAH/anLu8+xrr2tKTDG75YXxYSVP+TjBt
	 9ckhrZplbVG50jXKWN8YTkzqVnkKwz+Zpln/cihIhGkv8giFFpSA5o3bCwAkr/r2Rd
	 cV5qW5W64GdDrlhLyLWrU+EF87gFhdDDJtb9pFnrL2MOL5DDweZnvAO96qS+qTUOAG
	 WvVBOP2kgYwdfuwfq5SSyaL1uzuPJoxbHIMsmQ0gMhoZ8AvBuN37W45Wr0CELszxmL
	 pfkr9cg4qtDlfy7Ql/pkU5C8NJlzuaxfjohyF0nSWMztgcb8x0PJ87knPiKd/DdVES
	 wxFkElXcOULzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3A481317;
	Fri, 13 Feb 2026 19:39:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C30EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A4F412D6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zpoyOduXhIF for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20808413DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20808413DD
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15134825CC; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:20 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6221f87c17199b0d13ffa8ca0507c39b19c81df8
X-Git-Newrev: 6e0eb8753a7aea9189fd1445b539996b5e716fe5
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.15134825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libwebsockets:
 fix LWS_MAX_SMP when BR2_TOOLCHAIN_HAS_THREADS is set
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e0eb8753a7aea9189fd1445b539996b5e716fe5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The .mk file currently states:

   If LWS_MAX_SMP=1, then there is no code related to pthreads
   compiled in the library. If unset, LWS_MAX_SMP defaults to 32 and a
   small amount of pthread mutex code is built into the library.

However, this is incorrect: when unset, LWS_MAX_SMP is actually set to
1, so mutexes aren't built in.

To fix, set it to 32 explicitly when threads are enabled. Why 32?
Because
https://libwebsockets.org/lws-api-doc-master/html/md_README.coding.html
states:

   You can control the context basic data allocation for
   multithreading from Cmake using -DLWS_MAX_SMP=, if not given it's
   set to 32.

Signed-off-by: Bart Van Severen <bart.vanseveren@barco.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b3abf16c8ef7cf7b2493b3ddfc66ec132c42493b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libwebsockets/libwebsockets.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 7806b64bbc..2d3395c5dd 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -18,15 +18,14 @@ LIBWEBSOCKETS_CONF_OPTS = \
 	-DLWS_WITHOUT_EXTENSIONS=OFF
 
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
-# in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
-# amount of pthread mutex code is built into the library.
+# in the library. If unset, LWS_MAX_SMP defaults to 1.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_MAX_SMP=1 \
 	-DLWS_WITH_SYS_SMD=OFF
 else
 LIBWEBSOCKETS_CONF_OPTS += \
-	-DLWS_MAX_SMP= \
+	-DLWS_MAX_SMP=32 \
 	-DLWS_WITH_SYS_SMD=ON
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
