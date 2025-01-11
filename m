Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C3CE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2B2A81274;
	Sat, 11 Jan 2025 18:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxQ0QiAH4T5b; Sat, 11 Jan 2025 18:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC1381854
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC1381854;
	Sat, 11 Jan 2025 18:56:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FEAD942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E27581274
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0UgagbByzXG for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 724EA812E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724EA812E0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 724EA812E0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:55:59 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3cdd57060acso10224785ab.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736621758; x=1737226558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NEc1g6oFcVEKWBPNItp+KN9KNLErt1pHUznrRz0QXZU=;
 b=FcRmvm1VrYp2xEkanNBWQKV4+1uG6bRxgtGvhAN0GxFAeUzH2BWbl5IShLSO2cH3PA
 /Q4SsoFUQX8/dn5O723K2EKhjniA4KvG5G8W5GE5RW8+O7GOGGTpoErwKwjrrz+PjtAg
 WAYlT0xpZtfkjsVVjISqoILxDehZ4g4UldPLrx2yqqrsGZyChPvx6hodbURjEnvmhMQ+
 TfR2vqvz5Om1v21hutcR9qV3IHi4ULCJMN4/j4fkXMB5OBcafPDg5ln34VI37wEJpCS0
 XA/UZSqH6f0sjxa9m9R9eAqJ0Hr3mKeKcP5V3m/TtwlJ8TyHr/kbfgd8MeG92ihcEB8p
 J8kg==
X-Gm-Message-State: AOJu0YzV6CV7x3GBn5klc47xHM48ux1WlCYtXyuC849T0SY+kMzvI0UW
 y8s5oQxxSs225b8mUfzrPrd8Q3y9H6LdXyA/pPY4tEG7GImB0uiLhmTikw+v2tU=
X-Gm-Gg: ASbGncvYUGRgxk5E07UwwfNxCzYtPKypqdXJcSLy73Mrhte/mX+4BvfU/3I5mfWySCS
 w2jrUlSb/d1Hwr4WY2TvKRjZ/RJDtQxDL1dQGf9rJLfGd+gsZBDNCTyfVkwOemi0o8u2/CUS3pX
 yNuwnc2slpQUaHdxFrPT7cZO4SMDXa2dX92ZildUBh2jUMQA+KYX9j5AN5nlBSL01qrZAAqw8bD
 mpt9eErroLtHpShl1GPj8ZN/cwidTJ8MejvXOl9UAQ+68Qx6JojAck0H2cLhO2Yn7FN3CX+UF5n
 5M6/f04w6uch4Keo9c1CFYBHZqEqiqE=
X-Google-Smtp-Source: AGHT+IF0rrKHtM6HIP6MDYcSdTtmlecvQQTjj5ns89L2nVJpH1tWyOP2W3blZ6fb2o78tSGLjd1/dg==
X-Received: by 2002:a05:6e02:1d88:b0:3a7:8720:9e9e with SMTP id
 e9e14a558f8ab-3ce3a90ef12mr112226265ab.2.1736621758209; 
 Sat, 11 Jan 2025 10:55:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b613012sm1688306173.58.2025.01.11.10.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:55:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:55:55 -0700
Message-Id: <20250111185555.2956037-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736621758; x=1737226558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NEc1g6oFcVEKWBPNItp+KN9KNLErt1pHUznrRz0QXZU=;
 b=MVlvfhwNtgVe86IsUjNPEmYCZr2smCBZvUOOA7W5FyChqdHh50DJyWvvw8RuOKllXr
 WUsidEBhxgzKmQgpmlYwefQYDY7B1Gf+qAry9vNEpGUD2UU+NqqTMv5+ykWXJX4PX7CD
 Xg/pEK4PXtH7Lpk9SXv1G8uPYmXiYL5CJ1D6+WJxo0qaw2ecZaQT7QLBB+hthz4W4/O/
 BnzqDsbXF9uCxm/skgEmiLOgdkU9RpI8kz1x5puon11hahhRw7Nzz6mO/WSDZgI9nxx2
 n7J8VnadlhGOv0hMltJ2fk+WPo3Dn5ZyZRkShknBQC80eT/Bx3WFbESitjYVngK71cLM
 YqDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MVlvfhwN
Subject: [Buildroot] [PATCH 1/1] package/python-uswid: bump to version 0.5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uswid/python-uswid.hash | 4 ++--
 package/python-uswid/python-uswid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uswid/python-uswid.hash b/package/python-uswid/python-uswid.hash
index b6bf09c713..eb9011bad6 100644
--- a/package/python-uswid/python-uswid.hash
+++ b/package/python-uswid/python-uswid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uswid/json
-md5  e43ff6d49ddcda0c95338d3271694b91  uswid-0.5.0.tar.gz
-sha256  bdcd7ee5afac1da60ee688c357aa12f5f8d74bc28012446b10e2b4a9cf52fc6d  uswid-0.5.0.tar.gz
+md5  dc9a4aa4f9293b9e24c35c14dad6f296  uswid-0.5.1.tar.gz
+sha256  92b48a8f6601687c1cc556878571abf9ddb0bdbaf244713b7ff838c48fcb68b3  uswid-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  98bc07f3fb70d05b01ff740e8191b9f29c080159f01588991fbd872c611236f9  LICENSE
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
index 2092a06f52..e6ca702742 100644
--- a/package/python-uswid/python-uswid.mk
+++ b/package/python-uswid/python-uswid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_USWID_VERSION = 0.5.0
+PYTHON_USWID_VERSION = 0.5.1
 PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
-PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/dc/bf/05291df12037befeacda2083c798e98691043978e07ca4a00b4eb94aeb61
+PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/5c/67/9244d29d6391d49f30128da6c73a61c7a6c1f8bfcf0181f83298aa050832
 PYTHON_USWID_SETUP_TYPE = setuptools
 PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
 PYTHON_USWID_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
