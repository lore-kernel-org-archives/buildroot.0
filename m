Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A4DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 16:16:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F1060EDF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 16:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61F1060EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1568403A0;
	Mon, 25 Oct 2021 16:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pPQdTqjXmR82; Mon, 25 Oct 2021 16:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44DEE401F4;
	Mon, 25 Oct 2021 16:16:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58AF41BF27E
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 16:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47E3980B72
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 16:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gd27kpxeD6-P for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 16:16:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C2AC80B61
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 16:16:39 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w15so1437964edc.9
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 09:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcbYp/UydBAnoWS3E5ikJZ73f08GOC9vm2LFofuT/rE=;
 b=lV5/635iIvqrUTuitsky/yWKBGNf2eFW00OqzsWdzZN/HVlLxsWsse5Ybbkji4eB+k
 s7TaxANc0eTjPM6IhA9gMqP51npLeT5w4g3PEPRhYCUC/DwxbVsEheJCTMvh92JTp+tX
 u6ayMe5pHIquwnDDfcmfKxzUaTTb+eiwXhK4NQY8YWlOVnc6rwg+uKvSGMdFrcTEDxlh
 cOcgJTouugZa0HtsE4E02yNIwa4laSERVUPkENKMy2FDM+F4JZfIJDy7wVO5EPT6fnu0
 oHbPnQXyNGXbB/ywKGn+O6S7gqbVIYKMVFV6Tc4TNxE3/ehw/6hEiTVq6KqWvKLnj+hW
 YRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcbYp/UydBAnoWS3E5ikJZ73f08GOC9vm2LFofuT/rE=;
 b=gT4Wuxz8rplCY8h0s4YNHQNJ+8bKb52oOe1HYqQVRiS4U0lTL/nE6kldXYg08R0Y62
 NR1tqE6vD1KQIugzsQlfZFfDwq6cEc3+bs69HSnzUboTT1H/BJWmx8wQgW84YR7R54Fw
 7dOgCh0XaZDRXri2wJCuF+cs9HBD4pZfmCzEzzlfe0UXlTa3tSC8lcmrxsl9Gk6isyxo
 q7vKt+JDhA70eOYKOL4aHuzhacDbKRxnrn8Mi3RiwsvNrD6od7jEVFfBUHQmApoRBsVK
 cqxmh8jTJzmAKILKaziv+581W4ZdFoU/2PDfJ5LyBoYDHqST57KWznc33jpwoTlyWoZV
 Lq/A==
X-Gm-Message-State: AOAM533kFQtk3d7wBUMK8IgwL0eYunwn6dGRalPfq9axU5LqFe//yI9w
 HGIoT1U3wwjIQR4vGHZwNrSWvk4x8N4=
X-Google-Smtp-Source: ABdhPJzKfqLSBBEj1cTVNSMgXNL1Dc9eU5kFguGHIsscga64gOZhnKHtIfBcWac1Dqc3jOXN0EsVTg==
X-Received: by 2002:a17:907:7f8b:: with SMTP id
 qk11mr9755086ejc.313.1635178590207; 
 Mon, 25 Oct 2021 09:16:30 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id b19sm7627196ejc.107.2021.10.25.09.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 09:16:29 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Oct 2021 18:16:14 +0200
Message-Id: <20211025161614.1030231-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/htop: fix LICENSE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://github.com/htop-dev/htop/blob/3.1.1/ChangeLog#L3

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index cb434f3fb..12e48f437 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -10,7 +10,7 @@ HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
-HTOP_LICENSE = GPL-2.0
+HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_HWLOC),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
