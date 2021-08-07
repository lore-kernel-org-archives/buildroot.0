Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65E3C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 16:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E21060F02
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 16:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E21060F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ECAF607F0;
	Sat,  7 Aug 2021 16:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7s9R0JCaHPr; Sat,  7 Aug 2021 16:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6014F607EA;
	Sat,  7 Aug 2021 16:28:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6847B1BF5AD
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 16:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53AEF607EA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 16:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0Mos9TFMAbk for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 16:28:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01534607A1
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 16:28:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so8065314wms.0
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8A5IOPelNE9SGHPocKBg0HC+y5D19jnssdzCBudSMeE=;
 b=OiB6cVLX3AaUZhUFGLbB32ugfZUzZDWj5nmx2q4JDcTYxd524zI2cKP2+yGKG1Q6W0
 NJoZvTRiG7LqjVZv0ulGJktXcHFxk0hC4ixt3YAT41HGxpTxtROAqEOZ77ncHaRVSf9e
 82VE9bNs1KzMV1e0G9MoLqHEYbUe3WNbLK7vpdwf2EQpeFpLrN8/Zwt2elbW8USlbDkg
 L74HLpkGVboLkfEsCGiPfOIjXuUOWdNHeUjkkGKTf3heaTrXLtNfKjbj/69Ze8Y1Emlm
 Ajx+Ix+qO1z9nGO/zyDXKQdV2lZdAQZlawclrp0NgnJaTVYNdbM0YmD/RjRBu+2ja63g
 hMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8A5IOPelNE9SGHPocKBg0HC+y5D19jnssdzCBudSMeE=;
 b=eShVNMxI1zpfdN/LWhcr7BBlGFRYjejX/pSJZUkJkjUFS3zHJo9KvJnGanr43iGGIN
 IHro0tmrb+ADG5oqzoMZwqkRoH6XIcPO0m7n7FbT5xXyXcZ+WHt/97ssGhVg9jTHB7UQ
 VRtLPmYEj/vfoey6+RRHYYHiu1/xkLGmLMni0KqTSh8l7P3gkPoJ1lH0xuLdy1heoHd9
 rPbh8jkjaZFvAfx7RtNh8iuvW05gBLQSKNGC9Cso+rOA6zYU9wwkxwG+3LP6uTWo/7f4
 2r2V+BwbbhM3t7nxvewbtIwibnLdqOJ8/52vJ9TRenAf9woLaHEHmS3zHVgys1jtfyKm
 WITQ==
X-Gm-Message-State: AOAM530AGFeKruD/lcMR8vmAtKh4nypXzozfd8Xlg2hn/dKNi0wvSqaT
 awVGWaTggrMmkHs3BaEJrebpwpEDStvTKg==
X-Google-Smtp-Source: ABdhPJwG87nAEW29p4J81PcGMugI0pHOGo10JGq4mQ03CI+i/EzTKFFEzPn4KS5aOMqQkJNkI10vXQ==
X-Received: by 2002:a05:600c:3ba2:: with SMTP id
 n34mr8826246wms.119.1628353694965; 
 Sat, 07 Aug 2021 09:28:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id w13sm16164268wru.72.2021.08.07.09.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 09:28:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 18:27:42 +0200
Message-Id: <20210807162742.490256-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: aarch64 needs headers >=
 4.11
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

libvirt unconditionally uses HWCAP_CPUID on arm which is only available
since kernel 4.11 and
https://github.com/torvalds/linux/commit/77c97b4ee21290f5f083173d957843b615abbff2
resulting in the following build failure since the addition of the
packahe in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

../src/cpu/cpu_arm.c: In function 'virCPUarmCpuDataFromRegs':
../src/cpu/cpu_arm.c:562:20: error: 'HWCAP_CPUID' undeclared (first use in this function); did you mean 'HWCAP_PMULL'?
     if (!(hwcaps & HWCAP_CPUID)) {
                    ^~~~~~~~~~~
                    HWCAP_PMULL

Fixes:
 - http://autobuild.buildroot.org/results/85bf7b4dad73a748bf439e63874eb64d9a53088f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 2f191882cc..e231511906 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
 	bool
-	default y if BR2_aarch64
+	default y if BR2_aarch64 && BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 	default y if BR2_i386
 	default y if BR2_x86_64
 	depends on BR2_USE_MMU # fork()
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
