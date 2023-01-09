Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F44CC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D3381854;
	Mon,  9 Jan 2023 05:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D3381854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIMKUXee2ma0; Mon,  9 Jan 2023 05:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D7981852;
	Mon,  9 Jan 2023 05:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D7981852
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFB741BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C51AB409F3
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C51AB409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JHIcYbJ7aFjf for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:50:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B173409EF
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B173409EF
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:50:45 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id v2so4098048ioe.4
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OntAgtzq7xnrmpfcCMSxPmXhgXCK965qoRY7sAVagcY=;
 b=Z9EhYweypQ1j9YgoAJQHuLTiaPwUWaeO+dEI3+thDouIGk9TrWaHFNPmTlR+eWd2kT
 pREHStI5Mp0vsMtKTZ+VrMV+WSFUs2MYQqL0mev4PHI3761GF9W0ZSHvolD7bOxlLmt0
 r6hUbwVFdkdR+g7+aeTHscQrD181SVbVUKQ62wIX4+QSasCyL8NjxXVj8T7sUh4mXRy9
 I8QB448KyXnmnrFMI+HF0tpYL1A994ksC/84ykfVc6mFIFKcCKKKuFy3CpRPTEWPOZC+
 SuM/XQ2u23RuzEgb4eNaF4F37fm3RMLhHF4iZzJRF3Gxz+lyIbC1aYXTHvx2l7czypSS
 0afA==
X-Gm-Message-State: AFqh2kpgHdEooUl5sVvbVT2IuGq/cms11Th+qzTrZRR1c7ufbKW8iiH6
 yXsm0U9YLXCF2W9zZe2Xb9Z1uDUF5myGRSzA
X-Google-Smtp-Source: AMrXdXuvpwGW/PUOuZ5ChMKU4cGJvue9BxlBVTxm7QI+En0cCxzcIY4aJ95Nmn2t2J8HgqLaWsOllQ==
X-Received: by 2002:a5d:94cc:0:b0:702:9743:4858 with SMTP id
 y12-20020a5d94cc000000b0070297434858mr8070971ior.20.1673243444453; 
 Sun, 08 Jan 2023 21:50:44 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 b20-20020a5d8914000000b006d8b7bcaa6esm2940310ion.4.2023.01.08.21.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:50:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:50:42 -0700
Message-Id: <20230109055042.2746624-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OntAgtzq7xnrmpfcCMSxPmXhgXCK965qoRY7sAVagcY=;
 b=k/vZgImC+dpHCxz+db5L+WmBDbkT/mwY+9ZAYnJLrj30rmjsdxTj6LIIL2dvJqQNJe
 IAVQ+9OjyQNEGSRnHrz2qR2jOyyE1PQy9q8i3p3C0cEs+PgTtNu6Lfa6Vr0yAnpGGJCS
 Yv55nnai5PtVzbRAZN3Quye5ZTx5835p8SQyFMmT7F3hqfX3jimgJQ5IYQTr2laEKuKO
 GrFoEgT73m/FKw0hOR8nta6uj/nG9EJL6l+vIJKv/Wz6ryJkfll36AF9FpYxESiJFJ4h
 hK/XJIlPXFV/jd+4AiXtW9TXG4yenW69DMHNgawwmboHdnvYN6hQ29CfdkTnCM0xRjrp
 6Lnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k/vZgImC
Subject: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version 2.5.0
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
 package/python-scapy/python-scapy.hash | 4 ++--
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index 4dccffd39a..7b21e6cb30 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  54072af118e9291b6c7898b4ea87cdaf  scapy-2.4.5.tar.gz
-sha256  bc707e3604784496b6665a9e5b2a69c36cc9fb032af4864b29051531b24c8593  scapy-2.4.5.tar.gz
+md5  f546b1c82c2c98e0dae1a436219dd042  scapy-2.5.0.tar.gz
+sha256  5b260c2b754fd8d409ba83ee7aee294ecdbb2c235f9f78fe90bc11cb6e5debc2  scapy-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index 9cf17db671..a2c6cc6872 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.4.5
+PYTHON_SCAPY_VERSION = 2.5.0
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/85/47/c919432ca258f354bb2c1e645623f891603f185bfc7563d4a21f6432e7ed
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/67/a1/2a60d5b6f0fed297dd0c0311c887d5e8a30ba1250506585b897e5a662f4c
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
