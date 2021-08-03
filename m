Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE7EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1262860525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1262860525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8022415DC;
	Tue,  3 Aug 2021 22:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbaWJUPNYc8d; Tue,  3 Aug 2021 22:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55FD2415EB;
	Tue,  3 Aug 2021 22:54:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA0DA1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9CBF605E0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQS9WlaASZic for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:12:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05EA6605CF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:12:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so2612166wmd.0
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5K79xhh150hL3fITNlQBjYn/8hnIizez/TeVNL1o9Bk=;
 b=e9HKvtSQtXae/zrvm/sFIOToc72w1uWOwktvBXUNW1pro1WUxYoYvOHyKiU3d3atG7
 ATzzl/xsYOCMcp6qvAnNfOP5yf4wwndt59U0HO8lRsS/btqcxKYEiSObPCXbicgPF55a
 13ixZk8lLyzqJhup8qLnS+OFWRXLjgdqDf3W0zBN8+5RVdMgSMQ7/AgE8COdWmJkPqLN
 hRpZdt/1jX7iJs6+46/Lf4OUHjCvNZYJlNWN0QHgayrePLCaAztZlMPFW4MGTJ8VcftV
 msx+vBvZ4cl4ihAXBDInNSk6qorZG3+Hg588qrCNZAYzcf3GHkGDFUm8t/PIiTwA/zAu
 om7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5K79xhh150hL3fITNlQBjYn/8hnIizez/TeVNL1o9Bk=;
 b=SGAcHWGLjepg5ASKTg1cYpXjKnGFf1Z4+XcHuwp0O0/TdWhrOy/eBHsRZsK4nx4Elr
 vbKEvuccCPM3VMTGs+fjUHbNjb3nDuRLquJ4fYXxNW/2hcdfrN3ZRFEdm2hhpM/N1lVd
 KZnyolGdUfDBjnYRNkNkAi3qr2UQweBFgQrXBDZZZ0dMA0gB4b3Q3yFrehs5NKnGbVal
 tpzcCVdYjaufJFZM3hAKCOILKmM+AOfbdFaDpPLFzxoa43Eyt5O+6cYWczspKK7H0vl3
 kjHV/999VWj3JIiThUHHYwG0IfQ9n1++D3in1Ww59rpDSOSNzqSn9l6DQR125Z4Dc791
 2Sxg==
X-Gm-Message-State: AOAM530PvuxacG4jiU+SeCuZaYh5vVVHV9MlHxUwTKGSIxIrUZVce4lW
 /QMnFPUyNnHx8TfPv/MrjoaNOxsSpcZoEQ==
X-Google-Smtp-Source: ABdhPJxW3Ox7fsyK0TLNHZcjgZes8aK6SfN7vWtwDuWGER1lJi1nU2UkTguh/z4cyAAw6m+y/j5B1Q==
X-Received: by 2002:a1c:c9:: with SMTP id 192mr23189894wma.128.1628025138871; 
 Tue, 03 Aug 2021 14:12:18 -0700 (PDT)
Received: from kali.home (pop.92-184-97-75.mobile.abo.orange.fr.
 [92.184.97.75])
 by smtp.gmail.com with ESMTPSA id j140sm106235wmj.37.2021.08.03.14.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:12:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 23:12:10 +0200
Message-Id: <20210803211210.344167-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: add SELinux module
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

Support for netsnmp is added by the services/snmp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsnmp/netsnmp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 1a9a776033..985cfeac72 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -11,6 +11,7 @@ NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
+NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = \
 	ac_cv_NETSNMP_CAN_USE_SYSCTL=no \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
