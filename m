Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90117C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34A4281400;
	Wed,  2 Nov 2022 22:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A4281400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdDuo4D99C91; Wed,  2 Nov 2022 22:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 543E981098;
	Wed,  2 Nov 2022 22:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 543E981098
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 183341BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E17C04014B
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E17C04014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWApQfUJyDdB for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:05:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79E3F400D0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79E3F400D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:05:27 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id n191so16200639iod.13
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 15:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EML38o0E/LGluKqyphDR2WuvMw2w2Zcg/pkcBGuvQfY=;
 b=5VTzqM+dvONcEWv7ldyIE0b8Lgb2cmOpV+KMqenunOZ5BvclMjo4atkUED9VOxSoO+
 /516/38QIwVOHUHXplbo1JyZKyyum3thaX3jy8Gc4i+21kHUuD7tjejlyEBvLa4XwpWx
 qbcW32fUFL+a390ZKX93gf3ndt9I3PbGNaWB34ESkmoXRaK5Hloa9rYLb+8lX5EIBddp
 xnji0t3o86VWYujZiYVZF0abCffk9Ku6iw+Yk+3npecO9/3m+SVoIWLiqYZB3EmzIldE
 Us+8tsauEG4Xf+7nA0wkv9qhaJCYaMVaQAHCAQvMseeVFqIDKBa7yY2SdxC/2ivRMWPD
 lMjg==
X-Gm-Message-State: ACrzQf1/MsUyCdSKG/5rQzGozyIewwtcLAfCCjLuxg3jJuxLCNMRwVvu
 OQgWTGn5ef+p2KbnZCmJwYgUa8WFjDg0XA==
X-Google-Smtp-Source: AMsMyM4Npg0JFjcq/cKO3/y0dqsnJJATsEtTL7pUbEC+aACrRTTdcG4e92ISYoBm2i2QDb75vL30LQ==
X-Received: by 2002:a05:6638:3467:b0:375:4f6d:5c9 with SMTP id
 q39-20020a056638346700b003754f6d05c9mr12839637jav.159.1667426725992; 
 Wed, 02 Nov 2022 15:05:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y98-20020a02956b000000b003639ef62d08sm5263051jah.84.2022.11.02.15.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 15:05:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 16:05:23 -0600
Message-Id: <20221102220523.1739712-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EML38o0E/LGluKqyphDR2WuvMw2w2Zcg/pkcBGuvQfY=;
 b=pDZxelr0Vno6wZRwv6H8q8Mhp7QLzyN6giaSQYOVj1HiR8BmMZL6XyTHlBITcJVh6C
 G9bvYXWgWh1B3eQfClqY01+sk+clxrcrQKpo6cV2QaMp+Uip/3ES43a7kSn/dlTXXLkO
 raEDYvNWfUzwr/oJ7NmjSMccMKfVAnYEujYL5IXrf8EXV3ucxzau9HtW8wYDFKVPuCBZ
 haRbyWgwL8NhF+eZPl1fZ4y9BmVToOmPQJO+65lgTPFH0QqVpGsrwBZYYn3Yq5YamdYz
 PRz/rqpZB7872suX+AcrT7Pkmo/ewmI1Gy+avQpQUGzZJEGneGFWXlejAp/Ws8yfCdOn
 yvRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pDZxelr0
Subject: [Buildroot] [PATCH 1/1] package/python-ifaddr: bump to version 0.2.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ifaddr/python-ifaddr.hash | 4 ++--
 package/python-ifaddr/python-ifaddr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ifaddr/python-ifaddr.hash b/package/python-ifaddr/python-ifaddr.hash
index 57b155caa5..e3c2b13b69 100644
--- a/package/python-ifaddr/python-ifaddr.hash
+++ b/package/python-ifaddr/python-ifaddr.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ifaddr/json
-md5  97c4eb7505643b5f1fe17733cb42abd9  ifaddr-0.1.7.tar.gz
-sha256  1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94  ifaddr-0.1.7.tar.gz
+md5  b1cac02b5dc354d68dd6d853bc9565a7  ifaddr-0.2.0.tar.gz
+sha256  cc0cbfcaabf765d44595825fb96a99bb12c79716b73b44330ea38ee2b0c4aed4  ifaddr-0.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8700856576ae2bc80c63bc970250510d9213fb02fed006d5f22742c9ddde24d7  LICENSE.txt
diff --git a/package/python-ifaddr/python-ifaddr.mk b/package/python-ifaddr/python-ifaddr.mk
index f1154d9de8..9b7d50d825 100644
--- a/package/python-ifaddr/python-ifaddr.mk
+++ b/package/python-ifaddr/python-ifaddr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IFADDR_VERSION = 0.1.7
+PYTHON_IFADDR_VERSION = 0.2.0
 PYTHON_IFADDR_SOURCE = ifaddr-$(PYTHON_IFADDR_VERSION).tar.gz
-PYTHON_IFADDR_SITE = https://files.pythonhosted.org/packages/3d/fc/4ce147e3997cd0ea470ad27112087545cf83bf85015ddb3054673cb471bb
+PYTHON_IFADDR_SITE = https://files.pythonhosted.org/packages/e8/ac/fb4c578f4a3256561548cd825646680edcadb9440f3f68add95ade1eb791
 PYTHON_IFADDR_SETUP_TYPE = setuptools
 PYTHON_IFADDR_LICENSE = MIT
 PYTHON_IFADDR_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
