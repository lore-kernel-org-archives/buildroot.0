Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5D1C072A2
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 16:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1324340A01;
	Wed, 15 Nov 2023 16:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1324340A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVQJou-zjMuI; Wed, 15 Nov 2023 16:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 415494169B;
	Wed, 15 Nov 2023 16:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 415494169B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E47F1BF333
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 16:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3571980EA2
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 16:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3571980EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTxgYtuBuLYX for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 16:39:51 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F64980E3F
 for <buildroot@busybox.net>; Wed, 15 Nov 2023 16:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F64980E3F
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso57609355e9.0
 for <buildroot@busybox.net>; Wed, 15 Nov 2023 08:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700066389; x=1700671189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kqwroL0JPEH8OBBuSLtDklAD3vqDzvEIOVoZOUGJWgk=;
 b=gfUbjKmUNbofkKMNjag9dLteLUvctlMJInvsk7RCYYOgeeN1yDV8Al3WpRipvVvev9
 Ysqj1vFqXQSmeohCb3Ebo4g97Y0pnkg5droAJRR4DtIIXFjkPF8dkJF67YfekUxCq+3i
 vQSDd/lCCxms8BuQCnpk65c1qTIDr1s50JnX1MG92DsurAg5s24vFFocWe92XRhWRNUD
 kx79t4G6uxArrQGtjeplbYklB1CpIQWgJvtiRPoUBJM3gfhvhzHbhNtEonoKcYiv5nUR
 CgAonzwsEGG1hXKG5XheLQBTdijj4myRRGq8rkPZWvkCdZz1k/O5legeoZ+b/nC6pF8E
 4GQw==
X-Gm-Message-State: AOJu0Yz6s+FHZmfM6jwKP4sLCpbjPvv+GsqAw2vb1CH5H3rXCzjtzQaR
 HO66pxNcoga6E+4WOb9hY15PsyNwI3A=
X-Google-Smtp-Source: AGHT+IG92TH0wlN2Hs6iVocCA1ww1eUKu5vUbmTGDpnBUnihlKcMjpHPmD667hrZuPWV6Kp2YMZByQ==
X-Received: by 2002:a5d:6043:0:b0:331:3bda:a841 with SMTP id
 j3-20020a5d6043000000b003313bdaa841mr11525388wrt.9.1700066389073; 
 Wed, 15 Nov 2023 08:39:49 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 c10-20020a5d63ca000000b0032d81837433sm10954841wrw.30.2023.11.15.08.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 08:39:48 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Nov 2023 17:39:02 +0100
Message-Id: <20231115163903.445858-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700066389; x=1700671189; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kqwroL0JPEH8OBBuSLtDklAD3vqDzvEIOVoZOUGJWgk=;
 b=gKANUX0xQH2ZNAGjMEYda+D/7Ew4LokHoEhS9JYH+VvtWyWfB5mP4uyFh3P8nK3Ce6
 5MTqEY4wIKZ9qxBdrMczAcGsmfATjkSLmmI4v8AWwr8mGxpz7TrvZv4FGdv09I1GqLmF
 rh69zMTdlAzmq+GuC7ZslE1U1UHx7aynqZUZBplN9eCwnPNl7svW/G+l5xJaF+cC8BdW
 zA0QGWZdNISr2+fPTkljpewH6d0pDVcV9qoKP5Us3BMEkaVJUK0rvzDXtS78IGSP6AJX
 5kub2sTMgZxV3aJuKH26z9KrCbEx8RB+0qEc6n6Kxi0WkSVXE+h/BnW/aOGgNa9NJEoC
 tCoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gKANUX0x
Subject: [Buildroot] [PATCH 1/2] package/lualdap: bump to version 1.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lualdap/lualdap.hash | 2 +-
 package/lualdap/lualdap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
index 97aa3b570..62d8d20ab 100644
--- a/package/lualdap/lualdap.hash
+++ b/package/lualdap/lualdap.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  c1772077ebfd02e082e89583701ef27dd348dc76ae015247f21a2756f5fac0ae  lualdap-1.3.1-1.src.rock
+sha256  865b915a3ff16b9663b76a77e89ec54a5028ccfe95e85ad704efbaa144a608f8  lualdap-1.4.0-1.src.rock
 sha256  b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
diff --git a/package/lualdap/lualdap.mk b/package/lualdap/lualdap.mk
index 375754180..a6fc612b7 100644
--- a/package/lualdap/lualdap.mk
+++ b/package/lualdap/lualdap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALDAP_VERSION = 1.3.1-1
+LUALDAP_VERSION = 1.4.0-1
 LUALDAP_SUBDIR = lualdap
 LUALDAP_LICENSE = MIT
 LUALDAP_LICENSE_FILES = $(LUALDAP_SUBDIR)/docs/license.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
