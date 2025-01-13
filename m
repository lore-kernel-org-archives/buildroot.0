Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A62DC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C5381221;
	Mon, 13 Jan 2025 18:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxvka8YHPTE8; Mon, 13 Jan 2025 18:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F7D8122B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F7D8122B;
	Mon, 13 Jan 2025 18:59:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C36B95D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BDF660839
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkgOf2iF_VLp for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69D6F6081C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D6F6081C
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69D6F6081C
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:59:14 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3ce7a33ea70so950395ab.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736794753; x=1737399553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MW47IwRuehAwaom5emQQEw0wOgLd4XMi1pqyv1kq8Ts=;
 b=Wj3X5tl5IdoN9xsGbZah+MrDXTrxvapFdBEOTFRtW4P1+LCZUdbfVkBQWQUjr2dkle
 PDm+9CHnFnEBxuZ0m6uns5KFz8Xw2jDthOttjei9f7Io7DGGM2y3ywc8jbxCapez958f
 g0EnYiXXQPUOwXRLuUugbvElqYb/Xmqp4kXqyuD8M+fUNser4HvoTMO1VJxE0qM4JfJq
 sB2l8tqfIBAck0+43cpYPgkxKUMO4kDHi4HTkK5vJ7nvjFQkrC6dt6lH281nCjt1UJBs
 FzgmfgbsdD1MhbHXnvp2BezGcyTMYIdH4cUfjhuin8wh224FWp04yewVddF/L6I7JVLw
 lYXg==
X-Gm-Message-State: AOJu0YzBDzw45u5F0h+PrsKkcPdFBK2Nzk7Zs+OI7f5y5Q447LS+0u9y
 L6raJvWwsLnWHtHuL7JTYyLohiEQf5fLYNo4MZeDN38HqQp8G1G490pKU7Ommkc=
X-Gm-Gg: ASbGnctbiH06ieLLrhXNCcwTviQD4kZyUdrZaj9+3w1KGl4ATSMzAmHC98Enxz4Q39n
 wUj5QExgJwwR5EEJV2dUTIcPLpJbh8vK/xAPvq2w8YkpvIdaYhlA0/LtNBV8SQ2VpjdoAlkfROm
 9sDGjARvtR/jitw6NAoQAs2zPqHsa0xzbEU7ClupwBwl+PmiyJpIHdtXtlTSxdMy2CNMCJqmUxm
 WlAE7vkYh4Q9TVQ8ix5Tfb5R6mATB1ZLaEDBXQz+MUqqOrog1IuEMK3cHrCOBpS0oADfr3igHPi
 OpRJs56BSSYoKt8SA2KFvtcRH5OPTzE=
X-Google-Smtp-Source: AGHT+IHHflz8YQIu6rBJuJx9nLCam06lcppenRFFU4MYshB9hpL1zPLPlMhY6BEYvpBwasysc0drQg==
X-Received: by 2002:a05:6e02:1fcb:b0:3ab:a274:d68 with SMTP id
 e9e14a558f8ab-3ce3a9b59b3mr169976645ab.8.1736794753224; 
 Mon, 13 Jan 2025 10:59:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b62921esm2869092173.69.2025.01.13.10.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 10:59:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:59:11 -0700
Message-Id: <20250113185911.3036402-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736794753; x=1737399553; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MW47IwRuehAwaom5emQQEw0wOgLd4XMi1pqyv1kq8Ts=;
 b=ORVqJBL1Out7PWNCZdf4ju6TsRO6s0mbvBQjaZq9Pa3Jmm5mUExtnpl71CMz+qdFLS
 AHsiJbfGFlrOR1Ef+M+IH4Mv7g71b9UyXoCBL8d4IIb3MJG4XyMTNNECEL1znunIJSaZ
 YOjaNyawr5eJm7XdLywnyW9vaJZqC8JK8hvZ9IftV/RM7AK6MvOa3QJbMRIbDyjq5Fe6
 7xYbIvJcDoUnPBqDHcChptQrEP7bdxt8ooa4x8QUUfupM0c910EnUj8UK7bPAo0ZbuRB
 LuXEfz306TxZ5PZJ/LZPS3HMp7sYTaxdFUHnH8koicLpwN3KAFA1uaCguEN8qOtUMs2D
 yToQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ORVqJBL1
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.97
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 783a056312..9285b3d7ca 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  5f616b5314958f132a674ee7e68608f2  boto3-1.35.86.tar.gz
-sha256  d61476fdd5a5388503b72c897083310d2329ce088593c4332b571a860be5d155  boto3-1.35.86.tar.gz
+md5  07aaafa117a4a0ed4025296a85018276  boto3-1.35.97.tar.gz
+sha256  7d398f66a11e67777c189d1f58c0a75d9d60f98d0ee51b8817e828930bf19e4e  boto3-1.35.97.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index c8df598b46..11fa34bf6c 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.35.86
+PYTHON_BOTO3_VERSION = 1.35.97
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/b7/23/0fe81184d4c3c4f640288dce790c705a76263c1aa688f684ef1dbe9d4f7d
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/b0/0b/be51ba3bf22832bc918b4059ca182877681b02a45627c51d70efbbf1991d
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
