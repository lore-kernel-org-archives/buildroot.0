Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E09C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:01:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 149B060295
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 149B060295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4A4240186;
	Sun,  1 Aug 2021 20:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jx020Kxvb4qZ; Sun,  1 Aug 2021 20:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBD70400DF;
	Sun,  1 Aug 2021 20:01:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4A61BF424
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7FA606B3
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUWMgt9bVHAo for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:01:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C49B60683
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:01:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso9762260wmp.1
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3fXxUYCOCWtn+6gbtaauAk4aD2SIlzJa6RO/Lz55VJg=;
 b=tieKGe3gyLqdqYKufqhANgN8HTfeIu3KD2Hv39vJdb8z8YOgfKimWmekjxuQvfg0KR
 1g2WsDKal7Q9uO46Gb+M9pGqemP5POpcC34mD6T4x1kYfpZbWTUIVhCfwv69oMVTc2jL
 XLuy5xcODTSoTkLiYIXkaqWii+5m3T0TEUnXHV/kQzX75p9LROwVHgEFqxdFRU/cV/Hs
 sLfSx9imr5mo7Qo/1OTFTHHmZm2b4bWCxXRyevrsRETXQyGOPlEwFQ2iYVgS9/wxaHtJ
 8hi/bzI4gFuk/mlgcNsugeGxSkcJ4cmLknLRR0TPjlspOp2dxWeVJdK77ud/Fxsdpeq+
 Uxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3fXxUYCOCWtn+6gbtaauAk4aD2SIlzJa6RO/Lz55VJg=;
 b=OWIOV98aF/2ckelZataS6FHkCBcDWgECwl/OKhDvAiNXEbdfPZmceF6VLgH1ZYUN8i
 fU1jjyLxUODko6vUiqT1/KN/7o/EXz+CzarxhkD4GGacKk8Klop4bSWUtPf/KIy6lU+G
 8Myrcmi42+bY7P0RrN9tSodplN4MO8chxnbOhPdDBHGd97ULhCFXtUTnrR5Y4wIqUUfv
 hiQkCbh3IepX09FQKXMCzdRQpY/Ps3nAVxDCsKPSB1GmKuUSPqwTLy3FPrySreQiUItk
 Q39G1DgTvAzmFN+ub46rEzOewUPFt2J4RilJGnm0HiGQkLeyRVfyiip3KnYj/TGO3rFR
 sylg==
X-Gm-Message-State: AOAM533NZmG1feY8Qlif3UqGJa3ccn+PGaaS3L3t454ajrioBQycV5+x
 nSSfjFnZrMQX6bHbqo3SVmXFktUpZ/71WQ==
X-Google-Smtp-Source: ABdhPJxy436pSbgJ0yfHmZiwJyhr5Sfo/Yzxp9mxfhZZicthKhax/WrOkR0hcI1qcF/lRXi9WGW00g==
X-Received: by 2002:a1c:32c1:: with SMTP id y184mr12989535wmy.70.1627848059305; 
 Sun, 01 Aug 2021 13:00:59 -0700 (PDT)
Received: from kali.home (pop.92-184-106-251.mobile.abo.orange.fr.
 [92.184.106.251])
 by smtp.gmail.com with ESMTPSA id f15sm8498674wrp.12.2021.08.01.13.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:00:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:00:52 +0200
Message-Id: <20210801200052.3968967-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: add SELinux module
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

Support for vsftpd is added by the services/ftp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vsftpd/vsftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 181f82f397..8daf07c62a 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -10,6 +10,7 @@ VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPL-2.0
 VSFTPD_LICENSE_FILES = COPYING
 VSFTPD_CPE_ID_VENDOR = vsftpd_project
+VSFTPD_SELINUX_MODULES = ftp
 
 define VSFTPD_DISABLE_UTMPX
 	$(SED) 's/.*VSF_BUILD_UTMPX/#undef VSF_BUILD_UTMPX/' $(@D)/builddefs.h
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
