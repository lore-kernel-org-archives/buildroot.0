Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BE6CA5FE5
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFC3040D01;
	Fri,  2 Oct 2026 19:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-1ke69EyMAG; Fri,  2 Oct 2026 19:53:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 249FD40D47
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790970811;
	b=cfnY0SzCtDzdck6Lwtt0biPAokIqcOrNZFB/YN4u0QY8bB9z+u9KOkLog7mAGb6t50eK
	 1Y6hETfYDTwDGfcE8LESYVO0Tcb9RAH3vMFmypxyIFYKrfcU37hzA6NAEaRSB8EX7Uusq
	 wYRyqkVxKJuYy1s7kndtBmQjtCT5sjNflW/zatuCl808kzXqdQ4+mIv4gPCz4hdSWiy6k
	 ecYeI2JT37hUNRUC75yEiDiitxXwPWSZmPth6pvndUf1h7btFzwvQSt3r31CvRgnOCKeN
	 jTANXd0swDt6oVMLrCgjTgMr+liWjlYc3GR/CdVJsYTK2W6h1eC+iXMBj6bBHVw6tNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790970811;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DR+F33TBFMgc3WxqIaC1QMpMbU/DkvPIEQ2c+PlXhn8=;
	b=puxGoFDgWP+VB+kfY+WM+v+XFyym9cvv+9QNZlMPfDOsvWTJajbqMOyFarmRr7Qm15s9
	 5VpXeZbZ7vla5rIuityhF6YB6+tbPt9YeFuci0g6vRtVIlmbKxhwGi26gkx0Qba5nVFZt
	 hx7qnlLHGJOrYroyPe/lkhgzxILo18alkEOa/2CQ6+vCEnVLKrCMwbtoIThnLwrbAqrPL
	 lUmn/2c0ouEmftPnt9Gcoh5IGW2ahZz8DxPaKlFIrLZ7QmFEXNto8NPfslaLo7qmQvmkJ
	 xnrY5EqTSAMpLpqPJVW3Bd0s6414fjepFSQiBOzK15uK5FQKnuFeCeSqa3a6M9hO3Dg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790970811;
	bh=DR+F33TBFMgc3WxqIaC1QMpMbU/DkvPIEQ2c+PlXhn8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ju9AodaXIpJjUqXJlyqu5mz0jEw1Q/2PZawWxeWKq9+5JGe4sSAHxcT4JVYAwyE5W
	 yM96GC2lB5sKussjshZl7DBLpUdxorjvu2Oy/gEfm4JwEDfstAbICcDuz4s8+P/+ZE
	 JqhcPZ9zxniUqUOHLXR89waM3XZfaZUHbCH9IMlp3P/v68bS6TqEwNCEPp6L+kHYtD
	 Uwh2+5FJRh4xUFOWnJoULJZZLSxuOwFtYuROmJMx0Uvxhg/qGmm/KyXvstbj9Cx8e6
	 zxSBDC5Ty8mPPFsQzN/i8UybeU4rCS1DoUNV3tdKd5f1KsQGcHQtzmmX+nzTWVxomD
	 DNkBLZxH1F9uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 249FD40D47;
	Fri,  2 Oct 2026 19:53:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2805F282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19DC040D47
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdXY2w723Yff for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:53:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5768940D01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790970809;
 b=c4qTtpjh51KRBLPZHaTgNsbZtjNke5aSAd/YPL6jsirRmebMC4emmWbFNFQXvLSSh5mb
 sjBQ++Ny5axS1YeReyiZSBzq7p9M6JsPdeqQt9k+OgQCf4sv3cPlNtAL6wnEPktLnxlHB
 PmS6FSUmO9UGjwQRI0ARIOyJru4MbHB/5qgEudlZ5tpvmO4PIBwNtjJBJsUgYNI0RhQ8J
 VE52M4t/VjXyucDSSqG/LLgJaDAWmMGle2a4Ibok5MZIivudLu16KUu1jWg6dmXgK/irp
 s3b+tidHj1KtrkwQRmo9tD+MxWB9YFRynwseWKlj4dl7oWe7DoeO+H80KSt/dLQUEUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790970809;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QLvYk7JH88KGkfEcwZLlRfSQNXW+mB25ocEItl/vIFA=;
 b=h6s5YsvPE6txjQzjY/7gucvtqdnHnL6zhaxgZbwapAzaxPh95zrYEp0ybGL7ZzfCZoOs
 fbt6wkX33K8xdAYNazsRegRsRY/SLq23LAXSo4l03PwgJ/nhYNpGboU3GWG1RtmgH6g3M
 L64un1ov2edwdX1fPxQjjaANt8TribuNilxsDFK6q5Xt43L/NFGNgdCu8qrZtjthXQIeg
 Oc4LI0rf6R4/yhA5cIIqKvv9EvHlHWmoQANY8jjoG4A+aHorAaO4ZZsJ1pLfhutC06uhm
 bOg++jipdoCI3DT/NkHV5LeUZxj0tSvWPBZUNg23H7q8dS8CY8hhY++CKuEnDO3g/2A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5768940D01
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:53:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0058886BD; Fri,  2 Oct 2026 19:52:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:53:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47dfe8439945c84287bf6dbed11bce64a92d11fb
X-Git-Newrev: b2005938aed8798b2ce2df7733dcb75394b2d6b7
X-Patchwork-Hint: ignore
Message-Id: <20261002195214.F0058886BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: fix build with
 BR2_TIME_BITS_64
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2005938aed8798b2ce2df7733dcb75394b2d6b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

