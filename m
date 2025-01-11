Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE21EE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 19:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C2D960608;
	Sat, 11 Jan 2025 19:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYI8HPYBkH54; Sat, 11 Jan 2025 19:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C91360621
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C91360621;
	Sat, 11 Jan 2025 19:32:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8AB3950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9783A40830
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khgzca1sR16X for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 19:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EBB340716
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EBB340716
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EBB340716
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:32:53 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-84cdacbc373so95585939f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736623972; x=1737228772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odAQk2Ucku8+UjD09Y8jw1N1tRT41Fpwt62vlLBOmYk=;
 b=IfGF5llWCUcfxx4ZjWBOYtiOrmp3wN0UX8vEu/LDj0NazOu82SpjB/LqV4OSPNPBRc
 oRzQgw4tGV7ZbwYd1Kk0GsLz54roBKltfVDOEfUAvJoJfzf/ZUKI8N/ev5Q7XKO/LSI9
 Lf6SMCRNfaaTmvSTQARPw44k0xeONEACKF/oXGqCpzTLd7hpIbNxmZbDDbN/p9V+IxYj
 L1QH8mUzlDnxZIZWUKpzvk8VV/vPgWgtmIJuO3G0kRZ5go6kEGccBa3x5sQvFmadyEYl
 LdDru9r+o2JewTy9lFWk2OHI3/1F6bJGN3jjN/HVnwLSLKMTI7J2M12qoHabmjYr0Qal
 0WWw==
X-Gm-Message-State: AOJu0YyvND+v94+eZmg5ArXHkUw4nXTQIiPBqg4L7UeEC9NFQpQTYCGr
 MQs1eUW2eQ06Ag/vPmY2Pc0qkJf36okj/0gCCzxfP+c++eVF6ldxTaX8a1CcTHo=
X-Gm-Gg: ASbGncufMo46LoauVPI7Tsy8YxsFvCYPslQxTsJHyolOzOtaSAVf4CBCrDLPg3l4qPt
 39h7SvIO6uWYNTsHozwC6gUrQhuHDBjxvoFA1mhc6/7x+EZ5Nbbt8NCIfNcfYInE6f9n9x9qScE
 ZRdpwDkd3xEgMyuhDj7A+62kkq0yHACjwhNVR3T0keuPM48wIf+Hgp+L13hqzo7hyEzOE8vr5fG
 zaPb2ZXu9Jnv6SVkevihingRadrpEI2DKP6sQZ8w0T2aB6CsE8r+Jnetsd32tc7P3O+5voefhUW
 HC2875z60WOSJJfWlRqdqUs9wrurZdQ=
X-Google-Smtp-Source: AGHT+IGqnL7tBDS1L9mATsA3GmjYuP/260ulvLRUosNUq9K8gqhiTaL78E+lnyEiB2Hh6bPhodKd1g==
X-Received: by 2002:a05:6602:398f:b0:849:c82e:c044 with SMTP id
 ca18e2360f4ac-84ce00c4981mr1406354339f.8.1736623972178; 
 Sat, 11 Jan 2025 11:32:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f93d2sm1666728173.22.2025.01.11.11.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 11:32:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 12:32:50 -0700
Message-Id: <20250111193250.2969925-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736623972; x=1737228772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=odAQk2Ucku8+UjD09Y8jw1N1tRT41Fpwt62vlLBOmYk=;
 b=hbb4yi6yCOCv5wyqf3suWTrAvncWAI4Gx7jLm2aDgLUdyyBITj3Qt/g4ijIEmTqk6p
 PXG9hvNpFru1+8f391eh84rijCLJi9NEmEuQ8MZ5aJycadenKxUO/WLn/tWVYC87Le/a
 mgDEdgeE9BucJTR6zk/gQkXF6yeGlCgDJgEAS/k7uohP2EI5VZfpFgpM2z20ddy+oRMQ
 EXhW7JLR69gct1+It6ILJahGTSxLlSCIVn+CdGy91DLRLK9jqcYxdFLUaSgnaCzuLOQ3
 6HNISWejFW/jGjS2ZzOsXQst4GPJ2BP7TGozPpOI2SfHiCHohsrJDMb34hW3PdunUneD
 wU+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hbb4yi6y
Subject: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to version
 0.139.0
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
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index a40bbacb5e..f190d5ff6e 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  f72c481e45177fa6811822d65881b95c  zeroconf-0.136.0.tar.gz
-sha256  7a82c7bd0327266ef9f04a5272b0bb79812ddcefccf944320b5f3519586bbc82  zeroconf-0.136.0.tar.gz
+md5  ce24b798377f12fb3def7ebbc66e4e57  zeroconf-0.139.0.tar.gz
+sha256  2cfb4ef130aac602c9ed428a52243597ed248cf0d22ac4e2b21d90541de90684  zeroconf-0.139.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 973339b418..3a69afeab4 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.136.0
+PYTHON_ZEROCONF_VERSION = 0.139.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/82/e4/17075a9f1951b031dfd92d57916505574e0d1eab3f2fb7deecabd2be581e
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/5e/77/1db96e97567a1ffd8393a42959fa783ef66fc91d19ac9f7c75fd3be14661
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
