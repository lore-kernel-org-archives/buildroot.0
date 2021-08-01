Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D655C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:56:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9757861029
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9757861029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597DE83529;
	Sun,  1 Aug 2021 20:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Udr6CO0zcOpK; Sun,  1 Aug 2021 20:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B482083224;
	Sun,  1 Aug 2021 20:56:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6A091BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D569A40444
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3T1BvEoEU-x6 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:56:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C69240331
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:56:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c16so18968275wrp.13
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLLFl0ZA38A5m9aPZEu9eHXJy2kAgLHF5wHEq+tkEPY=;
 b=IaiVyGnigG+DtLaE7eN+lEPtGa/t96ooBy13UWAA9sI2bk0ER/YGzg1TGkS0f9SDu3
 AQr5y7FQ7a2GILVFG+7/dNZdqPQlXEUFUhOl3mRqTDtfSYslAEQwB3pSLyQenXbwvi1H
 NMnjPVB9jqrBmMMeAF2QWcp3vd7u6gAFXWYsPj/6J0yQYXcnrfBHcK9SAs1Vx12565Rz
 ceFukGJ3Twem4l31xMElmCYkEQ8mpnMcwv3ArKT9kKYgmcgv38ovLCp6Fr26iyeZV4Xc
 IFsIV9XMgrZFxAIiXMwbCfSiiMrkAXLV/4K/kZUA0yXEMSPRfNpX0aav1Jc67Q7fwBFn
 KMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLLFl0ZA38A5m9aPZEu9eHXJy2kAgLHF5wHEq+tkEPY=;
 b=t+2vjymEPi95NIKn8uUDBSIGHroSjaVZPVgc4Jlm0vOtpW7jhX8s76UCEUI6T2GL6U
 sPH2GhGkIf1DwuGlIVbjpdHz0vWl0dQrfxO977lPY8ywvGeQBSLbq0hiIsmzqWV30IT5
 MfcZua3oKwD3QxjWaIVRkCBehQm79yRNljGi5HY4HCyCjwezNu0wwwSZ0S9WPfGhMR0y
 /9UazKwFauqvqMQHRbZxNpOkO04GlGBXi1lfvR37vxrJzoOd3S8WKmlsQuY0b9xKQ95S
 1YBAGayvr7e1ppeaR3osbBjJ07sl5vN8c4kL3FwCkw60GZaHCPSvH8cBNiztZGrBv/sf
 raIg==
X-Gm-Message-State: AOAM530Miio1yu2k4et4GsY6BVvmTu5mii2OUgE+sFcfO0dKsgd+QU2E
 TPH1x1VbGfrxiC1Yvffch2ngtDcSw1eNmw==
X-Google-Smtp-Source: ABdhPJwISLATHDPC4obc09pwvnD/a9VSSYGfrFCmcLMOT1s5aRX0YaAgYcol3dTP98kNhIpRRa+Smg==
X-Received: by 2002:a5d:6991:: with SMTP id g17mr14324588wru.253.1627851402074; 
 Sun, 01 Aug 2021 13:56:42 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id q7sm8173527wmq.33.2021.08.01.13.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:56:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:56:36 +0200
Message-Id: <20210801205636.76878-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireguard-tools: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for wireguard-tools is added by the services/wireguard module in
the SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireguard-tools/wireguard-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index d3d2069846..d2f633be62 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -9,6 +9,7 @@ WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
 WIREGUARD_TOOLS_LICENSE_FILES = COPYING
+WIREGUARD_TOOLS_SELINUX_MODULES = wireguard
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 WIREGUARD_TOOLS_MAKE_OPTS += WITH_SYSTEMDUNITS=yes
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
