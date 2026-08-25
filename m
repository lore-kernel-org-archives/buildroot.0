Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A971C61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 09:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A0F9405AB;
	Tue, 25 Aug 2026 09:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_LCMfrj0dVx; Tue, 25 Aug 2026 09:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787650711;
	bh=u1/o6z743UrDOWaP7fYrp2PhGCUQI0nPx71MNMituFc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Q47uKChE2EQwKV8l8Gd/T0yiOcGzCRH+UYkcojvcr0WreC8mzadlDvrUaGGLesHEx
	 3lY7eHQeegjfM1TaBRn5ZnOsUBBQwFoxk89iI2mivD0wXKu2W8VtW23UW9KzHHRKGB
	 vCXSUVJMPlmHUvcvJ8McP9Sm0Cw/gXzJXzFT31eVs3Zuxu21VOcFMgkCEuHiDNKcK6
	 alQCxHxbqNW9Ym2QLK2RsXDxcYigtljpwZjfc1EkxwhTfVAd9RZAEPy5i8rAjbHz9n
	 4+joYflJTj/yzIxPpL3kahY33umJU8wAH94bQT2TcU8SMR0vMmA8vax+/4MN6WL5II
	 waaWzpz85fy/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D70040592;
	Tue, 25 Aug 2026 09:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 578CD336
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 09:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4968780C70
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 09:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHL4LvHXN393 for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 09:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Xm2/hZRx
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A53180C66
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 09:38:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so41323585e9.1
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787650707; x=1788255507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=q/1neOajwZLiy/dmOSPRhqriVFz9oPqaApp6W6aUyV0=;
 b=Xm2/hZRx05/7Wcb/D59Bhgli1rxJJ7Z4jCxn/JE9wrgWOcp5E2bbQYLCWXlQZVykCX
 XCShKhTkQr0Ri1ZAfhJY4KVLVSrhEDXWQmnz/b6e/YTkfuzC6Az5MtLiHHWG+oilbo2z
 47BZki+t2nwhr2Ld/LDmnFLY5ROEgIEiFYDgsgQfk0So9pYOuBvMGKovCHLzggrxIG04
 hTRxgTt5BcUJ7c5MibkDqhHrPbhI30A5CeOWPNqlhj0yfTF6mobCL/swK4y+o1g9Nw+M
 qqFy+ThBm1nbHFSc6eKm7SDSw1yLkx4Hs2AaTuvE+VvSHLLlhzcCOUNypHcDnOIIKK9n
 Yvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787650707; x=1788255507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q/1neOajwZLiy/dmOSPRhqriVFz9oPqaApp6W6aUyV0=;
 b=mHaTeqLxcqWcgvVMAshEa0toEaLxBafnKNUYycuTU7sG8jqh/5UiDC8dpBDDlI21xU
 mTXjxJBSa8BICHsFyDCMk7f13xIxkx/8vG+L1OJYw/u7uftNH2z38snflfr+R/CnD0EI
 rDWdcmedo6u+HvXNsY6MB+yXRokWbY5fvFA+dwEVC8lucifjOePvDyUkKd1acwe2TcmH
 wHl7ef66taLch92FU73RdfG9GCQRsAyB9aUj1KDar55DrLbEdsPsMpslqSbi1s0I/48q
 2kePn10PLQPt0ay9KEEYELF/Ex4YPfefkDU0yBNlk6joypjSxWnwTzy2US7VxMrDKlPP
 Gv1Q==
X-Gm-Message-State: AFuF++mjM//uXccA3FY3ehYGdSPa3CthOE926gurEiySFNRd2vp6rDh0
 Nt0qlYTfxqfzWqsbcO2FEDwJ9B4HXlg2Uz/AU342UTYcUezWOvyeibDeK3f0fQ==
