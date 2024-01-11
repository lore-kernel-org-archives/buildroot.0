Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5DC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C04B14171E;
	Thu, 11 Jan 2024 05:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04B14171E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Go-HePvNuERX; Thu, 11 Jan 2024 05:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2EDF414C6;
	Thu, 11 Jan 2024 05:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2EDF414C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 447041BF313
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D7D5611CE
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D7D5611CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHZNLna_Dv7C for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:52:34 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3219F611BA
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3219F611BA
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3606f5295beso25437605ab.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704952353; x=1705557153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LEnUy2kBOCgH5Vpz7Fcwqj+KwW7aJUTzWq3MI2/AN3s=;
 b=CRUZf46dGwaWck2+1dcyVGSMvnx/VouIiYF23rblMgimAzEuclPzigW3UL81tMTe6l
 CiDnjGbU0ZJToW5Ocr5HmztzMhZud16SVEOZUpz3lb9YrtHmDu7xm+7+PI67ngYM9LuW
 2Mcw9AyvBkD4h+TVIAUObm90T4FR6xkZrMLW5slUdmCSi/ZUNwOI6IOp4sF3JSYyBpJ6
 zEkAn5nV3DwUpF/Iske6YMZlNtBbP1AkrYqlyAABaSSf1fvrkd7Mpvw/HrryW8re48yQ
 Jma8ucC7Hm7LMZDWX9crzFCG/kGSsQAzJ8L5wHRRkBJ221HaDcTJC31lPNT6U2DA6qkv
 QX0Q==
X-Gm-Message-State: AOJu0Yzm3kI6p0PkGC2z3da0czp2esIOYb7/A02lRT1r333HS1gWg3gg
 hvTUgNRhoHnRjRmLuznLJZX9YEpX3NZkHw==
X-Google-Smtp-Source: AGHT+IFp3ODdNBsS2n9SM69HFJ1l1v1l3boJ6PbxbDzWNCiIF0JysNbsBSQN6Qt1YpzLcsbzJKTMQQ==
X-Received: by 2002:a92:c26c:0:b0:360:29f:b7a6 with SMTP id
 h12-20020a92c26c000000b00360029fb7a6mr855804ild.18.1704952352813; 
 Wed, 10 Jan 2024 21:52:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 ez4-20020a056638614400b0046e307135a3sm128869jab.18.2024.01.10.21.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:52:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:52:29 -0700
Message-Id: <20240111055229.3019251-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704952353; x=1705557153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LEnUy2kBOCgH5Vpz7Fcwqj+KwW7aJUTzWq3MI2/AN3s=;
 b=fMuj2g+9EMW50LaN7La3h355aa9mZPIVlE6WmFbuNl11k/va1ffw0eI6QuiEn4Q6+k
 Sp3/Ipgli39D+pWpEi3ltJitwSavvl+gKs3aE+AUY9kPlKRjyAxXVnDDmw9Z6Fva8eaF
 XSfKuB+UnPjf2YwilS0AZU1W4DCx+qh5uHaozbsiwkwzFB48gVYMSM5LDXlVRVKJYdZ3
 gKaQgmQ49z9LWRFF9Dk5ndAmE3Hem0gSafF7HFiOnft8bKHzVQjAQMWFtJKIUqON6HiO
 Ih9wRKXOx8N1Anzpn6F9J/sBU0ZHKPL8mJ8uyTnDWGxaKO/A6H7UD5V+U0LcUiqT7EC+
 gPow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fMuj2g+9
Subject: [Buildroot] [PATCH 1/1] package/python-segno: bump to version 1.6.0
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
Cc: Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to formatting change:
https://github.com/heuer/segno/commit/5f61bc42535b836c30015a0cef5db1e52ef8ac67

Drop no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-segno/Config.in         | 3 +--
 package/python-segno/python-segno.hash | 6 +++---
 package/python-segno/python-segno.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-segno/Config.in b/package/python-segno/Config.in
index 3957cd79bf..7107e67443 100644
--- a/package/python-segno/Config.in
+++ b/package/python-segno/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_SEGNO
 	bool "python-segno"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
-	  QR Code and Micro QR Code generator for Python 2 and Python 3
+	  QR Code and Micro QR Code generator for Python.
 
 	  https://github.com/heuer/segno/
diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
index 286bdf3615..58142c184f 100644
--- a/package/python-segno/python-segno.hash
+++ b/package/python-segno/python-segno.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/segno/json
-md5  6d7c852f951501cd3af85ef061d6bee4  segno-1.5.2.tar.gz
-sha256  983424b296e62189d70fc73460cd946cf56dcbe82b9bda18c066fc1b24371cdc  segno-1.5.2.tar.gz
+md5  b80c19075a7a07cce50b054e9e221cf7  segno-1.6.0.tar.gz
+sha256  8d3b11098ac6dd93161499544dedbfb187d4459088109b8855ff0bbe98105047  segno-1.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  98b0a86ca0cbf68c95051741bc983425a43fdece775fe0e2712e66be459cc9d1  LICENSE
+sha256  3af9b2f15c736a571978760b2d60598502c205eb6daebe2ec36f0272c380ed28  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
index c832f38f4b..2c230ee26b 100644
--- a/package/python-segno/python-segno.mk
+++ b/package/python-segno/python-segno.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEGNO_VERSION = 1.5.2
+PYTHON_SEGNO_VERSION = 1.6.0
 PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
-PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/90/2a/2fedf1023f9273d8326362df7936748ebadef92ba53ab7970d9b8df1a6c2
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/51/a8/960844fec8d853a4e8e91f64bdde323ea5a2a44357eca799e7f7f7bf2f1e
 PYTHON_SEGNO_SETUP_TYPE = setuptools
 PYTHON_SEGNO_LICENSE = BSD-3-Clause
 PYTHON_SEGNO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
