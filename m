Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A29EFCE38
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1AFC821DF;
	Wed,  4 Mar 2026 18:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZ4iUwBviAT6; Wed,  4 Mar 2026 18:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F172D821E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772648051;
	bh=KxooxwM/7kjuCfg7+qlROPKGR37AwQtl58hmq83eNTk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UaITVb6b5G7PQI7DQR91IG0xhcmtOFuFzORk1lLaKURw6CwMojlXkA+hTv9nl1Hre
	 m70bQ0fbKTvLnjOfgImpxYS9cPHOhUhLFRVCn+DA5smkf94hrMI+7njakHN0SNqJ4n
	 0cXOF0aB1KPlcQFqHXJ8ZAVLolFjBDYLjEqN8LcNFNzN3GWRoRv9QWwdX1IP7tprDX
	 416zx2TeSPyl5+l3gYZoHfNfk4evOxciuFXdiflEmnSa2vaYe5FGwMbTNFREVeqdmb
	 v2CtIGIsHvYpUqLOkhbKk81tExMOQ7nI/CWdfaPzRZk7LRx4bEPvzv4hKenjp6qLXY
	 PTTbbfSf32nJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F172D821E1;
	Wed,  4 Mar 2026 18:14:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55F841EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 480AD60B3C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QB_diYlkAreJ for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:14:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66F6D60B3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66F6D60B3B
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66F6D60B3B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:14:09 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-464ba2bb3aeso5446728b6e.1
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 10:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772648048; x=1773252848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DUGamyC2xEzzd9S7cre+RHthRoluTQxdR4yXliRrnqQ=;
 b=U9OQT00SyV9UNSpyK5zAERNgfstlcfJSTWhGMa98fn3MIRjIcBKhXUGi47mT5cvHhL
 IarPmN7U9XeJwHvUYejz/npGuVGydyxb5ezDb0BtwRUu9fPlFVH5BgIBy9/M/P+q8G75
 Was8FmmuViFVKwXxw2cfqakabSzjE3vopWwZWH5q83hgRonp4uuQERnRxaGHvYnZmtzb
 QHMFZS3z+sHCZzevwq3r8Z8kzJKirIPTq9UoJwNPL/bZyESbk64C7QMZnvAhI2zX7BKb
 ZaiSjofbuyg6Xi7+tfBsdlGXZ2/66hmsSmBa1D6GrPXRG70i0UrzulEMKz73iIurDSrZ
 tLBQ==
X-Gm-Message-State: AOJu0Yx7Y4Va4efS1RLyhsMlifUZZrFN08ciWLSCJwg0q/Lf+25Aqbg8
 56a1V65K96msU5KpblSbqOlGXdgz89KBlDi69FAG7PoDZmDQnzGj5GyOuWJScg==
X-Gm-Gg: ATEYQzzt+CmaDpRbXg8a3gw2QW+hP4FKPOCw1McqAIGkikLOpvL8gN63U0h6JrEP0gY
 W9qvxWpFF+7emkXWvloWKMEWfrvnlLQnwMVFWEMpBR1y+KRJn01+l0VJ1D3nQyeos1uVtvJhP6B
 TTUtcZ96tpNJEIvbN5MwafHvsckq8Yq5FlYKlXjrvdYzMxGnSQtTtm3W+GUCel3halaV9i0G5ID
 qx1o4UAQejNtsN1ezQ7KjKWD1+Ln+e+lrChLGdwNkhDRk/UkEhVJma1TdP6duridDWiyH7jTVCd
 6LMVfYiWmzdp7BHsaOXQLGHZ47HygOgk0duwOm6IAKgVf8e/Slz9Vlg/aFoTo8gq+XExc4LCyre
 MUzDb8uvTOh+bl8tt71p3J5da6vaNI98WS0uT5omQz8rw7WAjUwg/RF5L30yCZhtfYoZvymzwEH
 vqxdIeFAMSdW1JUCyys4e9Xp2RSFeEBEH9QF5x+ZXyGNoofsyWlWCIHpQLHZKGyM0tkvaIQhFFz
 EBbwaoDxyE63mVs55Y1eKQmuLlB3iCLWt2+yvLEzXLhdWyTYN0ijVW+ifs2
X-Received: by 2002:a05:6808:1494:b0:453:58dc:c006 with SMTP id
 5614622812f47-4651acd97a8mr1336993b6e.3.1772648047953; 
 Wed, 04 Mar 2026 10:14:07 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-464bb59be78sm12373814b6e.13.2026.03.04.10.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 10:14:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 11:14:05 -0700
Message-ID: <20260304181405.3739915-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772648048; x=1773252848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DUGamyC2xEzzd9S7cre+RHthRoluTQxdR4yXliRrnqQ=;
 b=H+uCSCLgCHPRN+U5QF1kxuZpeo6AKMQORF95UU1qcFAdDSCfS+d8oRRqoOdDYzIxWt
 hMYOwEonFl5p9DHLtg5r3KmnycwXrpvleVrDsq6ztQwz9nQXFOBgyK76WA/p6gCCzHDn
 UH9uE+5u37QZpv+69+K9VgsYA2WvPtgSXefT5uk0gM41SvKL7n4/Rcq04QVE7WBgoPZR
 SHEZSmFEnOZ8y4x0Mv7KbxN53XvlrelTbLSYNsaMPLA9id6lj1aRD5GIHqoaxF3fyyYU
 05fsFB6KquN8uQyeKY/DsLkk1n3uIN9ooAbxzd6aFLZ42P3X25dmrXSmHS50laLVWCcV
 s/oQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H+uCSCLg
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 1.1.5
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

Drop no longer required python-pytz runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/Config.in                | 1 -
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-tortoise-orm/Config.in b/package/python-tortoise-orm/Config.in
index 57cebc6489..a05bfeab50 100644
--- a/package/python-tortoise-orm/Config.in
+++ b/package/python-tortoise-orm/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_TORTOISE_ORM
 	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Easy async ORM for python, built with relations in mind.
 
diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 6e1f46dd6f..0bb4224a9e 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  b3dab10562c6574232334e954666f3eb  tortoise_orm-0.25.3.tar.gz
-sha256  b6dedd388393624628ec46228c93df361533ceb3925986fa2d1d22debc838a7d  tortoise_orm-0.25.3.tar.gz
+md5  5c143e93e4c35dfd8cd19dfdbc064d6d  tortoise_orm-1.1.5.tar.gz
+sha256  d4074a7c34a8445fcca19ec865189d80ea7a00b29e4b12778460fcab67a5ce74  tortoise_orm-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 3a380710a0..18ad37d5d9 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.25.3
+PYTHON_TORTOISE_ORM_VERSION = 1.1.5
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/dd/be/0fdfcd8295f4f02a280f33bdda99c3edba450f9a212149232f2fbb6afa96
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/f3/b0/2b3962847aad793d32646c6e43e7fab6f845f34a5502da5722fe704ec847
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
