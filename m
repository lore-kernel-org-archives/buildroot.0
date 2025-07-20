Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAE2C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 19:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0894483365;
	Sun, 20 Jul 2025 19:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siKG9agqKnLq; Sun, 20 Jul 2025 19:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4139782F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4139782F49;
	Sun, 20 Jul 2025 19:06:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CA2B127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E11082F49
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiHeWh_FmGK8 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 19:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FB1282F3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FB1282F3D
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FB1282F3D
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:06:45 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-87c11fd5364so85473339f.1
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 12:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753038404; x=1753643204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wlSqTGqFdUgVVek8Z//fy7oOrXes/kPD12U9TkO8YXM=;
 b=ltjtLCK/T9qqLWmXWXB5izAOAbNdGDiHYvEoHaT4E+bqcwwk+c/Skao5Ev6xd7NOlv
 ctbDUIGPlZyKl7eAtM8IiMlCGvZki+GVpnxeC3Z0GzK13eBVYsGUmC15zjRUkxUgWuoj
 HzGkHsUawtVL7EAjVT9WYRXE9L0zyoCIrBTgEXZwq1SaeUm4nkk+tRkXjIycmzaFspDB
 b3BntzPiPYCgKbHWGSoUS3rbDp99w3kMNjUmLkYnxGgcOjJ4cHL5R3f6IRnKsX78NJKR
 CMDKxaiC/0Hg2dXRma99zz3QDBdYQPbHvaYlW5icnMVJ43fIVjAFXObusJktNM/WR4gf
 oDlA==
X-Gm-Message-State: AOJu0YxQc6dAZn0m+8cz/vGGfad8dQk6NGYOqW1HGbWWxXHj5XU7wKrv
 Cidb1SZvjS7l3pktLanPVca85lB2RQ41YtrgjlXCFf3Nq4QnRwHbJqCQGmgU6/mA
X-Gm-Gg: ASbGnctBlzMn8q8hVJh7UskSLgkxFbWphtK1Gq3FQGWssbBK9xaAB2I0Lgnu91t6X+f
 YuXacMoAIEGs4vrub4LbTgiUcWwauQj3qLOH6OXrW6AHsoPGooT0wGkWRmV+bCoOLlnhvL9Djn3
 JddPBYsOjXOuskXkYRnFWeXDuekQTqSDmpzaHryxdDNYIwaYnKhVXuixL1EKyGLCcsB1uaFOC36
 ZtnB9o9n58X2oUtuUGT1oHS/8NXJ/6zaJfOka3Y3xHRjAmetlYBcyvAFRwk+99ppNLVpKeTCe3I
 UPJhJgOuFS8f4vKNSeJq2PIDBmDWJzfJzK8fDZeU87LNk/D2gCQWYDqFe8sgOc2hb3siRy8+DF7
 BtHSIDejmCNFNTMuItUhm3XHcdGehxGyQD1a8c06acrr3wojYFEtt4OIDjrmP4p+x7GM3tanpHs
 A39Bli26E=
X-Google-Smtp-Source: AGHT+IH39xn/qZT/nBRZPmruygqTNNILLsNOmX9wxsd5GZLG+OTI08bITzFpZr4ygXygI9AcRUzQcw==
X-Received: by 2002:a05:6602:6d0a:b0:87c:1cc3:c0fa with SMTP id
 ca18e2360f4ac-87c1cc3c4a3mr789337939f.0.1753038403960; 
 Sun, 20 Jul 2025 12:06:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5084ca5e4c8sm1384961173.119.2025.07.20.12.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 12:06:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:06:41 -0600
Message-Id: <20250720190641.3212754-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753038404; x=1753643204; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wlSqTGqFdUgVVek8Z//fy7oOrXes/kPD12U9TkO8YXM=;
 b=dE04JSMIGWSHj148XgNbxOIWUbzeMkh4etrJvCcKEydKykdnzxu6WlpY1DFNxJc9FC
 P4qHfduJ5KQEBXoePVobBpPoTslI47OvvDXpgc5aOnpfGcmqw5xev/Rhwrmq2a13xWzU
 kx6Wkm6FV9FedhpSQMtmIh98EhiqqoI2pEMcMliNqRDfsQmQmoZ9lIOn7g4rQV5ahrqA
 DmGOb6mhc7EMmCgii6kklmP6L5K6H/ooFdBFeGxElDifbsuOjowKEio3ruvRMBuMN1xA
 6xkDsj93DqJ55cfsvws2rtseDEel8pXgEw66IArrgtQVoBeBKHUztIlvchjMAlMFutUE
 qsTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dE04JSMI
Subject: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version 3.5.0
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

License hash changed due to formatting:
https://github.com/aio-libs/aiodns/commit/924b981471b676e90a1f38b1e20223c18b899a0b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiodns/python-aiodns.hash | 6 +++---
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index 3f4d911db7..e0c73c2039 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  0bfcd1b040912744badd2771a33a32fc  aiodns-3.2.0.tar.gz
-sha256  62869b23409349c21b072883ec8998316b234c9a9e36675756e8e317e8768f72  aiodns-3.2.0.tar.gz
+md5  30623b233a06bd318478e39828a771d2  aiodns-3.5.0.tar.gz
+sha256  11264edbab51896ecf546c18eb0dd56dff0428c6aa6d2cd87e643e07300eb310  aiodns-3.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
+sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 9c1bea601c..87aa8830aa 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.2.0
+PYTHON_AIODNS_VERSION = 3.5.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/e7/84/41a6a2765abc124563f5380e76b9b24118977729e25a84112f8dfb2b33dc
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/17/0a/163e5260cecc12de6abc259d158d9da3b8ec062ab863107dcdb1166cdcef
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
