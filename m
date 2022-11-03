Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C15C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F18F61006;
	Thu,  3 Nov 2022 18:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F18F61006
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ogaxvfWOxzd; Thu,  3 Nov 2022 18:31:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2065761000;
	Thu,  3 Nov 2022 18:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2065761000
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8EE1BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87E9580BF3
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E9580BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvfVTNSVbGnk for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:31:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CA080BD7
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96CA080BD7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:31:03 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id o65so2084449iof.4
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndhaI+q24TcbcLB8YDbWNcWUdrc610DhhcAJevVqy5s=;
 b=CDmwRJbf2CBx6hGlgeipydRhq7Uu49Hs67K7q5P+PB5opssDBeZsw7/UZzrxLHaaSi
 2TWc+zEM9Mk2uPl9Slnb/mPjZqzSeG1CSUXg+f1Z9X15CBFGCmCd8c6zJjT/Fkee+XKS
 OoEP+uUzP24xwaesxT1oLr23dDZ+Y8ZyKxVHw1KHvg87dcDCtco4q0vpk9UndjdVxJdX
 1iIVcDwS3s8Y5IBNjMKWxYlQe3IriZ8PTXAZ0qOo/o0ofFUsdYpAvJM8BfHtk8Ogx/mE
 ICxKk5f+GQkCEd3j7r2rNfCfVHtX+TRhb8TdcUpz4PI52AsAdxWjtp2u+sibsAXJu8dQ
 jxjQ==
X-Gm-Message-State: ACrzQf07M13EpqY40RmU33VBRrBtQHApkBXhbhXqMz/RZlGjWo6oo0fR
 dlDP1BAtwuZM03P3/WmLuufluCyf3UyGWwaC
X-Google-Smtp-Source: AMsMyM70uMAEHyhvDb16bsKLRDNdPyBTrJ2Vdi5HWLsvHvQj/CAuy+3R5Giwuo+KXdH+0DT+RYijAA==
X-Received: by 2002:a05:6602:1616:b0:6bc:ac72:e6a4 with SMTP id
 x22-20020a056602161600b006bcac72e6a4mr19506870iow.67.1667500262195; 
 Thu, 03 Nov 2022 11:31:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m8-20020a92d708000000b002e939413e83sm540312iln.48.2022.11.03.11.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:31:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:31:00 -0600
Message-Id: <20221103183100.1247403-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ndhaI+q24TcbcLB8YDbWNcWUdrc610DhhcAJevVqy5s=;
 b=kLS7UMwXqU1kQmmBvrPWIs6C84NtCF9mv2sKwY58riBAj5P8O123qoa+47+K+bzc7X
 h919owmrH10ljAkpgNBv/TD31FcONeWxQQ0UBRLfNoGQU1wVXVJgP3f7HAiKJZO7DykG
 Z51hALZj2gykMd2oDPUKuaWkEFV/KwcNZ9BPQIRNqmmLJ7GtvViuPd2/03/Eec9O+2lb
 PvBhDaoNWYjzyGmBz6UZJcBv9Zy8HOcx7IJVzsQrvR/knHAN5/xs2o64xBqSp11SMuWa
 2SLcjlaaJiwCYVwLijyTJXk3U0GrkZO2gbbtMdkexqXl2PKD7npijlfM9FSS7Yb2ZPia
 73bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kLS7UMwX
Subject: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version 2022.6
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
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index e0f253902c..e71e77e5b7 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  d7b7060bbac4970afa2050c139c9fcb6  pytz-2021.3.tar.gz
-sha256  acad2d8b20a1af07d4e4c9d2e9285c5ed9104354062f275f3fcd88dcef4f1326  pytz-2021.3.tar.gz
+md5  bf46b54a7e9bcb65ea38f54646181979  pytz-2022.6.tar.gz
+sha256  e89512406b793ca39f5971bc999cc538ce125c0e51c27941bef4568b460095e2  pytz-2022.6.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index d606750699..ccf8e2179c 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2021.3
+PYTHON_PYTZ_VERSION = 2022.6
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/e3/8e/1cde9d002f48a940b9d9d38820aaf444b229450c0854bdf15305ce4a3d1a
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/76/63/1be349ff0a44e4795d9712cc0b2d806f5e063d4d34631b71b832fac715a8
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
