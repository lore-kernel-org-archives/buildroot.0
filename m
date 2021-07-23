Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DC7C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 16:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F422760EB6
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 16:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F422760EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C99E460A38;
	Fri, 23 Jul 2021 16:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wu-FWRew3LHF; Fri, 23 Jul 2021 16:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C8C260A4F;
	Fri, 23 Jul 2021 16:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7310C1BF299
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 16:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C5E40584
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 16:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAyOGHYv7HR6 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 16:11:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D56C4012E
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 16:11:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id b128so1111613wmb.4
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 09:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8JV5yn+k0ZKFFmCYfUuNZl3+3cGWPQ/S1R2hkdhwDbs=;
 b=S/qIKq8obi+6crZxHAxEMYwQiObYjHrVkGNZeGcQK6Vc8l2+ZrzLTCQpWYUjY4D46H
 2Z11r1OQGL9a+n9JcvuCFvUc6eWr2K4TWFEnK10mz9/zE2LMF+J472k36sSWjKq51fqf
 rz2i+gy1lioRma9HVnZplc2hfMftsSfScwFjlM8bIFKirRu8+egjEPaeUbumSDRqwSTW
 83DA7WjzIKD9Pi7UsXXPVnvn4gu72CERBHe8vlTmePOQuVrmB5vJKA6u+b2jxuvQRTPA
 MJ9+cP/yY75N4+CsOtE//mTTeRqdS8g+EVaqMy+zd0J2ZpK+eVFUP6HUXqnlyFrAxXoG
 HWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8JV5yn+k0ZKFFmCYfUuNZl3+3cGWPQ/S1R2hkdhwDbs=;
 b=gfNWvxsTZr53AZnCqZ+utdjbY/5wEYzMPfrUVwpUb2McjjXVTKvgnwEWgEL8hM3ze4
 fgTmhpvxjTJiXbt8Z9BNu7VTkx0ZsHjeFxaXqufCcIp8fdkHB3feDZL9nZTA7/udtxFi
 gfTtKUhgW8V1qJUxwJz3Mmy7ylAC2giZ9ai4mQoRnKWnslUD5rfqk9zOH5JXXCCnL+Kn
 G1Vj6ezyTG41hPywYxhKG2WapNDtzSE8zUC9mWWbjEmcAcjUbgP7GLpwhRCTbKMZtWuU
 rw22rxMSYWfvWs7lv7ZrZu1uIHhCCIiZkeLN1N+hFVSFQRKduVe3Pr4u1Zjz+Twlgj2T
 b3sQ==
X-Gm-Message-State: AOAM530V8KkWy6g60MnjMMrQiucRlZhR+76LU8EuhS2dTHXRBORJ0cFz
 J6VA+M9JREwcAg3nTT2U/C1ezyLyhDCOhg==
X-Google-Smtp-Source: ABdhPJzhDPPzp/3krdwaFlwLoG1io35VgP77s954KRUWq2touEhI77NztWr8i7Zly16rpQdfqvz9yQ==
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr965001wmp.52.1627056659258; 
 Fri, 23 Jul 2021 09:10:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id b16sm35026071wrs.51.2021.07.23.09.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:10:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 18:10:50 +0200
Message-Id: <20210723161050.212751-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: add LIBVIRT_CPE_ID_VENDOR
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

cpe:2.3:a:redhat:libvirt is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aredhat%3Alibvirt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index eeedfbdc51..a0fd5af951 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -9,6 +9,7 @@ LIBVIRT_SITE = https://libvirt.org/sources
 LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
 LIBVIRT_LICENSE_FILES = COPYING
+LIBVIRT_CPE_ID_VENDOR = redhat
 LIBVIRT_DEPENDENCIES = host-nfs-utils host-pkgconf host-python-docutils \
 	gnutls libglib2 libpciaccess libtirpc libxml2 udev zlib
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
