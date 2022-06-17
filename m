Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E791FC43334
	for <buildroot@archiver.kernel.org>; Fri, 17 Jun 2022 20:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5785860C28;
	Fri, 17 Jun 2022 20:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5785860C28
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jIWqvaYN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ds5s25ovbmhl; Fri, 17 Jun 2022 20:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 905F060B8C;
	Fri, 17 Jun 2022 20:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 905F060B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 347251BF489
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 20:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E8FE40164
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 20:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E8FE40164
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jIWqvaYN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhBWmOWhm6yY for <buildroot@lists.busybox.net>;
 Fri, 17 Jun 2022 20:44:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47F4A40150
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47F4A40150
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 20:44:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e25so3227596wrc.13
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mz+wceAJCRvIMricBqbm0yLyYYPsgeDZxjCPP5ggvPw=;
 b=jIWqvaYNYhnCStPfOufG2mVD8hcqKKV8sQXTpB2q5sJxhU7IIYoVt7y1SugARCt6RR
 Ys/DxYPCLtMt9DkcXCsJYdj5cqLeeWOyQHY2dGfciw3a08rXyvz3iRngfWcAweZTT7em
 b3E69RLTlKcBdrRPV26PKpGOpcgZv9hRFdCwYVq5sBB5IXVq5ZJ/q5sCVKrFRes58c3B
 tK6DA1tox8rxyCrN7mLa1627br86keAIqgixBRcSqtbo7bSULJ6Aehe2GvwmaLO3j/E2
 KsBrLG0YkWzi1F9W2KxBCfUbPEBEkA5T2l0CkvxRh+lGovG34KHLMwqunfGefMD/BOAQ
 +zgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mz+wceAJCRvIMricBqbm0yLyYYPsgeDZxjCPP5ggvPw=;
 b=zNw+LwunlJFzGvssPCymjdE5ewCFG4LcManSt118c94SrW55O6y9bprUjDoTwtwXQE
 6hTNoJtv1R8R1Koe+xbSViogaAbuxFB0fIQLJRAaACYeAr74uuTyYma2URRwbmZpfpjT
 7v/yUCcJUcL95ZCHmlqJd6AM6gEWRZzFieoZjv2FDT7E4pxI1g5Gp3dfaMWEQQRd/Tsn
 u0y22jFD+snjFzydSUpEsnvwI1zhyMxID5SuJyBD+Y4llum59gOHCOUkKPWHpZFb1AsZ
 9k/Ptw+epM3RE2efF2zBMEHuuV5mDo5iUJcDpucScLP3OwjythW4lr6NWBbG+pM9rHZA
 IXJQ==
X-Gm-Message-State: AJIora99xikU0LQZ+19328+Ib5c7nB+d/43YoCzM3gT5E4S8rfV6PiQD
 TIlDGHHU3TYke1ik7CJCv3VqX3nyN04=
X-Google-Smtp-Source: AGRyM1vgYNiFJdHnOuDBbZsi9j6qNik5ePFrG8naFT0kKKbOiutUty59qBKP3O4Ctw13CYrbSqhWBQ==
X-Received: by 2002:a5d:5c07:0:b0:218:544d:4347 with SMTP id
 cc7-20020a5d5c07000000b00218544d4347mr10443352wrb.107.1655498690150; 
 Fri, 17 Jun 2022 13:44:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c2ccf00b003974a00697esm10502751wmc.38.2022.06.17.13.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 13:44:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Jun 2022 22:42:10 +0200
Message-Id: <20220617204210.12026-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iptables: drop duplicated dependency
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

libnetfilter_conntrack dependency is wrongly duplicated since commit
b835171cf9db23095c669b872dbaa15fc1e99898

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iptables/iptables.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a54194a8c3..682e23a091 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -19,11 +19,6 @@ IPTABLES_SELINUX_MODULES = iptables
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 	$(if $(BR2_STATIC_LIBS),,--disable-static)
 
-# For connlabel match
-ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
-IPTABLES_DEPENDENCIES += libnetfilter_conntrack
-endif
-
 # For nfnl_osf
 ifeq ($(BR2_PACKAGE_LIBNFNETLINK),y)
 IPTABLES_DEPENDENCIES += libnfnetlink
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
