Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A814EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A2784574;
	Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3lq4TSlr2sX; Fri, 13 Feb 2026 19:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B5FB8463E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011387;
	bh=P0SJcrEobOMobuEOMbVspjwMXVkhIg6dc6as9LAy2qo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NSQrX3Xlmqwm/vPgiIMLB1XiZS6i/C7ARSLF75vHmnijydUeW3IV358cP9FaJm48J
	 Ko08rJfagwHB42iVbl9z4ds4Qq+CF0jC6c2N6+7hwVhRiXwTidwTXjkmvHpJ7cBEdP
	 aXGiJXlTGMsttOyAcOoB0s23aXYxQUhGdvP1C5xrqBVjKvWoPUqTXn/mwczD7JtoBL
	 ABEquNu1fKRCdjeAhBxSjqZG6yHOtfCGLZ0HBceUXFqgNnyxDEAoGqRyfa5dBh7lTZ
	 EEcXUY/Vy9LkGDn5bnIVH7PBML9IoWkoMZPKu+0BPY2gOaDAh/sHEjryhBGlmFE8W5
	 Ax1Ea7ME+XoSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B5FB8463E;
	Fri, 13 Feb 2026 19:36:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02DDC69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D14641E56
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAOFFGzkqgw5 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F7241E21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76F7241E21
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C05981EB5; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:31:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eea5fba3d4de8bae1df515c27d37083603ed04d1
X-Git-Newrev: 3811f091f2e8d613a232500a3feb4541dfaeb0c9
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.6C05981EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libwebsockets:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3811f091f2e8d613a232500a3feb4541dfaeb0c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index e53febfce4..90ab5da0c9 100644
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
