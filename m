Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B38C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E86A7421F6;
	Fri, 17 Dec 2021 21:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTQ7p4kJTXju; Fri, 17 Dec 2021 21:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6853D421F5;
	Fri, 17 Dec 2021 21:21:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9F171BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98FF461179
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8RheTy8h9sC for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:21:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 876D660B6E
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:21:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so3225396wmb.1
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pGy8are4nysjPmhHANfj/Kw4HbBu3Em71k4rJR0UMyM=;
 b=CmNN6B54A4mhfhMssFCyzU5z3BQyHACoS61lNHZxbGfsVFb3m3HhUv9B1W/I7jvrTt
 UEqwYmKbL6fqA8uULnjQVDiOAx+r5IN7JzM+wOPlWCZdMZJKwMQE3eNI4HHpj5LkVQ8u
 9n58zDkN9lQ2kRGDNyYp7UqMuiHKklZ6X81rTz6sWfrYZnj+GbUDSvOrmETs8Y/7R6DO
 EKI7mhH4GVF1kL5gVI+OoGk13XO64fWlb+oVNzl0pmHmKEaAt2z28zSTcetThF+amN3P
 uCO46sDuWhT3BIbhzpPVOfk7/lZAY2RXzdNDn1krFR2761X0hJ67dzYyUiB08MnBZUJi
 5Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pGy8are4nysjPmhHANfj/Kw4HbBu3Em71k4rJR0UMyM=;
 b=DAwgCUn9ChOZfjC3d4mEdEqlxveLSfHGwsK7tp8rei6IxTk1tcswN4TjKs6vjZqOCg
 T32gcp6qzTwPx0SF3DcU40FwM5u8qXmjCOIyAiKfzESmpERORA/I0vuyj3tOW0FuSfz+
 1OIZeEgQk8h6Aq+CoVwDui2deUbYHlFGzn1U2FRE/gcaXQbwjAJtq2KslbFnSyW6RFfm
 aXgAk/0o0Cpb3xKGSWWTnDj5TUzDv4O7+vtv0g3rXzlqcudP1i/vt82iOs/w0H3TOYA4
 n5T1wZ3d0//8TOlRxfbDh+yBRpmo0TRppO/mXqy7/bvUuofPkG/RihBbDT5YLznALwhW
 nOaw==
X-Gm-Message-State: AOAM5332xQ2VOhanQNabfXI/o/KpofNOqsxAbyQQtw6mJwezJU4XfdEV
 tLDR0GuPb/tQkXlul33uVRbwunii3FWyUw==
X-Google-Smtp-Source: ABdhPJwmkunRSlUhjsMbCoukNs7VtAaMqoXOqM5UBvuL63iyYTftWhSBPOqn8l9WBI1MXs6hFcpNEg==
X-Received: by 2002:a05:600c:3846:: with SMTP id
 s6mr11144181wmr.37.1639776090620; 
 Fri, 17 Dec 2021 13:21:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id s8sm9653972wra.9.2021.12.17.13.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 13:21:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:20:15 +0100
Message-Id: <20211217212016.99438-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/modsecurity2: add CPE variables
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:trustwave:modsecurity is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrustwave%3Amodsecurity

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/modsecurity2/modsecurity2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index 52ae6f4c31..5d91818ade 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -8,6 +8,8 @@ MODSECURITY2_VERSION = 2.9.4
 MODSECURITY2_SITE = $(call github,SpiderLabs,ModSecurity,v$(MODSECURITY2_VERSION))
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
+MODSECURITY2_CPE_ID_VENDOR = trustwave
+MODSECURITY2_CPE_ID_PRODUCT = modsecurity
 MODSECURITY2_INSTALL_STAGING = YES
 MODSECURITY2_DEPENDENCIES = apache libxml2 pcre
 MODSECURITY2_AUTORECONF = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
