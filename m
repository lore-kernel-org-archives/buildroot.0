Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA70CAC5A3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC202610C5;
	Tue, 17 Sep 2024 21:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBeWS-QHiusg; Tue, 17 Sep 2024 21:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F091F61116
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F091F61116;
	Tue, 17 Sep 2024 21:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42BD01BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EAB861116
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OI9PHHo3_cJC for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A6725610C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6725610C5
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6725610C5
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:05:28 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82cda617e1aso429646539f.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726607127; x=1727211927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1L8VnaxDzeDskAMidrWra/SdJylhIRdEKAbSgKlxwxo=;
 b=cshjJ8BlGOgOXq3Q0XI30Avz/zNw7tqnKcByWZ2tvnT45EYI+r2L8iQopu2GLJr9kg
 hJ5XItGRvNkmWOAhpoO6B+bKyF4GNJimJgoATgAjHNOPsNqwA+/yE5Q+LBFAmD3UHqvM
 tEn0C3lagBkbM2ZnCKutXGAhmmQTPpKlhVpPwy+koXZjYcc2UCVBcFfMQIQORKRkAPgL
 HM8mVoMWVDzLn6+TbIt79fuAsXTsENFneUz3V/x6Gy/EspbYipT18K9hG7I6MlB1B4Sv
 9nS6RMaSVrMdch1zeBrMAmUjQjWzfFopics0Hx5ha6cFNCHBZQxa5n5FbcACPwf5rPDn
 OryQ==
X-Gm-Message-State: AOJu0YwmiQKvGEieehnswFAIWTlCOjWW5KZF+DJ9SICDojzxKH2rN0q0
 TInQcZSXI/1YaxTeEj38tUeWOqXlVNUveYLxQwqCGdptmJJRLncbI51UCw==
X-Google-Smtp-Source: AGHT+IHDVkAsXFErm1yNdovjiT/PW3fLxYkgGr1SDCbnJWovThHQFpuGZotkf8mMG47aVUMElvcLbQ==
X-Received: by 2002:a05:6602:1584:b0:82a:ac63:e7fc with SMTP id
 ca18e2360f4ac-82d1f98c15fmr1802003839f.15.1726607127451; 
 Tue, 17 Sep 2024 14:05:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d493389bdsm225535239f.39.2024.09.17.14.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:05:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:05:25 -0600
Message-Id: <20240917210525.1657-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726607127; x=1727211927; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1L8VnaxDzeDskAMidrWra/SdJylhIRdEKAbSgKlxwxo=;
 b=cqoBXOeR4YyakNS9wFIFcBcKe8Kr9qFmNUkf4GPuQfy408oYP/fqf/fI2ppCb3JGvv
 +yooKVDs2s1gJXABKhRKsSrkCECqtzutQyZBAHp3EG9To5hYIISWKJuCORJN6c/dKOGh
 QGMbn6fyR4eScuvQ14xEvysakzBC+hhtXAauN7pF2bimV+o6A5ka5nTCYGMN1nU31BLh
 6JkQEotTmpZSYz0cQAebafVj1lNt2iJcXFKS1/MM3gtivMXMNmjul+XYGo08WWI2ANda
 Nc6xQ3TLMnydGtK4fc3uP7Ncg+zAMJeJaEdsR+hh+tgnM2a1h1UL7NW3c5oMlaVWWPIG
 FIXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cqoBXOeR
Subject: [Buildroot] [PATCH 1/1] package/python-pycrate: bump to version
 0.7.7
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
 Nasser Afshin <afshin.nasser@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycrate/python-pycrate.hash | 4 ++--
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index 5489f9290f..e86f16a8b2 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  37e1bda10f41fe947512e9d5f8289518  pycrate-0.7.2.tar.gz
-sha256  8abd3fb9f3e7a2dc62061490f01e99b2a6185e88b1c9bf30db68853b748b8f61  pycrate-0.7.2.tar.gz
+md5  d5bc1e0e801ebfe27e2cae35ea45bc95  pycrate-0.7.7.tar.gz
+sha256  72f86a9a50497342fb2a940b1398a46e0aa2401a90cf77405074f2264b0e3734  pycrate-0.7.7.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index 41ad30fcc8..a6f3dccc5f 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.7.2
+PYTHON_PYCRATE_VERSION = 0.7.7
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/f4/01/09aac6ea758ca7b7b1b4832c0c39003752ef7b6c1478e6db2f34171db3fe
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/45/26/04cc9fd3df1a03a5f046e72d35f268c4dfebd278fcad228e81701576ca9d
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
 PYTHON_PYCRATE_LICENSE_FILES = license.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
