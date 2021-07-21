Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE54C636C9
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:10:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF67461245
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 17:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF67461245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5C8D823F9;
	Wed, 21 Jul 2021 17:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmjsvKv0xDTJ; Wed, 21 Jul 2021 17:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D04F823C6;
	Wed, 21 Jul 2021 17:10:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64E871C1135
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 548D081026
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 17:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0FYqqUH9FHa for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 17:10:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA11C81004
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 17:10:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id w13so1751477wmc.3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c5hbE3HQL6M6ihZUseCtgF4DGiNxtGUGwAk65+fySoU=;
 b=lUGf47QJE0/Id4pmAr/1hhFXow0tnxlBtMK8cYCyGmrrx1B0fs+J9OrVFLkEcVN0+9
 akU6QTgfAwISAMJemS4y0qj6ihCjShtXcIVJNG6NH3kXbvZnZFTt3pgRSg/iXzq4BMOP
 gJOOg2nTZru259pz8QuB0kW0aUAfhi+DhX39ajqlt8flHv7YsFo2QXi3Prc5wK4q4Yzj
 YSB1FCYpORiXPBCDX4pMQKOuQP00OqH+9plf+Wr07ZllQGvjwQCtkwsKdHO8SbsR4ADh
 bVZdu/CMa8Fb1ozYGpLDjk8DdC2bp4c3PYbxy89dm6sxCPiagQ4Q+8pcILTEMlTr10FJ
 SE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c5hbE3HQL6M6ihZUseCtgF4DGiNxtGUGwAk65+fySoU=;
 b=Jf9VD87y2e3fDTeFjDdgpuqvjWuVy8B6a2pAe5weu0H5Q/k/jovGgjNI1WdQ0ykhgc
 754jw9D7o+00qmpglweG299L+DkdjFAqlUKVCB3GBQI/2q4+v6hMM85MI4wZz8rw3NR3
 dck6vWBfgEVUy1o4Q7uvwcjeHcwpxSCkx/sV8KYXhzDTtWw1U/e2wGl5Eo0+rySL5sQ8
 3OqI+lXnWFkApYVqJGzKUvF6KNhJOw1fZjsG0H3j3Iv8uvbOhShBEqI+lpbG0OTKqVm7
 pJAI1+iLaI28psnwpZCHDRY2Yz6L6aHQ0yn9+sVGXqsHTvtx/E4Fdg2NcJYo2xTuNGz5
 iUNw==
X-Gm-Message-State: AOAM532oXmcCUC6ckRZoR2UxTDcmEUO2c6jGPj5dEDuEae6RZtPGrWTK
 da7OvAgS01d3CrRLBi3I+Oxwh3iMlxX0yQ==
X-Google-Smtp-Source: ABdhPJyUOiSGAgZUsEV4tuFuf50YWzixEfg5SBfztCwFIgdp8rXOPyIfKJKNjzrG2EZ1D0nbYph3gQ==
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr5074794wmq.179.1626887429758; 
 Wed, 21 Jul 2021 10:10:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id m32sm402261wms.23.2021.07.21.10.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 10:10:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 19:10:26 +0200
Message-Id: <20210721171026.489098-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apache: add SELinux module
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

Support for apache is added by the services/apache module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apache/apache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index dc66cd660e..365dc9a72e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -11,6 +11,7 @@ APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
 APACHE_CPE_ID_PRODUCT = http_server
+APACHE_SELINUX_MODULES = apache
 # Needed for mod_php
 APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
