Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BB2C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0183060DFA;
	Sun,  5 Nov 2023 02:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0183060DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eapQvdH5EEF; Sun,  5 Nov 2023 02:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4558560DE5;
	Sun,  5 Nov 2023 02:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4558560DE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6A01BF263
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0081F60DE5
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0081F60DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0WD1q3qDsw4 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:04:07 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D02D60DC6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D02D60DC6
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3594149e3a1so11266695ab.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699149846; x=1699754646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOr6vOgc80S9HsycV96DnAmu1N31hKFLxIwmdhuRzgM=;
 b=SnaVUExP480SjO0ZSCs8dYr+VwBgSM1fUoP47nxbC0vfi773JYNlxG0pdHIwQPUI4p
 1YkhXd3hxeKC9Bv8M9R0249AXNbjz/0c9KSwWF/r/avBZKIt9v9IDTY28swKCns8X+Uk
 tQeKUDhzCrOTwqVztKXpe86thJflM3SJC+BUqXoHw6Q4+sS1XoqoCawnMdr3jrR0DIta
 Diz1+WU54iBSwnYlcXlyReXBgQexVNyn8YlHKdQJ5F9ai4tNUFgHxEQF6qHFT6RhP2Mb
 C7k1dxYgQPSJBc3lEEd34shg33el3d1RJeU/mPr1YNEMms0jeRM392v99AGPcSMYRX38
 Tf6g==
X-Gm-Message-State: AOJu0Yw0tPCcGEpX9d5LJB+nOiZY1anW4rdR8ef6jlMW5vWWkP8dZlwT
 g82KYmcXBSYfdGYoQ/aR9jrqsLISl7Q=
X-Google-Smtp-Source: AGHT+IFEmDGsZcEMzJtBUKXmlcEznFJvzNr1foI0U+h52LEOxAq/fl3xa0EI2XYn5s6nlBJ9Fkt7tw==
X-Received: by 2002:a92:d609:0:b0:359:48ed:fad0 with SMTP id
 w9-20020a92d609000000b0035948edfad0mr9097612ilm.19.1699149845772; 
 Sat, 04 Nov 2023 19:04:05 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 n11-20020a056e02100b00b003513438a524sm1590515ilj.11.2023.11.04.19.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:04:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:04:03 -0600
Message-Id: <20231105020403.2734709-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699149846; x=1699754646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OOr6vOgc80S9HsycV96DnAmu1N31hKFLxIwmdhuRzgM=;
 b=E11mI5HvSMZAfRd4Q1rryuk0gHO5VJdjvnvqXE7WZezF3P7dT4y1ZJuHWft4puY/Nj
 LYmqEecnX69MI0CB56EGJDMWn9BTGluAOYWM3qeYQ52twYDID2NFBmIamyrn+C7IOA1H
 tS1CqFxF8NktI8swnPGWrcwngldE9T82/6l+Wqujo/TAM40mqw4zfYf0V8CmaqhpQ3QS
 im17hw3j7KFA8bknkXWKFGNxi/7AJx+NMSGmwnY7geTWqGs5NUDLJ79pxobrh1SLYQP8
 RJJhanMM3N8PKyh0MNHPoEg168yAk0k/XeOscKObce0QsNFmqPMAZLHgOMFwOnkR0jD/
 l5og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E11mI5Hv
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to version
 4.1.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bitstring/python-bitstring.hash | 4 ++--
 package/python-bitstring/python-bitstring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index f078cc7f14..c2ff9a69d5 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  ffd806650062e2fae33ee19b51906924  bitstring-4.0.1.tar.gz
-sha256  7719f08f6df89ce28453a5e580d4a8ec1d1bda892dbb033466da0ccd9bdcb706  bitstring-4.0.1.tar.gz
+md5  1750c35e8e45f597725037d35eed9ba1  bitstring-4.1.2.tar.gz
+sha256  c22283d60fd3e1a8f386ccd4f1915d7fe13481d6349db39711421e24d4a9cccf  bitstring-4.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3705eed5a923f35d9bfaca1f10e9136cc84d6e576570aec661bda69991f129ea  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index 11c9375707..9a5d8dfe84 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 4.0.1
+PYTHON_BITSTRING_VERSION = 4.1.2
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/d2/64/e733b18349be383a4b7859c865d6c9e5ccc5845e9b4258504055607ec1cb
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/23/fc/b5ace4f51fea5bcc7f8cca8859748ea5eb941680b82a5b3687c980d9589b
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