X-Gm-Gg: AR+sD13rpV+RS108u6rk2Xn/b0OsnTCpQpdXE9NsdIIDNDF+Ie4mEfWOP1ZnOCoCrNb
 NAmmI3GLALLFrp3fwT+Pgdemx2pnjKZHAN59ht9G/uKQGlL47J6aQn/+Fj96fnxKIvsVZ5BsE9o
 Gj3imjUvTRNmgVRY/+S6wz1XOxx6ZbnuJYGIsjyUg7PS8Uyq5oOu01qN2wM4KWXgXltoKttzeTe
 FpiZ+sd/V9106cab/ByCSanCROVcpzYw8vOvre4k1ouv7+lcCodtoKgqqx2qJe0vkXjTQzFQO3N
 5NBmWuaIoZJ+tgZc7sJ2hIDb9meOCXq70Uab0rth/Z4fZE6GG8ECtNpq73GIGjDbwvkbGR9tokV
 mVEfFcjwLxW8iMjsW1Wyi+cX86iKIMbxw0VxTTFK5z76ojxW8EyjdPB/5eQ44VJjhHL0L9yiZV6
 WK3lFRpfyro4clxkjBN2kzHmDnFvvIlzNFvCDgcdg12RZmnXddGp8IgFPdVizI6RD6jE9C/BstP
 WsbGgvo4NZNCiv+YhzHTIEhi214R3p+D8pcX9qdy+FuI/KOfOssZk+LRcleMbnjQSEvIw6bObsn
 2cblXZuT40rvNvMRlshn2rPMitu/DBoLnT6CXlDkxbZpqLTb5o4qog==
X-Received: by 2002:a05:600c:1d12:b0:499:728c:4704 with SMTP id
 5b1f17b1804b1-499c19dfb3fmr266038535e9.12.1787650706385; 
 Tue, 25 Aug 2026 02:38:26 -0700 (PDT)
Received: from KORLIN40066.barco.com (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-499d633506bsm23579515e9.3.2026.08.25.02.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 02:38:25 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 11:38:23 +0200
Message-ID: <20260825093823.1934016-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/mosquitto: fix build
 failure with make < 4.3
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

0002-Add-configure-time-check-for-lanl.patch (taken from mosquitto
PR #3358) probes for -lanl with a $(shell ...) that pipes a small C
program into $(CC):

    NEED_LIBANL := $(shell printf '#include <stdlib.h>\n#include <netdb.h>\n...

The test program contains literal '#' characters. GNU make strips
comments before expanding functions, and only since 4.3 does it keep
'#' inside a function call argument intact. With older make the line
is truncated at the first '#', so the shell call never sees its
closing parenthesis:

    config.mk:322: *** unterminated call to function 'shell': missing ')'.  Stop.

That is why the package builds fine locally (make 4.3+) but fails on
the build server, which ships an older GNU make.

Switch to the variant that was actually merged upstream (commit
dfde35a, "Add compile time checks for whether -lanl is required").
It links an empty main() against -lanl instead of compiling a program
that calls getaddrinfo_a(), so the test source needs no #include and
contains no '#' at all, which works on every make version.

Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/dfde35aa0fa5863863f4d0c8f2bbefe39320a119
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...0002-Add-configure-time-check-for-lanl.patch | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
index b67164123a..e6c1e00256 100644
--- a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
+++ b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
@@ -1,4 +1,4 @@
-From 447a6aa8df882a67ca3df6f5e95be42e1463eaf0 Mon Sep 17 00:00:00 2001
+From 1db9a29f4c831b656600a64de0531516dd198641 Mon Sep 17 00:00:00 2001
 From: Titouan Christophe <titouan.christophe@mind.be>
 Date: Fri, 29 Aug 2025 19:47:34 +0200
 Subject: [PATCH] Add configure-time check for -lanl
@@ -26,22 +26,21 @@ Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/config.mk b/config.mk
-index 34d5163f..cc7987c4 100644
+index 34d5163f..594a7267 100644
 --- a/config.mk
 +++ b/config.mk
-@@ -318,8 +318,11 @@ ifeq ($(WITH_EC),yes)
+@@ -318,7 +318,10 @@ ifeq ($(WITH_EC),yes)
  endif
  
  ifeq ($(WITH_ADNS),yes)
 -	BROKER_LDADD:=$(BROKER_LDADD) -lanl
- 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
-+	NEED_LIBANL := $(shell printf '#include <stdlib.h>\n#include <netdb.h>\nint main(){return getaddrinfo_a(0, NULL, 0, NULL);}'| $(CC) -D_GNU_SOURCE -o /dev/null -x c - 2>/dev/null || echo YES)
-+	ifeq ($(NEED_LIBANL),YES)
-+		BROKER_LDADD:=$(BROKER_LDADD) -lanl
++	NEED_LIBANL:=$(shell printf 'int main(){return 0;}' | gcc -D_GNU_SOURCE -lanl -o /dev/null -x c - 2>/dev/null || echo yes)
++	ifeq ($(NEED_LIBANL),yes)
++		BROKER_LDADD+=-lanl
 +	endif
+ 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
  endif
  
- ifeq ($(WITH_CONTROL),yes)
 -- 
-2.50.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
