Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B162C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 09:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9DA382E14;
	Sun,  7 Aug 2022 09:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9DA382E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxcX5a-uJML2; Sun,  7 Aug 2022 09:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73FE82D14;
	Sun,  7 Aug 2022 09:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B73FE82D14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770131BF83B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 09:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C8E2400F1
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 09:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C8E2400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdZBWJwTMjM5 for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 09:45:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 596BD400CC
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 596BD400CC
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 09:45:13 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l4so7804443wrm.13
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 02:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Ea82Rq6Vf5eWkVj+w2TmUGByog2pyf6v1U9gDEUJrKY=;
 b=6KI5DLnXtuyyO+8yYVE5IArkKQaUDXQBU4jGWSQ4xRtJaDyKyqJiaymAFpFLT5ovdc
 utq3PRc2G1jpNdu40E5CYDPGRWyq4fuyU7H142KaS7Vi5dzP8TAMqQgrm55cTUaFxKgf
 fiDpc8vMAchn3GLX5B7GlG+yxMZh2SaLdi8akcxKgeaE1ct8+5jgm40+VtAoh1Jah9fz
 gPGaEjfrJluY2/lyaMWzmedgJAlTTaFLigMnZ6d2t4C5N3FXYyDZPUIgRa3MVcUj+iJK
 LglaIeYDBStf4C+bUP4iGwAbpVRi58UZ+q3oOOtC84xKNEakcAHloHboqfebqyLrtNuX
 piYg==
X-Gm-Message-State: ACgBeo2Uq7vOjoSDjWj84xDk1JlPFU93pKwevljFmcJN89cA2L+ugMvI
 FSoFnYWETRQPb8YLTzjrI+04rnPgAOo=
X-Google-Smtp-Source: AA6agR5JipvNhUmTG/LJB+M0RxoLLhlxMzk18NxyTFCOFoVSzfMuour2TOKjsiSASHN7/SbgmYH9RA==
X-Received: by 2002:adf:c98a:0:b0:21e:2bf1:265b with SMTP id
 f10-20020adfc98a000000b0021e2bf1265bmr8515151wrh.426.1659865511111; 
 Sun, 07 Aug 2022 02:45:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b00220606afdf4sm8874747wro.43.2022.08.07.02.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 02:45:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 11:44:32 +0200
Message-Id: <20220807094432.3181119-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Ea82Rq6Vf5eWkVj+w2TmUGByog2pyf6v1U9gDEUJrKY=;
 b=UpfD9h2ri54RFos73KmR2ffhJGzFd/6SBLpYUK2ul9BHQY77y1OdtqQ8CuuMsy3MxW
 zyk9K8ocbct6A7OI2Ol4bSxtyGbwPNThRD0SYpTXRw2IFCRs0nQMxNiNkjixQX8qUBhL
 xY9rsZGDroozD6azStDho0h1cXQOfuXg1q2lrl5qoUecr3MGh15XWvcveWNUgi2/lBXI
 ImWkPSVDoZq8v/1NDmzPqHF3PrBzaQuniiu910XFKYE1ZRfxNoCpNrSEySzKYdO9oByK
 tgSn7RCnRL99BgIwRAP/QGmGG+u9w8lnInQVsJkXVvfr0xCat4aJRw4MeD6WwQ8ExJ45
 ZqCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UpfD9h2r
Subject: [Buildroot] [PATCH 1/1] package/boost: fix silent build
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

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14951

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 5e3f1d916b..ba7424bae9 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -127,8 +127,8 @@ BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
 
 # how verbose should the build be?
-BOOST_OPTS += $(if $(QUIET),-d,-d+1)
-HOST_BOOST_OPTS += $(if $(QUIET),-d,-d+1)
+BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
+HOST_BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
 
 define BOOST_CONFIGURE_CMDS
 	cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
