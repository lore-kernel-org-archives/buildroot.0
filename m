Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98169C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:03:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D31260FF2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D31260FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27804401D9;
	Tue, 28 Sep 2021 11:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCB68xrxhDhz; Tue, 28 Sep 2021 11:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F550401CE;
	Tue, 28 Sep 2021 11:03:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 355D91BF84C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31608403BB
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBsc1drA-0zn for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 11:02:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23F1E40331
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 11:02:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 r83-20020a1c4456000000b0030cfc00ca5fso1879280wma.2
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 04:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nh0qh6LjsXvZ/MFhc2IvWkYOmiNBapR0ihf5ubSbr2M=;
 b=iLeQwapjA5Bk/FxsR6EECRp/93O2Og4mxQrtM/VwEI1avBMPZ4rRoFnWKRrafE5UXg
 /5isr04iagkPTuYkDmvxMKrrUkVCOs7OPnMAFPZujsAVVfB5AVYz3xQjCWE0hAR2Q1uE
 BctTU0SLBJwuTBU4tv5Z+kjJa0oatTbMSAUudgd3Vu9BqPdSJrmH6vE23sGMtIqIh0Yk
 83hIA8gL3CixpIF3PmxCpbrHHZV2B+0X6FcEG+UMHBz06GoSY/vIgpFdEfL8Rnd6ojdy
 6/QvrKu/BlJSgXzhS8IXanNBV4HnKZAxOaKgh6195fl2vRcKcQKed37kJSBXvJjNmoFw
 N/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nh0qh6LjsXvZ/MFhc2IvWkYOmiNBapR0ihf5ubSbr2M=;
 b=ZJpBH3OK8WPiHuYAmfvSzLTzbs2pr6F1TFe+rQiTT8H0YI3VzndYLdxiOxlIH6GqQM
 WcYqIY3sSq3jQcUw7mJxKL1QrdozNRLgrbnxzBmNL8R4Z5C5BCqK41qc5LYk7TRSIZOt
 Sy5BbO3O5hwTMuneGAGfn13AV7iRloZZFWbZoTOtIx3EjjBvihqrN93BmziJexgKC3lW
 tJZ4/ZxXRBMPxY/Xb+jPJs6RnmnxlUsQRc0VGYriUTijPSfc13SswryiRQlTILIa0vlf
 EMDY18PDv1TZWCJ8CU3fiyKl241BUZ6zMYdS/Xp/AwhdG4iSNjE/gGO9Mv+KzK2NJGE4
 fCBg==
X-Gm-Message-State: AOAM530i7YPDC8Qhjm5+6sVPrps7C70QffmsXPsDfe7cbt/MQrgSnlwJ
 MlYalWOJ83BITl2krTCW9Sd7zzQjpaw=
X-Google-Smtp-Source: ABdhPJzEixWDgWURAh5/hButWJgncz9HaOQTAa6A9IL9Mmc5BKLwLsoNoiHCY96uMAGN8FjifeAFQQ==
X-Received: by 2002:a05:600c:22d4:: with SMTP id
 20mr4077613wmg.82.1632826945154; 
 Tue, 28 Sep 2021 04:02:25 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1254:64a2:465:81e0])
 by smtp.gmail.com with ESMTPSA id c4sm19432155wrt.23.2021.09.28.04.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 04:02:24 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 14:02:12 +0300
Message-Id: <20210928110212.596939-6-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928110212.596939-1-asafka7@gmail.com>
References: <20210928110212.596939-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pudb: bump to version 2021.1
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

* Update dependency list (added python-jedi).
* The package is python3-only, and not because of pygments, so
  the comment after the "depends on" can be removed.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pudb/.Config.in.swp   | Bin 0 -> 1024 bytes
 package/python-pudb/Config.in        |   3 ++-
 package/python-pudb/python-pudb.hash |   6 +++---
 package/python-pudb/python-pudb.mk   |   4 ++--
 4 files changed, 7 insertions(+), 6 deletions(-)
 create mode 100644 package/python-pudb/.Config.in.swp

diff --git a/package/python-pudb/.Config.in.swp b/package/python-pudb/.Config.in.swp
new file mode 100644
index 0000000000000000000000000000000000000000..eb0c0ba873d3b435a2adf1cc9831d6e13007f0a2
GIT binary patch
literal 1024
zcmYc?$V<%2S1{ExVL$;p#W@)gixbmO1aWYPRacOhoSm4Ss$Wo9l98XMTTq&kr0<-c
amzJ5Xmzjsd>`~#-5Eu;ss)ax(x=8>Z*b-R)

literal 0
HcmV?d00001

diff --git a/package/python-pudb/Config.in b/package/python-pudb/Config.in
index b3a93058b5..64789021d1 100644
--- a/package/python-pudb/Config.in
+++ b/package/python-pudb/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_PUDB
 	bool "python-pudb"
-	depends on BR2_PACKAGE_PYTHON3 # pygments
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_URWID # runtime
+	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_CURSES # runtime
diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index b3c089b85f..fc19f589d9 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5	4c024311d3f53bc189084821e7ef7d5e  pudb-2019.1.tar.gz
-sha256	ac30cfc64580958ab7265decb4cabb9141f08781ff072e9a336d5a7942ce35a6  pudb-2019.1.tar.gz
+md5  100b955e103b72279604420bbdcd07a5  pudb-2021.1.tar.gz
+sha256  309ee82b45a0ffca0bc4c7f521fd3e357589c764f339bdf9dcabb7ad40692d6e  pudb-2021.1.tar.gz
 # Locally computed sha256 checksums
-sha256	a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
+sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 6a462bf3e5..31df3147d0 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2019.1
+PYTHON_PUDB_VERSION = 2021.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/32/2a/96f72649e5dfc90cf69d8590c00884c6897d6cbc54f727fb40f47b4faae3
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/c7/69/813e93519fc28744457ff68fa2eaac3b4ea30dda1e6994e969fe9d3008d9
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
