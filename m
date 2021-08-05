Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06269C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:33:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF326105A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEF326105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73F42402AE;
	Thu,  5 Aug 2021 08:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hsj6f6qOhCP7; Thu,  5 Aug 2021 08:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59101402A9;
	Thu,  5 Aug 2021 08:33:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8E5C1BF9CB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2D494028A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wCjCt2NavBu for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:33:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2D0540259
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:33:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c16so5385424wrp.13
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 01:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJ/vViRPheF9+PKsI44ce3/FAjDEPo0zD/sDmXgbVGQ=;
 b=U5umYcSav+ANBEXAtEsf/5ZrdFk0LZzYOt/TDq45qHsMe3CemtNlPbwAg/s1cFf2WT
 otXr15uGPGObi6QGCxYoonli3vPpf89onlrgOTamtqeOq/wql9fYJ+eV6wdzgoUXgprX
 curb8Ptf5fFShb8JkIQyJ+OO/XxkgIlqXDc+ekgjXPtYNRsgSKNVKs0ISw7NBOVzYP1i
 quj+giiccIg+/a8acAuKuzLFclvWAj1RKka2VJA4FvDaFMJNFPtZG4dBnjwLwjoSNlJx
 8jjlNjs+zahORLV6hqB5zU6xCRTgEGsu4swXXjV2dYG9YeSnRiKbPMNPYP1mJmxE/1g9
 6L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJ/vViRPheF9+PKsI44ce3/FAjDEPo0zD/sDmXgbVGQ=;
 b=EEGYQAdD9w5fj7ygw8YYQsyjngmHbwkY+RQyJ63FmB2PsjaWMV8NBGdx9xc5WuNJnL
 UTDaVLUyM1knvUxD0qtOAzA9T330wkdcPF8VyFaF/c28b+kP9R1jhJc8ZRG+b+RXdJkj
 nnghVktB0TpU1gXohvRZ+NqMD+nVP3Ujzxm/Za1tM5rp3kwl+hkzcYGWhcNDJNF9ca+l
 RWSREtcRSPvEJu96GsvjK9f0OdUP2ruVZzdWyWP6riRTjCQ87XdKzE66hn0U127uGwEd
 aOHdAUB2puLqdT3bDEEbk6VKXByLO96PvuoKUn4KyV/SHAUyN5/jp63WS8MO7jKQF5Xj
 ptqA==
X-Gm-Message-State: AOAM5335Hepbvj1yjhTmhteEouVufLXE6kjLmrnTnFOkSJ+NVDCIx9dA
 KKIP7V3R4x++e0+SOssRbNI0g5rXxdrqRw==
X-Google-Smtp-Source: ABdhPJwrxkblZpdUBTP6ZO/rasJebxe7EVT34zDqu+lQxEwRNjVVBtsxs+xwNn0CN4RqzbyV0Zwv0A==
X-Received: by 2002:a05:6000:256:: with SMTP id
 m22mr3800900wrz.395.1628152418604; 
 Thu, 05 Aug 2021 01:33:38 -0700 (PDT)
Received: from kali.home (pop.92-184-97-131.mobile.abo.orange.fr.
 [92.184.97.131])
 by smtp.gmail.com with ESMTPSA id v6sm5183078wru.50.2021.08.05.01.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:33:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 10:33:25 +0200
Message-Id: <20210805083325.1919836-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/network-manager: needs gcc >= 4.9
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

network-manager needs gcc >= 4.9 since bump to version 1.32.2 in commit
360d1aad84449c6a1993d8c7e469dc0cd35339a2 to avoid the following build
failure:

src/libnm-core-impl/nm-setting-bond.c: At top level:
src/libnm-core-impl/nm-setting-bond.c:149:5: error: array initialized from non-constant array expression
     NM_MAKE_STRV("stable", "bandwidth", "count");
     ^

Fixes:
 - http://autobuild.buildroot.org/results/dc270ead82707f89d47616a0c18629715c6ea1a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/network-manager/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 7d44768460..38ab43740f 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	# Tested with 3.2, but may even work with earlier versions
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
@@ -61,9 +62,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads"
+comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
