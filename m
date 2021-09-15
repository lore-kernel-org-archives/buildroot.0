Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8450CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 20:57:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09BA460E90
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 20:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09BA460E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7B0A60B47;
	Wed, 15 Sep 2021 20:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZ4Z7gBqPhZk; Wed, 15 Sep 2021 20:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF456076C;
	Wed, 15 Sep 2021 20:57:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C4331BF2AA
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B11840129
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 20:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IivM8CmT9R9S for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 20:56:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FDA7401E3
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 20:56:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso5774655wme.4
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0owFwjlluXobT5DV63WWxxWyRzoCsjgLcK/gCG+W1OI=;
 b=n4jl+7HLV72yL0gOEHxMoJjbxl43COt0bJ/vt5mkUI6FjZhdRk+Bjhp5Utd6+DRHZd
 GY2Ub2qZE9tdvg0s6Mn1u42zJrlZLXu4y2ZlVKrhmb9LJwB6q+RB4/VgFGVlyaBkpppG
 kKOo0hS5K7JmcM+Afi9pXy0vGrpSAaohDkjaBb9CzoFaEqLNmoOpjwQI1uCgQPG4f9nE
 yH7L4TZwYzfpoR8xzJdWozUGSgB9RbGSKglMToBRoLWC/cUCtTh5oyycE3xdTciRTNTb
 1IJYdwksUEboXUx+nBBw+ITqyrekJY/vf3FVSmkItP3z0V2xRsikevAIQZ7F8DNXbLTs
 +u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0owFwjlluXobT5DV63WWxxWyRzoCsjgLcK/gCG+W1OI=;
 b=IaIEunmnHoYem56jFSCYC6C6J40Rqc+48Pdmxg62JNkzyC/uYdal5P87w0RkM0bFYJ
 sYFcU6syD7J8UUKerkLMKWjia5sq9GCzO+DmcwN1yKy+GiKMZm44ZGfZ0f3erCQXbKE3
 oG0MntAMjcsQ0BB/MEyz2cidxKSOnllYnldjzU8EccEbF5KUQvcevg7cmLr6mna+3GY3
 nDCoA2Q9dxOW2pFw2zOv4oLSxOI0fRihdrUZHBUgN+L2gePOCfb9WMta6nt734jsl7tR
 6TEXJgVXXgsolTdyLbhFX/gDIRs+2oa071ZWUpP2+NqQ9f6Pi0uVaEz3YzO5H8m3isA7
 pnpQ==
X-Gm-Message-State: AOAM531YIU66pTiPBStngKeK+sgpC9SVXtvgLDB+0XugFMudBou5ajqt
 Tpow8rjLBHTZ/ukColS1aIhXpx8UwQI=
X-Google-Smtp-Source: ABdhPJyB5JsOzMe/bJdq9YC1ofdeCdquH6WgvVX4aEizGUCtsOnnDMh+Hz0QlK+gJLOVXiIl1bB2Iw==
X-Received: by 2002:a05:600c:19cc:: with SMTP id
 u12mr208294wmq.0.1631739416200; 
 Wed, 15 Sep 2021 13:56:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id c135sm5358422wme.6.2021.09.15.13.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 13:56:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 22:56:38 +0200
Message-Id: <20210915205640.1411368-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/libvirt: disable docs and tests
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Disable docs and tests which are enabled since the addition of the
package in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 847c35e06e..396dd61577 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -33,6 +33,7 @@ LIBVIRT_CONF_ENV += \
 LIBVIRT_CONF_OPTS = \
 	-Drpath=disabled \
 	-Dapparmor=disabled \
+	-Ddocs=disabled \
 	-Ddriver_bhyve=disabled \
 	-Ddriver_esx=disabled \
 	-Ddriver_hyperv=disabled \
@@ -41,10 +42,12 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_openvz=disabled \
 	-Ddriver_remote=enabled \
 	-Ddriver_secrets=enabled \
+	-Ddriver_test=disabled \
 	-Ddriver_vbox=disabled \
 	-Ddriver_vmware=disabled \
 	-Ddriver_vz=disabled \
 	-Ddtrace=disabled \
+	-Dexpensive_tests=disabled \
 	-Dfirewalld=disabled \
 	-Dfirewalld_zone=disabled \
 	-Dglusterfs=disabled \
@@ -64,6 +67,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dstorage_mpath=disabled \
 	-Dsysctl_config=enabled \
 	-Dtest_coverage=false \
+	-Dtests=disabled \
 	-Dudev=enabled \
 	-Dwireshark_dissector=disabled
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
