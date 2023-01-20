Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95568C25B4E
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 19:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2243682362;
	Fri, 20 Jan 2023 19:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2243682362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7We3j_jG_RX; Fri, 20 Jan 2023 19:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671468234E;
	Fri, 20 Jan 2023 19:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 671468234E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF9361BF2BB
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAE29612C0
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAE29612C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rU4n_wEjajDV for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 19:29:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C3B960FB4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C3B960FB4
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 19:29:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so6561021wmb.2
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 11:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K0r8jxXNuMUPTizuigzlT2e0Jnf0KHCBvo81n/RjS04=;
 b=ei5Bwj8gkMlsALyakgyyn7ucNNXNDqnd801Lu3GWoFGR0qks4EBmTP/plHO1Br9X+K
 iGfAUeWaw6Z6fmBGs3Tac/wPjmm3CXoqciM5VFM+i230jbJ2w5o+g74Fm1CosF/baf8J
 NCSsoZGnITXTnc5LcIH7oY1vy9RSjN0Ff0t+bd15y7v8Wnx0DcDn9UqE0asMYf7aECOC
 AGNwddcflIoGwbAOBvaE0fnD7dqdpm79Qez76lK3kpFwQ3h9EbfkCob3HQZaGuCcWaY7
 YiJbsiBDqq09gV+LhDOVHTkV7rbCNQ+sL69w/vD1PXiO9VQ5x5c3m8ONEBetMlLIxqkT
 +4Pg==
X-Gm-Message-State: AFqh2kpEYbxpF/BglujUCzh3eZ2dWfoZziw1yvwU136r6UjYfS/GQclU
 4BMyTFue2KWvltR+ocQNUOanhMQ8Bz8=
X-Google-Smtp-Source: AMrXdXsj8lwwpmM4aZlCOjyc9udFI03bFVMiDwEaVwMZHrGdIA1D6hGOzMxJEQEqTYHtciwQlkl4ww==
X-Received: by 2002:a05:600c:c05:b0:3db:2252:e50e with SMTP id
 fm5-20020a05600c0c0500b003db2252e50emr7335607wmb.24.1674242995076; 
 Fri, 20 Jan 2023 11:29:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003d1e1f421bfsm3707607wmq.10.2023.01.20.11.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 11:29:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 20:29:52 +0100
Message-Id: <20230120192952.8159-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K0r8jxXNuMUPTizuigzlT2e0Jnf0KHCBvo81n/RjS04=;
 b=n4m2AaQH1TVF5XzqvR3JPWCwZXCSyFmZq6xc7+r4pfM66HPINNhKhb8dTnSO099f1f
 EZcIostSZcyl997ZC7iSxoWjslvZ7KL9GgekQ71XVuKImfd5scnxVa4bVYBiSr+m9BSb
 pY1j9E8qf8HZOfU2Gd3ZaWi6qplUZqn6AmIUhFMD8+l7XfjCaOXlnxUKfgRq/gVySALw
 9usUvrdoLVc97VlAEWCteM+gqosslcZ1AVxtbfyLg1XZtK2aQEgbLCOHJk5WX4faEAcm
 Mr+/MTZA2368ZD+RWLcWJA4lUAdhRar3vfRF9ffXEqS9Yy7/KnufKFU6MJwbiSs1YO4d
 7qDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n4m2AaQH
Subject: [Buildroot] [PATCH 1/1] package/python-future: security bump to
 version 0.18.3
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-40899: An issue discovered in Python Charmers Future 0.18.2
and earlier allows remote attackers to cause a denial of service via
crafted Set-Cookie header from malicious web server.

https://github.com/PythonCharmers/python-future/releases/tag/v0.18.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-future/python-future.hash | 6 +++---
 package/python-future/python-future.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-future/python-future.hash b/package/python-future/python-future.hash
index 4fb5d2a2d7..3b2bbb0212 100644
--- a/package/python-future/python-future.hash
+++ b/package/python-future/python-future.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/future/json
-md5  e4579c836b9c025872efe230f6270349  future-0.18.2.tar.gz
-sha256  b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d  future-0.18.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/future/json
+md5  dedcb70d14b23388670d54145aab8be4  future-0.18.3.tar.gz
+sha256  34a17436ed1e96697a86f9de3d15a3b0be01d8bc8de9c1dffd59fb8234ed5307  future-0.18.3.tar.gz
 # Locally computed sha256 checksums
 sha256  916e561392d48471b9c23437f56e2652f320cb3b119ceaa162edf41016f746b9  LICENSE.txt
diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
index 76f32180ac..57bf13d83b 100644
--- a/package/python-future/python-future.mk
+++ b/package/python-future/python-future.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FUTURE_VERSION = 0.18.2
+PYTHON_FUTURE_VERSION = 0.18.3
 PYTHON_FUTURE_SOURCE = future-$(PYTHON_FUTURE_VERSION).tar.gz
-PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/45/0b/38b06fd9b92dc2b68d58b75f900e97884c45bedd2ff83203d933cf5851c9
+PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/8f/2e/cf6accf7415237d6faeeebdc7832023c90e0282aa16fd3263db0eb4715ec
 PYTHON_FUTURE_SETUP_TYPE = setuptools
 PYTHON_FUTURE_LICENSE = MIT
 PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
