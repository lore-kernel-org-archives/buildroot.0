Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6FFE82CD8
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A7061466;
	Wed, 27 Sep 2023 20:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A7061466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmF-BgFsEuAW; Wed, 27 Sep 2023 20:40:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1730961460;
	Wed, 27 Sep 2023 20:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1730961460
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D41A1BF35B
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 667A2828F2
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 667A2828F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSlLlA7R47U6 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:40:10 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46E35827FD
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E35827FD
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405524e6768so98658405e9.2
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695847208; x=1696452008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4fafR1ctCymL8a3ajqmTpJK6/mcIefiz4p25wt9UJLo=;
 b=Dx0LTdGA/IJ8zB63lJ0xfbLO374UJv0GZMq+jLR37yt6Kww1UZYYES9KhEbSXicDbH
 egF5LAXfoajD+rCh/SGoPZajO/rHmnFbf47sko+pTYYsoVQjxb8+FAAGUv0ak59EQx2E
 In31Yi+8RxW5V5BlQuol2KSM6Pu185CGcuZILEf29wuaw8Zb9/fK4CcXwVqwmP4tIbsX
 H8hsViUISO4pX7hFhoxndwMu6F+w/6/WOp6xrTpHZnQuAiJ2C5GWeGmsde4g1DoBudz3
 QQ78S7ES+StsY7F1TujXrbCJOOw6tYgTuT04y5yG3BdRdEuFLlI9CLO7eXNtzRW2/lGq
 YP3A==
X-Gm-Message-State: AOJu0YzMrbHGoArWc3kr9oALgYjUANN5slZzpIYBe0uXjXOQ83I6kRx+
 NBJctHYY8ST+X4oRvD+mNwDYlV3xERw=
X-Google-Smtp-Source: AGHT+IHAjvaNUltYVjT9P5cZG1lOLx7kABNvJd/L6Lx/jvJaRn5C3n0wlrUPvXNqrBvOq3tmKy5tQQ==
X-Received: by 2002:a05:600c:218b:b0:3f9:b430:199b with SMTP id
 e11-20020a05600c218b00b003f9b430199bmr3202054wme.15.1695847207519; 
 Wed, 27 Sep 2023 13:40:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c3b8300b004053a6b8c41sm16917645wms.12.2023.09.27.13.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:40:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:40:03 +0200
Message-Id: <20230927204003.624730-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695847208; x=1696452008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4fafR1ctCymL8a3ajqmTpJK6/mcIefiz4p25wt9UJLo=;
 b=PN7gkGlN5B3qqP69CDHW/rQesGIg+CitSb17N2zUIwDE1jr92dKWSsJ412itjAuj7N
 my91hJd6q4AWpIzLo6ZjTFXg5O86ZgkOZLPlC5Jo4/I8BUvgH/BNb9zSyAaWlzQmqlYZ
 7ICTwSqBX2CO/nB1BsLF8rL/Gmuq3hFh0SilDizeGvAYftp7f5R1jQhPUxYF0WpKoGK5
 /gu+suaCs5yVgquhjmmJIli4mGSzp9M9CSp756Wqqp2NTVIc7OrZ8R9uPYJYLt+eI8dQ
 p4EQ7khX1aEGzxrvPNTHj9qEHanEuzFy9kRZ1JDVIbaEIfT4rxP551PN/L21slPGEy3X
 3K5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PN7gkGlN
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump to version
 9.16.44
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-3341: The code that processes control channel messages sent
to `named` calls certain functions recursively during packet parsing.
Recursion depth is only limited by the maximum accepted packet size;
depending on the environment, this may cause the packet-parsing code to
run out of available stack memory, causing `named` to terminate
unexpectedly. Since each incoming control channel message is fully
parsed before its contents are authenticated, exploiting this flaw does
not require the attacker to hold a valid RNDC key; only network access
to the control channel's configured TCP port is necessary. This issue
affects BIND 9 versions 9.2.0 through 9.16.43, 9.18.0 through 9.18.18,
9.19.0 through 9.19.16, 9.9.3-S1 through 9.16.43-S1, and 9.18.0-S1
through 9.18.18-S1.

https://ftp.isc.org/isc/bind9/9.16.44/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index a8c15f2a12..98280939ec 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.42/bind-9.16.42.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.44/bind-9.16.44.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  a8b51c6bfdf3ab6885102f764c2418e037897b7ea46a09f8f07876fa11a6c0b3  bind-9.16.42.tar.xz
+sha256  a8b51c6bfdf3ab6885102f764c2418e037897b7ea46a09f8f07876fa11a6c0b3  bind-9.16.44.tar.xz
 sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 618b5b9278..03ffcbec42 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.42
+BIND_VERSION = 9.16.44
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
