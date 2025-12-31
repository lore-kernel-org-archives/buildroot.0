Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B071EEE57C5
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 20:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E716480BC9;
	Wed, 31 Dec 2025 20:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7bh4jKNNu6A; Wed, 31 Dec 2025 20:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D8680B55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767212200;
	bh=t6LGevdNOdiqsM+eAzfTA/rHevL2dNq4dGNFeUqgNcw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Yi49KdlBbaCedEJgDmdWzPPfYzajdX3RGVdz+op1hiA1yXH7XjkCUsj9ORDakjDTg
	 oui6ST8LqfTeGshktoT9rmWmXzRP/8KFbC4mI78s7xU+vWXYeqv7JQJOPX9BjgHrLH
	 +ToLLswBvc9HjvqrGT45J6EJNUDAZspMzyLBXwfg7R9bu0dT5B97fYox/Wx33v9FcG
	 OZ/u2k0ZcMjHlcWmE03dBbjkeavMSdN20Qt5iQUkRLy2QPfkv9BXrUmVbJ9ZtkZ8s7
	 D4DIUZN2bk2LFV23jijMG6j4OGN0deHPbjyvqlg8aL1GJxUkLxIBOYn0QBWfkT8vMr
	 qMVdSMTLignuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D8680B55;
	Wed, 31 Dec 2025 20:16:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E460249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33EF7402BC
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14NMz_giGHQX for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 20:16:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5979B4024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5979B4024E
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5979B4024E
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:16:38 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-3fe9d6179efso2070315fac.1
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 12:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767212197; x=1767816997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZlveAbuwCUKAfmY88WKCCoZfFpPpgd/GGtYGync15Y=;
 b=IT6EeV0qT7YwsEN7EbG09wUA8G/HgGUg0U463MQ1bXexfHLLlgPzYRwUK5628Z83nK
 B5cDTmttpuWyA/FmSFUhskAFuQVmBKarMQVOTI90j/xOA0d3pG1Xv5bT4/ptfC5ZG95o
 /hRvH0IFw1Hvys+SUPlevTeXz2npXMpsu7u2TzuRmjMWTVBfD4AQZdVJuXCzlk73qNmZ
 uRrS1u47iqo1CwOEiDrSxa7q5PoEsgNlb3csh9s1JWJFh2oCjaavsPgQiIWGsV/tuqCS
 UknFjWGKH/M2x/c50oiLSTTnnPZRmCLkruwPaWmi9wiYS1kER2kaEbuW6nrVVTsvqojD
 9j5A==
X-Gm-Message-State: AOJu0YxHPeugtoyoJCgX/wXpsXnD9LLdwn6W6rtSJOgqZjbz4tV4JO02
 Ta+PPyVLyoQ0fNdd/SSs6RoDuzS915c8HiCIMvd9iK6F5eoaUItQWIyMQiiXxzqZxbE=
X-Gm-Gg: AY/fxX65pmH1X3KHuNcwGWge69FGVYctik5Gk2WCjCSfbKNjLKzAWYCNk+OwJaFo2My
 5dpj4fWgR/TDLVxiy64U8tWKeLF0Y94ao6H6iSGRxCOsl0cH0Mti/97Qf7QKFII9xyWiMSoOpig
 h/NdqD62YycLrbWyVeWmUDj936UrpMVu/rEtuwUA4t5y80sfMtBdXDKfSGd+n1uCoNoog28cwF6
 N8MzB1IYgcxyMjZB7mw1Gb80JfckATd/U1YIZ9zfDxunULPAsWQRnvfWKHk6qcuSj6ojdOGPNRF
 n1YNFqNiyClvVkbrwjR3wNltECdKowNVDmmeN8h+otjj8/81zMzrPvfzONGSHyg67jVF5hAMWex
 Q0To7k5kel2KDHnRCHbvcTl6G27Ik7WIyne0EWNO9hwhf/oL1QeU3JdU20GQfv07AK/r4wV/Xnu
 W1m1oeM/qU7nMPirTqadXxdd0WLD03TfZZZ3UsQlqAnpEJf8r4IjXWqbAuvHyDeJ41MRWyuhz5d
 so+oYDtY2UXJJ2rRrFBmjpot0OSQMSbYdkDPmp32UrdnqIsfQl4c8FyCjjiOb1LFA==
X-Google-Smtp-Source: AGHT+IFHRJk6GvirlaqJvV94CbxXVgHode9jd0pubw48cOCqyPCsywpMHxdVWQHfdBSZIvNrO4UTqQ==
X-Received: by 2002:a05:6820:2291:b0:659:9a49:8ee9 with SMTP id
 006d021491bc7-65d0e3a2918mr18863629eaf.29.1767212196779; 
 Wed, 31 Dec 2025 12:16:36 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f1f1caesm22137142eaf.0.2025.12.31.12.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 12:16:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 13:16:34 -0700
Message-ID: <20251231201634.4085035-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767212197; x=1767816997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZlveAbuwCUKAfmY88WKCCoZfFpPpgd/GGtYGync15Y=;
 b=Ew17//dg9gHK52wihJRe9k0emdUQYegg0zglMpEx++xazAv2hTDd2uIEWjwcQnfVFj
 BJDaVCQQLIeE/jauJJktR7Fr2IHOZS4aPaJLg/sM7tQ+73Eg65JOe5PwBU1qI3lzguw+
 sjAAaWNJLy1SH8Q3iTBPAhv0qcZzobi+fo+ic2DdbzZZhnG7KwTKQQpnYsuxgexl9Doj
 3pIOpHsNkcz3qIQwak3ehUQFq9vNKloAf+9b5xgT6C2C6X1+BBbybqeAkjT0Y55WDTK/
 eP8kXyUEhRD/zLmSoQsHjhzTcuLiAwxGsprxOALUd9Skz8lkj03da/wM2b6Jyat+U9IO
 XTew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ew17//dg
Subject: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version 2.7.0
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
 package/python-scapy/python-scapy.hash | 4 ++--
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index 4f86177e9b..b4b7dd2850 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  b8951038f22c9ec447538be8b08ac503  scapy-2.6.1.tar.gz
-sha256  7600d7e2383c853e5c3a6e05d37e17643beebf2b3e10d7914dffcc3bc3c6e6c5  scapy-2.6.1.tar.gz
+md5  dc3b089110a1fc1ef1d3679c0076ea24  scapy-2.7.0.tar.gz
+sha256  bfc1ef1b93280aea1ddee53be7f74232aa28ac3d891244d41ee85200d24aa446  scapy-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index f1d6ff346b..9df4614b9c 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.6.1
+PYTHON_SCAPY_VERSION = 2.7.0
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/df/2f/035d3888f26d999e9680af8c7ddb7ce4ea0fd8d0e01c000de634c22dcf13
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/82/97/7caec64f05eae3d305d83e7cce1ef2f337710513b89efb334f7278202e79
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
