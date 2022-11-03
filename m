Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E455CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B02E4032B;
	Thu,  3 Nov 2022 00:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B02E4032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnQkTYq0qtDC; Thu,  3 Nov 2022 00:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3C4B40112;
	Thu,  3 Nov 2022 00:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3C4B40112
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F02901BF95F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB72C60B70
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB72C60B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIpIi-MSEyMg for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:32:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D42D1606C6
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D42D1606C6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:32:05 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z3so187397iof.3
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A+yS4LLHC8EbAKXHbBKpaIpJQ8IjQ3Ih/SkzmeEf07U=;
 b=hGctfiW9kuPmOk8A8NMV4uSlW9KDOPifWlV0kEzYFbMvvF6dOgfcBkxjcP4H3ISPJ0
 OAPVsnQ6rlCxq/IxZ+45OlK0AFya4yKThOpuocZBz0427iSsGgAaCMSReVcbJCr3CgJs
 Fs3sDihypY/oapnGC3Ool1fw7AfnTh5Kx77PSShN4bbttHz0Wv7OZAIUJ7waCpVNUi6c
 X2MgJrHg6f0g0Twcb3sF+II8ycoXSLIjDtqqw4Ge9UrrxFMF/LHyur2sPXRZXJPkCPU1
 plkjgiojT3L6qIHaW20AzDELZN6HDCrBy5rKJ0vlUgxaIP3EghpI0lM8dMNAsTgLhgFZ
 pKwQ==
X-Gm-Message-State: ACrzQf2YAkaA79haoeck10j5ROftyoS8r87NuK9cOV2jd1it9tiUm2Ih
 E/iudljpT8jzKuo5539gBidt1BhcdbMaJA==
X-Google-Smtp-Source: AMsMyM6jgtqQheVjdyKimRSJOBoKK7EyfyoUGHaM/US0ZgRrV5Se8KCyEkt+hKL7FjNxhY+OpXqVAg==
X-Received: by 2002:a05:6602:2ccf:b0:6bc:d52f:a323 with SMTP id
 j15-20020a0566022ccf00b006bcd52fa323mr17962291iow.152.1667435524632; 
 Wed, 02 Nov 2022 17:32:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 a12-20020a02a00c000000b00356738a2aa2sm5303363jah.55.2022.11.02.17.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:32:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:32:02 -0600
Message-Id: <20221103003202.3007879-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A+yS4LLHC8EbAKXHbBKpaIpJQ8IjQ3Ih/SkzmeEf07U=;
 b=S1aruzTQUIy13XAb3aWT0yursNzCt2O01arY3DADr0wydjfue9Ioa9YwvvsnTadEea
 5Og5xp8d5LuP84w5DNUxB6cwGiziMTL6LfwvOZ8B5OjfO7QzaLDqsBkdRBPjCd6z2BXW
 VMR2pVlW8Nvj3IR8h5AN4VcMVBrheYT4XY+mc2Kfyh1wv1Q2CPOgseejQ1xOOkiRYOt9
 MGcIzKW0FMueomfkW/U8WWoh6RVT0mhPNelysOA/v2z7j4dIVJ6lic4Pt64pg1yNz5qA
 9+Clx1LWuvn8LM1Ksj8lrPoVqFdLKIuCXcbm1sbpToiK/JOa6V+18nDUa0YD7PywbEIK
 5HaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S1aruzTQ
Subject: [Buildroot] [PATCH 1/1] package/python-mbstrdecoder: bump to
 version 1.1.1
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
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index 90b9abb8d6..dd2f412bee 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5  b32ff478a38730a8ab0b884fe162cc41  mbstrdecoder-1.1.0.tar.gz
-sha256  f4dfd549e424ad8dfc985e6af8b55cb4ec0c208782f610d57439fe6a9a44c244  mbstrdecoder-1.1.0.tar.gz
+md5  62efa113a3cd2d40942359d6699338f7  mbstrdecoder-1.1.1.tar.gz
+sha256  0a99413b92bbaddda89d376f496d710dc7131417e98414a756ebcd41374e068d  mbstrdecoder-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 63f9af74f5..f875e4d71d 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 1.1.0
+PYTHON_MBSTRDECODER_VERSION = 1.1.1
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/6c/10/f82ba5a91489c91bf6adaa0e1aca38a7ab2d1d7d80195a5f6ad8c2ff387a
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/ba/ac/ba46bb6eb6165541ce25ff230469efe1c04043cf173f856dcc91876c38de
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
