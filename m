Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5DDC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0047960A79;
	Sat, 10 Dec 2022 16:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0047960A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIhGh8Q2ySET; Sat, 10 Dec 2022 16:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 380C360A47;
	Sat, 10 Dec 2022 16:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 380C360A47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7341BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A2F2817B3
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2F2817B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CX0R-8py-sPB for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:27:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C700815AD
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C700815AD
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:27:23 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1447c7aa004so3408104fac.11
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CpvvJ+bn2OGLFlAc0GsIP3bdn4n5nDi1QF0TktBQHKg=;
 b=bdgVSSnqjYNhBaeiG40C5Yt3biiqhup9cWad3gzQ+stdfw7Xp4hd5xGLjuF0/+BxU1
 BPHZ9v5o6EwxhF+8hPkLZRiCrk8GoZpxkJaOvFhcjz/CBXlbQal2eSPQEwu9ALVRmJQL
 NVKXo2W9T6bJfHxlmPFMdy/iiPDXDcwA/70SynAekGYlT2KRF9sK8SyM+DU7SOyxsUSN
 n5pXXJhimweOPw5HOBf4obZIve8QiOwPcUGR00IWIFD0cOLtgllotakTmpZPayl+h/S0
 EbQFw6HmCCIt0/pcNbqqnUYT7BeM2A+Lxm/4QpMNyt9UiPdyMw9i+dbwicgoM7B8NvOa
 /voQ==
X-Gm-Message-State: ANoB5pn6c8As0WH9NsjS9CoLOzSFCklRu2/a89MRtVmxONBuqYmfZasS
 XRIiFgu54FIUL888QFGNzGxxkFPrXkCmjQ==
X-Google-Smtp-Source: AA0mqf4Edh4Vyyauflf2O9dkecPDZb79aJLcckM810vrf/aHRNe4OKezJlUkaMNB7K9S/VNjZP1eag==
X-Received: by 2002:a05:6870:1ec7:b0:143:e0d7:7427 with SMTP id
 pc7-20020a0568701ec700b00143e0d77427mr5442646oab.17.1670689642341; 
 Sat, 10 Dec 2022 08:27:22 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 a27-20020a056638059b00b00389be83f294sm1464175jar.133.2022.12.10.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:27:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:27:20 -0700
Message-Id: <20221210162720.2479265-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CpvvJ+bn2OGLFlAc0GsIP3bdn4n5nDi1QF0TktBQHKg=;
 b=BRZsTeXPJOl795HENysYj6MCBu7nGqYEHCKQQhOLnaGtoyZwWTpo5cxQsbV0suErE4
 zJD85N5MvG9zDTS9qM2hwPo3Yy2tBRLPdJnZ23jzBvaJ0dfzhY36AAKh+F9Cdh5y07/i
 Fk8018jB/58O6zzXugiqEbpcBT5FtL+KcDqAdHju2p4VoO4kpy5/sbFj4jEL+mNggem3
 t2jAujXo3KSbbq1eIbMKmE7Sc/I1L9BcwWbXkGHsyniHLUUfdVJGiKZ3rv5s6UtuOH30
 M9RScDHn2aBmYTULJb9fX7oc28K6a6WEjDPAG2oi5isvHJRK7ty9ihMBOzVozYGo4YiF
 WTpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BRZsTeXP
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 3.0.1
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
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 32d8a22e66..a70499917a 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  169527085be8e6bb7874164c24481eca  charset-normalizer-3.0.0.tar.gz
-sha256  b27d10ad15740b45fd55f76e6901a4391e6dca3917ef48ecdcf17edf6e00d770  charset-normalizer-3.0.0.tar.gz
+md5  12ee1c8bedbfba84e99db46d5d94f411  charset-normalizer-3.0.1.tar.gz
+sha256  ebea339af930f8ca5d7a699b921106c6e29c617fe9606fa7baa043c1cdae326f  charset-normalizer-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index b2c42a74b8..95c55ffd3c 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.0.0
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.0.1
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/fe/77/6d5d367b7cfee812a88573e80bbe25cea2d015ed2c3490e4464951ff3232
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/96/d7/1675d9089a1f4677df5eb29c3f8b064aa1e70c1251a0a8a127803158942d
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
