Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122CAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9101D81B01;
	Sat, 10 Dec 2022 16:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9101D81B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rz6eiY4Tdzwy; Sat, 10 Dec 2022 16:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A3481916;
	Sat, 10 Dec 2022 16:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A3481916
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29E321BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B184400AF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B184400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCUdCZdWFR4F for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:43:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1458C40017
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1458C40017
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:43:00 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id g7so1426224ile.0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQEYrOuO2A9DtPu4wC7aY5LN/Ry/VgwOgOXyiKXNugQ=;
 b=OMTlbyyaJQ6PZMv0+oGT/V3LAsYgmRQfb7DCGjDYsmq5xRgqYBRph8c3tKecezB4LR
 A+cgYcjzTwdFUrzWYA0Y03uxPn2gV/QaVWjTK/+A1bsrGBESgPCVxS7hxhdV8i7sZyYP
 I7kAmNHiOkv0llErzmjx/qSYizQlIZcwqtIAle1dmGtGv3/6WMJ/G7D4UFQ23Z3nogqg
 /vT8TT7M0CdTeRBnUchFNuhXu3vfiXcASsQBBaL69x988iSo+xTBmHSKapZHx6TRRMgK
 CHQa0OluD3RdOTXF+1ULO47zZBRPDLXoOf05D0R6VVcpVVbLe531cwjenWt7W8XHbvTu
 uFRw==
X-Gm-Message-State: ANoB5pkfSWDot+/9ZYkZB75gVgdVj7tuavgIMe0Rtkd+1N77A7zlIcPo
 MsZVeVwEYskqduOe23XwiT5dY9tT+JFqIg==
X-Google-Smtp-Source: AA0mqf7YauYT3rtBHofw80Lo3SiVcv2uXaPXkrdH+lwkuzAaXJOTaKGw1yrIk3Jv7SVjtcLXWPfdOA==
X-Received: by 2002:a92:dd0e:0:b0:303:5302:c127 with SMTP id
 n14-20020a92dd0e000000b003035302c127mr6446714ilm.4.1670690578874; 
 Sat, 10 Dec 2022 08:42:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o134-20020a02228c000000b0038a6b67befbsm1529736jao.178.2022.12.10.08.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:42:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:42:56 -0700
Message-Id: <20221210164256.2523317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hQEYrOuO2A9DtPu4wC7aY5LN/Ry/VgwOgOXyiKXNugQ=;
 b=lhOHzI9gV3/kqL9+Fgeh5ilmQbJYwgHB8WQzafmliU72UluhG63GdRYu7cF59lRwoJ
 iCYZVh1/70oRR/hksfn2W6TLfD6dxkbt0HxAkIi/+Kt/sJZ5zMqI/SnIK4FuIMzMn+TJ
 nAaOdV/6Mt5CAFZ+KSVv8fYRGeof1NPiY5zWtkHA4B8PwozrmKQpcQhdrnV4qR6I28JB
 hI3S4IX+RCH8r4Un9s7C0tVng8M+w2xstmQrxhs5rMtaaN5GCgyw9WcYe087NGM8QVVd
 9S8jeDreS03auKrV+IOISsnTIGKZnbjuPZoBJnrAsszbKaNUJG5Ul3ebBnvFatMjqOhw
 WRpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lhOHzI9g
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 38.0.4
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
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 40d217f666..a01c8810e3 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  cd0b4536eabc6fcb80aa03430fc2ca485d33249eea0cd23f76c1dd9da410c66c  cryptography-38.0.3.tar.gz
+sha256  2abbeb6d42e8844de036bf2e0d78a42feeee1d57ebf29a07684490f98bdcab37  cryptography-38.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 69eb90d795..4254fa3557 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 38.0.3
+PYTHON_CRYPTOGRAPHY_VERSION = 38.0.4
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/13/dd/a9608b7aebe5d2dc0c98a4b2090a6b815628efa46cc1c046b89d8cd25f4c
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/e3/3f/41186b1f2fd86a542d399175f6b8e43f82cd4dfa51235a0b030a042b811a
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
