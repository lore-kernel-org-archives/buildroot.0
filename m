Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B11C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 316C160C18;
	Sun,  6 Aug 2023 21:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 316C160C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOAcLvfGCvuI; Sun,  6 Aug 2023 21:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7635760B4E;
	Sun,  6 Aug 2023 21:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7635760B4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4CF81BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AA5A400C5
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA5A400C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsgVHuIe8QHO for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:37:46 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 205F94046A
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 205F94046A
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-790fc019c62so32606939f.0
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 14:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691357865; x=1691962665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mlTYwoxX7WcWNiIaH9NKlYOhb1iHXCw+nEj1vRM+ugQ=;
 b=J73dAacxYzcVmB63PBZZkWMEv9mAAcdJ6meDlntpaskk2bWH69Cp4VITVU4IBDyw5Q
 ygRKlXlfW/Bd5shI/gjaiGxMGrUHyF75166j0BYSiC/I/MuqBUlahFGhcDkmqgT1U9lx
 I9ULZz3EDoA7acYSbA+A9NH84XxUoudXek8jpWeZjhoLnXm9//R5bL47Hw4XKWxBGWDF
 pFj48yD17vDzNcp2DZ+RLZ/lVpZl8gloVJdnyq4wzQyJX6F/mU2K/gS/eBDm7jVgLL0C
 qToE1UVP7XekKJS9gh/PLAysXNx3r1kybGWx+byEYnJ5D0wDvvdxIwLUtmleTvTtGOWp
 58bg==
X-Gm-Message-State: AOJu0Yy4VHFQVO/MslOMTi8e6Aa+QuzsxsUEjOuq6qa4cA38bJAquCJo
 kLRvlqdBvixJKsKfDBQrIwGl5ZkAIBo=
X-Google-Smtp-Source: AGHT+IH15jZtTEXRlnlxP9xGD1BVxRRkxiHSTFMAA3vGYv5v7Z3Hh5yxt959jmpvGaFB26VhTCex8g==
X-Received: by 2002:a05:6602:1646:b0:790:a365:610b with SMTP id
 y6-20020a056602164600b00790a365610bmr7130905iow.7.1691357864763; 
 Sun, 06 Aug 2023 14:37:44 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 e17-20020a056638021100b0042b451aa95esm2000073jaq.150.2023.08.06.14.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 14:37:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 15:37:42 -0600
Message-Id: <20230806213742.4097588-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691357865; x=1691962665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mlTYwoxX7WcWNiIaH9NKlYOhb1iHXCw+nEj1vRM+ugQ=;
 b=I4kUXgJABRZO9a3o1sNz5+Qx6BjAa2wLXA7KVxYL5uk0bNOUwtDk40CyumMiVJxgU9
 +p8iWvADnTPExkJo+4IcQjly34yCvfkw7WRKWBPZ+jX5QcoXVS36vgwu0C7rtpFrrUQK
 lp2OFqp+LVSRticUpjW0Ocf8aJAXUTflx8ybjm5DJsZGGwFAlBo1LpsgV8Lh+qhLpSOV
 y3s9amc4qkx7e2U+TBeppjHM+IK6MkyvLj6+Bl7HDNMbKTdWxTyZGxRyTT64ddW/s0xb
 Dtr+8eLCTATw9GVTgyTwRgnaxrYhK9JkV3xPR/UhBQdVPLZLA0k+s0tmVqYfI90POdBn
 L5uQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=I4kUXgJA
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.31.20
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 89f4c06de8..1f5e5c0d3b 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  805e638c353c532c2af7a7538d5bd4d6  botocore-1.29.115.tar.gz
-sha256  58eee8cf8f4f3e515df29f6dc535dd86ed3f4cea40999c5bc74640ff40bdc71f  botocore-1.29.115.tar.gz
+md5  efadef54dc1959898a42d4cae949572f  botocore-1.31.20.tar.gz
+sha256  485ef175cd011ebc965f4577d8cc02a226c46bd608dd2bb75ce6938328cff0fd  botocore-1.31.20.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 3e828fef78..b76d1c64d7 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.29.115
+PYTHON_BOTOCORE_VERSION = 1.31.20
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/9e/00/4560081a431aaa14c2257040d43f56c2ccba816d8bce3b8e1577a19f4076
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/f9/0d/ec24cb66b7651268462d5eb5d9d3c140a99f487db3ed58a45617991b11e8
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
