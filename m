Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9485AC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46592605FF;
	Mon, 13 Jan 2025 18:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrP0ylNH5gUI; Mon, 13 Jan 2025 18:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50D446079D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50D446079D;
	Mon, 13 Jan 2025 18:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11AA9942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E60BF403F1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mohiN0NgTb9 for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:31:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADE71404D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADE71404D8
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADE71404D8
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:31:25 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-844e7409f8aso159332239f.1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736793084; x=1737397884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pAk+LAKoIJesCKUgCII9z4UEN998SPSvhJCBnWBGd5I=;
 b=AWImUbB6QUCOTaKm3z+ij3X+r0IAxUuzDzC+WGpj9kLBsuAwL8aeU6KVL2Xo9MUWsh
 Pib0UOvGJNj+Tb93kJiNwZ7VIlC2umRE+w0zQf0El3r6zy4pnZyENO5qpB50VN41ABjU
 WB9+STbYDC7cDkxWfBwBwtdkiCWvB42cSJnGo8SekHPeLDhUZt/IReblcRxwc8Q5q2U8
 0ThIxagi2EQ7PZ2XE7KqWfOYU3M0WlwpsX5XgQbcGqCiSnXCUOs5s4oTpvWYXgoRYsML
 yrAI/dbDd7DMH1fX/pCsiPJ3PKatq3O8pixSmTVO71JHAbPuEXuBff5+naTdms/FNn07
 sMEA==
X-Gm-Message-State: AOJu0YxO37IhE+QpOxdYa5iFGTDas9VSii5y5QgH/y3rxqJYavYh1Re1
 TfTSJa4Vjn/9gfzQdxjrY9QYQyZBjVVopT3W7ntbUDmMKijHhlDSBN8WjAxY4kg=
X-Gm-Gg: ASbGncsCE1RFKbe9RIvJBkkVh2XmYH8pXXNciIYbB91OU8TkYEtVt2eTkI4hbJCexar
 w3HQgFhmFHx5dT1d3agwfGsK7eCswwNwJmM+5q/fRAZ9XbCI4Uc7DZLC5JJ+ydJ44XnN94oOdKw
 KMohUivCTHCuWwgC/+Agp/RVBXax8np8xzjWYqjzJl7jiv5SsF1gv5PK2LqgM48n2KvDuDXN/U2
 7rZ0CF5Fb6dzsFOJ3BZ7D5/rhBiZbuJOzx+SYEfFJHAxlR+WHv0dg2T+yVhejk6wuU28AlEGtjd
 /YIoMoW9WVok6f2doKQxezK0GS9A0+Q=
X-Google-Smtp-Source: AGHT+IGfPupd5m667pxM+unRq3XF/vE1WqYtv2vHIHeF8ax6Ec0V+8cWBp7Po36fvS9R/TSpPtibIA==
X-Received: by 2002:a05:6602:4c07:b0:844:e21a:e805 with SMTP id
 ca18e2360f4ac-84ce014c328mr1940597539f.9.1736793084293; 
 Mon, 13 Jan 2025 10:31:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4faee632sm282023939f.10.2025.01.13.10.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 10:31:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:31:21 -0700
Message-Id: <20250113183121.3010413-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736793084; x=1737397884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pAk+LAKoIJesCKUgCII9z4UEN998SPSvhJCBnWBGd5I=;
 b=QJDpX7K35DtJn1Y20VI2QEEF/iUKnvs/EnRtXTq8tguzCH6tQ5/mzOpjWqEUJPZpCM
 D/hJRSQ5nq1OVeLIEQjLMCROehLrpUwD1kthD8o6DHCMQl/uiDfKUSqYOSet3hV1V2Dh
 opoIC6Cjb+7yrUrPznoHgI+7hUiFWxx68SCrtahX5rK8GXgj/ZRzbNbNngTNrzYEfloI
 OiH6YsirlQf1rE5obMeZ2IvY2bG8nxDfyeurgeapmnNQg1jFu7EaQCIKuV+k2neEiwaW
 aUhld6Co4szLSZM5SRYD2mBSY5Ag4flN712hPAi0jDCygpLjnXd1AKqPpKSD+aoM/SFU
 pi3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QJDpX7K3
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 25.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 7afa41a908..8237b1cfcc 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  2c94bb542cd351fe103d72dca07ca7a1  pyopenssl-24.3.0.tar.gz
-sha256  49f7a019577d834746bc55c5fce6ecbcec0f2b4ec5ce1cf43a9a173b8138bb36  pyopenssl-24.3.0.tar.gz
+md5  b5b79d0bab00c40160cf983ef7ac3771  pyopenssl-25.0.0.tar.gz
+sha256  cd2cef799efa3936bb08e8ccb9433a575722b9dd986023f1cabc4ae64e9dac16  pyopenssl-25.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 6416abb257..33884f8d6c 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 24.3.0
+PYTHON_PYOPENSSL_VERSION = 25.0.0
 PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/c1/d4/1067b82c4fc674d6f6e9e8d26b3dff978da46d351ca3bac171544693e085
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/9f/26/e25b4a374b4639e0c235527bbe31c0524f26eda701d79456a7e1877f4cc5
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
