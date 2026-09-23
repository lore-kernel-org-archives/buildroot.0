Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB01C98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B965410F1;
	Thu, 24 Sep 2026 18:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbwXmEn9pF1W; Thu, 24 Sep 2026 18:59:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B4DD8410DF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276344;
	b=Qzm151NR8Cm5d8Dj5920shmCX5o2T/Ap62BuTeDk9f9C60OAbTNZJHajSMwxeI4P6vfr
	 xHXEEQOzS7DJhvIwDgp8f4Di0vSs0khtbjTpl+Ui0/Hjo+MG7aVdX6qIJEdGStJMT1OfX
	 ZnaSiaSHYfzULy/OGQWlzMc8u9/lurtfu4ZGsX7tsDH3Gm+qYXsgJAUNKN5OAwMfFhxzk
	 S0kYwxNDgyJv1mYW6s7D/29tRkGhM4OTcq3DjnHrFWT01rGvi5eX7qQ3t2PYcuf+10phJ
	 2z0QnaP/HeiCqZAK8V7izmmeALdldQCFqmrqUBKdp8e8RZs1Fab+mCWLmooJCP96t8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PLRQgIvDLw9RUWVOTHQ6wYY0bcu6T7y/oL87OPs4okw=;
	b=dZszAawElRJzyFMI0BPx32UNO/JQhABsFprOG+voDzzGhWmAXY4w7o2ghi21Dfh8fwHF
	 zbTcI4xC96/pvSrU86zQabQs3/NWNrkWpLZWsVIh8SA77SvOwA7eXFNB4gKwKJ5IGh6aY
	 vKuOHbcWUzZJTW/uORucw+TpzO41Rvf3yLk8u8kYIYNxspEL5hFNHV0XmZXCJDFqQESlT
	 xVB3OoXFztvUAeN5GC9rZLzEoeYzXrd4elAu1X4mYnDgy035heVCITr8ZN72cEZ+/VPOL
	 rRqU9FeuUCSdQsBVqVIy7qS8Yn4Aa7yfzedwh1K6euTHxbrry1Vocwf1hxeXPhxFakQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276344;
	bh=PLRQgIvDLw9RUWVOTHQ6wYY0bcu6T7y/oL87OPs4okw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ITL6f/Epx8VlM8Awb20ggSxytpnaQyifkfQcMyq/IETDPfoGH4bTs13/fkWKoA8u8
	 lZR23UAT8F2Msbu3oFDpWuUlv7rvlMGkG0dKxkVhIyjG/g5UTiU63DRaGp3zVzlvuO
	 urLbIyP0KWQNlu/x+s+17pMxIJyzf4Kxi/K2eA+9wKarOM98AnsPNyQG5EDok2iRy+
	 zGEs3qBtgGAhqtQilG6YfBeZsZnE9O5UhmH07x6WxJsOZ+hDAw/URSfdYWxjvzUCx+
	 xvnYWipg5Ch34vUcFsnDz9ITAUQQAuZ+zb1OLSEdfKHI8ewBCOAYh5j/FefLATD82m
	 AZN8DlSFxzkRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4DD8410DF;
	Thu, 24 Sep 2026 18:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BED49328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B99F68123E
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVj6vDbF57M2 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CDB4181232
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=rkmNPqqDF9/Ia+Vv7WkbH2EbKOd/3BC9s7Hz+4SUid7K60tBzdzYmTCgvNcHxdQf557F
 1WWXtNu3CIUiRpz5FWUDBZ/i+Lzu+44yuXM8T2m+fpSeD17qr7gcYSxX6ZFIlS9kIOHn7
 AkJIo5NnCg1DlzbFQYnqbN4FdG9cQ/13r0NwjkRxTNv9O4vuGXSrtAHA10tRTfGDH7Igy
 /2c5JB93lXO6NEzsEYXUDTJ/TVdTr79NIhzhGR9FMwq9XtwjEGkV1edUedOj5iLVsf88c
 /wXGHq1GAXcX9rIvhZwkcFYQcAkBQnNGvyMb4ivsDyqpQLPtYdDGqPbnmhB4SU6kG5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rDRMKElgxDAnagV2pqSDC7UeJ3P9mIe1PDz/0W6+iZ4=;
 b=HU7KIksZ900JIzw/o8W0mbA1lc4krzzlz/IHLp1wsSFhYesEQVOqmEauBIZ0nYOkXag9
 mPn3pRCthUStia2t4tqvrs9kNRklFxXfO3xLMY0h54zY1IXb6V10VPwwqtIlLAG32mhwX
 DuFGdc1oQA7OSfcFlGa2yc+MHD0TEeymjLA442uEhHiqKSzYbq58AL6TFlxy7B/61Apgn
 wtwk7CGEAksc2c+XwSEdc6HczXDbQ+7Bpxa9q53TDxX8z0oFFzxDNxqsrn9pj+nPc9PAe
 QPxvPGCT4EB+vUrw0rX5UGs2htR9YNLWFPjpk7kRnBHW1okzRJqprtTkzWw9d7h3M8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB4181232
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71728982D9; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:07:35 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0d7171fffd9cae4bfb70bee72cbf2fd0258533f9
X-Git-Newrev: c15befa90d1dc0b410daef340c8874d02706db16
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.71728982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/lua-lunix: fix
 build with gcc >= 15
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3784992311414319233=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3784992311414319233==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c15befa90d1dc0b410daef340c8874d02706db16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes:

  https://autobuild.buildroot.org/results/7fba1da21af93a7a0431fb9431dc3c8e872a00ac

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d7e810f731bb11fc4c866c52dda1a6e171aa513)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0002-fix-Wincompatible-pointer-types.patch     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch b/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
new file mode 100644
index 0000000000..910d684b88
--- /dev/null
+++ b/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
@@ -0,0 +1,37 @@
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 9 Sep 2026 20:36:07 +0200
+Subject: [PATCH] fix -Wincompatible-pointer-types
+
+src/unix.c: In function 'unix_sigaction':
+src/unix.c:9721:32: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+ 9791 |                 act.sa_handler = unixL_tosighandler(L, -1);
+      |                                ^
+In file included from src/unix.c:48:
+/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+
+note: this warning is enabled by removing -std=gnu99 from CFLAGS
+
+Upstream: https://github.com/wahern/lunix/pull/25
+Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
+---
+ src/unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lunix-rel-20220331/src/unix.c b/lunix-rel-20220331/src/unix.c
+index 2e0d77a..6d91e51 100644
+--- a/lunix-rel-20220331/src/unix.c
++++ b/lunix-rel-20220331/src/unix.c
+@@ -1278,7 +1278,7 @@ MAYBEUSED static void ts_timersub(struct timespec *r, struct timespec a, struct
+  * manipulated in C as type pointer-to-function. Accordingly, our code
+  * expects lua_touserdata to return pointer-to-pointer-to-function.
+  */
+-typedef void u_sighandler_t();
++typedef void u_sighandler_t(int);
+ 
+ MAYBEUSED static void sa_discard(int signo NOTUSED) {
+ 	return;
+-- 
+2.43.0
+

--===============3784992311414319233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3784992311414319233==--
