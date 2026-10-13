Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E732CA9ED0
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 04:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD55180C1E;
	Tue, 13 Oct 2026 04:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JetZgsZGGeO0; Tue, 13 Oct 2026 04:25:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EDE0880C11
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791865522;
	b=i5cDzpa6jVv7DKqMbZ7kcKPaUpIIBZHBXa56XKmPeGoT//GNeIPNlVFuwsOkK6xdM9Sb
	 cvyGZo1tBDc8ZKzndunxF/ISOUZHV0ZH7XGuF+UrHactCk43YxqrsfEFLLWFw6OElfBcp
	 0grSr3m6VR+LTO+Qj8h1ln/1V/qGBW+LaPqQI/2f+9vRH2DLV21JFcaLpXpdXi0kcsHRU
	 zL83TjRfkbDFaJi5OZJdg3Pe8Te2paWfy9mRt1Yumm3zbwVaAMhho0Spypl05HA0HBY6v
	 bXWeFQGuW1/I4z5jb+BLj7VK11tLHy39db0+EXP6JUu2rOZgzd4q6uQfs73+YH+mL4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791865522;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tWp94GDEy/q3CT99rGKlbuxjA8VqUVHpfQsrzBi+n0Y=;
	b=F/bGpTCefz28OaV/0AJd/eiF5pZS/2fm0YUtdmL6r84alTmRBjC8jsTsX+OOYTWqADMX
	 sPBiAaNSYSgLt+ss/i8f/Wpp6PDOG1IPQTVIFWXcn+2XK2kYIEKusSEDiC0+pdLcs30jz
	 HfCcvPQrDs+2RWc5IZ3V+ea8ivrHvBh0f9WGBzGfNUkf62thPc8EBau58+i8QbT7I0ZCK
	 fHHZ48cf/Mk7RI1GHRdFfmRHoNP3jxVvJhNv1Ag6e+5FgBbM7Dt2Z803grtRdUeVgvcMv
	 HkwSkxV4FTdWlTn4OEA42gyCahkcAWgLlo0xuScoQ2uLRPQ+rQ3v55jc/r1B6p3JQSA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791865522;
	bh=tWp94GDEy/q3CT99rGKlbuxjA8VqUVHpfQsrzBi+n0Y=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cSva1e0mZsp+ILOsABewSxr9KjEMmcoA+Ckis3selm6rrquVxz/bkzkBqfVqXEUPw
	 uMU30Z1F1nzRmPmiGsm30wnaMEsa52facF0wj2+5ygGAGaPK7Rdz05YgyTruPxi66f
	 8UVW3K/BFGg0K4WoxX2TCIqF0WI9w4c53IsVF415Mjw6mKpJx4qDUPsLWeZZf4a9vc
	 x10sbv4jY/rR71UWbJwkA7+DCMPjFeSy8/TWlF3duO6qTTjUEaVq/FZSp/4uOP/kA6
	 MN2KqAJwzC/imUdmlLHsVgGX4/ZOebwcUxMUXU1YZYoQ4xCFnv2E7qkxDUQf/hNy/m
	 s2xKtLeYYcQ5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE0880C11;
	Tue, 13 Oct 2026 04:25:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 430D01E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 349AE4054E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5qH1RYH732t for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 04:25:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1DB6B40545
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791865519;
 b=R8XoHnQ6qNpK/PC3srL42dUwj+EKmBfWqy7INBLC8biqC4CYgy49yDf3vM2Db/dI59+4
 EIJRsrjPrK6mW1FS5UwcQFJ2x+bW+jx8d9OkVE2cuLfjihToGsHFMjIo56upQOw4eMq6o
 eCcaa078hsgoJjmsoAZStupXW540j86CoXzuHw0dVze55BU6BUKHXlTKEYlI3NaToMpgt
 3bMwUBYJvxHcieStlNiFUOjnTPDizpgDCNdbIrjxM/UUakD772UUIM7t1ebg/sF2sWKqP
 ftQ87UnM1vEUySe/tGjYMmrvQnnbMMnRuQMcqEoW5UUPldREnUaGFCPbWGj1i3mCSmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791865519;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=3YAw+zNLksfiDZkuqQFkL+eq2FLZ3h8Zml/TZZrEBW8=;
 b=irPqxFEyRbxJ4OS7xv06ZgBeM9exTswgCrfFU/jhFRfqdakZWPyfQKzM1CYyEmKJYgL4
 XJSZWHRSifripNf7pG5yqyP50UPVyHDo9DztCmgL7L1a+nyNFU9zIKAAZ3FevK+SvUizO
 XWm/YRZnHk1dM6MXl2sxWrr5eMubisFX2+fWCQz0VYNivz2Kur2Gca/kxDd5IMVJN8ogK
 xuibVxALaXxLCzimVTZUC69iDhijgSgoROnTdfkkreefnSMEQ+LuQ80PinaRyg4Ax7EaJ
 Z8bmQu177V7HFvv2wWOCpU85fn4itW+DmFCPMo1BT3cNgBvZsC4JvUUke8aa9kzPkYw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DB6B40545
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1791865515; bh=QEDxeK1991+NT6LPoTk2X/4DCxTA704zdF7E+xonkRM=;
 h=Date:From:To:Subject:From;
 b=R3jcN7fepIAkM9juoh1yGq072Pu4DFFm/9GBvs09vMINM5fB1TRb2FG3FT3S0SYk/
 RrHoTmKnvTofvx8VfTkdfRiusjNsU6Ak08Pcq7QwIXQ7AB7hYvycY8sFVEDM5kSTIQ
 SXkw5oFwoMoG/2utu+c+zVxhWOig3Z4aPMDp9vNMLi2E1F6dvLapUxf+ftVmXiNVox
 9AjjAAy9QI5JUgauyY2SkiMf0+/DI5p01eBIatFUIOrpfqAk+Z8SaZSaDwvzm+EwxK
 /9J8rIKdeq6UswN4GFHYlC/gjpw1BUhYEJ+H9XnSL37ZWcQwyHarcLNIYFV/D3lT1g
 TFaICfQMBh1Fg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8C97131E09D6; Tue, 13 Oct 2026 06:25:14 +0200 (CEST)
