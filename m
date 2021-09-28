Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218C2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7EA260FF2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7EA260FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C03380F2D;
	Tue, 28 Sep 2021 11:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pv_zYCFAJR-Q; Tue, 28 Sep 2021 11:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA76580F18;
	Tue, 28 Sep 2021 11:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A00B81BF84C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F560608CB
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIWt3SNqQWqC for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 11:02:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63F0560AEE
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 11:02:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t8so57418308wri.1
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0teWW8sOFiSQLt9W++ewsYOKnC/1mnNbHxff8kP327E=;
 b=lKb5JzuaIuRyanvUTum8G45ZHVHCdivWhcQFCuiMWaawwDaKQM5VQOj7LRGt85j9PD
 Esud9gY+oKcgAIyhWu/tu4HnmUdx+o+5qjJCC81rhQMO1FvawZ//4jU9pGyoasfAAqqY
 rr5VK4WZyoa2Uyrd5dlDIFZjbXe07Fz7fRwndrcu4UyF3ps72TuQidubijowKmG91QX6
 X3W/FbQtI0tiTxj8z8s1LaqiCCQ7mX2KXs3xA10THbaMP/yZdNOEm16tWgTpVnWlatHg
 XmBtxPq/H6yauAlRQQ1KblS5KYSL7iaiAgp9J2GMhm/YKC0BXmnIQMxuk/K4kCscqrj4
 KQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0teWW8sOFiSQLt9W++ewsYOKnC/1mnNbHxff8kP327E=;
 b=ThUuNrc0Q89yuGOrXUCsLQFNkqsw4pMI+1R/GkfSzKQvldaYmyCRT83zQAl++DlO6S
 vfuuJIaYuROa392RA+u/BOJtQRX03CUQG56fP4VfAstCSD0b6DtqA2262OIkxdqF5ofT
 +YR+xEk6IP2DNDBNBXGXsKL2YBU80zlwO0a5Gwaid++kWit54EAaH8NSDor0byVH1CBd
 ahAMp7QxGz2znvhTdJJeGm+oumxDajIyzfbVW6kOrdE7FShCStDx8kIfoAIkfkvpBcQB
 pD+URVYwBIhQ+gwk+0BOHiolze8xdSjvWerUnYfn5SDzPQM7q3gUP2s3xVHK9uxEAyT+
 dXIA==
X-Gm-Message-State: AOAM5304OIZ3dDuSQaeu9V25nQaAIdWyJfPKoMyaXQqACtVkmM+C9+Eu
 yl2FoM0zFa7r2vT8BFaVnZD9u3ZmEbQ=
X-Google-Smtp-Source: ABdhPJzNipVlq6PKrw9Qjkmk1HBA6aGPA45nfembri2yMSVhePSQCneg1yAGJfoKzM7XziziPBz4ag==
X-Received: by 2002:a5d:5281:: with SMTP id c1mr5758208wrv.92.1632826942452;
 Tue, 28 Sep 2021 04:02:22 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1254:64a2:465:81e0])
 by smtp.gmail.com with ESMTPSA id c4sm19432155wrt.23.2021.09.28.04.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 04:02:22 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 14:02:10 +0300
Message-Id: <20210928110212.596939-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928110212.596939-1-asafka7@gmail.com>
References: <20210928110212.596939-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.20
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

* The package doesn't support python2 anymore.
* Update URL in Config.in.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-prompt-toolkit/Config.in                  | 5 ++---
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 6 +++---
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-prompt-toolkit/Config.in b/package/python-prompt-toolkit/Config.in
index 1066e166d9..ad4f8162de 100644
--- a/package/python-prompt-toolkit/Config.in
+++ b/package/python-prompt-toolkit/Config.in
@@ -2,10 +2,9 @@ config BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
 	bool "python-prompt-toolkit"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  Library for building powerful interactive command lines in
 	  Python.
 
-	  https://github.com/jonathanslenders/python-prompt-toolkit
+	  https://github.com/prompt-toolkit/python-prompt-toolkit
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 2d0c7ec95e..5a24634a56 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5	5016c523e603cd7119644fbc0f00ce53  prompt_toolkit-2.0.10.tar.gz
-sha256	f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db  prompt_toolkit-2.0.10.tar.gz
+md5  ba9e63c3e7e5a4f4ce4e4770a4daba96  prompt_toolkit-3.0.20.tar.gz
+sha256  eb71d5a6b72ce6db177af4a7d4d7085b99756bf656d98ffcc4fecd36850eea6c  prompt_toolkit-3.0.20.tar.gz
 # Locally computed sha256 checksums
-sha256	303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
+sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 183c7d258b..b575783f96 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 2.0.10
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.20
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/0c/37/7ad3bf3c6dbe96facf9927ddf066fdafa0f86766237cff32c3c7355d3b7c
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/b4/56/9ab5868f34ab2657fba7e2192f41316252ab04edbbeb2a8583759960a1a7
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
