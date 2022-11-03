Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D871C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B1B81F80;
	Thu,  3 Nov 2022 19:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B1B81F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpYaikDOK6ft; Thu,  3 Nov 2022 19:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E94581F13;
	Thu,  3 Nov 2022 19:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E94581F13
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AACC1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3630C61029
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3630C61029
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bk0J4geKtXqU for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:52:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4818161027
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4818161027
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:52:12 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id m15so1630012ilq.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C61xT9MlWvpju5oLKv0IFbWRlb6S4lzS+ITIgpHyZtk=;
 b=oUBR2i8MSKvI7/+DVkvV5Ol5pHYA0nG9ME3SDtZQzRg4ne12dXUqNDN6c4y5prAwas
 OsJXom6Mo7iYgrRfgN4pYTh/ZaXT80mqpkX2j21sVO2HS2AKmfxCDDd8aKuc9o2KNS0e
 HRMr61pjVI82Q++gkYblHkwwEuffPZUQHLh/tHOUXYhn72pha9ekOJrYkr/KVMxcRl3E
 cxcBDyhQXbDc3lRiHvghqA3qNx9E7yqY+Dqj+jGlsWNvtSUAB/ZEK3YCfHtmujDM16JI
 uA9fAF5wFXurJ1RwOZJlCYMhBV+CGU4jmQwGoOFYPzWgy0DQf1hguCM3HGstbuyl8DHb
 cgpQ==
X-Gm-Message-State: ACrzQf0qAQZBg0G48DvJ4vfNzMyKvZaBAfh6bIzXRH7oBZ/NGDg88zC1
 me/4RxLCLRpxprRZ4e44BA6CzfpeTpuidZKd
X-Google-Smtp-Source: AMsMyM4z2RtivU2c9uJ1DIFjT44aAGOjav2BMU8Zf8ytMNyTS/XByD55H7dnY7esZ6zRnuBEFYGobg==
X-Received: by 2002:a92:a806:0:b0:300:d514:6b55 with SMTP id
 o6-20020a92a806000000b00300d5146b55mr3655878ilh.235.1667505131133; 
 Thu, 03 Nov 2022 12:52:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c3-20020a023303000000b00375081fbc7fsm486750jae.166.2022.11.03.12.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:52:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:52:09 -0600
Message-Id: <20221103195209.1623802-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C61xT9MlWvpju5oLKv0IFbWRlb6S4lzS+ITIgpHyZtk=;
 b=eyuuNZyzLRAzymf2IDesfE9QTlgi+ar3tTzdqeh9ac3Z2birBaLytqPCg7/DinbhjT
 jSfiZwduZHLXrBP5jlbDwFFBEvuAqssbKrCkFZ0pL9Px6o5J9ankPEe4z2fzVgXGtPcp
 rFnFe/nq60SUDCqN+RrOeXJcciE9IRavdrUem8NXGfbGgWned4L3zYwJud/XtGw2sbW1
 decXyFiuKtOFAj273Uw+ipbz8Tjcl4T/eJPIAppdzM08gCTtag52CS/0qCqSH9GZ1eLf
 R8aFeT/lvDmsrnd7PqCny126R0hXsS3zWE6K9oiSgSWEjRi24JOB3NVl9UMy06HErXvd
 zTMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eyuuNZyz
Subject: [Buildroot] [PATCH 1/1] package/python-tempora: bump to version
 5.0.2
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

License hash changed due to line wrap:
https://github.com/jaraco/tempora/commit/7558cfe2eb2f1ffe3676905e9871466cbc9da24f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tempora/python-tempora.hash | 6 +++---
 package/python-tempora/python-tempora.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index 0fca58354b..d802a63d87 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  f8b2b0df1adf3f83b829a85e31bddb2d  tempora-1.14.1.tar.gz
-sha256  cb60b1d2b1664104e307f8e5269d7f4acdb077c82e35cd57246ae14a3427d2d6  tempora-1.14.1.tar.gz
+md5  24b77c173a7e89084004a38fe44e3ce3  tempora-5.0.2.tar.gz
+sha256  31fa5bb33b2641026211f23e808eb8bd351901988b167d45f323c8f450ecf211  tempora-5.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index b2f1b6b309..e22ac52472 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 1.14.1
+PYTHON_TEMPORA_VERSION = 5.0.2
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/2f/b5/5b0464385454c5ca93a39a1c6acefdf574aeb10ef45fa8958b3832cc7d96
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/72/2c/9aff4204a4ea5172b0cb3508f8a504ab6562ba539825ea2e33a5b4cb629b
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
