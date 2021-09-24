Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7843EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 21:40:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA65861250
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 21:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA65861250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A71342355;
	Fri, 24 Sep 2021 21:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9g2zayGc5uN5; Fri, 24 Sep 2021 21:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64CC42361;
	Fri, 24 Sep 2021 21:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06FB91BF3B5
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 21:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8B3483E9D
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 21:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLG1RswwFGp6 for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 21:40:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C70AB83E84
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 21:40:24 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g16so31395644wrb.3
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 14:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/riH72c6nmqjDLr5c1xsMZaTYV4qW7VsWV9EN9R8Dak=;
 b=HFxxfiJUBQ7wEKRxIeB22gPXFOeYOVZuo7/OOa3rrKMIQCqTOd39rzrz9+CyxoZb4+
 67jHlvC6WI2uUX/yH79GX17wN6ukXeRzC33T7ytSWMi6ZUL4EhisW+qdZSrqiBi2pbI9
 pdLdRJZ0g5Tc3y8j5OTP24pyiBIQ+Ge3AdnQ8PD8BtKtNI7OFzi1hBzbcihVk0t1VjMR
 xDcaydjiGVLxa8YlwWgbhA1ddxJ7RKiZuGiwJRng9HnnEuNhODIobHFuDOuSyyyVDcG3
 tkYQrmdGYVC7vSzW57zBAr02PFbVoXtFONtso5YytSKNwXCJSiXDT+mRo56XZjOIiVW+
 VWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/riH72c6nmqjDLr5c1xsMZaTYV4qW7VsWV9EN9R8Dak=;
 b=uuDkeY7U0Z0V+03a3zF7JxfQXityYScz+JIuBSniM30VDWOwlg7m9I8sYMbxlM/IE5
 DZZASiT9iFYiL5kG/khE2Z0y6kfmjK0bUsXTLbAzubLmhpxzFPO9m0x/oe0sE+PjOkw9
 Rz8Juwz7/7/zNxT66Y7maxBmf9pNTJgOo44SMoK5/ox5XJrH0DkQebFfBuhWhLskVRUc
 fNnS4D0FPB/8fVdMnTn7LlFrpoDf/k300B3PCHu8uRab7IXu51ltEWgtuIQFxUO/ZqcQ
 /fgfodPpf4LaYmpF4fA6oYOd8//j+nEmdhf7bU+zasR8FKT9KGlkUaE+ztLYyZd/FFzy
 BRyQ==
X-Gm-Message-State: AOAM533zq1BeXF9dp0qCByVijBjd6QXx2wfvqk+kGOh3l9qyeXK1joP3
 qYUJit2VajI97OjqXBBLM4N5sx/rysw=
X-Google-Smtp-Source: ABdhPJxEd2GXPtVC28jm35U1tKJZT6RrDcLFvrmzny+oWxw4NACpydG31p+mxhfyNo/3T1P+JDzX0w==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr4234530wmh.2.1632519622847;
 Fri, 24 Sep 2021 14:40:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id y197sm15641526wmc.18.2021.09.24.14.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 14:40:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 23:39:46 +0200
Message-Id: <20210924213946.2888625-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924213946.2888625-1-fontaine.fabrice@gmail.com>
References: <20210924213946.2888625-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libvirt: add host-lvm2 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-lvm2 is needed to avoid the following build failure raised since
the addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

Program pvcreate found: NO

../output-1/build/libvirt-7.7.0/meson.build:1888:6: ERROR: Program 'pvcreate' not found

Fixes:
 - http://autobuild.buildroot.org/results/13c12086a0ce06c348d5971b56b5f4f27fa0f317

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 0f6c7cef7f..3118de4d58 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -180,7 +180,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
-LIBVIRT_DEPENDENCIES += lvm2
+LIBVIRT_DEPENDENCIES += host-lvm2 lvm2
 else
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=disabled
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
