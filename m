Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838FEC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 05:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24ACB83E9C;
	Wed, 10 Jan 2024 05:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24ACB83E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuVmHgPh-db9; Wed, 10 Jan 2024 05:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72AAD83E91;
	Wed, 10 Jan 2024 05:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72AAD83E91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE9F1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1873683E7A
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1873683E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d14alA08UN7o for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 05:08:17 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D06883E91
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 05:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D06883E91
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-36091f4d8easo10769195ab.2
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 21:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704863296; x=1705468096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MJ7VoM8ew0Q1HkX32rqv2Bpk/4HOCRK2Akd+WbRoTwY=;
 b=q3sZSA6iICV1cNb17/o/IIqarmDEDXKDfj2pPRbBQa0MkIO/XdQI/DSgXnBWFhQNSE
 xPqTO6gT6MvswCOJPeai/2gnCFI+fSHXza95sLI0g9r2WVhbTJbnWMFd7wPTzFf5hM+F
 Vkr8bJfbSpRMSiiU1w/beY30sQ4U7DEVWoP+CClamm1CasMAuD7ZdAgh/AAAkxo8d4Ea
 vguBP/FqLArUopmgBW/cIZONSQlQHKYpHUCTQHCrUFhrSMV7Ssi5MDp09F8gH0YfBYVZ
 HAmxj7QI5Z/JXPSlj6uHR7Jx5EtJ2UcUT5Vgk+BpmLcAfp8SP9zTNxgp7Gm4nPL9ANZg
 e+TA==
X-Gm-Message-State: AOJu0YwurINJzqVqXmNmdcMRRGyJ+OC9ZzDCAARnAa9SHEmrgJUWSGIH
 I6mn6MRUwE9KW9XApT93NNhVkhH83dIAYg==
X-Google-Smtp-Source: AGHT+IGt08f2K4MEaACtjUlTa1DXVYotUqO8beReBHu19AaTkMQn3qvmrVSg3/QX3pl6s+bfoV9Ssw==
X-Received: by 2002:a05:6e02:1c02:b0:35f:ef97:ae93 with SMTP id
 l2-20020a056e021c0200b0035fef97ae93mr757505ilh.21.1704863295740; 
 Tue, 09 Jan 2024 21:08:15 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 j1-20020a056e020ee100b0035fadef5006sm1031658ilk.26.2024.01.09.21.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 21:08:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 22:08:13 -0700
Message-Id: <20240110050813.1109654-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704863296; x=1705468096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MJ7VoM8ew0Q1HkX32rqv2Bpk/4HOCRK2Akd+WbRoTwY=;
 b=ORPxmWy2M6s8Uod2roMCGKbgyAoexiJ7YoetT4/+f8cQpmZwFEhpO2YlgLlMY1You6
 hXgq4nJHh0XvI8yFbf1foxy2/VnfGkKrpljgfXlxR3XXZpugI7brLawGsWhOhKv9Pdaw
 cTwoN3JdqK8nR6wMDyULRplRBoye3WkRY8cJmdOk7KkrNPpvgN89DhVs9iIIuNIkvcor
 FqQC5zhPHbAy8HrjpobXQKsVqfk2Fg2s7KoijnNHSDoYXKI200+XTeW95E/YwaCgvQS/
 RGegBANNaNBaidBnzLo0Y97WHgosPTtV42pK6GEGeTHbQss0Qnvjrof4jPl6837+7xO7
 xs1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ORPxmWy2
Subject: [Buildroot] [PATCH 1/1] package/python-pyhamcrest: bump to version
 2.1.0
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

Migrate from setuptools to hatchling pep517 build backend.

Drop no longer required python-setuptools runtime dependency.

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyhamcrest/Config.in              | 2 --
 package/python-pyhamcrest/python-pyhamcrest.hash | 4 ++--
 package/python-pyhamcrest/python-pyhamcrest.mk   | 9 ++++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-pyhamcrest/Config.in b/package/python-pyhamcrest/Config.in
index c2a4dc06f7..27224cdbf1 100644
--- a/package/python-pyhamcrest/Config.in
+++ b/package/python-pyhamcrest/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYHAMCREST
 	bool "python-pyhamcrest"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Hamcrest framework for matcher objects.
 
diff --git a/package/python-pyhamcrest/python-pyhamcrest.hash b/package/python-pyhamcrest/python-pyhamcrest.hash
index 176079e0f5..ba230d3a07 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.hash
+++ b/package/python-pyhamcrest/python-pyhamcrest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyhamcrest/json
-md5  c808291b2fca0991d044927884e6d15e  pyhamcrest-2.0.4.tar.gz
-sha256  b5d9ce6b977696286cf232ce2adf8969b4d0b045975b0936ac9005e84e67e9c1  pyhamcrest-2.0.4.tar.gz
+md5  c731efc9bcb93ef4f73d110f5ca8e844  pyhamcrest-2.1.0.tar.gz
+sha256  c6acbec0923d0cb7e72c22af1926f3e7c97b8e8d69fc7498eabacaf7c975bd9c  pyhamcrest-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  71beae6c8151362cfe398cbd350191a1cc52d3d28499839a7830b25f5b50a7fe  LICENSE.txt
diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
index de5295e964..6631ff1d6a 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.mk
+++ b/package/python-pyhamcrest/python-pyhamcrest.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYHAMCREST_VERSION = 2.0.4
+PYTHON_PYHAMCREST_VERSION = 2.1.0
 PYTHON_PYHAMCREST_SOURCE = pyhamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
-PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/b1/9a/588f086b64ace8d2e9843d8551e9068b2570c3c51b06cb49a107303f8700
-PYTHON_PYHAMCREST_SETUP_TYPE = setuptools
+PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/16/3f/f286caba4e64391a8dc9200e6de6ce0d07471e3f718248c3276843b7793b
+PYTHON_PYHAMCREST_SETUP_TYPE = pep517
 PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
 PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
+PYTHON_PYHAMCREST_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
