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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031B9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 20:57:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 893DA60F25
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 20:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 893DA60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6690B60BCD;
	Wed, 15 Sep 2021 20:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKcDCKFoyfZq; Wed, 15 Sep 2021 20:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7CF60E66;
	Wed, 15 Sep 2021 20:57:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9A581BF2AA
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 996B2406A9
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 20:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYizGJcA5bBM for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 20:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB05140646
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 20:56:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b6so5891513wrh.10
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mEHieeRYAHUoz/CbCgJDcmlWLLmfjmHUqlg1KQMQjCI=;
 b=KsbQyCPrMEKkXEWiiWSSQsbGJg9HAdhfCT0mb3yyYclXcvZe2Jt2oRDq0HJv8IZ55J
 k146O6fXVc0ZIRJlQTKf5A528rgPfYWIrT/rfNxPYUdPbujrtZQf+riGItREan3YSE0N
 5zF3W2e4/6uJJ3jQuw8QsAZAi9jd4A2bhQY4eX5+HpuZqGY1rSmcs1StfSw3Qj1RfRam
 +or8YWxX76X4sNybu2MdCKZWZfC6PVPuPOBs5sagcHe/QC1VnsW5r3NpQiFKZRrkv0Da
 vZped2zVYs3tHYt9OZlL7kiQqppMhbLF1I4x+e72VXnoaRnmTqhFTfmgkaF/IodgMlF7
 F4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mEHieeRYAHUoz/CbCgJDcmlWLLmfjmHUqlg1KQMQjCI=;
 b=o2hmWrsNVfjzWH9KUqHsbNvh9x43jjsmb/CE2TsDscooxf06C9SbezPVBO6ErBqN1U
 qnx2cwkOvZza5CjYjuGTPMW24U3uTEMjzEfQkI+7x/zQbuxV6mIA+czcHH2aBwPI3mkp
 faGeQiA/maoZ0xT//LLhK0iFczdNIm2Vsa+thNBlEwL35BIgWu2Cenqysa3xukX1oJyW
 h8r8S2wtztfb9KHupoJswv6d7xgSZoT021O8qVmlvvmQzQU9RuYbeoz0gzy8qDLUDUIb
 oPM1s03CTwapZjvhNCzLQ5/6ZFq7LVu7DqWUWU/lsIQGToYr3XN5eANnWzCQOhBRmPTF
 Hhvg==
X-Gm-Message-State: AOAM532H79M2vm6IRIxLRCcLreAcPaOPDEib6ZwZnYlUCYAmxXy/dUeq
 lsV2XmiKKBkayiXh58BDHDmF+hAK5mo=
X-Google-Smtp-Source: ABdhPJxBHWOY/utd45RKend8CqdhMQf+E+qtpLbbashUt340PyiNUtg8E1/2kQddi3rl7tAlNiAFjQ==
X-Received: by 2002:a5d:4cc6:: with SMTP id c6mr2200792wrt.108.1631739418022; 
 Wed, 15 Sep 2021 13:56:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id c135sm5358422wme.6.2021.09.15.13.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 13:56:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 22:56:39 +0200
Message-Id: <20210915205640.1411368-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915205640.1411368-1-fontaine.fabrice@gmail.com>
References: <20210915205640.1411368-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/libvirt: add libnl optional
 dependency
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

libnl is an optional dependency (which is enabled by default) since the
addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 396dd61577..f30baaab71 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -134,6 +134,13 @@ else
 LIBVIRT_CONF_OPTS += -Dlibiscsi=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+LIBVIRT_CONF_OPTS += -Dlibnl=enabled
+LIBVIRT_DEPENDENCIES += libnl
+else
+LIBVIRT_CONF_OPTS += -Dlibnl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 LIBVIRT_CONF_OPTS += -Dlibpcap=enabled
 LIBVIRT_DEPENDENCIES += libpcap
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
