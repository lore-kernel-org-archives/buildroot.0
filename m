Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DF5ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FAE581270;
	Fri, 26 Aug 2022 12:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FAE581270
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIdUA0frkQMt; Fri, 26 Aug 2022 12:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A2C81297;
	Fri, 26 Aug 2022 12:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A2C81297
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0D541BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87B6E4020C
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87B6E4020C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RkPnSSWJuVj2 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9754A419DF
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9754A419DF
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:07 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w10so2003955edc.3
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AMWy4BCiIiK9WtLbb447EAIhXfr6AeAYxS2ixZx06VU=;
 b=lMopzxpZcsrYUHl4irzO0koBYuDyD5E9YyR7vKT3iiFVxnYzoF8NPWor50EiLRw11O
 a7ZhWV//P4+2tdCtpETfxvPDNHOmHZnyZAE1VcoZvoP0tVv08cXwrVj95qQUi3vVkVRf
 xHDCQT+Mco8nwbOjnksa1nnX6zTM5TGKRRh4kf9kRuzGq6GTC1xc8YOEvvfdA98AIb53
 2zEVlhqq4ip8QvdxOpTf4F61166E0vzPR9ULRr++NblTFwq8zRTXzvMCVXgGpgEqbB4/
 16P+nabfoFc03uzaZv0jJN4D2g0YHu3j1sF6u0fJg28qzRbQnlws91IXBYyENNBVLhpn
 dEkA==
X-Gm-Message-State: ACgBeo11q079MZqUsVKYYsCTx0n7XdbsjeI0pJZfUsIeDZ38PuulelW5
 YILm8mLJDcDrAgKq7H9aUxvJhu2uqX+V1ks2
X-Google-Smtp-Source: AA6agR4JcC1kcDvBq/vHNqS57g0jlkF5OcuFHmTSqSX8BfasZNE2vcfBAQFvNije4orNULSYj03M8A==
X-Received: by 2002:a05:6402:84e:b0:440:4bac:be5a with SMTP id
 b14-20020a056402084e00b004404bacbe5amr6794095edz.103.1661518385348; 
 Fri, 26 Aug 2022 05:53:05 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:04 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:32 +0200
Message-Id: <20220826125252.16782-10-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AMWy4BCiIiK9WtLbb447EAIhXfr6AeAYxS2ixZx06VU=;
 b=M20OF6YU/VUMe0WIYHr0eBsbpWvPZcTpcOBT2WsG9pnKLi82b1kXAhQbmVwcmnBtGM
 quyH/uHyRJD4/9W6Sz1VqIBv2ZdapvYoP011YPd7RrXa7UmrTjRUmO+3/6lrrp2vtKno
 0TMRY4ru4f0gAuc3cFcSMWQ4Q5s6v9ttfcax4J1SL4hgA6A00ScuEjKYykKHyKybx1aK
 JFeLzWeGWO7MfuNa4yJbGDLqC7wOu1YL4Y+hFdKWifAC5NPJsjEehOfBLZETeArvDmPo
 BcjRQuzjyU8mJ0dSrGMpnC3Cw3HEjF6qo+uzq8caFdkTmoqpF5RP3H5syRA/45tj/tRO
 C8gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M20OF6YU
Subject: [Buildroot] [PATCH v3 09/29] package/qt6/qt6base: add qt support
 for journald when using systemd
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a399f53e6c..31912f9462 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -112,6 +112,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_journald=ON
+QT6BASE_DEPENDENCIES += systemd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
