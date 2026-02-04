Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9F7E9D3F8
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4082060D66;
	Wed,  4 Feb 2026 15:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4uTNZuMteGH; Wed,  4 Feb 2026 15:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38F8B60DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217276;
	bh=iVYedoye/ElwXlf/RmgZ/xCEwO9u+ZKKA3TKGIismj4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nK7qgrnQ3ralMxjOp0knMGQNlBbw/u8xGr6FWGFmJtpAy4ctrDbfT/dv/3QINUqpl
	 ZaU+Bnm8/x+9oRogs6TeJD4FKseXbJqjAeOCgyDfnvpSC9LfhWXAloz6JR4qHVvIEi
	 kO5+v6Vbj2cW9c2dz0hB1ifuE1u322zRFNntffmAxqFnfmPZhIJqvv/ozo7bqAhSMN
	 t8V6NbjDtzq3ZYmBTEulPuaqQlK1W+KqytTlJ4Ff1WHNSWSfryB9pF71rp4fNCrV0m
	 kdHG1c9NTkGHH9g3VxSN1TPcFml5ZZ4I3TrT/cSjaxgCBTXX4GeZADcFbQupZZ0jtQ
	 Mz9T6rSZ2Fgsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F8B60DA6;
	Wed,  4 Feb 2026 15:01:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 904A1173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7165F83E3B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FXVzZYgDcKN for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D5E983CFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D5E983CFB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F2858691A; Wed,  4 Feb 2026 15:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 15:24:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06eacc370d643d1c55e5bc49edf9bfa66876f34f
X-Git-Newrev: b3abf16c8ef7cf7b2493b3ddfc66ec132c42493b
X-Patchwork-Hint: ignore
Message-Id: <20260204150108.0F2858691A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: fix LWS_MAX_SMP
 when BR2_TOOLCHAIN_HAS_THREADS is set
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3abf16c8ef7cf7b2493b3ddfc66ec132c42493b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
