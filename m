Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116BEC432BE
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:26:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCE7960E09
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCE7960E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E8BC40470;
	Mon, 26 Jul 2021 09:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h93Dws6yYs5O; Mon, 26 Jul 2021 09:26:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB47401E5;
	Mon, 26 Jul 2021 09:26:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC7EE1BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB4FD401E5
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:26:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0WgDDVXYOkA for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:26:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F09B7401B3
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:26:51 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so7710274wms.2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5w21+C8iKwa1gxEXyUdQmpSXMnRBi7YxWEG7U4zkg0c=;
 b=s93BczUtZpYCkZLP965OF/pLCydLm70NEVhFhWHWusbqQztFvldyTkVbsGLqrnTcbE
 diYH228bIpFH6wzNtLjA6DIh4jUiZDYbsfuxHp3BWcVNBNccJqOXd3eAkGslCzqdkS+p
 nrFEFvQ5w+r3GtQylK3TAj0lptZF+BMIjikYXciPeuLr5xolINw9NsVNGFqzwKF49Km7
 ZwoV3fcRLrXFcy5gufh1o6bL4SRcDmrrGYwzK2ClZYc3f6g87T9qT3MNyTGcNVC6i9/R
 V+10yrxMLaXEMEZkdqznIEaLCd+4eVZqDT2uio/UrX5IO267K8X1u1Q39B+tIvk+aUnv
 JjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5w21+C8iKwa1gxEXyUdQmpSXMnRBi7YxWEG7U4zkg0c=;
 b=LXlW7JnGRdHgP4kd/idtG6sIIU+PgDswaO1jAuWHCdPPHKG5QkGx7qoSdoNSDRU+Hz
 6R6DFZTtCI+fYNonpR1xZYeTXwjj7O2ZMOKKvE394Ujz1G0BA1eohj9M4lwxfFPmacT/
 ktRVS2JNDYdf8CU8JF2l62GrtuUWRSGASG0sONtbo2mhvQ3nPxTxSNT36BwgGBvkNMr3
 +2+wDDSVi7eMXD8QELDT3DGoTiDsb8sh6RntsOmxu3dlO4DWuy9erjMUSGUXJzyLkc8j
 gCcDbIP9LomeeNUuBmIjl5+N8HKO2mI6nOehyBvqROvB/K3/Tz1p8luU29OIhhwCxom8
 TJQg==
X-Gm-Message-State: AOAM533pjZKnCZRufQOKYUNdiXRjdeSjyPcarLbOeKTCylxgv/k/TZ2X
 5coslomqrA0G/kYFH7VLw1gTooIcoSeuOQ==
X-Google-Smtp-Source: ABdhPJz7tzYhGz09a4ox3kK5/IumAOKkUikHLHm18jvfrVt3L76GxYyW8h5pfrKU6d1u2uqOw+MQ7A==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr16226509wmi.99.1627291610021; 
 Mon, 26 Jul 2021 02:26:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id w9sm35673675wmc.19.2021.07.26.02.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:26:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:26:44 +0200
Message-Id: <20210726092644.1714513-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nut: add SELinux module
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for nut is added by the services/nut module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nut/nut.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 1cb494e5ca..3f214c5606 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -8,6 +8,7 @@ NUT_VERSION = 03c3bbe8df9a2caf3c09c120ae7045d35af99b76
 NUT_SITE = $(call github,networkupstools,nut,$(NUT_VERSION))
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
+NUT_SELINUX_MODULES = nut
 NUT_INSTALL_STAGING = YES
 NUT_DEPENDENCIES = host-pkgconf host-perl
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
