Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3DDC61DC7
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B8CE6081D;
	Thu, 27 Aug 2026 21:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqceZuWeSKm4; Thu, 27 Aug 2026 21:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787864930;
	bh=6NDaQI6opZcDoNvsD60Q8eY0PbygsGfNhIq0Q0qdqCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eiDsplSB+05xktSLc+xVIkVP2itPdjeUQFnlJIGLf93k/LLG8XOmY2VCA4ryDUxoC
	 TNyK+kEN0/NTDZZttYQewDUPh8wYWQlJypPb1qiuyHiQNYPUfBRxYAtGVY8+MoISTc
	 vitMUZstReeqPjHXb0nOtShJGFzYN3ylY2qx4OiDXMGrjHOWP8oG1wnw4KrTSCQAuJ
	 IfFBbJBWLYMerIwDUnMFaOMl1iQQ8FLXZRUNzFTxpHnVtqlMzxSXv+m+nUKE6xhErF
	 tEcpWDlFVbc9h00vt3YM7Vn63DPsDSgm1Q0DiW6sX+b1uIhbUhgnKPnpKrboJVJAw6
	 9erR1DW/sbz0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B09F60826;
	Thu, 27 Aug 2026 21:08:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C1B334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D00C84037C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19X-YnP7B9iM for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3208B40379
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B8A79215F; Thu, 27 Aug 2026 21:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 23:01:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1ba84b9a7b75edfde4872d2b85684605c79bb97
X-Git-Newrev: 94aa7f40b5b132b255314f6402d4c2bf50928c75
X-Patchwork-Hint: ignore
Message-Id: <20260827210749.7B8A79215F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: needs signed overflow
 handling
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94aa7f40b5b132b255314f6402d4c2bf50928c75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

haproxy has a runtime test to verify that it is built with -fwrapv:

haproxy
FATAL ERROR: invalid code detected -- cannot go further, please recompile!
The source code was miscompiled by the compiler, which usually indicates that
some of the CFLAGS needed to work around overzealous compiler optimizations
were overwritten at build time. Please do not force CFLAGS, and read Makefile
and INSTALL files to decide on the best way to pass your local build options.

Build options :
  TARGET  = custom
  CPU     = generic
  CC      = /home/peko/source/buildroot/output-haproxy/host/bin/arm-linux-gcc
  CFLAGS  = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1
  OPTIONS = USE_THREAD=1 USE_DL=1
  DEBUG   = -DDEBUG_STRICT -DDEBUG_MEMORY_POOLS

Which comes from:
https://github.com/haproxy/haproxy/blob/v2.6.0/src/haproxy.c#L3008-L3037

So build it with -fwrapv to fix that.

Notice that this message also embeds the build path (through CC), breaking
reproducible builds.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/haproxy/haproxy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 970347d3ed..f75f18e031 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -15,8 +15,10 @@ HAPROXY_CPE_ID_VENDOR = haproxy
 # https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
 HAPROXY_IGNORE_CVES += CVE-2023-45539
 
+# haproxy relies on signed overflow, so MUST be built with -fwrapv
 HAPROXY_MAKE_OPTS = \
 	LD=$(TARGET_CC) \
+	CFLAGS="$(TARGET_CFLAGS) -fwrapv" \
 	PREFIX=/usr \
 	TARGET=custom
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
