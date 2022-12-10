Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C479CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CDA081759;
	Sat, 10 Dec 2022 20:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CDA081759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kobQr1ZmuqKz; Sat, 10 Dec 2022 20:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B96816F5;
	Sat, 10 Dec 2022 20:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B96816F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4340D1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A77D410C0
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A77D410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfnPdqlKFeB2 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:57:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C8240934
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08C8240934
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:57:39 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id j28so1597942ila.9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1q/Fwz+3zvFNShqwLHtjMyE9Ocpeu3bbWZI74F+jehY=;
 b=Bb+6aPt47tJ//lNxOiAi9Oc/kAICW3Hm+2GdCd7C9jHzxk5nZNxvfLBzrFz+Ttfi9i
 fKL042KIV2qwRN0aRG/nl7t9aT2UYMbC4qcbw08q2F6Yj8lUcwEEyY1HJmkCEFEyjuKm
 oS9pbmZGJMElTfimyDZ6x0W8Hb4pO45U1nZdvcCbxGI6UJ/UVxWM9+7y0Jar5VH5YvrE
 nkbYCVDYu1oCG+4Unvk3I5ioFdMK0JO5BKNoP/TR7f158M43a1BfZ+ca2eCQYagfDlYh
 Mm28fR+LCxY/ch+x8FOrizKbV0woOiKGi3A/15Wl33XyUjd/iiyMNoBnfPBHP0UwD4a7
 q9Og==
X-Gm-Message-State: ANoB5pkyRQLHTzFjvmI4VdX6p0taaVhe+MV77lz3XLIxAasyNw8gyUD6
 pRw5Xc4UHlE/zCfnhXr2BHx8DVqo13g2Mr3Y
X-Google-Smtp-Source: AA0mqf4n8f5CWHe6Taku9irLKrilMpbfefXY+bnsRfVVeCDXRshmhBc2GYa+KxsypzdJ2f2m+FwTzw==
X-Received: by 2002:a05:6e02:e52:b0:302:afcf:d424 with SMTP id
 l18-20020a056e020e5200b00302afcfd424mr6329529ilk.13.1670705858941; 
 Sat, 10 Dec 2022 12:57:38 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e101-20020a02866e000000b00389fb6c2ca5sm1688771jai.98.2022.12.10.12.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:57:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:57:37 -0700
Message-Id: <20221210205737.3632890-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1q/Fwz+3zvFNShqwLHtjMyE9Ocpeu3bbWZI74F+jehY=;
 b=Je+Q7YDB/WkMU49BTXVCLm42PkJeg4zGqXRvL/JXl6vncViINZ2Y1v4jbzfX3v/Qae
 2FRELoks74NtTOukYfyUYDsTmTmUFBkGNYvEaxByVhuhz5nulqobmIVTrXnmgoUXAYJi
 yhrEMejleci/kI68wjf2zeL7kBPHnej0JjeucLoLOt1LSC9z1Z83FpS/RTqEuFyZjJg1
 JlEQEKn4v9Wfg0dgM+1W2Ne9LMPWKE6szg82yIxc8aByb3lmKJ9rkFp/QMP2lnO76Aux
 9mF2It4EYs1fO8f7ShKkkI8l4AeMbqSfmAiNaYrWqaIYHB+yVK5qWfL9bi2rEHnaGQ4H
 6IYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Je+Q7YDB
Subject: [Buildroot] [PATCH 1/1] package/python-u-msgpack: bump to version
 2.7.2
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

License hash changed due to year update:
https://github.com/vsergeev/u-msgpack-python/commit/8794887e2a71258ddacb7c435ca6f43304c2a21b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-u-msgpack/python-u-msgpack.hash | 6 +++---
 package/python-u-msgpack/python-u-msgpack.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
index 0891783985..0ec2385533 100644
--- a/package/python-u-msgpack/python-u-msgpack.hash
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/u-msgpack-python/json
-md5  8691cea6bc7b44bce6e2115260a54323  u-msgpack-python-2.7.1.tar.gz
-sha256  b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551  u-msgpack-python-2.7.1.tar.gz
+md5  6c4fbe9e1df1c1563ecc9e435b82fdcb  u-msgpack-python-2.7.2.tar.gz
+sha256  e86f7ac6aa0ef4c6c49f004b4fd435bce99c23e2dd5d73003f3f9816024c2bd8  u-msgpack-python-2.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256  268ae7b7efbf67cd7bc0a9efea844fcf448d03f9cc6b8c79e8fe311815985030  LICENSE
+sha256  f938fe2d3b7b329005d4b2851f106fd4351ca55f0836335acbe52386312f7f31  LICENSE
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index e0a3b3f297..372c5a8d45 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_U_MSGPACK_VERSION = 2.7.1
+PYTHON_U_MSGPACK_VERSION = 2.7.2
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/62/94/a4f485b628310534d377b3e7cb6f85b8066dc823dbff0e4421fb4227fb7e
+PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/44/a7/1cb4f059bbf72ea24364f9ba3ef682725af09969e29df988aa5437f0044e
 PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
