Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D549CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C779941B1B;
	Wed,  3 Apr 2024 19:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBcI0_wDCFEm; Wed,  3 Apr 2024 19:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B8041B35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B8041B35;
	Wed,  3 Apr 2024 19:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D49231BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE8C660751
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrUjNkwikSv6 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:56:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F6BC6073E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F6BC6073E
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F6BC6073E
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:56:01 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1e0d82c529fso1848085ad.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174160; x=1712778960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G0Q355aocEqLATZcouyYcbSVbtiCs8HYTmuJ6cAkHnU=;
 b=ICv9vNT4evyVYNqZumC5mLyQVVoeMySS+/XKnA4nx4s98qRviiuj/oZ+gL9xUNPFAq
 TarVLSMRFvATDWnN9rgyECfjSPFOQ8Hx5AfqnV699mun7O4TmRs/yH7ah1QkWYdiUDNE
 Xbo8MZafQFmiKWZ7jAXlsvC1Z4h12idzPrde10Ea32Z5FjemDqJm+gmahLXBG6X+zrR5
 a02tN+zL4OOXAUIeXvIYurEwCL3o8pfVbCUAoPNW2XMik8BKiTZExY9lGygs5PziVbuO
 aEdj3YNirTTH1ZSRYwY1C9C95NCZad4gtg/iyUGRlI15aGbNnODU8cTlhxRblO/0J6+M
 6Mgw==
X-Gm-Message-State: AOJu0YzA2dITv0ARgHTT9bGYV7PjvkMBd2n/k9fLQALYxriGPTdmAG6U
 pLTlA6RfOrm3hbORIWEc+X0bNT5sxeDIj1N4XY38XmtF55FjD7b+P5v3VbPjDGpG42nTUOvi/DJ
 T9hQ7lQ==
X-Google-Smtp-Source: AGHT+IF4VEKYE6Ed/W331FRH7sfuPnOE6NwqjGINz9gQs5fyldda1L15MVSoKmvoLjExqv5HSL/Z0w==
X-Received: by 2002:a17:903:244a:b0:1dd:dde1:31dc with SMTP id
 l10-20020a170903244a00b001dddde131dcmr279919pls.26.1712174160479; 
 Wed, 03 Apr 2024 12:56:00 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 t14-20020a170902b20e00b001e2a08839bfsm801805plr.300.2024.04.03.12.55.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Apr 2024 12:56:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 12:55:49 -0700
Message-ID: <20240403195549.2445-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1712174160; x=1712778960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G0Q355aocEqLATZcouyYcbSVbtiCs8HYTmuJ6cAkHnU=;
 b=y5mteAMIBTR1imhFj+G2rsj3olcZSU0J1ee5Psukzm+IQLxziNJvDYc1g03dC+JDZW
 oCCI8f7LPCbGp278ckm4lSaQ++0mou++Ito6PSjfISINgFgewAG05jeNJZtNFOdr6mRL
 xP0z3CXVBUg/jiaocWFKAGx/dSxS0eIGXM1wQ+kfuZEeOBnS5uloiy4ZGCwbtpSb5Uod
 XiwBbZ1lxD35C5JXkghYcuZ74EsZvw2BD0tMvScTYOaenCdmF1NvxpSTEAZvSo/9eg/B
 7zrdZl6/QoTekwK22vbhjUXBxz0PJCXMwLR50GM2Eh8xNGAu8JO3BgqMkS7zqs/5d++/
 ncYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=y5mteAMI
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to go1.22.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2023-45288: http2: close connections when receiving too many headers

https://go.dev/doc/devel/release#go1.22.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 06d8776db2..81bd14baa8 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  79c9b91d7f109515a25fc3ecdaad125d67e6bdb54f6d4d98580f46799caea321  go1.22.1.src.tar.gz
+sha256  374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9  go1.22.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a8ec5d95a0..0e39ad9f8c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.1
+GO_VERSION = 1.22.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
