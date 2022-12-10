Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A11C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 297E94047D;
	Sat, 10 Dec 2022 18:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 297E94047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssKYxbPTA35O; Sat, 10 Dec 2022 18:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6133A40376;
	Sat, 10 Dec 2022 18:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6133A40376
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D29B1BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0485C40866
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0485C40866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pW9T5t1kWbfw for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:13:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD5B1403A7
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD5B1403A7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:13:51 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id d123so3741432iof.6
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5gCsh41APpyHzArS1qNYuwj/C6We8fXR39wWvXmxWUk=;
 b=2h2xIZQvFIq4F8kzktDEuM7nqzPw0C7V4bHYcRKNJNlTS6xQo2Fpgq7cYMz0h2bqT5
 ltRL0uX+niB5ys9AXg4FZk3M1Irmev7zJvmK9W/D8b+ME0xkKUUpqytD43QEDShYxM72
 ZsC+6Gd0RCdsjZdNo2qoCPS9ofCmqqjS0Jnyj+zkfmSyz/A5FBsCFxa+5cgYoxKMsn3B
 +Tve2Fj8/+Yigc0kn/0PwigacTcx3fzGtk8Ga6kz+nfKC1WBIZ/xsh5QkRblUN4G3sq9
 7wiigNsVvLm/vSmIEq6Vk1EfeMMbIcECMe+TiGi1tuQCzXFjw49ySI1sb8XCDeIzx/bQ
 xq1w==
X-Gm-Message-State: ANoB5pkBkesNTMQlsvcRi7KcfSZmOrlxiILCCQ5QFyVTadGQ4pQsnCc8
 J/qUcSd663ymLcYZ8kAgC22aS/KYP4FIAw==
X-Google-Smtp-Source: AA0mqf4z313NT2WmI4me+JyI2Vt2/7iS/gziOWp1TvtcINJregHUbSCRlBq50pmvkHIByiIztqmEjg==
X-Received: by 2002:a05:6602:24d7:b0:6dc:2c1:d43c with SMTP id
 h23-20020a05660224d700b006dc02c1d43cmr5414429ioe.14.1670696030663; 
 Sat, 10 Dec 2022 10:13:50 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 q30-20020a02a99e000000b0038a6da37802sm1580794jam.24.2022.12.10.10.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:13:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:13:48 -0700
Message-Id: <20221210181348.2864692-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5gCsh41APpyHzArS1qNYuwj/C6We8fXR39wWvXmxWUk=;
 b=JgwokDno4YP+JdRdDOz+b/mH2ybz9eCWmVg8QywLZ86b0dkXT1/pO0uKaeWusPyPIc
 H2tkr0W2nj/r+pk24H8KXzhkZfzBGjBXfgpDvJ5273ysFy4h994OSSlaAjFWadZoKrFP
 n/XbHVEUZKMgkdkgjnJIprs7ClYaE1bz6xGouDFYr1wkuG8uSBKPKhHvWdHtIoKXZhJG
 Ls3MfPIYQ6hSItDneEjL3k/Pg2XTKAyVNaAQSIu7Jq30nZrLWNkAbfBbh4X8/RzbRPqR
 CV1t01GRldmMbKR47qfBZ36olJQCT8NULbxbiVR3LfXOsNXlq/aqH2rPmT4766gTnwVX
 qiaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JgwokDno
Subject: [Buildroot] [PATCH 1/1] package/python-jedi: bump to version 0.18.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index d0f083e942..dee8810e89 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  d8dba4a98a35530f7f5b461c20aff180  jedi-0.18.1.tar.gz
-sha256  74137626a64a99c8eb6ae5832d99b3bdd7d29a3850fe2aa80a4126b2a7d949ab  jedi-0.18.1.tar.gz
+md5  47e89a2b8bedcfeb1527fac37b9ba1b3  jedi-0.18.2.tar.gz
+sha256  bae794c30d07f6d910d32a7048af09b5a39ed740918da923c6b780790ebac612  jedi-0.18.2.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index b0508de701..40de61f0e8 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.18.1
+PYTHON_JEDI_VERSION = 0.18.2
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/c2/25/273288df952e07e3190446efbbb30b0e4871a0d63b4246475f3019d4f55e
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/15/02/afd43c5066de05f6b3188f3aa74136a3289e6c30e7a45f351546cab0928c
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
