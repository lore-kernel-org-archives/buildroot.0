Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF75FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 00:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3169640490;
	Thu,  9 Nov 2023 00:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3169640490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GoLaGOTCsFFG; Thu,  9 Nov 2023 00:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D53D40491;
	Thu,  9 Nov 2023 00:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D53D40491
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B215A1BF966
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8520881FEB
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8520881FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UX4xheWi-2jQ for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 00:09:14 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B576981EDB
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 00:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B576981EDB
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-359045af665so1287805ab.2
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 16:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699488553; x=1700093353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DOQQqKuipH2W1ZOWkVDFxj/HMvlIHJ8JAdvLUen4blU=;
 b=p+GZ+sp2tDr1nxo+ft8Uno4UBRblH+DeepQCcIDP3tEigEtTNnx9/2nDGN+G98fe0c
 5yBuEGjJWdOqao8+Pqu7yFKjTovsLbqBwmSEQruVFdn1KoyzvlerKMrWQAd2v7fGJXx+
 1GQRLAewoD8eNAOIGg8jeidM4MlMWwcOa/srNsBmN/vBOoIOj3faB8BTby/+q8Ad3DQj
 XQwTneN7UfrGXR9Q9n2wBF6Tki+ZkkzfJF+BfaCIELIDA5Qn+p0mNaaRV+ZQibERqlXp
 cZntqPPfD0ZP7NFAybxKVq0bel+8IiAy7pIyYJUBuDqYqioceLQaZclVIwWiV9uVPXMT
 gGMg==
X-Gm-Message-State: AOJu0Yyr36M2/aXkCEzNriqROj3LiPxOn7pOSwCktjCi3JWwM2ZnQ9O5
 WaZ6Ra57RFaY/Y32SJR0DFoOM5Qkq2E=
X-Google-Smtp-Source: AGHT+IHlMD8wBJpwUrST0Z8XaZTZ9DLuxtoK/8A1nohuWzwtXclgG2JzLVcowa4NqdeVrjXY4E3c3w==
X-Received: by 2002:a05:6e02:1a21:b0:359:4223:5731 with SMTP id
 g1-20020a056e021a2100b0035942235731mr3536350ile.30.1699488553410; 
 Wed, 08 Nov 2023 16:09:13 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 m8-20020a02c888000000b0044cda7ec75fsm3651660jao.62.2023.11.08.16.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 16:09:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 17:09:11 -0700
Message-Id: <20231109000911.3667161-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699488553; x=1700093353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DOQQqKuipH2W1ZOWkVDFxj/HMvlIHJ8JAdvLUen4blU=;
 b=UcSKJsYVkDDv93lHPpMpHKq+pbXHL8qBrIJI6YxykSkiFpkIsXA51fkwtQXpmsVV0x
 OjEFyAvrH1kWQvt0r7kLgYD5SfRgX+nRzcTTb8jrYcXGYAJ6mMXu7yQdrmqH2lEgjYSN
 inJuuIqv/P2g9LbG8YVgRkAZYSxe4Hmha9rttmWz3dzxZ80RxmwVbNZIEUFeGiVFyDZO
 EDHa0q2AnqstUdM2zWfHvhmejBRuElwe6zQrwqSRXnLcdfp7UyI6QG/nIgJYu/Y/t+gv
 ODT7VBf5piSf7hOZwq2vPFJGvRNTpq8PxHY2fw5RrFmVQ+rqDrswHvBXeQ5Ilb+Aknl+
 MhVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UcSKJsYV
Subject: [Buildroot] [PATCH 1/1] package/python-netaddr: bump to version
 0.9.0
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
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-netaddr/python-netaddr.hash | 8 ++++----
 package/python-netaddr/python-netaddr.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index d55390aad3..04dc9797f6 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/netaddr/json
-md5  34cad578473b66ad77bc3b2a7613ed4a  netaddr-0.8.0.tar.gz
-# Locally computed
-sha256  d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243  netaddr-0.8.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/netaddr/json
+md5  0c89e96501370d2538ecadca372e55a9  netaddr-0.9.0.tar.gz
+sha256  7b46fa9b1a2d71fd5de9e4a3784ef339700a53a08c8040f08baf5f1194da0128  netaddr-0.9.0.tar.gz
+# Locally computed sha256 checksums
 sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index e3ffe4e85b..1f78f04210 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETADDR_VERSION = 0.8.0
+PYTHON_NETADDR_VERSION = 0.9.0
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = https://pypi.python.org/packages/c3/3b/fe5bda7a3e927d9008c897cf1a0858a9ba9924a6b4750ec1824c9e617587
+PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/48/4c/2491bfdb868c3f40d985037fa64a3903c125f45d7d3025640e05715db7a3
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
 PYTHON_NETADDR_LICENSE_FILES = LICENSE
 PYTHON_NETADDR_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