Date: Tue, 13 Oct 2026 06:25:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <as2yqqA5mwAIMWnH@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: patch to remove pthread_atfork
 dummy for noMMU
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For noMMU pthread_atfork() is only a dummy.
This causes build failures in util-linux: the configure.ac script
detects pthread_atfork() presence because the symbol exists, but the
build fails because the prototype isn't there.

Fixes:
 - https://autobuild.buildroot.net/results/936/93637dfaabad0a1f11a94488421f6cc73882817f/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...threads-add-dummy-for-pthread_atfork.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch

diff --git a/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
new file mode 100644
index 0000000000..66605aa657
--- /dev/null
+++ b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
@@ -0,0 +1,43 @@
+From 2e902dccb925f1f185836bbad2284e2879550cb3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 11 Oct 2026 16:25:53 +0200
+Subject: [PATCH] Revert "linuxthreads: add dummy for pthread_atfork"
+
+This reverts commit 9e38e0aa45cca21d5023d0af94377f0e1e41d2f4.
+
+As reported on the uClibc-ng mailinglist by Thomas Petazzoni
+this dummy without proper prototype is breaking util-linux
+compilation. My usecase in 2017 was curl+libressl. Since then
+I moved from libressl to libopenssl and that works fine without
+pthread_atfork(). Tested with curl in Qemu for RISCV64 noMMU flat.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/2e902dccb925f1f185836bbad2284e2879550cb3
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libpthread/linuxthreads/ptfork.c | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/libpthread/linuxthreads/ptfork.c b/libpthread/linuxthreads/ptfork.c
+index a1bad3d54..74d630830 100644
+--- a/libpthread/linuxthreads/ptfork.c
++++ b/libpthread/linuxthreads/ptfork.c
+@@ -150,16 +150,4 @@ static pid_t __fork(void)
+ strong_alias(__fork,fork)
+ strong_alias(__fork,vfork)
+ 
+-#else
+-
+-/* We can't support pthread_atfork without MMU, since we don't have
+-   fork(), and we can't offer the correct semantics for vfork().
+-   But instead of failing, just provide a dummy */
+-int pthread_atfork(void (*prepare)(void),
+-                  void (*parent)(void),
+-                  void (*child)(void))
+-{
+-  return 0;
+-}
+-
+ #endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
