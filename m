Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0BBC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DC36101C
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88DC36101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441B060657;
	Sat,  7 Aug 2021 17:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vWZWiETYg08; Sat,  7 Aug 2021 17:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 932E6605E2;
	Sat,  7 Aug 2021 17:23:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0101BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A37F40168
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8r6-z-lwiBa for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:23:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 815DF40019
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:23:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso11223925wms.5
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y4hJY/zaJ5VXdDd0s4C658RJFfwfrTcczXRHeP1KCOg=;
 b=mCONzurZngLtvslieTvn/VadJbO2MqEyKOgK+7MwvYQGQP4O7odOEUf1H+IuUROmqy
 0DlcWQA+fbbR5u8WqBZ2ClH4m5aU8KvJDqzD4vl12Nz1H6Wk30CgbfsfZGRSg9dSPn+L
 sUbJMl2/QcGmBVGocRuKCoaqL6ZqVf55zSrrshADPrHewxTYxWP/1ffpHcfKnbz4NO4a
 AtU03YW7P88cs+TLibjlS+Kp1ppFfsF6RH8P1BP/NrO4kkgLhsIKR9mLc95CdKeEn8Iq
 gKq1lAji+/T4pmYJO1fRA9m/OigMCN6AcbVenEToZtx6inG7fJG6+q5T0zk9jr4UX16r
 f9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y4hJY/zaJ5VXdDd0s4C658RJFfwfrTcczXRHeP1KCOg=;
 b=T7BGcJjx/jKfJHFeDQq/KwNuXUL5CjnSpo5DTpN7s+TdSKY7ocAFcZYWC5jFcVzJEE
 nFvMFT5qvUF6FImZ/yKNZVrd0I7IDw+NaX54BtNY27ew9zQHrOuL3CUqxh7tJoq2i9Wq
 tnBCCvzIVypROWKc+YsL6MkechHd+eVB402VM69pZTPJ/+t9hkfNWFxAbjN65y2eqWCF
 g+OtDZwPfnBh8ZQLVdgrFfuixxW4fMDLYu79FDMHpAzOlXdMNvB/MmOIilClA34C788r
 Tn5ZomJkNRzUwnANvJ5Jtwb84y1KU9dvhD4s5zX2haMnWd6dwkPuVA70Fgt5x6ER7s+1
 q6Cg==
X-Gm-Message-State: AOAM533Z6pIO9TotGYrOCRpoFdCvmuaDgRoEeceGFyqXF9iDqiQYvVUY
 KibKkmeVzR0VFYJSWufZccXJ3ZgBFAZVHg==
X-Google-Smtp-Source: ABdhPJxLOCFO+/ztBd3hDQeRaqhPMU/pzIOI8AVNSTfaz2n47WiEsiCXVRvSNFNEZWm3EfXV5aA9cw==
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr8659368wmq.175.1628356987224; 
 Sat, 07 Aug 2021 10:23:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id c10sm16947492wml.44.2021.08.07.10.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:23:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 19:22:58 +0200
Message-Id: <20210807172258.972482-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: needs xsltproc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

libvirt needs xsltproc since its addition in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index feb2d6aa84..d99e538008 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -10,7 +10,7 @@ LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
 LIBVIRT_LICENSE_FILES = COPYING
 LIBVIRT_CPE_ID_VENDOR = redhat
-LIBVIRT_DEPENDENCIES = host-nfs-utils host-pkgconf host-python-docutils \
+LIBVIRT_DEPENDENCIES = host-libxslt host-nfs-utils host-pkgconf host-python-docutils \
 	gnutls libglib2 libpciaccess libtirpc libxml2 udev zlib
 
 LIBVIRT_CONF_ENV += \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
