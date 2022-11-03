Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7DDC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B2B401BE;
	Thu,  3 Nov 2022 14:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B2B401BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgnL_qb0S30T; Thu,  3 Nov 2022 14:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E63D240196;
	Thu,  3 Nov 2022 14:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E63D240196
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 025001BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2F2260FA2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2F2260FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dM8pScDprQ_E for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:25:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECC8060674
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECC8060674
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:25:12 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id s9so1127115ilu.1
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3+yf9q/fBqoOjTtjdCeIzMjtR1aORx8nGlRujcM0ra8=;
 b=gV79m3fkuoBEaNVMr8r2Hqc8XIs1y8bLvzk7eNKISmmIJDtsbeXXqeoc7sULjDGfDD
 RKzYnJc4TRQfSaX+YfHkU+yLy7lS/lUJwLr9FWUVxwmiSfRbFOjBPkkllUodCTIQqbz3
 0PLp0t89tZEnb+dr5XfZPi7b0tNPycpQcvRYW7dH3EvIjeZ9qk8mmn9gvoCz5XP7effs
 7Z51yxtQt8HMq6Ng4/DWKXWAfWPOvmCDLrOYOxZqLfYJhnloLXSxZTKRRx6WosEpLskk
 /tGp6pgALlkaJAsK8kXSrcllcNJ41siI08Yh0yBN3KofquphpSX7p+cBzrkFAv4z1m3G
 CH5w==
X-Gm-Message-State: ACrzQf0bWH2uU4qUxdzUP3tje8WcUjOmZ3Cjj3h5pz6clUGVfAq5yM5k
 goHoFOvyCM7nJXQ5qUaofVHGhs2wx91I6Si/
X-Google-Smtp-Source: AMsMyM7M54sGJA83IbgbR/A1o5SexIkwv2s5oQ/+wpADMDuhY6DP2wZLZTbktxzWrsEIdeWUNZEMeg==
X-Received: by 2002:a92:2009:0:b0:300:ad31:581a with SMTP id
 j9-20020a922009000000b00300ad31581amr14703198ile.172.1667485511778; 
 Thu, 03 Nov 2022 07:25:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 w191-20020a025dc8000000b00363362cd476sm253605jaa.101.2022.11.03.07.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:25:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:25:09 -0600
Message-Id: <20221103142509.1243641-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3+yf9q/fBqoOjTtjdCeIzMjtR1aORx8nGlRujcM0ra8=;
 b=Cro/bzplEvaTtYycRrWxZZnfUOXxdVg/wKasktNxhwUb98/GSglzyvsXHdwRa5mCS9
 KuFDxjoAufDnbmj6qQuicQFMKLBmVwoIEs8stXK7JBJZ0FWxpnZenrLwN6t0AdovQJBR
 q4rDsA8MqowuIkHTDuei37tn8YI3bDeGSFXXXdeZO0qOXrVnUlcpk49jOCx0ds/DvMh9
 pVu4Fyt4njIzBtwR8f5j1SpYE+s1pgHvAp+NLibfmtbXkSK2CdoLo3TPac7rIr+wNxfc
 pxj/QqV365XROZXnCA7pA++e5Ce4IJCtXoj5sco7nvVuXCTL4aa6i1zvLkPdYVYuuGqF
 XduQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cro/bzpl
Subject: [Buildroot] [PATCH 1/1] package/python-pyicu: bump to version 2.10.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://gitlab.pyicu.org/main/pyicu/-/commit/366090276963a90924d22420e2bd80a015fca332

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyicu/python-pyicu.hash | 10 +++++-----
 package/python-pyicu/python-pyicu.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 8b113d4ab7..009b264336 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/PyICU/json
-md5  7656f5cc53a7c18b40e653d6eefdee14  PyICU-1.9.7.tar.gz
-# Locally computed
-sha256  db27cd1cc150b879c5465872bec7fdaf340eca140aa922be03891d5b9f855b61  PyICU-1.9.7.tar.gz
-sha256  74bbadee4ee3c3a1ac0ecfbd74bc7ce64046de1ceddf4717dc923809ca8ffce3  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pyicu/json
+md5  4090ebb98702338cac3dbed2d72c2fd7  PyICU-2.10.2.tar.gz
+sha256  0c3309eea7fab6857507ace62403515b60fe096cbfb4f90d14f55ff75c5441c1  PyICU-2.10.2.tar.gz
+# Locally computed sha256 checksums
+sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index c6587c399c..512b2f857f 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 1.9.7
+PYTHON_PYICU_VERSION = 2.10.2
 PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://pypi.python.org/packages/6e/88/f42a1297909ca6d9113ba37b37067011ae29432fe592fdd98cf52ad23b77
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/64/00/a531e119a97e54601f616f5061879ec2d4bb058d225014f9acf94b2970c3
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
