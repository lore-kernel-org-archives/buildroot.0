Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75585C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0528D42309;
	Sat, 23 Jul 2022 21:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0528D42309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1T5dpgtbHD0T; Sat, 23 Jul 2022 21:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CF641793;
	Sat, 23 Jul 2022 21:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2CF641793
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7C881BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 920B360FFC
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 920B360FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ke0lmSmE4Qi for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:00:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7B4E60FB9
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7B4E60FB9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:00:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bu1so10823157wrb.9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kby2oYHOnWqm0fApff6sVLszdUaMiTwM7cC+Pt3ddNA=;
 b=szihHORB+YYAfAoFwgMNQV+Y78nSw6lr5Y7lVQ7ZQ6k0pMat2TpdWMZuToCDDdqag3
 a65G8MqD6Q1CB3FT874NY/YQVGYLdo5DFA3iLxwzOIq+U3OkYYHd9KTNayh7bie9k8Cv
 FVQPAxS1RJmJdGZ5puJNowHZHeMqyeW4U5rn37iqzEBTgEcXUR2V9d61Gvv7itTpoi4+
 2zl/UdhrzStB7tJpiHi1QmxGTk724YfPbC5LcpFo7+ABJFR5uynxDLVaCVV5gJztnSlw
 UKwvJVsHe2Y/jpscf83NXYH/L7GHzg2fuUBiierKUfR1An5CgtHGOOTYHr9OnV3Vnm9L
 kkbA==
X-Gm-Message-State: AJIora8NYNCGx7RGM6ViHHcHR+96+Xr1QxSpcrvlLdT6R9C5++RHUa2X
 MqCmS9gUE/Je9QbdFv2tTRFsz+7fYx0=
X-Google-Smtp-Source: AGRyM1v9nTLECIXytjvMDC29mplopqnzD/Ewuwt7cCJBRYg36IKFCw7BVXzYfIU45KkC8QI0i6nwhA==
X-Received: by 2002:a5d:588b:0:b0:21d:a918:65a5 with SMTP id
 n11-20020a5d588b000000b0021da91865a5mr3656791wrf.210.1658609998469; 
 Sat, 23 Jul 2022 13:59:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d4352000000b0021e297d6850sm7653934wrr.110.2022.07.23.13.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 13:59:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:59:53 +0200
Message-Id: <20220723205954.458058-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kby2oYHOnWqm0fApff6sVLszdUaMiTwM7cC+Pt3ddNA=;
 b=q5vRsZKpWyhgXjM9pjfqReK5EbiDlzlVacIEUyKAgFvEsj8/kr/D0KDTu2SO4wJPmD
 TfIVoVC/4xKNCSWiJgvNNvJdmAU/teWiNpG3qq6udO8RDrkXFglFbdYT0Ez1Mbxfzcvf
 f9wtIq1tthGfoVqPGdGYwEqeI4pLBCNj/JMu7tMJtM9HWBSVsdSrXirs4ho1KbXWUj7j
 FC6fZxpJ9DrFgNmD5AJLC2e7AFD2IOz+ReunAPvbUQik0dXPwXdPqkabMJK8LtSIG+uc
 Bl6AuGIDvZe1i3nXCpKksOOH5sDGu9o3x+TYuLmrp/ZtUL+0mvQGIJMuCNjlT74Be9yV
 dYuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q5vRsZKp
Subject: [Buildroot] [PATCH 1/2] package/bind: add libidn2 optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 1646fc6237..86049d3648 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -54,6 +54,13 @@ else
 BIND_CONF_OPTS += --disable-linux-caps
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+BIND_CONF_OPTS += --with-libidn2
+BIND_DEPENDENCIES += libidn2
+else
+BIND_CONF_OPTS += --without-libidn2
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 BIND_CONF_OPTS += --with-gssapi=$(STAGING_DIR)/usr/bin/krb5-config
 BIND_DEPENDENCIES += libkrb5
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
