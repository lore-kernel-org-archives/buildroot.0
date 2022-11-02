Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2120AC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 23:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BC6E81EA8;
	Wed,  2 Nov 2022 23:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC6E81EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FK0-Mz4kLPjx; Wed,  2 Nov 2022 23:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDCC181E53;
	Wed,  2 Nov 2022 23:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDCC181E53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 001651BF46A
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC5F940112
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC5F940112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjAOEWTxbere for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 23:44:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE04B400D0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE04B400D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 23:44:01 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e189so128324iof.1
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 16:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3jzz2eP6J8f1DluclfwFMDFnThdQVarlrzrc/kHxWj0=;
 b=2pZCaK4Z2gi79/+FoWLQbVNt/rNM+KRXPe1F6p0Ra9hit8oFDQc65REclD48933rY2
 gSuJL8zdhTFFVhU55N2LJUOzfzhARHoyDR1j/Y2WckrAHNbLyc2QtwTUAY0HOFx8NZm/
 tZh8pIzyU8rH/29RbEolChpKGsur8LqVXaRtI5hX2VbMk2SePVbAjCWP3EA6lblyqFZn
 3xVEJrhytsBVF9dhu9U2GSHiPM1Na1VtB6daNsmOano0+myv+py+g5NN1Des2GvDC3lx
 tOZs1U6z/Ayek723fsO7wYSsTG4PctrcpEMa/xASVcb9rePXqLmjJOuDj9/NnxOoTg2o
 3N0Q==
X-Gm-Message-State: ACrzQf2UMAsEXwUa0nAfClMXqZDNuAmmCDpLO7awatPzjlyXHF78f3S5
 iwwolMOj7Qe2Ub3Y3rz+mwfRShvzLGV1Ag==
X-Google-Smtp-Source: AMsMyM5F+yxr/UedUbWhqzRIXmJk+09p1D3E/xLBcvzBMg7Rn7mvGV+DBXt9IUJMHiCcU9zmU4nrSg==
X-Received: by 2002:a05:6602:2e96:b0:6d4:fbcc:b54c with SMTP id
 m22-20020a0566022e9600b006d4fbccb54cmr2589667iow.202.1667432640424; 
 Wed, 02 Nov 2022 16:44:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 g43-20020a02852e000000b0034294118e1bsm5378130jai.126.2022.11.02.16.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:43:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 17:43:57 -0600
Message-Id: <20221102234357.3591773-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3jzz2eP6J8f1DluclfwFMDFnThdQVarlrzrc/kHxWj0=;
 b=eCZO1s4XCBwVzcLI2U8eeGSr6ycNpWTLQBKJGqtECO525ikL1R8lazUqhuC2sQFyIA
 NgcDPVga9OxcrFWYFZhPV0qAIALigHpSe18dXkDFDH+jg0bfZYvVmVaXaWNnW7L54ZDS
 bzaq3QkkFyUlz/xvVcpyMHDIS88sY3gW3I3CQ27VffsjNT/IXVhvFg7NMiIAmu2yaVWO
 JjOGkVNCEcruE2cvCBDWrOJmvA4dITXQ/EQD27WrlDARjkmpQpMz6WsazqGi0FLeFJNE
 KvReVI/j5LchYfIVkJ1VJP3Ar/gUWkkjBSx72Inoe+jrKndFx1Vbg9vMjpM4+SWUgibS
 0xNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eCZO1s4X
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-classes: bump to
 version 3.2.3
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

License hash changed due to line wrapping:
https://github.com/jaraco/jaraco.classes/commit/7558cfe2eb2f1ffe3676905e9871466cbc9da24f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-classes/python-jaraco-classes.hash | 6 +++---
 package/python-jaraco-classes/python-jaraco-classes.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-classes/python-jaraco-classes.hash b/package/python-jaraco-classes/python-jaraco-classes.hash
index 088ee2269e..0e170d58d1 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.hash
+++ b/package/python-jaraco-classes/python-jaraco-classes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.classes/json
-md5  63d4f5a2df2625ec3979c9633da1505e  jaraco.classes-2.0.tar.gz
-sha256  dcc2c4a8ca4b344cdbf2e1be7124a5c4f192574cdbb453b62350ae8240a2caf5  jaraco.classes-2.0.tar.gz
+md5  a661acdae43995c08500324a8df62f03  jaraco.classes-3.2.3.tar.gz
+sha256  89559fa5c1d3c34eff6f631ad80bb21f378dbcbb35dd161fd2c6b93f5be2f98a  jaraco.classes-3.2.3.tar.gz
 # Locally computed sha256 checksums
-sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-jaraco-classes/python-jaraco-classes.mk b/package/python-jaraco-classes/python-jaraco-classes.mk
index 7455ed4d44..4790516330 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.mk
+++ b/package/python-jaraco-classes/python-jaraco-classes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CLASSES_VERSION = 2.0
+PYTHON_JARACO_CLASSES_VERSION = 3.2.3
 PYTHON_JARACO_CLASSES_SOURCE = jaraco.classes-$(PYTHON_JARACO_CLASSES_VERSION).tar.gz
-PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/6e/27/f6ce0863a6ce574922ffe70d63c40b9771aefb686cb595cf435d184f0ca3
+PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/bf/02/a956c9bfd2dfe60b30c065ed8e28df7fcf72b292b861dca97e951c145ef6
 PYTHON_JARACO_CLASSES_LICENSE = MIT
 PYTHON_JARACO_CLASSES_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CLASSES_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