erts/emulator/sys/unix/sys_time.c undefines _FILE_OFFSET_BITS before
including system headers. With BR2_TIME_BITS_64=y, Buildroot passes
-D_TIME_BITS=64, which glibc only accepts together with
_FILE_OFFSET_BITS=64, so the build fails with:

  error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"

Backport the upstream commit that removes this ancient workaround.

Fixes:
https://autobuild.buildroot.org/results/72443d8e794451cbc4063e906d6b2405021cb52f

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang/0002-otp-Fix-build-on-Yocto.patch | 80 ++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/erlang/0002-otp-Fix-build-on-Yocto.patch b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
new file mode 100644
index 0000000000..9f4de3508e
--- /dev/null
+++ b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
@@ -0,0 +1,80 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?John=20H=C3=B6gberg?= <john@erlang.org>
+Date: Wed, 13 Dec 2023 16:34:04 +0100
+Subject: [PATCH] otp: Fix build on Yocto
+
+A workaround to avoid breaking "micro level process accounting on
+/proc/self" broke the build on Yocto. As this is a really ancient
+workaround (pre-2009) and the comment is unclear about what
+actually breaks, we'll try removing it to see if this is still a
+problem.
+
+Upstream: https://github.com/erlang/otp/commit/c38fc7c62e818273870340f3faf83cc3905e1cf1
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ erts/configure                    |  9 ---------
+ erts/emulator/sys/unix/sys_time.c | 10 ----------
+ make/autoconf/otp.m4              |  9 ---------
+ 3 files changed, 28 deletions(-)
+
+diff --git a/erts/configure b/erts/configure
+index 1d573b4..0b046dd 100755
+--- a/erts/configure
++++ b/erts/configure
+@@ -24417,15 +24417,6 @@ else $as_nop
+ /* end confdefs.h.  */
+ 
+ /* gethrvtime procfs ioctl test */
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
+diff --git a/erts/emulator/sys/unix/sys_time.c b/erts/emulator/sys/unix/sys_time.c
+index eb2c47b..f60e345 100644
+--- a/erts/emulator/sys/unix/sys_time.c
++++ b/erts/emulator/sys/unix/sys_time.c
+@@ -22,16 +22,6 @@
+ #  include "config.h"
+ #endif
+ 
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self 
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+-
+ #include <stdlib.h>
+ #include "sys.h"
+ #include "global.h"
+diff --git a/make/autoconf/otp.m4 b/make/autoconf/otp.m4
+index f543101..984ee1a 100644
+--- a/make/autoconf/otp.m4
++++ b/make/autoconf/otp.m4
+@@ -2705,15 +2705,6 @@ dnl
+ AC_MSG_CHECKING([if gethrvtime works and how to use it])
+ AC_RUN_IFELSE([AC_LANG_SOURCE([[
+ /* gethrvtime procfs ioctl test */
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self 
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
