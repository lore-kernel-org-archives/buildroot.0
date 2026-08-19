Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84270C5DF81
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 16:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F9B606A2;
	Wed, 19 Aug 2026 16:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqpzVacSNjZ8; Wed, 19 Aug 2026 16:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787156660;
	bh=rkurHv5nbiaVLXYyWrsPdRBCNP6JMlBD3EoJpPNZ3vM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KUdbsS9QEkhVvg2US+uwJjUHV+6i+vXU23tno/To8CWc8iDFwv1LRE5iCgTH63duU
	 9JcFCUU8Sc8vUXqRPO6bTcEoMGOVUmZrPukWtquIWFyExTpKjuhOaOvGVqlS1JMHup
	 7fbf92fAvDeaDJ+3zdVOIS++zww5kpkJwFK9yUnvhb2qfZuok6bGt9hrJbIXhkx9zR
	 2maO3p6bEGvtKOfR8DODB5rKgEbMZ6W0rXvIMhMDjbuc0P9e08NP3C8/gYqrROJYZ8
	 qrlNf1+i+QkhZo0HFVjrUIdROTO8P3KTxBhlmK7+8nTsLv7Rv1M/70pO1qBm2UvtYg
	 gZAMYh1z5h0Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7851D606F4;
	Wed, 19 Aug 2026 16:24:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A278D265
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 16:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88558606F4
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 16:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6lI7CieicNF for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 16:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B125606A2
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 16:24:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so339875e9.1
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787156655; x=1787761455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=goDqBA/f8AMyAxdFBUAMdbIh6Ln3qI4SzoLvt+JVQ28=;
 b=AFnsGPG33eclZWMcpNEHWYXXulGZVTpOvWI6tGwu6o5cur4KNWdx2TJWTWSnNeMUXc
 ure+AbmwMEc3yPPCSkACJOmz+vBHUCcs2r6pVF7Y7TZUi5nN5+dXsKFf173YZDCHoJT6
 HrFH50bscAP/LnqTBPlZU2tLQxd5G+fU2mrj/XXQGRZf+MKykpj59zrVZG4IVr7pyVsr
 f4rnWvsuCgdIaouLeGjNufeMgDDo5TxYFllk+6opyKiJ5Fu/vKvXsVbbM+Shpx+uimS7
 G8lXY2eD6Re54DoYF4nmjlgAjR2+1TZX26DCGCNDPXTZOmAr3uSRb50yF1UHAXYDsBVX
 3xMA==
X-Gm-Message-State: AOJu0YyCGcwLNVS2PPjSE7O81jY9FGEisp+3A9LFo4Pv8RkHSPWIWzc1
 sN2rkcapip2mX85WqnRNrekeiiW2gX4ikMYPjozbVDgFhkPy6t1nEee+LtvWBv1ToBLDmSg93Oc
 E4dIDT+Y=
X-Gm-Gg: AR+sD13QKJntag2UC7DCrTPP0BuXG08bMYDjWpfNEjw6UACpATjlCOmmDAZwcRPbPoH
 iklnT9U/KCmfQiTZCpEborXx6YSpdBYjl4XqYPk7c2Yp7CZeGq9xdMZflp2t+Ffo2bJJT/swSAe
 P3AyKx/pc0f9L75oZVcqGTdw97ZCnsUOkjLo/gTbrp4KAcAFjSva5dFVRVX3tddXCL/KpeDuFzr
 ODEfI96Iwi2X/+4YIBdGvfoLtqZyrlcii1GCf02bdtLsOK5t4gR9jQQaqRsdIzvJ+UvzzGEjCA5
 OIDIlAwU/B57Md2jUhYGINU0grY18vfer0KnocBzrl4GHiiQeZXJCdx6SYscPsvTvMmq1w9WhtV
 UKql+JP3NQHPrNUSgiuowzxGao1tquAGvRpvG0DrCnq5FpaN1Zp9Q0KJmCgkj2D1Wus0VQDCUd+
 rTaaeX6hXKUoc6fZA8zqTV931d1tPXzhzGozuOx3uQleO4LvugXGdX7hB1d39i39Kp2Ma8MqFON
 7K0qqoxLtF0w6aKMe3gO+Bnl3iyjOT/7LUffo+s9fumxOWnG2q4Ib2po9GP0A==
X-Received: by 2002:a05:600c:3487:b0:495:5d6d:9cc1 with SMTP id
 5b1f17b1804b1-499b0633f1bmr7488035e9.0.1787156655293; 
 Wed, 19 Aug 2026 09:24:15 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aaef1665sm69388825e9.5.2026.08.19.09.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 09:24:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 19 Aug 2026 18:24:06 +0200
Message-ID: <20260819162406.1945796-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819162406.1945796-1-romain.naour@smile.fr>
References: <20260819162406.1945796-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: remove TestGdbArc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Arc specific gdb version was removed by commit [1]
but we still have the TestGdbArc that was testing this
version of gdb.

We can now safely remove TestGdbArc.

[1] 0b3d526226662af8b16525aecec7da5ff0e5fa1d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_gdb.py | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
index 324052efdb..78395b1847 100644
--- a/support/testing/tests/package/test_gdb.py
+++ b/support/testing/tests/package/test_gdb.py
@@ -89,19 +89,3 @@ class TestGdbFullTarget(BaseGdb):
     def test_run(self):
         self.boot()
         self.verify_gdb()
-
-
-class TestGdbArc(BaseGdb):
-    config = \
-        """
-        BR2_arcle=y
-        BR2_archs38=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_PACKAGE_HOST_GDB=y
-        BR2_PACKAGE_GDB=y
-        BR2_PACKAGE_GDB_SERVER=y
-        BR2_PACKAGE_GDB_DEBUGGER=y
-        """
-
-    def test_run(self):
-        self.verify_host_gdb("arc-linux")
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
