Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91924C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:21:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36BDE61042
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36BDE61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046F7606B3;
	Sun,  1 Aug 2021 22:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cCL1WsPVVm4; Sun,  1 Aug 2021 22:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F1F606A6;
	Sun,  1 Aug 2021 22:21:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D9621BF855
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F158F606A6
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lf2kM3R4bWO5 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 22:21:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EF2F6069E
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 22:21:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id b128so9279018wmb.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 15:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wplwdQWZfN9gERD2cDRaRl0HJepHtp4PO2HhhpnYyyM=;
 b=dv7nnQjAyKv/ahEBybF1g3hLgn6ktW1/zevf64+9eHULvicYm7p0CbvE0HfOHT8XlQ
 Md96C5JWj9F+QV3BTtdmgLpR946+JIWmW9qCwYemZa00nAVsvxioZyN9OxxALb702cpW
 8IKD4UbtiOGy6TAJ8IzhtSlLaygI4fVOzesVdu92k2yJvbGIdtGst9IffSZeHenWB2wy
 gWbzCdElzd5Rt+Re7etlfBett1Fsd8x6kygSubLE41ybMSG4fv3ZdcITpoH7FN1sTQmF
 cOv1CeFt0z+qkbJmnDgEtbGpwsKaortAhDDW/3BVcL4flsagetC1piZwzKJaGpgxWOjb
 f5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wplwdQWZfN9gERD2cDRaRl0HJepHtp4PO2HhhpnYyyM=;
 b=M54edRLuYS3C153E1Gfv5GklzxEM2YGi7yaTaIx2ZQviCuFIlcY9dYPCWFkJsbRZy/
 njxxRV9PzLgc19bud3R9imRp9VTyfuW1qAfSjbCXptFGmwHhdiajFhhS5keVtPSuEYGL
 Y0zUdCGPn7FSgX2c4jQCUj+hE+QXHRHySWSyQ8SgzABb/CErmFDRfwkStL6V21qoziea
 j9hGgBiKJFQhmZFbm/xbC/JukbnkHJwfNrY1k5xf9yoI8eMg/N4U4iIepDZ5EtcR9I8I
 3CZKf7ha6P8jLkDnj5dSiJqVq1bbScxsN3dhyAt2WL7NMzEf0tfvLiq0y8/d9DqCmBjc
 dlFg==
X-Gm-Message-State: AOAM533ccoxTQ6HVnKgkIFBFEft50+f0TySo5rD3pC2f5Ur+bsczTSmm
 IFaIJB6WWX3uH3gR69LafJ5tGCNfX3H3KQ==
X-Google-Smtp-Source: ABdhPJzHDKlZY/8DBvyJw+DI52s5cBPsCiXZLgELCBt++1dp1WJ6Y/SowDzaDxIlkjmLDUxmUb2UIg==
X-Received: by 2002:a05:600c:4fd6:: with SMTP id
 o22mr9007654wmq.45.1627856470841; 
 Sun, 01 Aug 2021 15:21:10 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id g11sm2255537wrd.97.2021.08.01.15.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 15:21:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 00:21:00 +0200
Message-Id: <20210801222102.1244919-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/tpm2-abrmd: add SELinux module
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

Support for tpm2-abrmd is added by the services/tpm2 module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 0584ba928a..8de233008e 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -8,6 +8,7 @@ TPM2_ABRMD_VERSION = 2.3.3
 TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
 TPM2_ABRMD_LICENSE = BSD-2-Clause
 TPM2_ABRMD_LICENSE_FILES = LICENSE
+TPM2_ABRMD_SELINUX_MODULES = tpm2
 TPM2_ABRMD_INSTALL_STAGING = YES
 TPM2_ABRMD_DEPENDENCIES = libglib2 tpm2-tss host-pkgconf
 TPM2_ABRMD_CONF_OPTS = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
