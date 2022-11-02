Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8A3C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7893F408D1;
	Wed,  2 Nov 2022 19:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7893F408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 523DkauxVvzG; Wed,  2 Nov 2022 19:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A961540194;
	Wed,  2 Nov 2022 19:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A961540194
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE4D91BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C702360AB5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C702360AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hamHTM-ztku1 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:35:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE0660784
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEE0660784
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:35:33 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id z9so9985442ilu.10
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fMdmBK9Wfa5h4zX18d8ATKhHHMeldkdh5pEGSwG3yjE=;
 b=7NzFizd2ZrZCnWbe4XKw9FD/sPH95rflOT6Ktv9gkmFVEMHYFw4jzLOFiEfy5Ae0cs
 rjX6xnwePyujjJ/r/kK7RqOpAptD9LQPg1gE8GZ2v4rqTwBUp3aOqI2DZOsAGvvJzBzH
 p1jkQ7w+als900PapN4m61/mkWo7Jc5t0AfnTLYLSBKNHTyw1hcF24gEhByhTxgPVYsB
 RD7zXz4FSF2bvW9yVvQ/oW91CuKEucesWbQBW6GlsZ0aqKedbL7H6dYkPP65vidRQWEl
 FXIH0kSIMtRrk6wVuuvsKNiVu+PGcvdvAJ83lhJoRqJXFgPEaZJkwa1Sb5ii7BjUX7JJ
 gCMg==
X-Gm-Message-State: ACrzQf1nuoKBfx8+/AQNxI2QA9XxE2gQHasSFgz8wYo8M3LA5U6D/BN5
 sNoO4gw36Sov8orAhb2vexVMR4XqiBCxPQ==
X-Google-Smtp-Source: AMsMyM6I4OAclgRUAwPyx1k+1n3KuxO4eIQZ4o3drRpWaIqq7UQEgthcZ3eKOD5BkxrqGfzZd7I1xA==
X-Received: by 2002:a05:6e02:1207:b0:300:afb8:b51e with SMTP id
 a7-20020a056e02120700b00300afb8b51emr11512343ilq.35.1667417732598; 
 Wed, 02 Nov 2022 12:35:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m23-20020a023c17000000b0037586addbe9sm672547jaa.88.2022.11.02.12.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:35:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:35:30 -0600
Message-Id: <20221102193530.56710-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fMdmBK9Wfa5h4zX18d8ATKhHHMeldkdh5pEGSwG3yjE=;
 b=oyekv7VfP976VRTIJ0+CT/bl6ExPoE+djrmzlCfgocK4VSSZdmS8B5ezVjawZKNJiX
 EVKZAcz4nRZmJflCPyPmvoMJ83eN83uy9cqXLkw/YrwQj/3ECLyPDyPAI3QyfpWg4wj+
 MzGwLfZ0aB1x5nqjj8DlcOWbTG/FWIzHuXoCl5wae7g+hBusSE1o1B2TrXDQLjDPozo3
 +ef5mWfUe8ASxspfplYR7ExT7nD8SMSTX4cdoSEMLRSKRFwBe4JPyFRVmrzf+T82CA/e
 7TxLjzW3Baf9nt+UV5FbfdFnV9H2P9CJ7V7QORj46G+jhQ1K9hhtRAEaRDSEZBTMcbd5
 2lzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oyekv7Vf
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 38.0.3
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
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 0f6a62164b..40d217f666 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  59f77beef181a9e6643ad2c10b8c6551fc561452287bd3552bec76c86d55b774  cryptography-38.0.1.tar.gz
+sha256  cd0b4536eabc6fcb80aa03430fc2ca485d33249eea0cd23f76c1dd9da410c66c  cryptography-38.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index c0265f5bfa..69eb90d795 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 38.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 38.0.3
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6d/0c/5e67831007ba6cd7e52c4095f053cf45c357739b0a7c46a45ddd50049019
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/13/dd/a9608b7aebe5d2dc0c98a4b2090a6b815628efa46cc1c046b89d8cd25f4c
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
