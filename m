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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91FBC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:55:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8826B61054
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8826B61054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5248B402C9;
	Sun,  1 Aug 2021 20:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsfvbx5xRDax; Sun,  1 Aug 2021 20:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F07401E8;
	Sun,  1 Aug 2021 20:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5AA1BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B390606ED
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8m3lCoFRL6Bg for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1CC060677
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:55:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d8so18979777wrm.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=joGO+lZydvk/NSwA05REgeHsOmqCLoX1feGjY506usA=;
 b=eh+wN30vsof7MPFOwEPjC5Dp/u2+E3qrB2uZnlmd/rSt4NipMyndWHQzJ4Asdvb6xM
 5Q4JiSdxt2ImZNH/Lyydqttkywmk9dgUE/SFc6pD0k1+Q4Jf37eDo9nejEoF7Xp/c++4
 fCc/NS6srpMfdc5fzN0Tg9lcLvSKYxGG7TTFJxGaExYZNuCBsPc/iZ1KJ8K1QN4anvv2
 N7AWT8KNQBp+V6oym9en9trkOwwG592VJMcDNRdKrrAOj/5sWTg39SsPXACp/+1L/CU1
 nUWcmW7Ny2kNM3CScL/pZSP1G+U8AqI92LRGK06imYA8N1j7A+0Aj5reZALFVpggUjVi
 RG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=joGO+lZydvk/NSwA05REgeHsOmqCLoX1feGjY506usA=;
 b=PDlHv7Y/v4Qumpo2ikFHl9smC3kL3ZbXl8wrxRfHY24tzIh5jJ4XhJ697AnSNaxiyG
 /GLaPKBuxQgOHFG3GzzOLyv+KmPpp8yGWZ48HAIaaC3hO8arEAn5alWus8rcSxhPaf9/
 DpgQR8DWHL3w81uul5PoK2HsbtqpbbPursVbPLynbi91MvOkFBqHRtb53qkkeQJYuYeg
 NxpimXbOPSBv409+ASqLAF7Zq+eIWrr/+H2syofS9Wzls+8R5xAGzptjOzSmmQjw/jkZ
 iKKxS+SE/11dEEuNfexRT1XS02T6iNAryBwMxZRGh1R+6++9RKbj2Q+cIPo71vAXLZfb
 i0Wg==
X-Gm-Message-State: AOAM530qoV8JIGNRHUL1Sw2B6yl/vyKTV95YEY46QEdlax6ASn7cppre
 JgOm6v8HsRumRXCKO2iCzzNaJWmkUTLQSA==
X-Google-Smtp-Source: ABdhPJzh46YFlOibnjE/yJvCLLuggHH/59NzKF/x+kfgwIGGYHJx6bHED76Kxr8LtHd20vLoVrQZMA==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr14065533wru.7.1627851325664; 
 Sun, 01 Aug 2021 13:55:25 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id w13sm10716939wru.72.2021.08.01.13.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:55:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:55:18 +0200
Message-Id: <20210801205518.76572-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dovecot: add SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for dovecot is added by the services/dovecot module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dovecot/dovecot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index cb1cc990a1..62499061f2 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -11,6 +11,7 @@ DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_CPE_ID_VENDOR = dovecot
+DOVECOT_SELINUX_MODULES = dovecot
 DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
