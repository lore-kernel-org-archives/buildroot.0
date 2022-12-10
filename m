Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B7FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E655404B2;
	Sat, 10 Dec 2022 19:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E655404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKvFlMoNZA3V; Sat, 10 Dec 2022 19:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0571404A1;
	Sat, 10 Dec 2022 19:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0571404A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B88901BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0DFD60AE7
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0DFD60AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNbEExkHW_cM for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:50:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C5260AD1
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0C5260AD1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:50:08 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id y2so1544042ily.5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zud7D8fWX26EKXNcG50iWgrL5CnTMMbgI/I4E5J2Jd8=;
 b=gy73IhEh5+UpCcbPsCjE6wuDYCdvXNKUP0VR0iEjY0CMZmXiQACvjr4322atgL1o3u
 nd5HnJQkje7IY08N/X7eDIJR5uIjohJWETeLu4kfsK2kkWdv6SzX1tQ484O++NH0xGL3
 Ac+pTZVs4jPay0XI5NUqytiuuvhULaf8FcbaldaekloU85W0K9WHGiyVH5AtWH6d1I8e
 lGnskE5MdE4zc5rXzX8MMuhA4TN9gZXKBbhXMxIW2DrDEM4NfRRzZeSqt1S5ZI+1oQyu
 6+khKZT5A7VBKojq72Iw/Byz04IMIUSI4u3JYqhMLo1ewv7ApC3GGWVBJHz/x1ZyUPuy
 4riw==
X-Gm-Message-State: ANoB5pm5kja8UWWBuJCdQUnheZSO4+h2VZHbUJ4ERvLgnKw2F0A/TpLL
 VWnuSQYgq41JyNSRzDRKq6XlcoS2BPyZszFF
X-Google-Smtp-Source: AA0mqf5qojtpNmhuWULyXVPgB8vHmK6RLakcX38tTgMpZW/pb6CbgcK5VPo+oX+e+FK07++av9eAVQ==
X-Received: by 2002:a92:d286:0:b0:303:9e91:27bd with SMTP id
 p6-20020a92d286000000b003039e9127bdmr3363629ilp.18.1670701807521; 
 Sat, 10 Dec 2022 11:50:07 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y13-20020a92d80d000000b00302f8863878sm1561280ilm.24.2022.12.10.11.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:50:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:50:05 -0700
Message-Id: <20221210195005.3224315-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zud7D8fWX26EKXNcG50iWgrL5CnTMMbgI/I4E5J2Jd8=;
 b=EbS9PTz1+fhLKO3qvHnYIW70ODzLpC6mowk67JiB507SpyVZA5SzbQD1vXYkiV3TBD
 /bx7Dt9XCBUIPpW++PXoXSOkEwaSNAV7oG9wDR0ahKx6yUGGWK+h+BenOGqbD7+6qPcP
 VZpSkiO/dPgxtC+6ICfEA9F99b2wiXF59MrtBLz2b3Rht3zuEKbnUYhATlyveRqalAbX
 EQWzPk9eQre99TPHRyO5NntBdzorXoyn1tE3RjRYCYwBPAyQjE6B8PYpCD8A/jOKOIBT
 PHX66gmB95ilXRKJh6ST4hsjiqYDLhmm2LcvZZ9saDIjSMo5YgQeIF+mYuBqx7d2f5mg
 3IMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EbS9PTz1
Subject: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20221110.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydal/python-pydal.hash | 6 ++++--
 package/python-pydal/python-pydal.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 852e568ac5..c55a17a545 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,5 @@
-# sha256 locally computed
-sha256  0a2dbc5d61d37d2b59d441ed0aab48c1ec906ce66088eb5cee021b009601de02  python-pydal-20220916.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pydal/json
+md5  eeaf44cdcdb6bd2040713c710a4a04be  pydal-20221110.1.tar.gz
+sha256  7c3e891c70f8d8918e36276f210a1959bb7badf3b276f47191986ffcf5b6a390  pydal-20221110.1.tar.gz
+# Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index a3df1ccff1..f55c7fc2c5 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20220916.1
-PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
+PYTHON_PYDAL_VERSION = 20221110.1
+PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/73/83/b904c464b6ab060e12b3f406f1fab7deb97bcd9d2021d8c87325e6225c2d
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
