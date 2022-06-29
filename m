Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4DCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 12:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1598612E9;
	Wed, 29 Jun 2022 12:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1598612E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFbt0WDi9vBM; Wed, 29 Jun 2022 12:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8555A61309;
	Wed, 29 Jun 2022 12:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8555A61309
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9691BF407
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85B85612D0
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B85612D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_8SzJW1RRME for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 12:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F4D60E3A
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90F4D60E3A
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:08:04 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id h20so10113064ilj.13
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQqrYsIFw1iuQcVHgRq6u9V8Df4fy/0INbC6nsRzNpM=;
 b=xPAEW9rBIF/JhUtWy0pd8Nia2p7GbPgct8kyMZJ7FovGTT1Y/2Csezn3m0tk4H7q0+
 TP1ACAYobV/1iQ84Sw9TGBqPrKlASRtUeK7dS0B42HqoLyxz65HNBZ5J7mNKH/M4jdLw
 Rrthn8MvVP4a1EHFMh7UG7EU1jVlRTEt65jk01K964pP1+H72BoFxBhBpZToeOuD0TYM
 FvRt2LY860/NqYUhxpLQTp5DId3S3ylyXAN/+BXv7MvoWmY7NEuJ6nUe2+LPp4kxCoyl
 PuvfTiI2wDWaoNS+kbBDcwVDjrW2DJfCtJJboo0T1UohN/houKH1thM3dj3lj++Qca0C
 yZbg==
X-Gm-Message-State: AJIora8tB1gBSUHmsgkWEDW6lftth06PxPAo699+5kFU8nR+BdW+4aSQ
 tE40QKCOHCLYJyd5NDEBnzsjs9MJJIM=
X-Google-Smtp-Source: AGRyM1u9VgG0tWFM18oJPVjICagzqUXLbQneE89ctQVmVMdO2oiMWXfm8x2/3GOqYpUptE28q3tLYA==
X-Received: by 2002:a05:6e02:190c:b0:2d6:5c98:d0e5 with SMTP id
 w12-20020a056e02190c00b002d65c98d0e5mr1684861ilu.193.1656504483554; 
 Wed, 29 Jun 2022 05:08:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 c13-20020a02330d000000b00334748f85easm7302583jae.106.2022.06.29.05.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:08:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 06:08:01 -0600
Message-Id: <20220629120801.2344395-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQqrYsIFw1iuQcVHgRq6u9V8Df4fy/0INbC6nsRzNpM=;
 b=oVVS+gL0UmVS5MCIxdKuv3rlOjGtKdqI9eeKCaufJbikO0uR/Pscq8BFLhv2RaAINm
 OIahnfBmvcbR6L2aYJ/atRk+i2WcLnoLDk5L5YGls3/9wu2cmFPoS6XvvqBGCd8XjQvp
 FeS5jRxyWTAfZEXViMYm/LjS00vYWCzN6mOoyeouVIgMMLHbdV34sJmpPLLaLO7zzVFm
 /xj13399tnX6ABss22ckVkovNZdmC6tjERcJyAWRi+l4MbfFTJkwgDOx4XMR6w4w/WXm
 8edFfcoi/xPz/lE0kqN4guwrFzo/6SpVPZwKfNeh2gTKEHmfdVTfhP03Dvznm1EA4OvW
 YeIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oVVS+gL0
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.15.0
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index bb257499af..97c5e79024 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  55f8c1121335891c7e972b73c15369ac  pycryptodomex-3.14.1.tar.gz
-sha256  2ce76ed0081fd6ac8c74edc75b9d14eca2064173af79843c24fa62573263c1f2  pycryptodomex-3.14.1.tar.gz
+md5  683580f8f464348397a41ebabb5511a9  pycryptodomex-3.15.0.tar.gz
+sha256  7341f1bb2dadb0d1a0047f34c3a58208a92423cdbd3244d998e4b28df5eac0ed  pycryptodomex-3.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 067516fc84..8f22bf3ef2 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.14.1
+PYTHON_PYCRYPTODOMEX_VERSION = 3.15.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/24/40/e249ac3845a2333ce50f1bb02299ffb766babdfe80ca9d31e0158ad06afd
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/52/0d/6cc95a83f6961a1ca041798d222240890af79b381e97eda3b9b538dba16f
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
