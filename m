Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F1C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FEE81F64;
	Thu,  3 Nov 2022 18:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98FEE81F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4KM143XdoYv; Thu,  3 Nov 2022 18:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C310581F5C;
	Thu,  3 Nov 2022 18:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C310581F5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5274B1BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B35760FFD
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B35760FFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nxqy3C1xul2q for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:44:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD1161007
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DD1161007
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:44:13 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id x16so1529026ilm.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RpGluyfcPv6ajGZc3Ct20QA4D08zcl9CkbSAjxwmgbo=;
 b=q5B+Smn5f1fRCIPOL23SV6xbLO3ZFafQFJzBtYEPTbRvZ8ERo12SfGmKhzDZ3T/HI8
 IhehyzN6Ox54w9WezqlQUZCSwBFdji5ojFjc7Unp8rdLcaW1vZRp3sYfkwjJbhUUJbf+
 8v/IQMOMshwegwGoEWsOyglt22b7lwmTLir3tuVFOLrUdkg8AHjr8gAWjVRlY23SNa2f
 9hG+wIvirhZtyZJWIIlIUT66H5spQg+UU38WFl8b4C+uF52JjmWPzH26cTJBBYOM4Jyb
 rpFgHeHotVPbnSMRs2qnArVvs6XShfuPugIK5w3mdODaaZ0ggTDlngvQ/8p/nEsfpzNP
 dkhw==
X-Gm-Message-State: ACrzQf37ugjk91Fmd3iyk/zY8RwRXqk4m7eoVJ1InHa7iIXV0Sf/ARyp
 Xzb8kXY0lljeuNVoDaiK51MYi1QYgmZzpUR1
X-Google-Smtp-Source: AMsMyM44i2wqNpPPiWennb22ksPwGSLxLMuh2ghaPXwj4CePkl+h72NpztmwHZi09mLCgKTBRnLPmw==
X-Received: by 2002:a05:6e02:683:b0:300:c796:d971 with SMTP id
 o3-20020a056e02068300b00300c796d971mr8338371ils.256.1667501052283; 
 Thu, 03 Nov 2022 11:44:12 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t129-20020a025487000000b00349bd096a82sm441078jaa.109.2022.11.03.11.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:44:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:44:10 -0600
Message-Id: <20221103184410.2056758-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RpGluyfcPv6ajGZc3Ct20QA4D08zcl9CkbSAjxwmgbo=;
 b=juACntjhyCCfDFGgGx9qjngpigc8oYDK3CbAL3iWs4rgJ6yWVs4iLiKd9Ynk2xs6bx
 huvLrmsubtmLMNPiKrx+eTXzeFVKrKiL1R76EQAMY2/kD2sjhT3QIV11kVhuRMpQ8IoA
 BjvTOYBrUvljoCBjorHVHHhYpqktUpgv+QHQAEEer8aYLFijuHEJEEHkunC+USKSuwxl
 sbyqo8grYqJFqXm10JeBRPRkCjHxjXAwUBKcDg1s+MMdoC6HiAWYlBPCSacUXCzg1adi
 FBkSgv0ptPUb0uG6Hcs2MbFsGNTAS7PKK+pUO3EMcnty7bpRQ8BsfOit+CcQXZTn3Pmx
 Ierw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=juACntjh
Subject: [Buildroot] [PATCH 1/1] package/python-redis: bump to version 4.3.4
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
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 57c71dabfa..9465e251f8 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  7a00d4540374f34e152a33faa1fcee5f  redis-3.5.3.tar.gz
-sha256  0e7e0cfca8660dea8b7d5cd8c4f6c5e29e11f31158c0b0ae91a397f00e5a05a2  redis-3.5.3.tar.gz
+md5  15f05dbef3d166c6244f7afa6c3cacf8  redis-4.3.4.tar.gz
+sha256  ddf27071df4adf3821c4f2ca59d67525c3a82e5f268bed97b813cb4fabf87880  redis-4.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 98c1a16599..7c18f31507 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 3.5.3
+PYTHON_REDIS_VERSION = 4.3.4
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/b3/17/1e567ff78c83854e16b98694411fe6e08c3426af866ad11397cddceb80d3
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/8f/d4/78ef2d3f316041fa6c92daa7ac2c8056c39858c3775fad35fd84b9b3a6fb
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
