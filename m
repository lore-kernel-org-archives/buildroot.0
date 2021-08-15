Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E537AC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:59:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E26A61208
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E26A61208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3190340139;
	Sun, 15 Aug 2021 16:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kze3hPv9V3rr; Sun, 15 Aug 2021 16:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D30401B5;
	Sun, 15 Aug 2021 16:59:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0067A1BF21A
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E070F80BA1
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCHpX7jeffEW for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 16:59:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21E5E80B8B
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 16:59:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id u1so10168351wmm.0
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pUu1Sf33D+/Sp9l4ML3nkTGbW1Xx37TYQ+5hrYTzUgA=;
 b=Ip4UmYkm+ms6N9AO3ESCynqQixY8fVmtlQwCK32vQRqBBW0im13OoyAflENPxaqnd8
 liWOLvHGML7y0H6ubhGBThdJBynO80wHNVPNpEXjS4L37jdnkCMmvKtgxOZHuRXNSJYE
 4as3f7R3M7IO+I7KyplL4ZLEk20xGItbG2LZFfWonQ4+fBpaHBhZJ5DPvh+ZLjF8OoUO
 MjVOlcaJj2lWG194hX5wM5oUmfHc7y/Ves7ognwZaLNVG0OWCAiUjNGtviFhDgDfARdF
 G0gHhhov1OpOsTMQqRJ0CFn4osiZW5fdCzagEX6SD/ZOwBrLjFXP3JoZOeSke3u2vkQN
 ds8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pUu1Sf33D+/Sp9l4ML3nkTGbW1Xx37TYQ+5hrYTzUgA=;
 b=mlW0P78ARZ6PoVteael0aE7JLVMalj1XGsd6NR/YzW/frVfVB08xe4qGeFc9vK1A1K
 ZWeMfU3yWEQj4dGXpDyB1EoIDzqXo9Le5IWyDijmjKAGUh93b1ZxZa8tSlFbxCNOLtGz
 eH40p3Wuu4vzUx+6NOdOtXxcj8w32CanjaZjWLiLSiUXAM+Ma9y498wrkVOstyJ923ji
 BCoucw/qcc8Xa/in4AD/e353y1OkUzWrDiwm3eOK+Bj7baECMcWB9vHlvtVo8IpTiSia
 ty0QMWlBbaBNtbTsykbFZRVDe291iPk1FxITRKQl913hmXem17IFSot45Pyf9CGGEm6S
 +5XA==
X-Gm-Message-State: AOAM533j8CZA0fKtV78insbkozg/v0v2g9wxVJ9/XteiDWgLV0fX7ggW
 M3P35emINRufCYnUUB3JUhlhzOo9mjWHDA==
X-Google-Smtp-Source: ABdhPJzBmEun6FMm0MyFg4H0/q4hBdlTbZYKUD5QylJRrzV7beTHgyc1hniCMvmjcXIpnSECe57iYw==
X-Received: by 2002:a05:600c:1909:: with SMTP id
 j9mr7989090wmq.139.1629046760078; 
 Sun, 15 Aug 2021 09:59:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id q10sm7722727wmq.12.2021.08.15.09.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 09:59:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 18:58:45 +0200
Message-Id: <20210815165845.1495680-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iozone: update IOZONE_VERSION
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update IOZONE_VERSION to reflect what is used by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iozone/iozone.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index ebb6243651..32d57ea76e 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_490
-IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
+IOZONE_VERSION = 3.490
+IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # IOzone license details can be found at:
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
