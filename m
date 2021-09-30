Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C471CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F78615E1
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89F78615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 612E183FB5;
	Thu, 30 Sep 2021 07:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfN-kCy52Kmm; Thu, 30 Sep 2021 07:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5FB83F8A;
	Thu, 30 Sep 2021 07:03:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 858C01BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72E31613AD
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pA2vAySrwmAZ for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A0A460715
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d6so8230272wrc.11
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yk6FN4gJAjdD8zmG0cGa2ETh2NbgTnMJRw8MlPG7A+w=;
 b=Q0M6ygw7DcLn4+azgwpY9FuMRpl6zl7RoOq62yrWlKjcmOS2Nf808v3fGBKjMZ0YQo
 ShW0BuO//saXDJ/LsQoJdla7k8njz11O7N+Bv0/Jk+zWF1AgMaIWvZ8bSOeR0Emy943p
 m8n3KqZ6aoDVq1+ppusB8Put/ugcOBxLKuJxZHVKNEIRMyW/pF0o9m1vhTqkiBNxHton
 mB9YBl3kQa5SvGJ0bB9tvlGy5wZFPVulyER+/JuyRkHu6Ubcp5TphXtIRwW/DvIzayZR
 60CI6BX7kX8d//Z+71hJr0FRGdTBVyh1m1josUzlTz3CEDVqnTjVz1dSTCCFeRb31wCV
 6QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yk6FN4gJAjdD8zmG0cGa2ETh2NbgTnMJRw8MlPG7A+w=;
 b=nPy42nwYqZKrjJoVBU+MAA7yBRLV11wMAgz9+cRuZBGsSbw00MKACtGHgD4rvfpqi6
 mbK2dwswsjxn1/Hf39c7lerHo111lJNgqaKW1iNbL+nWp4OE83Hxz3qiAgkniDQjam0v
 XYRV+u37899VdkbDpCX5PZuuhbUmCAkvlC+gbPlXggkElKUrM6dkli5msL2VoHEjr8cS
 +Uweixs4YQtSVAl2n0m4Nssr978jj6RZv7EERu1XP+n9aLeBjT5mA54mjPw0Lb8JFFNR
 0WfbzYxbzhooeFlog6BQm0AgdtzYDlcAUK4FZIZc/fd7z38FbXRedMeHmdV0dM8gNkw3
 kw2A==
X-Gm-Message-State: AOAM5312C/wXJxpIslepfpysO6uNuiNgUlHYLanAxX7hRq9r+Qycrr2B
 kgetlTOAfGD/nXdyds4hvlaNqRZQODs=
X-Google-Smtp-Source: ABdhPJzostpGRvrMksT7zy/cZi/PabmsnC241EMqHev+slkKYXaaYJpqyAmrA9h6aV8Z9YDMiyooWA==
X-Received: by 2002:a5d:6dce:: with SMTP id d14mr4365052wrz.363.1632985271766; 
 Thu, 30 Sep 2021 00:01:11 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:11 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:47 +0300
Message-Id: <20210930070051.40361-11-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 1.26.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 288d986e7c..066bfb7288 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  3a88ec3bcb761ca23df2c3583949be37  urllib3-1.26.6.tar.gz
-sha256  f57b4c16c62fa2760b7e3d97c35b255512fb6b59a259730f36ba32ce9f8e342f  urllib3-1.26.6.tar.gz
+md5  e0051a87a956e618a6bb514a07fa7773  urllib3-1.26.7.tar.gz
+sha256  4987c65554f7a2dbf30c18fd48778ef124af6fab771a377103da0585e2336ece  urllib3-1.26.7.tar.gz
 # Locally computed sha256 checksums
 sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 775986d516..a1d22e023a 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.6
+PYTHON_URLLIB3_VERSION = 1.26.7
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/4f/5a/597ef5911cb8919efe4d86206aa8b2658616d676a7088f0825ca08bd7cb8
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/80/be/3ee43b6c5757cabea19e75b8f46eaf05a2f5144107d7db48c7cf3a864f73
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
