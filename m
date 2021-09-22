Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F85EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:09:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E13361268
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E13361268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C234051A;
	Wed, 22 Sep 2021 07:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOqdApScGwXw; Wed, 22 Sep 2021 07:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3265840504;
	Wed, 22 Sep 2021 07:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9C031BF3FD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D697881A16
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vxFwt71a5au for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 07:09:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1141819F6
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 07:09:00 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id m11so2096453ioo.6
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 00:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odAnzzPxXm68ydkMsEipFJRiQSD/kV5qsgj87FVq4Dg=;
 b=OcAbZM4jgLwabp1HHeSJkdWn0FKHozcXDaZuGICiBAsKQVQl/Ksd3I2/+0EQ+xQB0k
 RJ4IWAetk1dCLpI0FizReJnqVr+L+nMy9N+g4JzV1JjEZh82EKP6AkgYBoD/lBju0Sju
 +grBeJALAluyd7oPa1w/wX0V3gxNETG93y3NXCEJgy5ziKW9DdriNRr9s/xuq8R0wqSU
 H/EdxlqbJmwZ2lA3kmKa4f/wceTohOfYsJX1wLhBY6Ud4znHTmtqXYmFmNBs7qJ5FLQZ
 0f6vki7JRYBhUCHxHePRxi/tarEKvXAQJEoB6D6HNIpyqd0eVle2uws+FUpDkxFPeqYl
 J4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odAnzzPxXm68ydkMsEipFJRiQSD/kV5qsgj87FVq4Dg=;
 b=pEaHfylUP/XWsPGFK2kscvpDlz0yPUJ9mWUbiAoc1DDCSxIHKIY4LwEhPw7P67rNhv
 HBlg43YN7Jz65GKW1KwSPwiuK7tb63kivLm7UYO2SepxfAPLDoxls81eq5le4KUo/S7c
 +TntIAOOoF6BRnc0E+f0Asxi49SV5kh0UZo7DRew193LJJvr+YuPogQKaYqhZk02oJSN
 TYcxixvqbEdpaHS5kS0vgRXnGSisZhuEeakmW++MYwEAlNrQQz1lGQfZDgkkwsEvlty8
 esKs7PLmS40MTXk8rGukjR4yk5ZHUGNk4TZXE6kRffsXAVyZDPx5GVLoOP5FV7UYmDED
 aJEg==
X-Gm-Message-State: AOAM5333YVbCRRzokDIWyb9U0IW5QMjvWzJG92M34AZoHx6gGCoPEsFF
 sl6HXjRLoDSTq0Q4nveIvc9dZ7NAD6U=
X-Google-Smtp-Source: ABdhPJzJorvr38IeD/VBdOryJ1bfQWGyvUpN+f/XtDOIJuThwWKdIN6xplmmnxEjPE+IkdsbbZrebg==
X-Received: by 2002:a02:6988:: with SMTP id e130mr1245149jac.97.1632294539508; 
 Wed, 22 Sep 2021 00:08:59 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id b12sm631811ilv.46.2021.09.22.00.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 00:08:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 01:08:54 -0600
Message-Id: <20210922070854.719889-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-pycryptodomex: bump to
 version 3.10.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

License hash change due to test vector license being moved:
https://github.com/Legrandin/pycryptodome/commit/eda4f65718f9f9cfa3868f17675679ac583fa5bb

This doesn't affect us since we don't build the test vectors.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycryptodomex/Config.in                 | 2 +-
 package/python-pycryptodomex/python-pycryptodomex.hash | 6 +++---
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 package/python3-pycryptodomex/python3-pycryptodomex.mk | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-pycryptodomex/Config.in b/package/python-pycryptodomex/Config.in
index c7127fee59..a6d42f383d 100644
--- a/package/python-pycryptodomex/Config.in
+++ b/package/python-pycryptodomex/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_PYCRYPTODOMEX
 	help
 	  Cryptographic library for Python.
 
-	  http://www.pycryptodome.org
+	  https://www.pycryptodome.org
diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 1016672af8..0dd2a7c08d 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  08bc8fbbcd6060c06f1f10e2dc18b834  pycryptodomex-3.9.9.tar.gz
-sha256  7b5b7c5896f8172ea0beb283f7f9428e0ab88ec248ce0a5b8c98d73e26267d51  pycryptodomex-3.9.9.tar.gz
+md5  91b86ca7fa80d41179d7735067c7347a  pycryptodomex-3.10.1.tar.gz
+sha256  541cd3e3e252fb19a7b48f420b798b53483302b7fe4d9954c947605d0a263d62  pycryptodomex-3.10.1.tar.gz
 # Locally computed sha256 checksums
-sha256  d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
+sha256  c273fb45d120362875aafdd6189f4d7c70f6c36d4cb7ce427e0dc704753639df  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 341d1fa0f5..fc2dca4da9 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
-PYTHON_PYCRYPTODOMEX_VERSION = 3.9.9
+PYTHON_PYCRYPTODOMEX_VERSION = 3.10.1
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/14/90/f4a934bffae029e16fb33f3bd87014a0a18b4bec591249c4fc01a18d3ab6
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
index bd7602c9d4..76ad74b43f 100644
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.9.9
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.10.1
 PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/14/90/f4a934bffae029e16fb33f3bd87014a0a18b4bec591249c4fc01a18d3ab6
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
 PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON3_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
