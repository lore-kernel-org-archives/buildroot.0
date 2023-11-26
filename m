Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51347C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 22:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA38E60C09;
	Sun, 26 Nov 2023 22:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA38E60C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZVriZahSKxy; Sun, 26 Nov 2023 22:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB2C6062F;
	Sun, 26 Nov 2023 22:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB2C6062F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6B0D1BF215
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CE8E812D4
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CE8E812D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yk1kAudnbUP8 for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 22:53:49 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23AF181230
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 22:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23AF181230
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-332e3ad436cso2077894f8f.3
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 14:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701039227; x=1701644027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uQGr8Qjbm6CN/GtsrW2KjkvakNX53tipTtIa8cE7ItU=;
 b=TKaUXaD8AfZuU0c6kt9V6S5RylE2Cda+6yQpU9og5PftdkORe60bOGA3N2rpmbCG17
 TriUFOgnnoYLeqyFuImgxRQSVWx/dgNhfzTFS/Q6bf7hT8rS5asVCDMEedsegekWgNSy
 i2qgMbHNnQ3Ddb9EtRa6SqMb8kd0HgASPzlmDfwwc0SQjfNtbbrxPgLHzLY/v4VfLOOo
 8Q2PqmixkqE3Cgvepsc4MyT/6OETDWV57r65gXFiEb364vStT33k1cfb1aN51WzHojvL
 CV1GUyuNaPsHweJVi712SsbGLXNQykJZxvdxD8S19kPtysqaLqLBTcAYuGy+2cwBuAid
 cF7A==
X-Gm-Message-State: AOJu0Yzlajc2NXYLT4vmBFCBU6O6hzC4kl98PiBb6SgyY7M/wczkaWSR
 BZ6prlW7obFXTJ4fstzomL+Ra74Zu38=
X-Google-Smtp-Source: AGHT+IHImb4ruEjhfztdqi7PzBUR3WF8BeuEp61wA/68losgJAPw4aPtLqv/xdtl/Wt0RaB0NoBzqw==
X-Received: by 2002:a5d:44cc:0:b0:332:c5bd:1d9e with SMTP id
 z12-20020a5d44cc000000b00332c5bd1d9emr6674426wrr.4.1701039226596; 
 Sun, 26 Nov 2023 14:53:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b0032d9337e7d1sm10229231wry.11.2023.11.26.14.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 14:53:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 23:53:41 +0100
Message-ID: <20231126225342.324803-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701039227; x=1701644027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uQGr8Qjbm6CN/GtsrW2KjkvakNX53tipTtIa8cE7ItU=;
 b=lSXCEc9t3X2a8n/HssKSgQTkiXNTbsNYj1KLhG+F3nubDh6AGwJH2V8dkwNm2hjdDp
 lcwiGrilEySHkR9sDjjQUlPj273lZG9Rt4B0+CawGFNaTrS+FGu0UYmGOUkyHBxCrWcc
 u88HBPWzaWia24rVmju4QRNtRMNDftlo/cxVUwLV1Q9hb5fZv81uqi091CFLSXVawIOS
 wLmmiPbxSnW/K1FPE7tLQXilgh/QyFKYnXagfeHWQbc0zWC6DqAFtI/YKqnKjl7k9sW4
 ozLEg8QBpBxz9UUmjKKsuob1aFdx8/tEGOJkvAEjpoI5eslpldKGsRcAQwflqPIUwDxR
 sYDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lSXCEc9t
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xwayland: add
 XWAYLAND_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:x.org:xwayland is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/6F35318F-48A3-45B0-B70A-F953B7B0A0E8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xwayland/xwayland.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 1b626327ad..17048b4989 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -9,6 +9,7 @@ XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
 XWAYLAND_LICENSE_FILES = COPYING
+XWAYLAND_CPE_ID_VEBDOR = x.org
 XWAYLAND_INSTALL_STAGING = YES
 XWAYLAND_DEPENDENCIES = \
 	pixman \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
