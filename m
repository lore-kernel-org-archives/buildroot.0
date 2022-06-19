Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84131C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B5DF60B15;
	Sun, 19 Jun 2022 16:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5DF60B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIeErWka_lni; Sun, 19 Jun 2022 16:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB7060E5C;
	Sun, 19 Jun 2022 16:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB7060E5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 402AC1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A8CE60E5C
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8CE60E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3tFPNq1RNQY for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:37:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9DD660E56
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9DD660E56
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:37:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o16so11647438wra.4
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PyN2XPU2DF+hbPUfXf/BT35qReJsWT3HJm6nCp00Bz0=;
 b=tKty826TsjwHNn8DRM9yCcS/SM8keHINCphGK52j4U45bIXBLE///oUWZVOBXxZLaD
 NP5GDMU82Lq9QrLqCsIhKyUJSxZQv8ejr0g8PVQ6/kGGcwq5Qzoql0iIsB2HJupKLj4F
 0qzjnwQvvMxh73gQCEGuCuMofclZVwzouV/akmMJQtc+m7HQyR4PCc9jormpBxbM1i4G
 0+qKW6PTmsL7G/Ei7k5UNBy7yTaLGerjEPunGydzftmlM65iBIVi8y9LdLCJCig+OLRc
 i/E77IElWkDA0058e2zZmY77QeQd5GaVdANvdxx49PCtdh5xMrfGC2kG9yufiJ+2Rubf
 55EA==
X-Gm-Message-State: AJIora8NFR2DFxWVLlSmt61iG9eTnsXJJUdI5xUpuEvmY947mlIeAaj3
 87qJI2K7zToTgsXWT9Yi3McU3aFb9tE=
X-Google-Smtp-Source: AGRyM1tk6iPm/5qqMrqyu5R0bn76RFgScWasACWuO+HP374oEL9R5XlMd8Uls6tzidA8I8Nus0okGQ==
X-Received: by 2002:adf:df09:0:b0:21b:8a8d:99c8 with SMTP id
 y9-20020adfdf09000000b0021b8a8d99c8mr3956561wrl.152.1655656673727; 
 Sun, 19 Jun 2022 09:37:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adff6cc000000b0021126891b05sm10453348wrp.61.2022.06.19.09.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:37:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:35:08 +0200
Message-Id: <20220619163508.636307-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PyN2XPU2DF+hbPUfXf/BT35qReJsWT3HJm6nCp00Bz0=;
 b=ksegZhtd/r+Urx1wF6Qz4g/xTyI7jkq+NsvY5rjxFg5udjc0ytkutHiUoMV3xa0CMG
 iAaUCiI5fJNFDTJZPstsvmNTV5J1hELldxVAEFuJk6CT7l4KZUmM4oFoe5olk6MaoF6b
 jbw0fkq/zr0MLeVQZbOV6mN5uj8PgmTK2N6hlQeAEZIqvOYPTe63Y2y7yWbrFPhIl+VK
 vmJDbD4FY5RECX1MYeoqfOgqQiySfb07BbvlfWuBqpxZ4n4Zg6T0Cfk+Gkgakisyz3Jg
 IOkE6B9RtW1bCf43Qi00uK65DwD3IGTfUca+oCoEfG4MCbBaaWZZ6eatZuZ+eYytSmLl
 BH3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ksegZhtd
Subject: [Buildroot] [PATCH 1/1] package/nginx: replace NGINX_CPE_ID_VENDOR
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nginx has been replaced by f5 since February 2022:

<cpe-item name="cpe:/a:nginx:nginx:1.18.0" deprecated="true" deprecation_date="2022-02-22T19:26:32.967Z">
      <reference href="https://nginx.org/en/CHANGES-1.18">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:nginx:nginx:1.18.0:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:f5:nginx:1.18.0:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Af5%3Anginx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/nginx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index cff741ee35..ba01c7e016 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -8,7 +8,7 @@ NGINX_VERSION = 1.20.1
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-NGINX_CPE_ID_VENDOR = nginx
+NGINX_CPE_ID_VENDOR = f5
 NGINX_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
