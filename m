Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0940EE4992
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 10:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 828FA606B1;
	Wed, 11 Sep 2024 10:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PesihFgtegRx; Wed, 11 Sep 2024 10:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BA6260A61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BA6260A61;
	Wed, 11 Sep 2024 10:54:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7504B1BF391
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 10:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 630F040B6B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 10:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGCuyF67xDkv for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 10:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E973940063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E973940063
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E973940063
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 10:54:46 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a8713b00219so48618566b.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 03:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726052084; x=1726656884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xqezzdOVjUivS9lPBCCzv9z4ccqF/Ii/HWyA4FvPOzU=;
 b=fDbMj0VnWmiMfVF/bwDPVVZhp5cW/9eZxunZVwcqeE0Hg70K+Uhjh1gzr3QJ1WPeki
 85z0k17fmIHXge9NHSAgF12z98rTAiJrBK3+mrqV45Q+ava1UwjcJiaaBnSISVKSqTLn
 wK3q7uiCNN4zeWcj93aAlEHJQZB5GYHd/sNmkJZUQhQILguSuu6H/Ih+lG7lZGSvh1G7
 6ZUdJ0AOJ/GA+NWYcJQqnSF1LlpUQ+CB85rVoRP+06/q7Z1/kwLFa80H/5ZZ06BUMr+x
 U1C8pT1YBBqGRxBeRo5ncb9rTt7/gz4F2ihXfl2GTDmg+DCENMzJNGUb6cH5jZ6EKudK
 3yug==
X-Gm-Message-State: AOJu0YzEu6IN40A6GcC/c6Q/tA5Q8i0kGk6yPWw+qS3QsIKGYKKIBhQP
 kxZtSluZdlpqoky3mHBIliVs1XVo/nWBQ11UpahgyeeA+2RlwHLFj6ZWiBGcrpFKwKOZ9dCYX2N
 RyfR12g==
X-Google-Smtp-Source: AGHT+IGzuOPzrjSm+aEkN7UdcA/2tIBL0RArXZRDLoGZO0X+Aq+wZsVTESOnqR3liGHNuyp7sveY2w==
X-Received: by 2002:a17:907:96a5:b0:a86:a4cf:a197 with SMTP id
 a640c23a62f3a-a8ffab000cdmr187450266b.5.1726052083387; 
 Wed, 11 Sep 2024 03:54:43 -0700 (PDT)
Received: from localhost.localdomain
 (2001-1c08-0183-0c00-a698-b453-0ef6-b5d5.cable.dynamic.v6.ziggo.nl.
 [2001:1c08:183:c00:a698:b453:ef6:b5d5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce86e0sm604283766b.143.2024.09.11.03.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 03:54:43 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 12:54:36 +0200
Message-ID: <20240911105436.854798-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726052084; x=1726656884;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xqezzdOVjUivS9lPBCCzv9z4ccqF/Ii/HWyA4FvPOzU=;
 b=QBJ90j2CnNdmRLbozTS1949u9dbSNnfv2ZFBSVupp6r6yL+5R8MwqdR5IikZWcMHqz
 kxJ1O3StdFl5JB7QAIwYbPLm2Yj6odjopmIAfbgC+/ZP5FZ6ZYYGRHtIBfv2ZZiqXbET
 nEdodTq9oecfb6VjK2cTdOA3gbN8lXxX1UZEc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QBJ90j2C
Subject: [Buildroot] [PATCH 1/1] package/boost: revert commit
 4349746dac6f55b0b0faca21a7e609fb67d1471b
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4349746dac6f55b0b0faca21a7e609fb67d1471b states:
```
commit 4349746dac6f55b0b0faca21a7e609fb67d1471b
Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date:   Thu Apr 18 11:13:50 2019 +0200

package/boost: don't install boost cmake files

Since version 1.70.0, boost installs its own cmake files which are
utterly broken so don't install them otherwise all cmake packages using
boost (host-thrift, domoticz, i2pd ...) will fail because
BOOST_INCLUDE_DIRS will be empty

Fixes:
 - http://autobuild.buildroot.org/results/4ada26bab5c1e6504c7d8c92672326ced1d336df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
```

However, this has sense been fixed in the five years this change has been in
Buildroot. Furthermore, having --no-cmake-config breaks packages expecting to
dynamically link to boost::log with a multitude of
`undefined reference to boost::log` errors.
See: https://github.com/mendersoftware/mender/pull/1663 for one such example.

As the --no-cmake-config is no longer needed because the original problem has
long since been fixed upstream, it is safe to revert the change.

Tested with the following packages as a smoke test:

  - host-thrift
  - domoticz
  - i2pd
  - libcpprestsdk
  - log4cxx

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/boost/boost.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index bb73edfda6..61284b967a 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -103,7 +103,7 @@ BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MA
 BOOST_DEPENDENCIES += python3
 endif
 
-HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
+HOST_BOOST_OPTS += toolset=gcc threading=multi \
 	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
 	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \
 	--user-config=$(@D)/user-config.jam
@@ -116,8 +116,7 @@ else
 BOOST_ABI = sysv
 endif
 
-BOOST_OPTS += --no-cmake-config \
-	toolset=gcc \
+BOOST_OPTS += toolset=gcc \
 	threading=multi \
 	abi=$(BOOST_ABI) \
 	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
