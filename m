Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1DFC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7595060E38;
	Fri, 18 Sep 2026 13:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeD7FJmhRIH7; Fri, 18 Sep 2026 13:07:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 90DEC60DD4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736823;
	b=qC2qU8oYkCKiPyPRnRp6Z3OnKwJuoPpDUCcJTGxhYF8NJajh9brtFoFtMWH+I28OSpMR
	 D8vszYdrxUJQ/eaBotOFmd24rX2CLLVRckslzv9eoD4+fYsPrEfvu3S710iX+AVPU8mXW
	 WS5Zq5UMDfI0vtRj8J9IYxJwZZJydFhp4+XVzUshAz7tZo+3q6gMqMyWPw5sNsPutP49x
	 YTZweG1lG929KUvQxO5HmBo0E4fsD5b8wc5brzec5GcpnpOwKqnpdsll5EoUb000Xzsyw
	 zJxmpQ7tfUf6M9ZChbR+aTdlEdCBHJo/xXYMhC+4F+VeWN8SQ87X4/XgJrG4jfZAbrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736823;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CG3oTF0V7fa8aujPrnn+p/QVbpwnfomJHzx+oj7Q1+I=;
	b=lKF6mcD4nK66nrPId3JeU3Au7T+prcpaOYjpj8CDIaDZAb4D0Hy+c4mPdBJVRSsXdA2r
	 h4SAQ++L3fMBJfKgGrBSULWiDOso11SbdSjJJv7ezKlbSh18UNLNkP93rFiFVj9F5aQQW
	 kctReQVZfr+B3RPUeBuwYpmmXdy5Lj1c3rhunQrS1Rw+KbSl11wnyaFt+coJ0j5k5tLAQ
	 QiSfGIHgPlKmr0JOQ3iMTlXNSnE+fIveZxr56HLBHBFOZUTcNC2JrYFz/wxt5u0C01ALv
	 7C4P8FwSrSu7S4Ts9NsrDj2xjmelGkSag1fSneG6kC1YtfZ9p3B9kTwuQvdhnp5JWpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736823;
	bh=CG3oTF0V7fa8aujPrnn+p/QVbpwnfomJHzx+oj7Q1+I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l9kKHepNIF6t9ufnGbJSgyb8/K2i2h1cE2o7K39j3Xb4ejOsFQlmrbupfw+vhUBp3
	 uBgQiknADBTFcoQ3Xl+4t/YEqOFNtd2R5CPz3iCD4H7M3BjaWg78lL9W7lfnKRKkwU
	 tX9cQ5jluXNL5twbrjXeder7//L5fpY67iDUx0ETzaLHBkUs0oE1qK1oRI6/k2+ByO
	 IViveDRyywGxYo9EiDaHUOSDqj2+C5gaT9P3cVA7BoGzBOnAyVOtkGReC+RNquLeiL
	 EF5ozJBuXgCJ3lMx/fbD59t9mXl3gHggY/NGhsfeGh0hh2dsZZ1kEm+7xEW297KP5V
	 Dgg+WV4h5fisg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90DEC60DD4;
	Fri, 18 Sep 2026 13:07:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98164B0C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BB3340BFF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADTs_r1Dxqka for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BF31E40BF3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736811;
 b=sOlcIYVtpi5+mUTcw/gnQuKhsrmifgoY6bsmf/LemjpXf/h39zMMHnMvc+L3qpj2ePvf
 1sPdzfW8n4uxw8Gw75gzqX8Mmr1yzcQwVBQB50m4M/sGcuo8ATKJiLSFhhbJ4CMyrmo9m
 26Y0Anb4dNFh2xW907K2MYXSJrVbhJyVcVEwaXkVfn8MCD+WTLPYeqpwBFysY65KWvPMz
 F8SWCWYJt/TNR78pI3R5Y/lFfu3Rn8NdglDR9hw40NWaoTeE45ANEIMD9/ctJPXdMSuOr
 mp3wlYjXyKUZEJWqnNd51h9bFRqgNaAzR0hTPwxfLxpt+qiwZUO37ozjGkFm3Zf9Mbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736811;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ke13w5E+LsmFI5rhOPQ+aI/TZt68lx9rYX7m2aH13EQ=;
 b=Zp9AQPpga+qpMVBCKOOo4e8DlZa/EuQrT8ITJq7q/fDV0zBBz6L+dLLGuxV7RQ9IT238
 dinsHg+2srtQmmTqDpdpS9IdyTn7XFpzeRTJQFCg3sGpXa8mYq+FKs47K7UpBrUuPVM8v
 7/dhLMPm3FdTKiY/Id/YvSVTY4k+K4hMuZrsluOWY8pWGMdtVB5QCc8s2Npk1uTFFC31H
 UuEviDYbtZRpjUo5JVDtTT1vIv7EPtjfwbjXaj828dr9FjuQrCiMEbQBvq9MxtbIHic+j
 qv3Yar8fdO82wYZ8j/3mIpnOAPOife+sU2xygxJo92h4RJ1nYI6FP1Bib0m1pjCTzxA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF31E40BF3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 785A497698; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:46:11 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bc4357219a4974dd82987abae1dede95adf3e986
X-Git-Newrev: 1b3642b460a5e2e8768ce9dc1a18e65d71a039b7
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.785A497698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/xz: security bump
 version to 5.8.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b3642b460a5e2e8768ce9dc1a18e65d71a039b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/tukaani-project/xz/releases/tag/v5.8.4

- lzma_alone_decoder(), lzma_lzip_decoder(),
  lzma_auto_decoder(), and lzma_microlzma_decoder(): Fix an
  invalid memory access after memory allocation has failed and
  the application reinitializes the existing decoder to decode
  a different file. This bug could at least result in a crash.
  This is tracked as GHSA-5qpq-xqfv-j9pg. CVE number is pending.
  (Also in v5.2, v5.4, and v5.6.)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f125a653038c9460b515b1f0d4c8c4be37d88c3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 488a3d55dc..270ac748db 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
-sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
+# From https://github.com/tukaani-project/xz/releases/tag/v5.8.4
+sha256  3340ae48f88665abc78d71dc43446fb3f7e70b48fd59844ac0e14958cef6e00b  xz-5.8.4.tar.bz2
 
 # Hash for license files
 sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 056c168057..c3232966ee 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.8.3
+XZ_VERSION = 5.8.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
