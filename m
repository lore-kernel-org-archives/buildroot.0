Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D34E82CD8
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14ED86146C;
	Wed, 27 Sep 2023 20:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14ED86146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_CxtqsrSlvA; Wed, 27 Sep 2023 20:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5005261468;
	Wed, 27 Sep 2023 20:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5005261468
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 399EB1BF35B
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 209E861466
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 209E861466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYPkmTQO47OI for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:43:34 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C39A961465
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C39A961465
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31f737b8b69so10503667f8f.3
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695847411; x=1696452211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QumdfNmiWzt8e3DFCSU5jxKcVLhLYnRDI7bOKr5BhZ8=;
 b=HsgG+vD1AoLPkJWQwnjmfoqXUdpMLEpcMLxzUkIrhYTbyLBlXpU/x4SWikRqEZA57l
 UmuOO7RpPQHP/GWixI/6gwR4imziraYKkQo8XtcOpo+sixXfy7/ivOAdi8tU76xJsKum
 AdFXeR22WUNfkALk48zVqdqODWm3rygMQ5vZFHVnwxXchaEmM7UIeexSTY9ionmzFzFC
 GJsT51pxSWSSo/a7cVxgKPLGtSI4U6ko6VWhJNTGkOgFJ1HBbyhvizjKZ74SSy0zm/XY
 1UqUnpflxiLdr87OmJNkDDdOP0ZkWS6STBiVF2c+weHOHdXVVxNCJzdklPNfuz7cpV6Y
 Cm/Q==
X-Gm-Message-State: AOJu0YxIXMZB6iWuF0nHfGagtP3T6Uo/UDlv/R/NtDqFsvYd9IbJHs0l
 8+Z9eC3nT3E1J7GYwwlCHTv/kXEC1YM=
X-Google-Smtp-Source: AGHT+IHLQcvtcQASKdm1MK0v2yRZE6yTCfIKZXYNs3vGqpw97UXrYtp/HYd6AydolX4rk+zWeO3Hew==
X-Received: by 2002:adf:f7cf:0:b0:313:eb09:c029 with SMTP id
 a15-20020adff7cf000000b00313eb09c029mr2312615wrq.43.1695847411288; 
 Wed, 27 Sep 2023 13:43:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n3-20020adff083000000b003143867d2ebsm17853993wro.63.2023.09.27.13.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:43:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:43:29 +0200
Message-Id: <20230927204329.626845-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695847411; x=1696452211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QumdfNmiWzt8e3DFCSU5jxKcVLhLYnRDI7bOKr5BhZ8=;
 b=H8bC4x8Nh+9Vbnz1RmzBCFVzuOee4Rzefo/MX24GtOW+absHo6lVMWjnzY3MhhXgJr
 zJomfRR7uRFddBbK08TR+hgmWZ3cZYVyu/iQasEu+8vw8WKpiWNeHHhHuOcMdejbm21b
 vePgw5nCQkizOGSmyaQaYwxk+BLpXrHIcHOsOUKR5RgHE0QEWO+DpInd9wVrv/sUkQro
 eYDfka+YQ9VthhHSoKDIBFpZ8o4/7g5U0MlKzADMZycC1vVczHq4SNh3I8j+d49Ru4pe
 KIwy56fosh2YGfZ9/rj/AsbVQj1Da61w2YfkiRAxHuwvvCLlwdR06PYp09TZ5IzCs6IM
 YaUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H8bC4x8N
Subject: [Buildroot] [PATCH v2,
 1/1] package/bind: security bump to version 9.16.44
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
Changes v1 -> v2:
 - fix tarball hash

 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index a8c15f2a12..d500b61128 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.42/bind-9.16.42.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.44/bind-9.16.44.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  a8b51c6bfdf3ab6885102f764c2418e037897b7ea46a09f8f07876fa11a6c0b3  bind-9.16.42.tar.xz
+sha256  cfaa953c36d5ca42d9584fcf9653d07c85527b59687e7c4d4cb8071272db6754  bind-9.16.44.tar.xz
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
