Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA01C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 06:46:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A220160F56
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 06:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A220160F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E8444011C;
	Tue, 10 Aug 2021 06:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RGpqgXsk8cj; Tue, 10 Aug 2021 06:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63F9A401AD;
	Tue, 10 Aug 2021 06:45:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F15D1BF30D
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 06:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B617607D1
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 06:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5oW4HC_9pBE for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 06:45:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AA9060685
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 06:45:50 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id t35so286107oiw.9
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SW27Fju3oFBkIb4nnLLzsDjouT/cf8zc2YgBM9Hny8=;
 b=TWYvNSsQjMjgrK8bvrA0lgnkLq4MjP8VwWsHIKRdtn7nuJo84qJIWDNyvvmPviayzZ
 QXCBFSzKZlmUbtRZI/TBts1Y0InHuiP88jJnsKOt8Oi8YUaHWg/SyQAkYhCZCOOES7MN
 gKGK3n9NMX7Cn71RTCBGQ/6X1IixlEj3Sv2Oybcb645lZ8TtTXkcdZaetxjL7vjKDWLT
 5pUEn5fwippS/6ShFw9QejKFOxMKB4YTCxRn4ar+hVR0FxVEqYOkHcwGScAgkSKle3ak
 wQ+MmzVri597pOqEQAS0brBCQvHm/QEFXvu2y/uObeLywVFkLUD1j9IqNIuuJpihmTHj
 k1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SW27Fju3oFBkIb4nnLLzsDjouT/cf8zc2YgBM9Hny8=;
 b=UfqrU+LJ64CF52kvUF3GVL3Qz7+UN0C64CMi9ZpMBCJxbSO+QtAQ5OmqakOuThdicW
 veKqgsR/QuAHBKsJycM2IAuKddT/tYQHLHTA/n2gHn4xZuFNH5STe0P+EU7rbMt/2qmn
 JTSRYBkfPIjaUJ6BBB88KnmCSxo/Cl74R+uj7tQQmYGwx5vu55cOsGOgqAOjLLlCT8tK
 QnkBdvaZh7y99mb8CxyBPNtJknwplA1AtLwI+ySr3G7C+ZcnvusaEM6gg3Pke5S+FsPj
 Od5AOswSICj0acUsoT6wj91l3HZEB/Naa3fCSIiJ6Y8kYpJ3OYkKn6kgXq2TOHCdnzbL
 ae8w==
X-Gm-Message-State: AOAM531lilWicfkEDLWikZSvtIU1lxCwhjmbM5kiAm5N/HaX2EcQR7oC
 yuFcODY2I/uFPor27JEO+79OBqP4w8M=
X-Google-Smtp-Source: ABdhPJybVTy7tFizRkVy4TAubaLDQxM6OMiyHMiluzP4cEanvSznpXZd2sPtlqAEMdqMSHt1zl8V9Q==
X-Received: by 2002:a54:4805:: with SMTP id j5mr2342347oij.130.1628577949576; 
 Mon, 09 Aug 2021 23:45:49 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id i8sm3461677otk.51.2021.08.09.23.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 23:45:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 00:45:46 -0600
Message-Id: <20210810064547.2579380-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: enable host build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This will be used for building tools that are included with the kernel,
such as host-bpftool.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/linux-headers/linux-headers.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index a8d1c2ccaf..d171879bc9 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -135,6 +135,15 @@ define LINUX_HEADERS_CONFIGURE_CMDS
 			headers_install)
 endef
 
+define HOST_LINUX_HEADERS_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			HOSTCC="$(HOSTCC)" \
+			HOSTCFLAGS="$(HOSTCFLAGS)" \
+			HOSTCXX="$(HOSTCXX)" \
+			defconfig)
+endef
+
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(MAKE) \
@@ -160,3 +169,4 @@ LINUX_HEADERS_POST_INSTALL_STAGING_HOOKS += LINUX_HEADERS_CHECK_VERSION
 endif
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
