Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229FECEB2CB
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 23:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B4081062;
	Mon, 30 Sep 2024 23:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1czifvNSasu; Mon, 30 Sep 2024 23:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD0148108E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD0148108E;
	Mon, 30 Sep 2024 23:12:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0D11BF28D
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 23:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F040E401B2
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 23:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOjAC9iLN3vM for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 23:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F6C9400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F6C9400E2
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F6C9400E2
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 23:11:59 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a34517248dso14508955ab.2
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 16:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727737918; x=1728342718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vdM1YFnutoFyZmuj2zr9Hko0m703Z35NrftibbyZ/JI=;
 b=BWOs28GXS5G4dwjba43UqQnfDebdNQo77W77cs+Q6be9Wmh1rWVBLgCXg08QafRbhn
 KWqhNZFiWhGKUCH/w7jkfT4rpoujP9VZZvGWgGY6jUeMUasZvdOsUCOH/QjX6C4gySC0
 Jojl5Fl1CCaVcdwJ2dz/hUMA8Qhf/uCcgoZFGinzq7unDa4TsEdrMtd5neAoEVzdwn3g
 Czv3C/5aXGyYMYAVqpNCCdSlK7MdaA4dkdLkCALi9B3GnTL7d1xoQtnpPSmUJ7uK1xD0
 oPdzjCNtKutvGZ02RuidphjXCVBbo1Y1vCxKFrdtXYZKvDHXflWZmnO73bHRKq0dH/c1
 0n1A==
X-Gm-Message-State: AOJu0Yz4jNpXJp+idQzN01z8hqQtwBzAqV6fYkrLu5WYDRRUG99pgHXq
 YPdrvWcDYNaakrlm2XEIgaD835YArD7F85ingVmn5EtMTqcjywDHxIoP4Q==
X-Google-Smtp-Source: AGHT+IE6Gk6tjTogjkNnwSmX3hCHny1dVu8tW7z5aBROGhjLCDBWA5HsBGsJAJU0s1XKG4qI1QiVVg==
X-Received: by 2002:a92:b70d:0:b0:3a3:49f0:f425 with SMTP id
 e9e14a558f8ab-3a349f0f90amr80779495ab.0.1727737918294; 
 Mon, 30 Sep 2024 16:11:58 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344d82ac7sm27551185ab.23.2024.09.30.16.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 16:11:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 17:11:56 -0600
Message-Id: <20240930231156.1212998-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727737918; x=1728342718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vdM1YFnutoFyZmuj2zr9Hko0m703Z35NrftibbyZ/JI=;
 b=UEqbRmLel6SjO9TkNEau0hQyNEG8BQmz2bnwy3F05YGOOAvNwXviwDorCURBc5E4xf
 raiDxD8czn8cHNnEhZrInr5Ff7yUXV+yyU/GC2yqagOifw29xUbXF3AZM8pzVR0nfDyK
 IM+Es4P2m8hWdBUsqQAPj2QTD8P0KSKTsOav+RiXmFJ/WzzQRwG+rqm/Zd/w30uml4pw
 nue6tglyaVpYTrS6mWPFdnj8eLfHWcQWuZilz+30my5KTdwhCZbJ6eZ4qk6vZRErbkLk
 Ri2vl3TtMhnc06TkhDdetlqYLMIhbwK8mgHwzhst4b+TXwSb+XKIDmvHqKYedBlc50/g
 xkTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UEqbRmLe
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version 7.1.4
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

Drop no longer required python-pysnmpcrypto runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysnmp/Config.in          | 2 --
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index 0840a464e3..0c63b57931 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pysnmpcrypto
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYSMI # runtime
-	select BR2_PACKAGE_PYTHON_PYSNMPCRYPTO # runtime
 	help
 	  PySNMP is a cross-platform, pure-Python SNMP engine
 	  implementation.
diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 9136d23a14..4e1df1e4ed 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  527c09f53ea7c28963e55b4c4b483ec2  pysnmp-7.1.3.tar.gz
-sha256  29853e4daca82992ae8b1932a4e32e1ec9df8234905b6d594d43773bdc72c4b4  pysnmp-7.1.3.tar.gz
+md5  9d1ba65a734a613e68d616f3f4c24b6f  pysnmp-7.1.4.tar.gz
+sha256  4ec7fd78cb7437ad64644108dea603cad8e49f065da3dd3e0539dda68bad320c  pysnmp-7.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 5db86bc976..78f9eeb930 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.3
+PYTHON_PYSNMP_VERSION = 7.1.4
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/f3/0c/bb2ccb587b5e79036dd83aa5fe835c2bc460a3098c4060461e9d324c6670
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/43/71/18a9d8c00efba166b66408040028f25a8ea20d2acc9cd89bd780369544b1
 PYTHON_PYSNMP_SETUP_TYPE = pep517
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
