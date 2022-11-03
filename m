Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD2AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD0EE41852;
	Thu,  3 Nov 2022 19:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD0EE41852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07W-AF6hiycK; Thu,  3 Nov 2022 19:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85CE94184F;
	Thu,  3 Nov 2022 19:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CE94184F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0A11BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74AA581EE0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74AA581EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w937CRjrmQgf for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:12:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D9E18174A
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D9E18174A
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:12:46 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 11so2211035iou.0
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2ozp6b5ooh82cgp1qDQwwIwJDW+VbHrKESeEAuLijc=;
 b=c/W4brr5UINv+8S/AqDxOd9e3gVYbtg6ryKRn8Z62g/ZJ/1J6+irfjiW+148XzCVla
 ejpazY10rdWYn2smseNDABO68Y/PbPrUT3fTmWfMqjSqN3DVI4wgx35mb9WkRPsZE/JE
 moZAObJBvao8H6E9ia6WyifLrN9pCsnRSq3ZA+IQWop8rHc6g5WqKZGOe7+VXULbN2JK
 AXa9vazpahatqVIzEOuCjLjAg6+cR5CVSdA2NsQrSP/vGZ4lUaP/3zMDsr3B8zLjjYwp
 LB0ucFQbD8uyBS1k4yYlyXSLEObkYiJtWO14UU7EvJPk4PSmRcUwJMyHu+vvtx72zO/0
 Wjpw==
X-Gm-Message-State: ACrzQf17fhOx9xpeuxKEiQCN4kC0sYDzhlwGzebE1st3g5IzzBtCvd2V
 UpdHOIoQdOc4V1w0Lax0bnKMa2uZ+Sv+A2Zs
X-Google-Smtp-Source: AMsMyM41zPR4kEw2pKc82zYiz4UyeJPG56By7cVd9NOxGf3zrCWVu7yRImAysrK2RMTshglLXLFPAw==
X-Received: by 2002:a05:6602:2cce:b0:6d6:8c09:8ca7 with SMTP id
 j14-20020a0566022cce00b006d68c098ca7mr1631761iow.187.1667502765389; 
 Thu, 03 Nov 2022 12:12:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c2-20020a023b02000000b003759b13c639sm452978jaa.97.2022.11.03.12.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:12:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:12:43 -0600
Message-Id: <20221103191243.4018939-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p2ozp6b5ooh82cgp1qDQwwIwJDW+VbHrKESeEAuLijc=;
 b=AoK5FOZDThGPvN+UX7G0tvmXg43cqN1rIqZJbrozNaOMjOdv1FsLO77zyOQtMvlHFu
 mQZQQkj5I0JqwbijpubTLsA5vtOXeqRL22A2F/6irghXObj6vc4BEAAFoh7tV2X3kZpm
 q65y3zvrsE5Q3e6pF1qKA/OtUNIM8C5tEKBe70nK7pRIj4CG6/+ivnLww3YFVhHj6D3C
 RReMaPCx3M6XKLgeum/tomMJlSCf2wPUQIFdP3lRGT2z1kOWODPwQjCYmSXBikozi0O8
 hptpaNLnMi+3tR/fASx3RF6UtTZtOO+YCxk5BlXHidkaNKK3JoOaSk0T3YyIheWbxVub
 csWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AoK5FOZD
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 1.10.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index e9fda822ae..729ffe94c4 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  6dc8c7586d95f7679c7bf7f749336cf8  sentry-sdk-1.4.3.tar.gz
-sha256  b9844751e40710e84a457c5bc29b21c383ccb2b63d76eeaad72f7f1c808c8828  sentry-sdk-1.4.3.tar.gz
+md5  7f31bd0d6d968c711f8b1d928836eaaa  sentry-sdk-1.10.1.tar.gz
+sha256  105faf7bd7b7fa25653404619ee261527266b14103fe1389e0ce077bd23a9691  sentry-sdk-1.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 9238b7fb1c..d8e9e8a2c9 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 1.4.3
+PYTHON_SENTRY_SDK_VERSION = 1.10.1
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/a7/30/1d967b2e0cac2fa388344b2968fa57e69d5382b922e57cda43af54b9063a
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/43/37/89598a56119199b69a3c4b13e2ce1b57ff69f68313ed393016086d6b487b
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
