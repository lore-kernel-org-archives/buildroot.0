Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E49C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6295D4012A;
	Wed, 10 Jan 2024 04:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6295D4012A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86i2zfvp8SfP; Wed, 10 Jan 2024 04:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B31C94177E;
	Wed, 10 Jan 2024 04:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B31C94177E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 224F41BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00678435F3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00678435F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgqo7Uyy8UVg for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:42:45 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAA03435AB
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA03435AB
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7bef3d20395so17104339f.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704861764; x=1705466564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDG8Z5kYqRlJx3eQGUgrWKysVmLtPwCWsqANlFdCALs=;
 b=bhLR6Cq6imLa9+TDrn1v9vo4HAWMSWn0cl2cSgIm49DnnfihHo2RUKoE2TQxlNBR9o
 nn7CdgOanOBSsDowPYrNyfuPSAAgMFcn+mGW6c4LV+RgJ0Zind1emmHKdev+Y487ctvu
 nHLVPhHGMK2T6N5p+e4cN36/vDWV7LMUoEHOcc4y1KYblKXTYMd1TP8z9dQoGqxFNPSS
 x4NrGamwlhUh+EV1XkfIUv3SHQ9CR4eSwCXySxgQdFXhFzNwo7KWIw44tndCMkxgp2jP
 rhTj2pookUPlK2/64wUBniRrV3cLitm875vdh6+ZO+DKxGZYpsb47ylQv3pfwCZIHlWA
 ovMg==
X-Gm-Message-State: AOJu0YzHp2SzFz6qv29dHXKmjuuNngFaYcy0iPs+8GdpcM3+JXLNG6Va
 JOFlrGHSOz/E+6OuFLx31w3OkhK7RhvA0g==
X-Google-Smtp-Source: AGHT+IHOi7ARZb18mbDTGwCwe3PZu90Jfmy1XdhN7WOOp8arBFkyzfJiBG/vHUs7IK6rlOo6LWA3Lw==
X-Received: by 2002:a05:6602:1b16:b0:7be:eaea:ea83 with SMTP id
 dk22-20020a0566021b1600b007beeaeaea83mr186990iob.11.1704861764241; 
 Tue, 09 Jan 2024 20:42:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 k34-20020a056638372200b0046e29c56401sm1080425jav.0.2024.01.09.20.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:42:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:42:42 -0700
Message-Id: <20240110044242.1080333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704861764; x=1705466564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kDG8Z5kYqRlJx3eQGUgrWKysVmLtPwCWsqANlFdCALs=;
 b=WRDRYHlrI70j8qH26yepOPjtRwmQI7wnLfNkyS1+z5k0mRt+vG04WeFdqt89wxYszL
 cH9Ma+E/KyIIefm05KK+jIfEmkrqzyzt5W/CuD8+JVFMSya+dZLLfPD5LXlk07m5qLgX
 x6y7y3z5NPRdNM8/Jr5xBZUSq3UKvACUJg/lH2aEK3l7QrpEV+bqMOzNeIgD59m96+HI
 vn62eBF8lhqBhUSkDjWkCT6TsZK7IfpDjbJ99j7jg2PLudEtRlMwQzgY+OTixOd66Kj+
 MYqW6DBkT28EN6SRkoCU4bW8OLqoEbLzYg/ltIPkVzFha/KRJsCyDneJb2TuoKZf1K3z
 kJJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WRDRYHlr
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version 5.9.7
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
index f388118663..c5f4f39fe0 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  eec35090e7474e471a12f0dd16c981f9  psutil-5.9.6.tar.gz
-sha256  e4b92ddcd7dd4cdd3f900180ea1e104932c7bce234fb88976e2a3b296441225a  psutil-5.9.6.tar.gz
+md5  afcc40a779f84f6d909570a8934cebc3  psutil-5.9.7.tar.gz
+sha256  3f02134e82cfb5d089fddf20bb2e03fd5cd52395321d1c8458a9e58500ff417c  psutil-5.9.7.tar.gz
 # Locally computed sha256 checksums
 sha256  b89c063b3786e28e0c0a38f1931db61fed35e69dd2a2966fbecffee0f46c8d10  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index ece1039a51..e83193f20f 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.9.6
+PYTHON_PSUTIL_VERSION = 5.9.7
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/2d/01/beb7331fc6c8d1c49dd051e3611379bfe379e915c808e1301506027fce9d
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/a0/d0/c9ae661a302931735237791f04cb7086ac244377f78692ba3b3eae3a9619
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
