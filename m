Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45C4C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:49:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A05860F13
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A05860F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CB59833AF;
	Sun, 25 Jul 2021 07:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_U8sTnUpLu0; Sun, 25 Jul 2021 07:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC5B98338B;
	Sun, 25 Jul 2021 07:49:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D55C01BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB203403B2
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5igjZu1PDYm for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:49:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 981F7403B1
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:49:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o1so7114449wrp.5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EXieRg1m/5IQ1Mq1afadgOMzj987Wgmd1QBLu/7r2rk=;
 b=hDVOOtioQ2O9zuiLAGrN+wUHgA3H2j+ObVK641m3KoaMzNkRqdK1h0ZvWlAMsEkju3
 1U1LVTJ8K/psbi3837R86omROEdhTvOo1I14T4W6juRJec2UbG2K8dZJhReLLFX0++pj
 CbUy1Q+68oYND8egmRk18tKhU1y7JPVSPXAAbPpIULHB3QsyUuIGEg3L55Rp8Z2WhwsX
 vkzN67Vg+QLsCHkTItYwqtN8Vy1yRC9jUu4MdFK0lVZkWPmMFvpepJPmdX7v2rPv68mK
 O+uajPiKBoTZxFxnhzezTFyEcrZ+RPpuWA8+y8Yhi3cxnpbFK+s+MahyJOUh8x0R1dXM
 gdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EXieRg1m/5IQ1Mq1afadgOMzj987Wgmd1QBLu/7r2rk=;
 b=j2d1QYuwiGJ+2Pmac8bqWNY9VKjv+0NJ78/1kOimWUwUrt1LsxPdHaYKradP0hfInj
 TZemQoWaMa44lLEGAs7sKjEihBH2LejdDbQzQQobWCLSMS1A/hJxFVwpKJZmJHLNtwwC
 M+Y6g/fH7Gd+mPpDRcM5whLJH0Pka8/bdS11/FsnizxMKO54cr+rkohdZZC3Set+b9c6
 vY+GPeP43goMIvWZOi6jkA3yfTnhHTyA7zVgKZTg/LVjoNv4ldOt8Exrj9MhD9ZUGv42
 M3/3Iv5u2Jcfk8Q2WAqyOa21dHi2d8ogs6UKELkAm19P9GOs1JQoNWrZCXQJuAIfWXA1
 bWwQ==
X-Gm-Message-State: AOAM531BWeJrkldsN67CoDsiatI2F5uuyROfCZ8lMz+b/rFR7640bxNq
 h4FgG0+exlz1LK+5S0Z6ycVtQwasCkVmmw==
X-Google-Smtp-Source: ABdhPJz0KqiTQ6JG0PSSNdYbCxmcpvE7/2gn0K6cIYzWj1ZKqZqp+bTfFJlQcYx/WOThYEhEb4lUTg==
X-Received: by 2002:adf:d225:: with SMTP id k5mr3411001wrh.10.1627199344477;
 Sun, 25 Jul 2021 00:49:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id 19sm32357937wmu.17.2021.07.25.00.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 00:49:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 09:48:55 +0200
Message-Id: <20210725074855.855272-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix legal info
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

Commit 87bef179222ee8a0b0f39c8f96113a4ecf813085 wrongly removed hash of
COPYING

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsnmp/netsnmp.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index e3adb28c6d..9d196c8bee 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -2,3 +2,6 @@
 # https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9/net-snmp-5.9.tar.gz.asc
 # using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
 sha256  04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071  net-snmp-5.9.tar.gz
+
+# Hash for license file
+sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
