Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F7CC12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:09:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C356560FF3
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C356560FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 934F381D5A;
	Wed, 21 Jul 2021 17:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ioIYNRpNGwng; Wed, 21 Jul 2021 17:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE650823FF;
	Wed, 21 Jul 2021 17:09:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 223D51BF38E
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1226C81D5A
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzsMXy9dtEHz for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 17:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E846803C0
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 17:09:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r11so2950574wro.9
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 10:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MVYY80B34mDet3D2qrnwA2IeAXnqGgwZ3NmK3ZT3TQw=;
 b=l2mgmwa4HPcHouJku0ODSnAg6J8EXp+KftYweZVGK6Akbwj6YEY2LPQmdlNlpr5OQf
 mfeJ65U0Oa5VhLz2eHC416RGofyxd/W+yXuitlvagZuqfvktx1TBfDXplRjD6D+7ya9R
 +VDcwTtufD6eUL8vcNoSs7qg2rnaKUZrYlGB/KiUbnhuvAuF1LeuGx2WmWM92ZKZOktI
 DLEGZNe59MmY/VwyDGDbSOQyWsyuXmrvuJAkPJvfOMKjCasBif0nvtAhTjmyWsIywYw9
 g6Bb+H8COXeExzgRn2Mj874RGC7cyeW0qKfcr7L9OFv+wFfQUQG+cNfKHavGWvvakt3p
 xb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MVYY80B34mDet3D2qrnwA2IeAXnqGgwZ3NmK3ZT3TQw=;
 b=pVeX6yCFw2u3meaSzlVjkmJQ7Memp/kzrOWA9i64qD6OJzmDZINoi//S3cV+siJFC6
 wVHRR2qbSLjS43KYGpAlTTCY8FpjznMGnkQXZQ1LjmUHPsOIUlganN3h4NlMr62S8XB+
 PZFlcQRhLEmBpBXprwAAbsEdGYv8sxIL5uzBDHVQWadcwBlpTK7+Zb3u3cTBhL2lanFo
 YzRzU9WGq86UmaPHxVpPU4POu50QrUQgIAlzSEcmL/uyjj4CIT9JaTcXZUaQn+tRi6Nk
 +VirH9+8BFLp3kvk18mZfOgIZl85Myz63hR5Q0jpxvDWmuUON2GWMO4aNXNLVwgw7TeY
 59/A==
X-Gm-Message-State: AOAM531WRkI405VsdlgsgEscF3F7ojD3yuDdIVv1VmD3sOgSPnj2/4yX
 OHeD5QZ+uehVPoKRFFtINM4pUG0TNeT1Hw==
X-Google-Smtp-Source: ABdhPJyUe8VVeE/JcirAHkff+QDf/J3+4W8PcKOlq9INuthFAZRHmJ3jD32Uhn6yAXGC6aiVnCZrhA==
X-Received: by 2002:a05:6000:1a86:: with SMTP id
 f6mr23818687wry.127.1626887339369; 
 Wed, 21 Jul 2021 10:08:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id v2sm27871869wro.48.2021.07.21.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 10:08:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 19:08:52 +0200
Message-Id: <20210721170852.488768-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/avahi: add SELinux module
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

Support for avahi is added by the services/avahi module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avahi/avahi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 9976df5357..9de6ebc4d2 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -9,6 +9,7 @@ AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_CPE_ID_VENDOR = avahi
+AVAHI_SELINUX_MODULES = avahi
 AVAHI_INSTALL_STAGING = YES
 
 # CVE-2021-26720 is an issue in avahi-daemon-check-dns.sh, which is
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
