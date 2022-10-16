Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740CBC433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 19:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E50598146F;
	Sun, 16 Oct 2022 19:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50598146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eu1_34bbNS-U; Sun, 16 Oct 2022 19:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B96481392;
	Sun, 16 Oct 2022 19:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B96481392
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4FF1BF337
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 19:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 080A440144
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 19:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 080A440144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkEbXC62ArVG for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 19:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F9FB40120
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F9FB40120
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 19:30:18 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id 137so7624910iou.9
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 12:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=52zm8OuQZviL2ZXnqaajtGZaUqzmRi6wiazSe8WwXvI=;
 b=wOCcrYMY7QAgvTxedDG3GM578LlOvnoYQYb9oQV1tqDpLzEzBD3lxv/o00AQdR7iXm
 6NXHSa35yzyaJ3BKx+FKpyJKlC5VBYk0vYV5As4qVOyZEIXzukzyDN5EWN/yO2zPJUd3
 rLuWYdrRKSZcdkfJA4SZD4UQ1aTokZ04f/Ptd3CfBc16eVXmRjMWnTykaxz2RGLLzuYx
 CrLR/D6ZObcr/Dm8X7W39i7MFRL3bo6GLii0yaYiqJmVTCZx/j4/IYmWo8wBny2WKLwh
 WQS6hMdtjfZZIDf7SeDZdMfxsyTHJmzeXbMLRL4iPXqn8CB6oZ3BwjFwje+oKcf8o4w4
 79Pw==
X-Gm-Message-State: ACrzQf3g7GnCMPTYVHmi7pJ+UgDT07cPeYtVPMnAAx7FXNtLwKzg8gEc
 jQ3l0/teGnjADwCL7Xv2cDRTXxDi/Ob1Yw==
X-Google-Smtp-Source: AMsMyM6MgLFDaPWv4HUQcFZuF/dAysfuJefWbt61bD//lFE7gJFzfoA4NPblbnYHjhAQCqt4E7ZMww==
X-Received: by 2002:a05:6638:33a5:b0:363:f04a:eaec with SMTP id
 h37-20020a05663833a500b00363f04aeaecmr3793874jav.87.1665948617051; 
 Sun, 16 Oct 2022 12:30:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 h8-20020a92c268000000b002e988fe84d1sm2896152ild.58.2022.10.16.12.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 12:30:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 13:30:14 -0600
Message-Id: <20221016193014.3384022-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=52zm8OuQZviL2ZXnqaajtGZaUqzmRi6wiazSe8WwXvI=;
 b=Jc57J9KEBfXohkPglnPJZG+xnDjijdOQAmoArv7dwOXJLMGk0IkJd+PTU5o7g35ex0
 eS9vbPRbGlNUo53TDm8nMwU5E5FPpVgTBf6R9gwPad3jlGUhz+aMnYwOFR8SjeWf6X6y
 GIEniYyAhZZlKKOFdiZvjuluSF4syC6Y1ZRa9ws2WM7pLKpwXpHiKKfpjl1TbW7BwCqv
 ZNBpKQlMZ2flQ107Sgv/w8Jz02TIq1+outglQwG3YxwCrzt+bj5+A8Z94/nu3CBPAuEs
 Os5QUYLaXNaXB005aeGCqFnDenk+jtFG4PU11dzBUhVkTl4LauNt+sBYpCYynsH0OYmC
 rTug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Jc57J9KE
Subject: [Buildroot] [PATCH v2 1/1] package/Makefile.in: set --shuffle=none
 for MAKE1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make 4.4 introduces a shuffle mode which randomizes prerequisites
in order to better flush out issues with parallel builds, as this
mode randomizes prerequisites even when using -j1 builds we must
also explicitely mark parallel incompatible builds by setting
--shuffle=none which disables goals prerequisites randomization
for the parallel incompatible package when running in shuffle mode.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - use --shuffle=none to disable shuffle for MAKE1
---
 package/Makefile.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 43d214bcbe..c69c201c46 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -17,7 +17,9 @@ else
 PARALLEL_JOBS := $(BR2_JLEVEL)
 endif
 
-MAKE1 := $(HOSTMAKE) -j1
+# Only build one job at a time, *and* to not randomise goals and
+# prerequisites ordering in make 4.4+
+MAKE1 := $(HOSTMAKE) -j1 $(if $(findstring --shuffle,$(MAKEFLAGS)),--shuffle=none)
 override MAKE = $(HOSTMAKE) \
 	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
