Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D9C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D7E404DB;
	Sun, 15 Sep 2024 09:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JR9lpDaDHEXp; Sun, 15 Sep 2024 09:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30449404E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30449404E3;
	Sun, 15 Sep 2024 09:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6812F1BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63F6B400EF
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETfWVjzm-I73 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B46B401A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B46B401A4
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B46B401A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:23:29 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82cd869453eso70859239f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726392208; x=1726997008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=895KAtc3DT4FcsbDJ6pHvYtcRsFOYpgh/5hVmCUG03k=;
 b=HNL1dopgOsRXuwZPSBf7cMWaZ6engntt2KL6pf4jWswmFbEewuiDve5kAhpUGiaKft
 tXojQCnrcvjeBmHTBoURcOSVe1vrN9iJjZSrVHUKSxmV7B0P0F6TorhNJv0AipoHvekV
 dkc5LXZV/osSuAhVRe46ri6Cne2psiCG4VwjEJE4EUN7wrSUUXhCVPyDC3tfywYhqg1R
 /ysGT7jlYEK0oBTWxXHYi4lSfe5LUidEUs3mNUcnD+riyBxUfs54K1asvfvwjRbIfMjL
 BeqRrnkAVwfm8SIRu7g2i8fuHu2VZ943w83lHP0LtQLV/02+uHH8orjCF+oOk72KN086
 AvGg==
X-Gm-Message-State: AOJu0YyuvFSpm2vSE9Y/qUuMCv6TohkSKoFsOglBk4ADoZq42gNR7bXc
 IhhBhpLME6pmAjwU+vfTIig066XpGG+oEMByQxqGJouiphjUwwJcXDw4eQ==
X-Google-Smtp-Source: AGHT+IFZSW2oo7flxQOTtJvis3ojTcFxgFc3hbNrCCPDEpzf69nQoGu5lHGrOvFhJE/Y5fMzxQZn3w==
X-Received: by 2002:a05:6e02:1cad:b0:3a0:9fc6:5437 with SMTP id
 e9e14a558f8ab-3a09fc656cfmr6918695ab.18.1726392207945; 
 Sun, 15 Sep 2024 02:23:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1abd0sm848719173.104.2024.09.15.02.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 02:23:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 03:23:26 -0600
Message-Id: <20240915092326.1591374-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726392208; x=1726997008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=895KAtc3DT4FcsbDJ6pHvYtcRsFOYpgh/5hVmCUG03k=;
 b=bMw8ACXQCW1roryQX1WnG3wqaUKlsiKJGvM3QIoQGqK1FqPP1weVOobFGkA12V/gpc
 OTmjJlXPLRai2IRmLOnX1B/jeID0wFL1ncY0iglAbKezpgB/X2r0055ugVyYemnIrT+9
 +25a+v9Xi7+BwaaLu+bmDLp/dZXY43Wb6UsLFUOk+tBVK34x27ZBAZzPpeCE4no7DjRf
 GYtLuwMDIDUsGqy5EZIPt7+vQSNehIWxWscgqqE/lRcIOn0bfyj4HyJnT+APWdjrlzIX
 E5lmblqRdzZQJ3Ljp55jxkQhKMs5tjk6FeuONGd2iQUhsTGxlMqsFTIMmwv2M1eqnkRh
 LxVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bMw8ACXQ
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-text: bump to version
 4.0.0
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

Drop no longer required python-inflect runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-text/Config.in               | 1 -
 package/python-jaraco-text/python-jaraco-text.hash | 4 ++--
 package/python-jaraco-text/python-jaraco-text.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-text/Config.in b/package/python-jaraco-text/Config.in
index 9ce179b056..44000ccb18 100644
--- a/package/python-jaraco-text/Config.in
+++ b/package/python-jaraco-text/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_JARACO_TEXT
 	bool "python-jaraco-text"
 	select BR2_PACKAGE_PYTHON_AUTOCOMMAND # runtime
-	select BR2_PACKAGE_PYTHON_INFLECT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
diff --git a/package/python-jaraco-text/python-jaraco-text.hash b/package/python-jaraco-text/python-jaraco-text.hash
index 704e75d6be..1e79bf746a 100644
--- a/package/python-jaraco-text/python-jaraco-text.hash
+++ b/package/python-jaraco-text/python-jaraco-text.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.text/json
-md5  9f63a5cdd56061ebd84d8175d1df3b70  jaraco.text-3.12.0.tar.gz
-sha256  389e25c8d4b32e9715bf530596fab0f5cd3aa47296e43969392e18a541af592c  jaraco.text-3.12.0.tar.gz
+md5  3c519c7a49d6448e6dc2073d466afd39  jaraco_text-4.0.0.tar.gz
+sha256  5b71fecea69ab6f939d4c906c04fee1eda76500d1641117df6ec45b865f10db0  jaraco_text-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index 06b028d65f..2d612196a6 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_TEXT_VERSION = 3.12.0
-PYTHON_JARACO_TEXT_SOURCE = jaraco.text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
-PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/53/30/52edc6c9997d48b0d9fbedb6a29edab2b397968f637b76aae299a9128c34
+PYTHON_JARACO_TEXT_VERSION = 4.0.0
+PYTHON_JARACO_TEXT_SOURCE = jaraco_text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
+PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/4f/00/1b4dbbc5c6dcb87a4278cc229b2b560484bf231bba7922686c5139e5f934
 PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
