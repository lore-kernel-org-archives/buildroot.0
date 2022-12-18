Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC01C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 22:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5947160AA5;
	Sun, 18 Dec 2022 22:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5947160AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxKQUuWlcqRq; Sun, 18 Dec 2022 22:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A595560A4F;
	Sun, 18 Dec 2022 22:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A595560A4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1451BF286
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75E5860A4F
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 22:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75E5860A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Cw-PFX05gN4 for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 22:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CBD56059E
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CBD56059E
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 22:29:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bx10so7142138wrb.0
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e+oOZQ/lCKXJl9P+kdxS4LSAJqjl4njaazLMANidwqQ=;
 b=ryAfX2FWakWqGImMnNhSpla8T45OuFdS23xAWSdAumuDBYf3HQwTtUEaQzi7BlwIdh
 N5jWvLfk8oRMFFmj+SuX5xcvnsmD0+eWAd0iNJqHb8C3+P7u6KMj81bPP3nG41eiBfP1
 h9/Rvwc9aB5thBDzIzmAPBNKee4fuGAlah0bjgmXraYU1DnJgH0byv7RC3ssbZJC83mj
 aB2k9yM7f2IN6g7WYXod+Enl6uKUh9SzsNiRmMm460XgyrWy+ThbZArdXT8BOTzRBD5N
 KmJgko6FAovRXF4cBwwDA8hNNfFaEf3XevZbxvXDeYj2zXu7EJJIRQh/33ripXWsMJUw
 QCvw==
X-Gm-Message-State: ANoB5pl41bVBp047N6lx6GDyHhFueMC2uQpKhnS2Icka6JB+lL8Xelr8
 rv3oG6VOIz6jqbRyZEfx7d10zVKbsX0=
X-Google-Smtp-Source: AA0mqf5or9uVVZMAjoXIhEnbidgITrisWn3I8/IVo3cLMjGr0X38x3xyFgMCHbqPsVq2DKrzAB0xog==
X-Received: by 2002:a5d:4012:0:b0:242:5878:2923 with SMTP id
 n18-20020a5d4012000000b0024258782923mr23772516wrp.10.1671402575107; 
 Sun, 18 Dec 2022 14:29:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bo21-20020a056000069500b00228d52b935asm8309628wrb.71.2022.12.18.14.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 14:29:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 23:29:30 +0100
Message-Id: <20221218222930.101076-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e+oOZQ/lCKXJl9P+kdxS4LSAJqjl4njaazLMANidwqQ=;
 b=BBSzxX+k2Dx4Y1Fc1JD8L1uC1AGGaOZYWhBWRTNJUYOxvAs+AaEuX/QF3BggBsuhxP
 fl5jI/58GQDY2wK1p5jy5cq1A1fgNpFlGqaIoKw9QK8VGRytxaixdUWPeU8Vop3VclFJ
 y4O6WD7OhFF6EyQhFJnC/L04HxTMs/8VhF4UlEwKj+zQuq5KSH6w2p2iOezH7FPOVWDF
 pPxIfrNDA4HntAwm9TPfHz4xilYL9hKkNKu4x42nJ5MqTnH2o+VmiB4dyuI3/l6A1AxJ
 3XaUOJXMzZpqqVhT02ex+WBS1RXGGeriGx4AG6P4VvMEGPT62Ku8/Z0e9VWmpQhB/qYr
 7njg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BBSzxX+k
Subject: [Buildroot] [PATCH 1/1] package/mpfr: bump to version 4.1.1
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

https://www.mpfr.org/mpfr-4.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpfr/mpfr.hash | 2 +-
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 35056f626a..4b0d14c9c2 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f  mpfr-4.1.0.tar.xz
+sha256  ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d  mpfr-4.1.1.tar.xz
 
 # Hash for license file
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index cd558dae0e..8d12c7502b 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 4.1.0
+MPFR_VERSION = 4.1.1
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
