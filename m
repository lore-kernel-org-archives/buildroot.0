Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2CFC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:43:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE8A360F4A
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE8A360F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CECE4029C;
	Mon, 26 Jul 2021 08:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfcBBOXXKAY0; Mon, 26 Jul 2021 08:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F067D401C0;
	Mon, 26 Jul 2021 08:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE9B01BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB591607AF
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LH4VVKjMwHqm for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:43:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57977605F9
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:43:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id n11so4803418wmd.2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1FXicKljDbGor+cNe46Y5ZwHWmwQF9Z/ruKbQIZCBM=;
 b=PaxdMa0akGb/SOqecuzHR9tN9ghf39RE6zAx6ubN7JUKTK/Mcx5bFsy84hwz0dqBWp
 E1GKO3MFaOrDSQGHEMhvE7Iman48T4EpfNglwDDyF80x21Qd/YHus+6dS/0K4c+wJbw9
 5fworYHvmoD+1+/O24KTfEjEtTXYxhVp0ZxTVzxW1i8Iz7NDxrGr2x+Kst/LIvfZYyHj
 hsOP0t9GuocOe+xO8meCNPkPyl6DwvD9O0Xy2SzKCcY9g+Qg4AIOwOOn2DCd6sz6QTIr
 Z+3kj4DlbLqfw6kOnA5JD30Vxl2yV+UFdaYirDLP4BrSmaFOPjGhLbJoDz8zbssjd4jF
 4kTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1FXicKljDbGor+cNe46Y5ZwHWmwQF9Z/ruKbQIZCBM=;
 b=s6mOauST9cy0PK9T6q0H/WRNgO3RP6D+EwE3dOaRXWWYpWcKqxgDMf3kI0pULLJNRD
 R3kJHBz5Is56WxM2B94Vsxe7yUezptKiM7Syx75xktI2LnBmi076U4vk9CVeqOy7sT7l
 7K4A9qFySwmtCUmZlFinOAFywm1VvZe5ItgaAcTaXGbYPKLEUdcNvy2cXgCAH9kAJiXY
 wr8NvjyaN488wCND+mr0+iB6NMvZkJwjDe1zYuO/tyRmW028M+v43OqUNNIGgUWWQxZh
 OE1lJSkkevp5xyVMZ7EYyDTSSx0ugMOso9Ye66s7v+Fdpp/XVbtU2+JwbLYBfaJW+jwH
 WjBw==
X-Gm-Message-State: AOAM5316vFxAg3XwxdW4Rqp3ojaTqJdWLw8VkzZbPcKWzdZ64PcHP1/i
 3cWoMuvkcTmqDYYgR9PBJJrqTWLrHi/Ptw==
X-Google-Smtp-Source: ABdhPJzOGCR/+BLnx0w1yYydXE2nRN8Fft3Ayu3GQdxiH21PNw5kwt96NnMNYjaH/tgEpKXXu8Vh+w==
X-Received: by 2002:a05:600c:2e4a:: with SMTP id
 q10mr1682019wmf.133.1627288996402; 
 Mon, 26 Jul 2021 01:43:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d18sm40967096wrw.7.2021.07.26.01.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:43:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:43:03 +0200
Message-Id: <20210726084303.1708442-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210726084303.1708442-1-fontaine.fabrice@gmail.com>
References: <20210726084303.1708442-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/iodine: add SELinux module
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

Support for iodine is added by the services/iodine module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iodine/iodine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 5de6389189..521ca3d927 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -10,6 +10,7 @@ IODINE_DEPENDENCIES = zlib
 IODINE_LICENSE = MIT
 IODINE_LICENSE_FILES = README
 IODINE_CPE_ID_VENDOR = kryo
+IODINE_SELINUX_MODULES = iodine
 
 IODINE_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
