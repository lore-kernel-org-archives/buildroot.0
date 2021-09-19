Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9CEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:37:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F1160232
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51F1160232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC22783F4D;
	Sun, 19 Sep 2021 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKhkuDYnsUvD; Sun, 19 Sep 2021 19:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31E5F83F55;
	Sun, 19 Sep 2021 19:37:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4022E1BF2F5
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BB1D6073D
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3XXLEyL2szx for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 19:37:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2969160607
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 19:37:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so14000914wmc.0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2MMOKb/F+qj4dHx4oBSoNsGScJcgEa6GqqBCDPvgyg=;
 b=ZXxkygqp4UAuBIb2s13jxoOBQKPs0XHvD+qMYymGT/wHO+KXOFVL4EkWuIrnbmdEIb
 aw0ek1iGa8dqinWG6VeSzuZYWh7h4L9mSHAaausCd7CHGmaxnZz1gmiyqsdi0/zEnKth
 z19bbE7ZFYjV9oDVIgb0TXbU7cWvor0LNSaM+Gz5W5NAwB2J7UMo8inKECrNCkOrokRa
 AhCnD+azsmDT/nBFaN/W6kpVJw+IEdhwnRPxf4BBjRyCKIfJHNVLsrI2wTzK15sQwb9B
 nCT+ZEmCe7hYyujK1OiDt544E/tSqlagbCYy6zl8ExcR+BMPIIRbMCR460OSqCvmUWtF
 7W4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2MMOKb/F+qj4dHx4oBSoNsGScJcgEa6GqqBCDPvgyg=;
 b=tqMhfmS4/RwdcvwQ4JJ7P2aPYc4fIzPvhuJDq2CFQamsRCftxjAYEQtvZGyBzxwU5o
 3jpzb+lSFgUAo/2fM1ivEDLu4bRUGO6xf3+X3dabL1GSN0bodkjAaqQnhdbfm0Tno2We
 pUnuX0UX65TL8NU+07ZJ7vGVM8IXHrQKmkPPg68gLOIbaZxV5ba/sOHkXXVUSKBfEgQl
 OQW3g4TDYWxkPGlT6PpiCsiXu+RrsG76ooZdvafOB+h6cBg1N5GjRznNzfl4UgfMs05O
 cgN7yZjA//e6Zf/hyiXG+hxJ5B5AnXnstRcu+zUGERyXSDim5Nf2Mmz3tLhXZKPSQqST
 Tfyg==
X-Gm-Message-State: AOAM5328zEJNfrDwsRxYleG56T8eNsBcLRYn83RHATuLbJ3xR60o9RkB
 Vb3s/sLD2cFpkInDwKk02B3I7j03mNk=
X-Google-Smtp-Source: ABdhPJxBtDTbrIYqWZVb2iEwf+8W/bCZmFMZqRQXbhCK2sY1T6gda7ZoOV1HUG4k8gChUEIkvfwXMQ==
X-Received: by 2002:a05:600c:4b87:: with SMTP id
 e7mr25988836wmp.108.1632080245988; 
 Sun, 19 Sep 2021 12:37:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id l124sm17423049wml.8.2021.09.19.12.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 12:37:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 21:37:11 +0200
Message-Id: <20210919193711.3990663-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pip: security bump to
 version 21.2.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- SECURITY: Stop splitting on unicode separators in git references,
  which could be maliciously used to install a different revision on the
  repository. (#9827)
- Update hash of LICENSE.txt (update in year)
- Update indentation in hash file (two spaces)

https://pip.pypa.io/en/stable/news/#v21-2-4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pip/python-pip.hash | 6 +++---
 package/python-pip/python-pip.mk   | 4 ++--
 package/python3-pip/python3-pip.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 58bc239154..69214110f8 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5	7d42ba49b809604f0df3d55df1c3fd86  pip-20.0.2.tar.gz
-sha256	7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f  pip-20.0.2.tar.gz
+md5  efbdb4201a5e6383fb4d12e26f78f355  pip-21.2.4.tar.gz
+sha256  0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b  pip-21.2.4.tar.gz
 # Locally computed sha256 checksums
-sha256	5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
+sha256  23a7361c2b1581028bc623b9da2bd24997abcaa4781ace6ad444a37944f8dae1  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 71f76e2842..ba7134e235 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pip/python3-pip.mk
-PYTHON_PIP_VERSION = 20.0.2
+PYTHON_PIP_VERSION = 21.2.4
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
index 58e3c06c39..5e20b06865 100644
--- a/package/python3-pip/python3-pip.mk
+++ b/package/python3-pip/python3-pip.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pip/python-pip.mk
-PYTHON3_PIP_VERSION = 20.0.2
+PYTHON3_PIP_VERSION = 21.2.4
 PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
+PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
 PYTHON3_PIP_SETUP_TYPE = setuptools
 PYTHON3_PIP_LICENSE = MIT
 PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
