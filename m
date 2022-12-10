Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C839C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D14DB80A8E;
	Sat, 10 Dec 2022 16:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D14DB80A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RZSNVrM4-zn; Sat, 10 Dec 2022 16:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A6558148B;
	Sat, 10 Dec 2022 16:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A6558148B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4B61BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE9CA8148B
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE9CA8148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8EnxbDtwR60P for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:10:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C0481469
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05C0481469
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:10:17 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so3384837fac.8
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5BkPTCWLRY6lGXZIWhQNFD78iSeCJwdOJDqMYT7Mhx0=;
 b=pYd7BICwdaWn0aJseUAy/hK5W4oM8bdUtAlBnvY11yXrJlPNgJ6PPNLNTvcGqHhDIW
 70FTl1ZgLtvELwmNgeFstFznXxGuhbIQ6IMSuBRPnfai34KpF3Gm0TmPQBjZXf2h1GhJ
 O5g1qSKa6H1AwGbaOazj3tP2rtYhwIwGjGoNJY5aALm8nIzML1JQDYrrJOmePdxa5szp
 C3K47A+vEwnu8qU7pC/2uQ5wQk8NPNrpvBWwXjmBExSkOuzwrl6DABwkfo9Klmz8JHHK
 +QW68htsXJ2ffZ9PUusnLz4OBDlLaG0F5UoBxsPa25MZ0w/rxkuU1S91IZb43EChpIfd
 Cwng==
X-Gm-Message-State: ANoB5pn8NS85oGa7K+3jJuxYLMw+Ehj8B+Ty7i3+K3zekpYXPLu2rDGG
 /ZMtIa/vhKDmndu0qL/GoCI5V4FztX6FPw==
X-Google-Smtp-Source: AA0mqf5OSFbSO889BDKIgtIqYlnLW8ipbrPwTZZwkbbE7nrhZV3e/mjwsWSyLs2P3xUMuxpt3O+XnQ==
X-Received: by 2002:a05:6870:6b92:b0:148:9d1:5a0d with SMTP id
 ms18-20020a0568706b9200b0014809d15a0dmr3095123oab.21.1670688616800; 
 Sat, 10 Dec 2022 08:10:16 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w27-20020a05660205db00b006e00e8f0e76sm1913363iox.40.2022.12.10.08.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:10:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:10:13 -0700
Message-Id: <20221210161013.2437778-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5BkPTCWLRY6lGXZIWhQNFD78iSeCJwdOJDqMYT7Mhx0=;
 b=eTdsv53djq7o1VzFgKg8yT6QFhPPOtZQQtAgskZsgt618wU9s7kMhpfHKIkXjUHidS
 r0RPKKg5fWPpu7aBlqL+IK+3QtqCGN4a6GUfoJP4Pyo7ZGe8zJ46Ep1IBHACskt5RsCP
 ZfGSb2V1xPiqptLKRToM8tKXFBa+t/Fvq3qpkkVs6w+viebGuwkKjk9HyfDe+1sM/asK
 wBEufAzDnjSZEvN/vMhbRcwZnX2y/f+ZU4gas6BVJcaSU7YxwqsU4uQVGZz6zfNKePja
 AF1CQz9Dqe1mMdVeZeR4/iZ4W2aQ6ehmkLYlh/I3DeFvXYnGYodQ8diQcpQMzprl15lk
 fCaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eTdsv53d
Subject: [Buildroot] [PATCH 1/1] package/python-canopen: bump to version
 2.0.0
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-canopen/python-canopen.hash | 5 +++--
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index 32bcae18f9..610dca3f34 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/canopen/json
-sha256  4394770d528e93a48936138c4a7b37b5dff26d54f82a435ad9790cd1e43f55b9  canopen-1.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/canopen/json
+md5  0719b73bd8ccaeaa9fb758c5338fd030  canopen-2.0.0.tar.gz
+sha256  bcc8aa9ea83f7ada5da0dade81038977be52a93802c2657649729eb1f82065d9  canopen-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index fc328c698e..bd0a3bfba7 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 1.0.0
+PYTHON_CANOPEN_VERSION = 2.0.0
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/1f/2b/55b6d82b3dcba184a01c6fe027df239953940e36a463cd24b71e67bd1f37
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/9e/d6/6ced4b410b904aeee5f7d0227187eae95a5ad769f01014a74fc0e016845e
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
