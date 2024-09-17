Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6013CAC5AA
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 919F3813EB;
	Tue, 17 Sep 2024 21:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aq9dhlk5r0gs; Tue, 17 Sep 2024 21:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89D2681450
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D2681450;
	Tue, 17 Sep 2024 21:44:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B84BC1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B46B281450
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3odfBCNKvQuJ for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6E4E813EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E4E813EB
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6E4E813EB
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:44:17 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a07bd770e2so33265625ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726609456; x=1727214256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AGBdn9j4OlfOG03+15q3G/orIE/2JttweDIalxCHFlg=;
 b=ImAajRnEQ5MXhZaPmgyg7z4F5bELHz2RUJ4QkMInGlEYb+j+BAxiwGo+H6zTmWNtzQ
 gmyV41uDkf1Fc0Ct/sIeRVhT1EdML0mJPT8rH3v7btV0XqB1olpj+DkFXvM+xluYgn4b
 cT6PvHMsaXdnokeQaG4IoFz+Bay6qWiCrbYTTDPoiQdrfGkVB06Kid84NjaELAaYa3xp
 d5N+SMCPF9GRb/FkncXwNQHQqmm7zksdHS/R7GqZ1LQXJYBrOVd2sRz67uT3jLgcHpUR
 GhvMnn1318k6t6Xd/SCLMT70JeGY+FEHkDOaqm1LL4QqhQtZw5epViuPZJBx6M2ugirM
 CkwA==
X-Gm-Message-State: AOJu0YyHMXMUFp8h7Cq6wrPpEBOpRB+Ngz7sHBTtg056+BExK6deKqcc
 fC5gHcsyAeTakFmxgXEDt214fRkByZ4KB1dULcTehTA0GJ48oznGJTBrhw==
X-Google-Smtp-Source: AGHT+IFV288SrBw7GpsOLGYtLwkEldoKtDUmnBSc+Ao0D0K1j1eHPJHv538KQuvv169KEERDfzO4yw==
X-Received: by 2002:a92:ca0b:0:b0:3a0:92b1:ec3c with SMTP id
 e9e14a558f8ab-3a092b1edb8mr113385765ab.4.1726609456380; 
 Tue, 17 Sep 2024 14:44:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4bafsm2181693173.12.2024.09.17.14.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:44:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:44:14 -0600
Message-Id: <20240917214414.77753-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726609456; x=1727214256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AGBdn9j4OlfOG03+15q3G/orIE/2JttweDIalxCHFlg=;
 b=SHsbVpuM9WhFznLnGeGn8KbDFPPMT+nzsj6wwDhOAWU2aie+ZEy3UBY5zPvW5fDSaL
 nfABVlgUWYi8/WePcdBdiT2ZZZ9XUpUaNk1g649cUqEU8ZdOg43DyeCJVFLZTAHdLFhp
 u+DTYdkeOS4ZCEeVySeAR2EJz2xd3V/QmzrOjAK3xhl9nvIuc/1tyoM1jlCdSUbOcaz6
 H1jz7OM69Wci08NmmS1xMsoeTKc02GQiFkaJH/DCU5tZbeO8tiy0EHu3GupBvju6Mnn4
 ui+7ZyvpPDPyds+faps7/KxIE8o3Za/vYW4RBrXtdmyiubt5RAo2CyEYap9B7PM/mWtc
 Lkug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SHsbVpuM
Subject: [Buildroot] [PATCH 1/1] package/python-pyelftools: bump to version
 0.31
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
 Olivier Matz <olivier.matz@6wind.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyelftools/python-pyelftools.hash | 4 ++--
 package/python-pyelftools/python-pyelftools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
index 70af8104b9..0c848cdca6 100644
--- a/package/python-pyelftools/python-pyelftools.hash
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyelftools/json
-md5  2b4f82fd30436834b9357a5e74b8ceb7  pyelftools-0.30.tar.gz
-sha256  2fc92b0d534f8b081f58c7c370967379123d8e00984deb53c209364efd575b40  pyelftools-0.30.tar.gz
+md5  abd09b11e10bf32bfa6cf968b7a41e57  pyelftools-0.31.tar.gz
+sha256  c774416b10310156879443b81187d182d8d9ee499660380e645918b50bc88f99  pyelftools-0.31.tar.gz
 # Locally computed sha256 checksums
 sha256  ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 0e52c0b885..9c46419e41 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYELFTOOLS_VERSION = 0.30
+PYTHON_PYELFTOOLS_VERSION = 0.31
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/84/05/fd41cd647de044d1ffec90ce5aaae935126ac217f8ecb302186655284fc8
+PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/88/56/0f2d69ed9a0060da009f672ddec8a71c041d098a66f6b1d80264bf6bbdc0
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
