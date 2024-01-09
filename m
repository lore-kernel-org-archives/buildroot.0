Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64D9C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9778F41908;
	Tue,  9 Jan 2024 08:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9778F41908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hO2NOJZ509TR; Tue,  9 Jan 2024 08:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C859041902;
	Tue,  9 Jan 2024 08:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C859041902
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACDC31BF2F4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D25820AD
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D25820AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIBUJi2xkjOe for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:11:19 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 925C48208F
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925C48208F
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7bee8f7df35so438239f.3
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704787878; x=1705392678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53IVskJShjOyy+hPHzwiqUAfwzNhHmdWWLrZoXzRItk=;
 b=ji5OO/BgnskI/WEVbFr5c+swpb67FmDpbnlN4O0saHXLVdItOiM1DEhfvV0v5HZkgR
 O/G5LOJ7hTByHVnt3Kl0QY4SDTYKyrdkEEsDxo64fbk2+Sawx43s6vELTSsoYy8F2Ksj
 OeoJwmUKCmKbaJqNlis6FXTMQq3S3feCH+c7/Yo1Jc9nDtjJAxQZW5EddfIssx/3ojIO
 HY3nZQuygi+DjCj20K0ahYEVsVzmYzBJx0tCK9iuLKSUfRDM786RDVrZAiQrg0KXxx0H
 0hVduC4d3VMGY22LQHs1H3zgm6mfXLLiwF63jkWA4+bHJbqJrWq3XciZJs4ELWLuyFXH
 ov2g==
X-Gm-Message-State: AOJu0YzJUrGhWocbmPM3VND/rPzLS4dcnB4E+uqPk/aXdrvlL30d8GjZ
 u/WBjn54iQnKZA3JcgjCK6Ay3nt6KxGJTA==
X-Google-Smtp-Source: AGHT+IF2e+Gp536VCdiyrUpWWfX6tk7n8o/D2dUqQHxy3Aba7FLMv8b40e9cp0zt8sQ6NBJgfRJlQw==
X-Received: by 2002:a5d:88c7:0:b0:7bb:a8fc:4a3d with SMTP id
 i7-20020a5d88c7000000b007bba8fc4a3dmr6026695iol.5.1704787877921; 
 Tue, 09 Jan 2024 00:11:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bg15-20020a0566383c4f00b0046e2fe3a1d8sm506015jab.20.2024.01.09.00.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:11:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:11:15 -0700
Message-Id: <20240109081115.4065619-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704787878; x=1705392678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=53IVskJShjOyy+hPHzwiqUAfwzNhHmdWWLrZoXzRItk=;
 b=ikdr0/lyPz/N0hrS/Xs9l6x6pki+S39y4TYXRNKpvGCSBOZYhQHk1+t1cmJLuZg7zV
 Kho0SynZq8VacTlSDqsd2zU+DETxIcSkkuTDbX2CVyXY/v5aZvhIPP6UaOgCjEW9dR3u
 Kd8NSOv/+wVoeoo++XmRxWO0EVjL/2kXyq/8I4zbSdLHHlTPtfdv92g7eHUrwZVCmCjQ
 zwomHZ7+RWmEPw8YpAgYVDDuvNqrxdXMQxOjStd9KzK21YM7C8WObNakm0h4xn7zKg2e
 rfkAqIepQeZsQ+ZWSCJZU/iuNv5l9B1efC+T11TK3t6g49b8NyaEeR49xd+iv3OIiU4x
 /NCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ikdr0/ly
Subject: [Buildroot] [PATCH 1/1] package/python-hiredis: bump to version
 2.3.2
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

Hash for LICENSE file changed due to license change to MIT:
https://github.com/redis/hiredis-py/commit/1e29dd4719a44092e8317d6cddb8075a4a143e0e

The vendor/hiredis/COPYING file remains BSD-3-Clause.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hiredis/python-hiredis.hash | 6 +++---
 package/python-hiredis/python-hiredis.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 372f2f50ae..ad33295ad7 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  670a932c2972cbd88f910c2b29f85c3c  hiredis-2.2.3.tar.gz
-sha256  e75163773a309e56a9b58165cf5a50e0f84b755f6ff863b2c01a38918fe92daa  hiredis-2.2.3.tar.gz
+md5  8823961dc3ba19a6e63ab6329b3b852f  hiredis-2.3.2.tar.gz
+sha256  733e2456b68f3f126ddaf2cd500a33b25146c3676b97ea843665717bda0c5d43  hiredis-2.3.2.tar.gz
 # Locally computed sha256 checksums
-sha256  65d467915fa36249f60e6942c9d44dfe54d75882e6b66e94fc6c3971fcde1722  LICENSE
+sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 5aceb15ae1..d86fb109dc 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 2.2.3
+PYTHON_HIREDIS_VERSION = 2.3.2
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/b0/04/dab6792584fc548803ffa50b5bb2b99f01d3ab04d7c7f64e85f1a22fb847
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/fe/2d/a5ae61da1157644f7e52e088fa158ac6f5d09775112d14b1c9b9a5156bf1
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
-PYTHON_HIREDIS_LICENSE = BSD-3-Clause
+PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
