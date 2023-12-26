Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454DDC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 11:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E9981403;
	Tue, 26 Dec 2023 11:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E9981403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4G7BCyz9W5W0; Tue, 26 Dec 2023 11:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0923E813F5;
	Tue, 26 Dec 2023 11:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0923E813F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3DC1BF309
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52533813F5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52533813F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CgJcU1Cn3uaE for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 11:17:29 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61585813F4
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 11:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61585813F4
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d4103aed7so52724175e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 03:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703589446; x=1704194246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e6jygU0Xv8fZ9Xuai6wMzXMaayHhmHVDqqUb1H/ld+E=;
 b=i87JIG8ym73e+f2PIjF4S2FbbzMd9IFFVUgcZIPsNZBozIo5ppqgrMfLJpP+6Cv2DF
 i/8byyucYYyR35DSJ7Of+bzxAqFAujO2Huzt/FyNqu5hO0LrX/EVOxSFlgRG8wMSFeRc
 eRKa47FCF0kgwanMRlEvYennvch6d14+n6pt+6fi+EAaElmMpBt5OPm5jVum8kpM1aMd
 Sy5ymoOd8FFmGFIYbEVH7U9XFfaVz0KmUPWdD9Gfo+R8Ddl4S+YitsANGkQK1LuVXd/8
 OFEZ0sf36Zpj3Jx1qujUiYbMxDip0hWJ81nXbpw5vxVqG7j2V0wvU8GoS+RxzEOkJoTP
 UKfw==
X-Gm-Message-State: AOJu0YzY6diVuHg/8+h/v4TwHd0OPC/mXSr855CHsLTRxvKeBbiYr0kk
 8ghRqTmhBAqlBMncpNw4JNs8VhF/R1I=
X-Google-Smtp-Source: AGHT+IHZFgspYBFgXxpISxLCYhvcoyndaearIFK3FZMAfJEtMqbcpRZpwy75KnsQQxUt0UFtopa0Hg==
X-Received: by 2002:a05:600c:4503:b0:40c:2e1c:8f87 with SMTP id
 t3-20020a05600c450300b0040c2e1c8f87mr4089875wmo.164.1703589445763; 
 Tue, 26 Dec 2023 03:17:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b0040c41846923sm27711108wmb.26.2023.12.26.03.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 03:17:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 12:17:22 +0100
Message-ID: <20231226111722.6830-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703589446; x=1704194246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e6jygU0Xv8fZ9Xuai6wMzXMaayHhmHVDqqUb1H/ld+E=;
 b=hDuhfg7diSw9lG15RyPZoQAPjmDuh25KMJPW2b40vYCqo9XncmoOmMMBYkLg/FLQNi
 w38MHQZJ9EFqkO6R70Lsg+esr3dv8tmZPmdLXUOCQRpauHFoALI7fg1x47dfFh/HyPzb
 syw8jhmUOf3pnV+zKmBXx7EnQT330cfxsuKS1oteDuthWVpxOLcb5yc+AWSCmEL6B16L
 u19SRljl4eBVrgGMNl2l2RfTVkXvaCqc31LTu9O4eRA0ohk31FLgWExtsdd8lBeAN7i7
 oGdptmn5Dz7xjz47PeBMJqBL09O9SEoDuU+j8kuazuR20T3eXDIiBlxZcBSPGd9i9n4F
 zv9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hDuhfg7d
Subject: [Buildroot] [PATCH 1/1] package/python-asyncssh: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:asyncssh_project:asyncssh is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/55866328-B495-4FDC-B9EF-C014E6885187

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-asyncssh/python-asyncssh.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 91e0d9d419..51e2e1973c 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -10,5 +10,7 @@ PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/5f/86/59278fefc49
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
+PYTHON_ASYNCSSH_CPE_ID_VENDOR = asyncssh_project
+PYTHON_ASYNCSSH_CPE_ID_PRODUCT = asyncssh
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
