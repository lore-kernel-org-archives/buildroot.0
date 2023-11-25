Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F17C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 07:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E784660BD6;
	Sat, 25 Nov 2023 07:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E784660BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lc-vdcG3i8Jy; Sat, 25 Nov 2023 07:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F08E60ADE;
	Sat, 25 Nov 2023 07:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F08E60ADE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD5421BF861
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 07:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A336182243
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 07:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A336182243
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jmb2OuGPFj3q for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 07:02:41 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B41D082241
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 07:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B41D082241
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7b35b9645e1so92353839f.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 23:02:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700895760; x=1701500560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6EcxaDGFPz9h3U/ubn3fYz3c8Pkzb1HeeDR4S9+1Xg=;
 b=cnk0BsRKhHDDU7FESGkNHvLYe3Sk1Q/n2a12i75377y4kqevBKS+tz4UtnU/8cC94G
 aYEb0ZwE4/B404qe5wHA9fLhmBX+LPVXjggXPlrWlPL31eXcGPxsvqYmpZL/ZGfeSjWW
 o3LvyVQMLbTVQlD+7oKKJ8oQdYRV8QF2ARMZilrpJz24rHxGTygTmxqwMWk49takbPbp
 nKwfh044zNld+j/1JwLtmTE429BeBYoxefnNHLYuCWM9LNuyd6SaMZAKUPgeVSYbai7a
 k+facBsQi4FmLZw8WilFQ5kJdJerI1FJ23s6Eut+aYDxWjns69Vi4bLEY1fJfF9Y+jTs
 Q67w==
X-Gm-Message-State: AOJu0YzEJ+pgunwejjP/yw0wGFX75NqRmlJyPNk718RiWf7uoxPxkyrf
 grgMRzO5bCUDO1DxtIhmFexZ4ZrKAEE=
X-Google-Smtp-Source: AGHT+IGOuX6te25k2rp8CcLgpRf5xCSpmRMWghUfxKnFdFEOVNDfz/U9yRvjuTBncAP76cOwe4D7Dg==
X-Received: by 2002:a5e:c741:0:b0:7b3:56df:3db1 with SMTP id
 g1-20020a5ec741000000b007b356df3db1mr741624iop.12.1700895760290; 
 Fri, 24 Nov 2023 23:02:40 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 em4-20020a0566384da400b0043978165d54sm1280433jab.104.2023.11.24.23.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 23:02:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 00:02:38 -0700
Message-Id: <20231125070238.837182-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700895760; x=1701500560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/6EcxaDGFPz9h3U/ubn3fYz3c8Pkzb1HeeDR4S9+1Xg=;
 b=exCF+gnO3OjpHqlCLL/lAIX2+CJzvK2dtBGwuMaJwnCDSfFjOolWyBGgJAWLrxwLST
 ovYHKMnNqLnWmY/tV6Cl4J9yJB99jbiD6lo3IUl5dsGPfFF26t+pDJJtKX7RklYTLpGj
 V3srPXmOtUefeiyzVyRwFGpp3iTnFX1mLNblcb+pEw5Nymbchr3p+azfXBQSXOIwRipd
 zS/MvBkJcLLq+pT0JHtiQCtS7CLrEt2BuMKrHvE3Gkc4Q5rFDBg4pvY+2oybWh7PGId0
 6v4D3X1LtMN65KAwKPf++ibOnWjnEDX45IsBiwiFVQ8OhGQnkt2YsaCB+FOQkEnapxXe
 9DiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=exCF+gnO
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.19.0
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 954f4a8938..2b74e03e76 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  3b8d868cef13ea41cb3bfeab66a7707c  pycryptodomex-3.18.0.tar.gz
-sha256  3e3ecb5fe979e7c1bb0027e518340acf7ee60415d79295e5251d13c68dde576e  pycryptodomex-3.18.0.tar.gz
+md5  0dc96e1ffb42c955d89c2ce3f3875c9c  pycryptodomex-3.19.0.tar.gz
+sha256  af83a554b3f077564229865c45af0791be008ac6469ef0098152139e6bd4b5b6  pycryptodomex-3.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index d6eb2a9513..0d9855c602 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.18.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.19.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/40/92/efd675dba957315d705f792b28d900bddc36f39252f6713961b4221ee9af
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/14/c9/09d5df04c9f29ae1b49d0e34c9934646b53bb2131a55e8ed2a0d447c7c53
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
