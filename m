Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C9C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 792AE404B3;
	Sat, 10 Dec 2022 19:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 792AE404B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2iKDSnJ67Mi; Sat, 10 Dec 2022 19:33:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5BC3404AB;
	Sat, 10 Dec 2022 19:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5BC3404AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 672EB1BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD748195D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD748195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vb8DHRo9xN0I for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:33:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 013338195C
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 013338195C
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:33:46 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id r72so3805737iod.5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=19wBuV9LfWybngYUpEZPC4zD5m1AZy6z1JQm5F/Gkog=;
 b=jVuOCmxBmVkvgxeeNourf1dwscgU2e6agkZ2rl/H0dkxHaKj6jYmgLqnQ16vrASq61
 2FQBIYB02rIny57pBzMXsm1DsuOInolCiRytncbqxFlgr6iCXcZg/z2i1wZ4Vq0x/axZ
 mnIZzGyXOOuKSR2rVpbjVCiyqzWmNiJBnWOwn5NqGBi96MpqYDKu6CCHMwHcfYNU3KeM
 UrSU4KcdTfUwPe/OyaRyciSGZikG14Y4r0OzxY2xlZtqYae3BQmtFyGPIT9pBPMACKw7
 NP13bpcl1+g1oNCN/tpZIdtUnzh/5hTJRfYaxAe5CV6m1a3wDR41JbI430+N14QVcbkp
 Aokg==
X-Gm-Message-State: ANoB5pkIeUmnNetJzEUdeJLPzMvkKkbF+VJKWXplO80DBUKp6D4D0Jbg
 MdKsh7g1XOfVYRbBw3bGb496pd4kLTALQvnV
X-Google-Smtp-Source: AA0mqf6UE4MFRLOX5Y3Ijdy/WyTIUqD2S9fjD6g6bFAGOeHkufvmGmIg8rHww5+Rym4qUtTHrK+jqw==
X-Received: by 2002:a5d:9ec5:0:b0:6c0:a7f4:50a3 with SMTP id
 a5-20020a5d9ec5000000b006c0a7f450a3mr7798225ioe.14.1670700825875; 
 Sat, 10 Dec 2022 11:33:45 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 b16-20020a026f50000000b0038aa3699c97sm213107jae.43.2022.12.10.11.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:33:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:33:43 -0700
Message-Id: <20221210193343.3140927-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=19wBuV9LfWybngYUpEZPC4zD5m1AZy6z1JQm5F/Gkog=;
 b=WqzAj4XOUp1b0uoATpm6nmKlaXCuj8jxETuraWfsIufLJsg9Qx+rfE6pj+y0oOLxUE
 OjEWhSyLcHg80qpznTiN1GMZLtnjRnMsCz9W76d5q3ThBQfxsBPtGc2fB5PsnrPBs5/X
 BelArjZZr6L8r3YNGyp9bp60CQ6dlFo13HPTBWQ0XCGsMoeWaRD+y2A4nvHdTed+hhZm
 QfYAp+aTuQ+U8p4176sgn0wAv0hVGU6wB6NUT4ivKbADyfSgs6pFTBNUh+uK0b8yKkhl
 mvB1yXizV74qiktWIpgHsF8wqU+KNQWLdGzviIT5fbq58wpUU/PMz4lYQ3gS+Gx3weTk
 mLrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WqzAj4XO
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version 5.9.4
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
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index c7b7e46ec1..15927562b1 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  66b847f94545e96b540518ebe19740b4  psutil-5.9.3.tar.gz
-sha256  7ccfcdfea4fc4b0a02ca2c31de7fcd186beb9cff8207800e14ab66f79c773af6  psutil-5.9.3.tar.gz
+md5  f72751d05b781757b7cd9bc375d2e351  psutil-5.9.4.tar.gz
+sha256  3d7f9739eb435d4b1338944abe23f49584bde5395f27487d2ee25ad9a8774a62  psutil-5.9.4.tar.gz
 # Locally computed sha256 checksums
 sha256  24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 578f69d3c7..e764d1accc 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.9.3
+PYTHON_PSUTIL_VERSION = 5.9.4
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/de/eb/1c01a34c86ee3b058c556e407ce5b07cb7d186ebe47b3e69d6f152ca5cc5
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/3d/7d/d05864a69e452f003c0d77e728e155a89a2a26b09e64860ddd70ad64fb26
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
