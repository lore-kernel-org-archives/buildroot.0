Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61365C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 07:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7644606C6;
	Mon,  9 Jan 2023 07:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7644606C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ade9Ms0oiC_Z; Mon,  9 Jan 2023 07:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17F1C6074C;
	Mon,  9 Jan 2023 07:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F1C6074C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 529861BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E1E8174C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E1E8174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgVPrkVQiJae for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 07:16:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0580D81854
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0580D81854
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 07:16:13 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id y4so4212299iof.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 23:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sN9/391VQRwS10uv3LoPDLXbcO4h8mQUYCL63o64/S8=;
 b=mCyWkq/MPY4fABmymOo9pqbDzX9sC/gSEJSR4EYvBkhpGpSWyrvLmxG9HP6jN7yMln
 /ezptCiWI6lFIhp9QMiUqlGiKAFSi0bsh8V1HLHpMGqLOn+lY3HhCvGvdSmi9UW+qxqF
 J2+Xq3xZPbAFvr3mKxyXk1dkd9+sW4WKs8dt3jsuoQPXwMpWgAD0OvfdMwzZnndqb00v
 HZ9T4z/HNWOGwxUQJA27cTnwR2nKskTtXb847Zpx8n4TytilYjyTFZYEjrJlanoPPBTv
 z2kHNfsN0FoWxRbO28e85z5FisWGzuh6w7HLiPk8t4PMKZpIezqgc8PTaq/obuCYHYm1
 6etg==
X-Gm-Message-State: AFqh2kqD7otSkgwKos7inQaZNQRniUc1O6AW+j00gCqr2yoit0rMQTLv
 pmACIyCZpdN32f7VqizbXUlJaCpuDC+LAjOu
X-Google-Smtp-Source: AMrXdXuz+o9vEkkG4hOrVojyR/TrbV4ZJrBgDZgnBlvuJg6OMzjwj4LtLdt0PIDMVE8ifEYJmewEJg==
X-Received: by 2002:a6b:e806:0:b0:6df:619e:6589 with SMTP id
 f6-20020a6be806000000b006df619e6589mr51213692ioh.19.1673248572855; 
 Sun, 08 Jan 2023 23:16:12 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g26-20020a056602073a00b006e30c7e5cb2sm3008180iox.47.2023.01.08.23.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 23:16:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 00:16:11 -0700
Message-Id: <20230109071611.3156580-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sN9/391VQRwS10uv3LoPDLXbcO4h8mQUYCL63o64/S8=;
 b=l7OEYwEseVU/3l4vHBLKo+mtC96d1CjeCOvhSaXrKejOVYtltGJfxiYtEcNRsL32n7
 zngVBAN1UKGTvEM3eUrlj3AHbftFQ00zQsVE3iqBujmj3IbnbYPiMkwt7G3iTQRA1aZV
 TuN9caXTI/2IqiODDPaf2v/ZesY543Ft3eQiRgeY9YCz+sE1TnB8VVw80Tzs3zhe1ZKr
 kULFSzhKdxLzQQiMl9wdNaMykDaXxi5qwbrIxaIZsSXPy49ofwqIt06h7XkmfBOUNwFi
 VQqjMyWGfiUIKIRNzJUnrOl4KfhdeISPLukzzhapAzqWyPkmcb3Y9krzmDOWULQf9U/W
 W8BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l7OEYwEs
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version 5.7.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 3dfc681167..759cafc250 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  45a74680e2936470821bf74a8f043a71  ujson-5.6.0.tar.gz
-sha256  f881e2d8a022e9285aa2eab6ba8674358dbcb2b57fa68618d88d62937ac3ff04  ujson-5.6.0.tar.gz
+md5  f93bd7aa33e3e6ed41c9e3782abe7b48  ujson-5.7.0.tar.gz
+sha256  e788e5d5dcae8f6118ac9b45d0b891a0d55f7ac480eddcb7f07263f2bcf37b23  ujson-5.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 24ad4822b8..3afd33cb5a 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.6.0
+PYTHON_UJSON_VERSION = 5.7.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/45/48/466d672c53fcb93d64a2817e3a0306214103e3baba109821c88e1150c100
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/43/1a/b0a027144aa5c8f4ea654f4afdd634578b450807bb70b9f8bad00d6f6d3c
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
