Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFED8E6F06C
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 16:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766DB606E5;
	Fri,  1 Nov 2024 16:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOBPGGo5lyds; Fri,  1 Nov 2024 16:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD77606E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DD77606E8;
	Fri,  1 Nov 2024 16:18:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 161DA60
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA21C4029F
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ackv8vQKWriI for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 16:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9EE6400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9EE6400D7
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9EE6400D7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:18:33 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a3b463e9b0so8034165ab.3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 09:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730477912; x=1731082712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ieqxehXTXh9fViFMFmS+pj1cqljpBN5YgQd//Ti4YHA=;
 b=Hib0QI4SggXVlIbAIjpIT0AFM5YYIu/BUKeLWSY4vW5oQWhiqyP9dCwBZnT/ttFY27
 3TchZRHhelSdgueYPCr/NjE+RAQWcqlUAZfj5jxCaZscyIRax9LB9MdHdmTgSsiFxEsh
 Ln//mA6YaQYdAw+0JJgwV26OT90AyI4U8RanvXAHwMP4ttS+TFvhJATvHiz4SBGE82t6
 llt+zT3bIUL+q39LCo08x+r3AFaBdwxCNkL+QVphPmYzRifTpAQG6hW9FgzRgjd/TKzC
 k033OTc+zvIRkHHwAy8FEc9VmP7Y+QSqGzWXQ5C/7JkVlHrtY+FDVRL8ftJNWuCIPSZy
 CB6Q==
X-Gm-Message-State: AOJu0Yyd066/rgLAX7tMJYXlxxujo+ZT/snh5h7z0ZXTgssSoakaQoTD
 0XvDg/qA3IM1gAB8+A2FIKVoolKOD4emUl2CWug4/0J5bNm3tc2BWY8fGg==
X-Google-Smtp-Source: AGHT+IFJbxPl1MKiIax05+sWP3HAk/j7Six/PpSPjXqafqSmpFudzlX1pVeJE23DmqjOtl1hUCkD1g==
X-Received: by 2002:a05:6e02:1c4e:b0:3a2:7651:9878 with SMTP id
 e9e14a558f8ab-3a4ed2aff10mr231580855ab.12.1730477912271; 
 Fri, 01 Nov 2024 09:18:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6b6491cfbsm2278865ab.38.2024.11.01.09.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 09:18:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 10:18:30 -0600
Message-Id: <20241101161830.368487-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730477912; x=1731082712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ieqxehXTXh9fViFMFmS+pj1cqljpBN5YgQd//Ti4YHA=;
 b=JFBJLi9N5theLDXSMZu37ZG5LVmTHm3RJMGFo4BzVqZ4mKCeS9iRlAhftTFBk3Nb9l
 aORPfSXM8fH9rmQW0oMLGu8XLugm98z5y3XA2DPYMGWqimr3whp205dIZyW6tRFjVU31
 viYSMC6KHM/GTAwGCWXs1RYaU0GHq+vAIEcU+YO9wMPKuxU94rj+VWUS4asnDPjJXc2g
 Rgky8pralDiiYhYyE6CBSFiRIYKRfD2Nu4pBPzeOM9BLIAYHq+Ck2LwiYeGT+Q8OZg2N
 zPSK3PKOlEzN19WKelNGYZ/rUgVHxr58q5nJeEn6NBOs3hlh19uNUyJD5iCbhMw7NdRg
 11DA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JFBJLi9N
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.53
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 18282e4b44..0f156fa9e7 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8533d8838eed90ea6cef60acc924e4a7  boto3-1.35.36.tar.gz
-sha256  586524b623e4fbbebe28b604c6205eb12f263cc4746bccb011562d07e217a4cb  boto3-1.35.36.tar.gz
+md5  c9518551b25ab97e6c63b94061c6895f  boto3-1.35.53.tar.gz
+sha256  f4124548bb831e13504e805f2fbbfcee06df42fffea0655862c6eb9b95d6d1be  boto3-1.35.53.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index a7acc88380..c50f0562bc 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.35.36
+PYTHON_BOTO3_VERSION = 1.35.53
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/33/9f/17536f9a1ab4c6ee454c782f27c9f0160558f70502fc55da62e456c47229
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/12/c1/1dc34b322d2f022d190c34dd4aa7f1a242d73633c25061bf56bd1319fe05
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
