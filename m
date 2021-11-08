Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC56C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:27:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17FD6120A
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A17FD6120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0AD6083F;
	Mon,  8 Nov 2021 19:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id szX27CtsvJT7; Mon,  8 Nov 2021 19:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E0F96083C;
	Mon,  8 Nov 2021 19:27:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA03C1BF311
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C612680DC6
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HeykhlSIh3i for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 19:27:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2854B80D7C
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 19:27:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u1so28774565wru.13
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 11:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uy7ehZfgfO/FsWDcAKx7nah+nnTX2mCMiCqwxMk9vyc=;
 b=o+Url7Hm8zWggxBS2MY8UV1/4YXjz7ESTM6ra77NN4MusDiFP7qhsSZQ7/5f/L+ZgK
 IaVJLxpv/2J7VtWMqk+/eueVSqAVTFXyYzxaPdhI5yZ38ITHAcM6nhJ2ckrN2irB8Fvo
 Lu5cMxa4/voKDzkh/cbLBp9uemqab6AGINi7j2nODrkyk7KOPgfXzapMCLOG8HpGUaqD
 bWRzvwHfGuL27AMbE9UxmJOpqdKLbjkafJH8cwPHdJHo0A3NBLiVyil7ryNBE3gWPYnw
 maJaYQZLhGso12Hva7smMnfwKUOY5Gg0hcgaqBE9sPKPh9NxhW94aalfbb+pNzyTkvCr
 4QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uy7ehZfgfO/FsWDcAKx7nah+nnTX2mCMiCqwxMk9vyc=;
 b=huFDnzzLsOhMJLibMykzupUVN/2C6QeALIsm2VMOQNk/RkY5zD6iQSj7XbD6VL0Eby
 ixLp+X90VDdCYj6ZkXuMk0catDYboITRZd7HHLVrLm+Lz7r/7vBRpovrPKPaQHC8tEjn
 9W4Lj5rJqGbC5n73b2AyVpPQeziOqRAvpK0OiFuZFVEHi12CZXIpjYlyVRw+phFHOmOI
 l+VDFbPnC5e47uOHjs8LNadDo8SWOxCc5PFQXdt6eU+ZXdHtegN/S/MH4e+jIsH+4bL2
 oepM+ssEKc9PunYY3qsIUauaA2ISXvXuXL6BzGpahDqnJA9ete3LYEjsY0fujeoqJAIX
 1lVQ==
X-Gm-Message-State: AOAM5323eDK9id387t6ooTHjasjyLAuWFJs1evFKBIh/dTMHGuKkmxsB
 Xtb0pJ+ZHAfSKzi1Exc3WELZ5w8apY9ojw==
X-Google-Smtp-Source: ABdhPJwgFR+4YM1zDTq226F7WITihlLbHf+L5RaM+LeQ3lTetFrJ67jzc9Wp1if5b9Pd+kfyz8p0qw==
X-Received: by 2002:a5d:51cb:: with SMTP id n11mr1878125wrv.278.1636399632115; 
 Mon, 08 Nov 2021 11:27:12 -0800 (PST)
Received: from menoah.home ([2a01:cb19:190:c500:f823:1d08:390b:d00e])
 by smtp.gmail.com with ESMTPSA id r1sm256016wmr.36.2021.11.08.11.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 11:27:11 -0800 (PST)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 20:27:05 +0100
Message-Id: <20211108192706.456116-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH]
 support/testing/tests/package/test_python_unittest_xml_reporting.py: fix
 flake8 warnings
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

support/testing/tests/package/test_python_unittest_xml_reporting.py:3:1: F401 'time' imported but unused
1     F401 'time' imported but unused
make: *** [Makefile:1220: check-flake8] Error 123

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 .../testing/tests/package/test_python_unittest_xml_reporting.py  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_unittest_xml_reporting.py b/support/testing/tests/package/test_python_unittest_xml_reporting.py
index f08c88e3da..446c231a00 100644
--- a/support/testing/tests/package/test_python_unittest_xml_reporting.py
+++ b/support/testing/tests/package/test_python_unittest_xml_reporting.py
@@ -1,6 +1,5 @@
 from tests.package.test_python import TestPythonPackageBase
 import os
-import time
 
 
 class TestPythonPy3UnitTestXmlReporting(TestPythonPackageBase):
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
