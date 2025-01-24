Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816E4C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DDDA608FE;
	Fri, 24 Jan 2025 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7ND1-9RGStf; Fri, 24 Jan 2025 19:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4185D6090A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4185D6090A;
	Fri, 24 Jan 2025 19:50:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C77F941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFBF76090A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZyLezF5ferk for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:50:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0BE0608A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0BE0608A0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0BE0608A0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:50:50 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-8521df70be6so104146239f.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737748249; x=1738353049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=La90bURkY8O/t+gl2AXyRg2SbzH2fHd+RB53wRiT7w8=;
 b=DHN2h/Ihb4G3701YVkLAr7o408Yi3Z1qoi170OpDE9eFaCpb2SFW/4ySDRK9RYA0fl
 Fu95zIoEBuQqCE8L4JBv591pcYVkmIOsw3RrbaNLnz3uyYimqco3eOcEUd4zdsIxSAA6
 9spPLwp7VjRryHxnlvEPZiHurcqfTXGiGz5Q55MwpQMNWj4y3hw9955mf7LJP2KvbfRW
 hTM/TtrKlGZU+7ozwHwEVgFYT2IxAJDJtl4CiOU4X7V8WvOglWfi9nGtmv/4BtTaNvVL
 OLvQjuaSS1vw2xT2Di55xDAjXutdl9STOSuOqCmumWrqbHYFqF6RmgObB5THJ/gUdglZ
 VZ9w==
X-Gm-Message-State: AOJu0Yy4Z6Q+jq+fdps+jE3K3D1DQbARQ/MtrmSpnuqBI7idIqSBx9A9
 xRYZPAUG9PHXOJqGjdLbco7plvyKIgDhJKOn7wPt6QtNf7mu7wOOWCEppQpu
X-Gm-Gg: ASbGnct9MZ4ihwbv3KXdCJG/UM0c/rCQauDVF+VvGZpsmES7E/xVfEC2zy5QnImzXux
 Zh57d5N9sr6+S4TbsoJUlKn6YM/g6W+0NSowJphwOj7nyojvNpJhTEG5451TPclfKnXj9COFYZ0
 PSGOIZ3nK7kEbsUzMi3TqoXfrkcbtyK0DQFv7gP2Urj2fn2eGgZG9vqgRK7rzAWPFbJoLv18pk/
 eCXfNTApeGD01d1AJ1RzbuKvpWWuwAgjc11EkooJwn85TvKGWpoZBsPD7UQ7DJg3O9CUtpjcZkT
 8k8oSF7vXUPNUayrH8opKmFgLBeVWbZZ4Ux/u/hlnq8Qw3U01gcUfY0=
X-Google-Smtp-Source: AGHT+IFeRw5UzHJr7mMkPHhf3WKyqPZeznlFj0PGZhiR5VxWpeP3Ow5UaqFBl8UlgieDY9hD/hzBNg==
X-Received: by 2002:a05:6602:27cb:b0:847:51e2:eb0 with SMTP id
 ca18e2360f4ac-851b62afe94mr2728394139f.12.1737748249620; 
 Fri, 24 Jan 2025 11:50:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da0390dsm803684173.3.2025.01.24.11.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:50:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:50:47 -0700
Message-Id: <20250124195047.3824467-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737748249; x=1738353049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=La90bURkY8O/t+gl2AXyRg2SbzH2fHd+RB53wRiT7w8=;
 b=eWLvF/4kvg4yRRBgn3x/vsga3j3IPBGsbItUatIjmm18596j1SlWuk/eEcD/hLfNBC
 aWdtrnLsP+hdnWubfzqZUxkSxMM9DWQb8mFQswzhaOQKKZc2qPY+IdQCJVePqVAU0jcs
 x3btQcIlD1uDL0JZTS15X7h0twQHH5rBhk/D7mBqFLVZNTwQ9P7TA5z5xLa872INuaiz
 CXUUNozFOMHdhTc6bbdZiZgP8xWQ10HNR0dkddqJMMFEDRzroFqiLuG33ZIwbFZFZyIy
 4n1RwLte8K0gZWmo7SxkH2i53wBAKbxCTJIP1EqxGj8wJXQwrmlTE3NKvCsEnHvkZJHT
 v66g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eWLvF/4k
Subject: [Buildroot] [PATCH 1/1] package/python-mbstrdecoder: bump to
 version 1.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index 2943ef293f..aa278d4590 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5  33522a4bd9217dae46ebd0761e1a1e7c  mbstrdecoder-1.1.3.tar.gz
-sha256  dcfd2c759322eb44fe193a9e0b1b86c5b87f3ec5ea8e1bb43b3e9ae423f1e8fe  mbstrdecoder-1.1.3.tar.gz
+md5  c9d9514be421c358ca75faea3a430672  mbstrdecoder-1.1.4.tar.gz
+sha256  8105ef9cf6b7d7d69fe7fd6b68a2d8f281ca9b365d7a9b670be376b2e6c81b21  mbstrdecoder-1.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 566420a60e..6f51b36103 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 1.1.3
+PYTHON_MBSTRDECODER_VERSION = 1.1.4
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/70/8f/dd5d4efbe3f90d2d38c948f0ca5c698e2d6cedc58ead2f5b90272cbcb4fa
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/31/ab/05ae008357c8bdb6245ebf8a101d99f26c096e0ea20800b318153da23796
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
+PYTHON_MBSTRDECODER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
