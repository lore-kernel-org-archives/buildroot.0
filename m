Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CDDCDE012
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 15:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7046E423E8;
	Thu, 26 Sep 2024 15:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wa6cO5nDzcU9; Thu, 26 Sep 2024 15:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86AB6412F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86AB6412F1;
	Thu, 26 Sep 2024 15:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 133911BF30D
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 100CD845DD
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMoMfX9yAyhF for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 15:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C3BA845B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C3BA845B3
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C3BA845B3
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 15:23:06 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a341ab4573so2816665ab.1
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 08:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727364186; x=1727968986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HUdBaA4JWEw1YMHWVA6zGWccMotiYLZJfZ7qIdTdOSY=;
 b=wdnZp5EqEkU8x+mkoJuar8hHuLhg5/svOBVOX7bAMxuayh9w4s0yP48EHVB+9woIed
 ggAoaG7CIP7RW4w9P8mI79xUy53t9K/1My634P3YLgowkJWX7s7ZVclBpxxkEHginbKS
 MFovYnJBIg9rt58XYpiQLHICGL8nojs3skA/pdr1BDoHgWrQwf/7TEddG7PeL8Hw0pFD
 jSn5mwrd7GdkXthG0G+sNRLtDFWmGrMuuAbnXnoQjVCGWofPfYsqfZTuCZAqsSjXoG4K
 aMKjvRZGoa5yUm7q5UNuTJCyfU2z2T/N6g92EWL5NhutB5SbXYoxBkGTBN8KRfATuY/1
 RcnA==
X-Gm-Message-State: AOJu0YzXPwesHOV7hnQnjoEAI4HYNzaA/FVUow7Glv4OB7SAAhqruKg2
 WAceIgi87VFd7Xyr2rgudfQW6uZwYWd+9OUHzQ58+NyG5pdAXaarmqDdYA==
X-Google-Smtp-Source: AGHT+IGmDh4fdqmih7IHbnlW068YbMTh/LuapNHGKpzDZrUUfjE1QcmKqd3nEay3n5qJwaOqfNSNig==
X-Received: by 2002:a92:c542:0:b0:3a3:3a77:9192 with SMTP id
 e9e14a558f8ab-3a33a7793f5mr20188925ab.26.1727364185822; 
 Thu, 26 Sep 2024 08:23:05 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a1a56cf5c2sm18325815ab.32.2024.09.26.08.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 08:23:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 09:23:02 -0600
Message-Id: <20240926152302.12950-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727364186; x=1727968986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HUdBaA4JWEw1YMHWVA6zGWccMotiYLZJfZ7qIdTdOSY=;
 b=KSf9/4jhvTWbjMEFPi+vv4vnwkowqoGLKEdEbo4LZlj8zcCLRFM1MnGn/VNq8CXp1Y
 QUW4mXqQPeccPlf9dX/pdkstopkFdsHmqhSxQzx4dRPp0Yy1DgthbKziiT/mZJ/71c0p
 PqSux4H2VYvoSg/j45KsL39YVDYjgFIMUPUULjN2ueFx+KRrxeoNZsGWTbrFRJ2C5GM0
 XsDNdBP11juJ5Ihk3vB+tSQzys0wYbE+6upVntWN4qaSc9vyfh6VXjj8GWcBxlS5bBd5
 zRgu+6tA7qMHyPDY8AEFWTTot+n/K+xJcY+Z0IyKlQfoUK+Dc3MJ9dFnQFiwxD7L6Euo
 Ygug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KSf9/4jh
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.10.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 76b79e4586..4b75d2b3fb 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  29173b702ff6043fa62da8de0795ddea  aiohttp-3.10.5.tar.gz
-sha256  f071854b47d39591ce9a17981c46790acb30518e2f83dfca8db2dfa091178691  aiohttp-3.10.5.tar.gz
+md5  6a5b9b8da3ac1f64871e43fe4a0d0358  aiohttp-3.10.6.tar.gz
+sha256  d2578ef941be0c2ba58f6f421a703527d08427237ed45ecb091fed6f83305336  aiohttp-3.10.6.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index be721c1ed5..42ea57d23c 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.10.5
+PYTHON_AIOHTTP_VERSION = 3.10.6
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/ca/28/ca549838018140b92a19001a8628578b0f2a3b38c16826212cc6f706e6d4
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/2b/97/15c51bbfcc184bcb4d473b7b02e7b54b6978e0083556a9cd491875cf11f7
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
