Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76507C4707C
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 03:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6CB83E4E;
	Thu, 11 Jan 2024 03:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F6CB83E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0-M-hsMoRI3; Thu, 11 Jan 2024 03:00:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59B5883E4F;
	Thu, 11 Jan 2024 03:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59B5883E4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAC401BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 03:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CCCC437EB
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 03:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CCCC437EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xq1Xhc8ag-DB for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 03:00:27 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C8D243666
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 03:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8D243666
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7ba9f1cfe94so147440339f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704942026; x=1705546826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHs5ESxqsyXsnrz69DjSpzEYqTbb1y9t2YNnigAHxME=;
 b=cZ399Qr5USoB+sBSgy4y8PY6XnX/wW7fRiRsPBsgRrkA/3wfj2M3IUhcIjdlDHXO4o
 iYNDWObx3eHLxOEEtZq9/mB/6LPZ8+GX7qT+gk1Crf/1981cu493UaB+ozXeTw8I5KyW
 nzjwjJMV8Sb2h0PM9hWPA2UOL1Kd4cSQutc+FzvFas3smNppfvn5PZ9Lx0IG7yG9Mtqe
 9EEhmhOLlUKdF0YZ7SgwM55CGWHn2RbyIRprj1KxdEp5g0o/EngpNCkE9jlxCh4+YN/o
 BsFVuoLUJ/mcGKKqSlSdiFrCSElNLi3fDWNst8Z5IjwUBx/aKPhIKHZ5a61/SrfFdT4h
 dJdw==
X-Gm-Message-State: AOJu0YwJsNLFEXOSNfxmsuqnuvB4683IKtyZ9igFdpcnf6fHDp09wTE2
 zHabK7IamKjbc9H78OlqG0sObHC3iO5YtA==
X-Google-Smtp-Source: AGHT+IGkt/Hu3QFL+dNU9IhxOb5SWnyEuh4HYQWS8ZDnVtpe4aUbrJgHWLb40ootmsQ9XFaGSetHjw==
X-Received: by 2002:a05:6e02:ecc:b0:35f:ee15:724b with SMTP id
 i12-20020a056e020ecc00b0035fee15724bmr54798ilk.4.1704942025770; 
 Wed, 10 Jan 2024 19:00:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cq9-20020a056638478900b00469328386c8sm53717jab.162.2024.01.10.19.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 19:00:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:00:22 -0700
Message-Id: <20240111030022.2676853-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240111030022.2676853-1-james.hilliard1@gmail.com>
References: <20240111030022.2676853-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704942026; x=1705546826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHs5ESxqsyXsnrz69DjSpzEYqTbb1y9t2YNnigAHxME=;
 b=Yu+yZT9IbaMQJMlWOVnyj1EqxYCIhybarfGzTI2s/yic72e3ruqrymURAsO6WquKYw
 /XXXBObvmZWVHAiFepgJkqpqXZmD1eQpRuYYnSieCiaGz5HjpxDpBCxyrj78nQhqnzkP
 vkY6NUDFbvnU+ka3xGLmIgJNzarn9jfyER7FpXzKuluxhJJnzvGzcibe2Qqdx4wV+b3m
 LGqBu3i1jfGsDTM+qhgbVPHPMWfx3enETMUt0/AHEQqwC9GTQcKnjlrcl8tYTStenfTh
 c5H6soYpDmlWZ9SWrnIL47blLqBF4BGsfu/KU4BgLBAOkB1Wok+f7lSMqdtI4ugh49dS
 6klQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yu+yZT9I
Subject: [Buildroot] [PATCH 2/2] package/python-pytablewriter: bump to
 version 1.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-msgfy runtime dependency.

Drop no longer required python-six runtime dependency.

Add new python-tcolorpy runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytablewriter/Config.in                | 11 ++++++-----
 .../python-pytablewriter/python-pytablewriter.hash    |  4 ++--
 package/python-pytablewriter/python-pytablewriter.mk  |  4 ++--
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index 041c30eb6c..e0252625cd 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -2,14 +2,15 @@ config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	bool "python-pytablewriter"
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_MSGFY # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
+	select BR2_PACKAGE_PYTHON_TCOLORPY # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
-	  pytablewriter is a python library to write a table in various
-	  formats: CSV, HTML, JavaScript, JSON, Markdown, Excel, Pandas,
-	  Python, reStructuredText.
+	  pytablewriter is a Python library to write a table in
+	  various formats: AsciiDoc / CSV / Elasticsearch / HTML /
+	  JavaScript / JSON / LaTeX / LDJSON / LTSV / Markdown /
+	  MediaWiki / NumPy / Excel / Pandas / Python /
+	  reStructuredText / SQLite / TOML / TSV / YAML.
 
 	  https://github.com/thombashi/pytablewriter
diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index f082542dfb..d4432ee121 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablewriter/json
-md5  0eaa4a2429d22389b5e4b8c5f5135bbb  pytablewriter-0.64.2.tar.gz
-sha256  99409d401d6ef5f06d1bc40f265a8e3053afe4cbfbaf709f71124076afb40dbb  pytablewriter-0.64.2.tar.gz
+md5  4e3d421d026f30fadec4ac1670e524ee  pytablewriter-1.2.0.tar.gz
+sha256  0204a4bb684a22140d640f2599f09e137bcdc18b3dd49426f4a555016e246b46  pytablewriter-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index d865a89330..d8bc3615dd 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.64.2
+PYTHON_PYTABLEWRITER_VERSION = 1.2.0
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/a6/e1/50c1cd9734a9edc1386913b178f9e4757c1bc37665c1855a6596c25957d6
+PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/cc/a9/76aa4430d32ae10b23e4347006dc4c67a3e2a00621e4bb38a60c1a77f15e
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
