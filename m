Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB55C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20ABD60605;
	Mon, 22 Nov 2021 22:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SW7Vy-Et8ezU; Mon, 22 Nov 2021 22:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F865605E1;
	Mon, 22 Nov 2021 22:28:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A65551BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A18644038D
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Na_b6_zx_WlF for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:28:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 044994016B
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:28:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso452195wms.3
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXQrnq6NLnO3w7d94KNqAdDdr+rV0pe/6GgvG4kNZ0s=;
 b=NjgILnAFzAu37eo7GEpC6meUR+DKUlA4c+u0mdnh1/oI5gbEPeO3rueponqkFI7Ub4
 NY+7DdwD+9o2LppldkY8qJJim4IdKRiga+Z/uPQIAzmWVmM2ewQz2uXGIeLLS4+bkM6Q
 tNC0648wL7AsFW0uEdevvn8r6ad8FTIsvxm/BDNvb7SLhzGOdFS9I4QnJUfrTZCR6AGA
 ZgknPC47NgGacApBl7n0D2RUK3zkj5cCBzmGHVai6h5xhL0AjNgB/djydRlTR/E/55+c
 zNAVha2U/3WnQHpIvBEYVuNOO7lYZuDexbyLTnNTG7zm63KRb6pD3KLmSe5Dfp81UkiH
 rDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXQrnq6NLnO3w7d94KNqAdDdr+rV0pe/6GgvG4kNZ0s=;
 b=6o+cHsJdTKwv6rAIficba+SM5sQxawylr9pJ/nILjS6iuMj5HMj4MrdYSiUhvuBr6V
 iUGP9EYEJ0nXk+znIcvaq5sT/gy1UAIjGAdgHhAwxJRrScJvAUxV+B85/8Bg16VBfRQl
 mR3o4e/VJFmOuLaoGTOMx3uKHpPYV2927gq2FwkCWU+ycRJ1jK2pg7ftfVctq2vXVuom
 /V7PwkHVs/DfpIr65Ur59//0iKTvpyfxNm9h373qVPwaovDR7A3Ose088Hl6vbcfOeHg
 nz0oLAV3Gfa3IWu4HvrXS7Uh+jEmyJiGhAkl5EO+rnS6wsz4FJhsrdC+ZJdAEZLbuFNU
 lnlA==
X-Gm-Message-State: AOAM531J5XoUcZUqQgT7yaDBlmdZrvXgKjnf27H982jqg/K2aFBhz0dM
 ky2m/csBR1iCGR6/uwqTOEye2QuhgQY=
X-Google-Smtp-Source: ABdhPJzN7Sk5Tl7/cENT79Sd/ObaFkWnLzoBz/hpzUYweXwGKtDmJDFFXIGPP5uk7W87bMtJIBZTOg==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr694171wmq.155.1637620122983; 
 Mon, 22 Nov 2021 14:28:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g124sm22283105wme.28.2021.11.22.14.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:28:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 23:26:21 +0100
Message-Id: <20211122222621.3539653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nss-myhostname: rename
 MYHOSTNAME_SET_NSSWITCH
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
Cc: Vincent Prince <vincent.prince.fr@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nss-myhostname/nss-myhostname.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nss-myhostname/nss-myhostname.mk b/package/nss-myhostname/nss-myhostname.mk
index 08683a542b..b1bdca8ef1 100644
--- a/package/nss-myhostname/nss-myhostname.mk
+++ b/package/nss-myhostname/nss-myhostname.mk
@@ -10,11 +10,11 @@ NSS_MYHOSTNAME_LICENSE = LGPL-2.1+
 NSS_MYHOSTNAME_LICENSE_FILES = LICENSE
 
 # add myhostname after files if missing
-define MYHOSTNAME_SET_NSSWITCH
+define NSS_MYHOSTNAME_SET_NSSWITCH
 	$(SED) '/^hosts:/ {/myhostname/! s/files/files myhostname/}' \
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
-NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += MYHOSTNAME_SET_NSSWITCH
+NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += NSS_MYHOSTNAME_SET_NSSWITCH
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
