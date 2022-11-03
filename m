Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC799C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70ECE817A7;
	Thu,  3 Nov 2022 19:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70ECE817A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUu_3_c9xupY; Thu,  3 Nov 2022 19:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F51A8176C;
	Thu,  3 Nov 2022 19:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F51A8176C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E40F81BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFEC98176C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFEC98176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5Gn-2i-L8KN for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:10:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD3F8174A
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFD3F8174A
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:10:40 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id r81so2183151iod.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NqAX9nJJUIu7uPH03lOjAfJ4lxdyvjFPCdHwB3I2YGM=;
 b=UdBSbKVRYs8BEmquJJsLpGdQERU7HwZ67HRlTb6RtV10W62OatMaRyMq4RwUy9bZwQ
 FzVwBMakR84aDqRjVRXcnGdPoSSgAzWV8u/mJMjbrGogd8OTGW560dL4OF3gWG/S1IHq
 X5bp9zPsJcqguQIRlr2TNYPezUNfAdUcdi33TRyepczRT6HC/sQ+4vcR9KidzTtI09o7
 kPeZR8oKxrpTTb0iM/NJKH/J5mBSFndlMNmObWWPLLogq7fEomgH7RRrJKptrpG88qcK
 JEm6FP7R8t306zSIvhY+aMTZgoYlpf+r0DaBNOfXrBni8htiyqpQKUYDx3D4YGUipca7
 /crQ==
X-Gm-Message-State: ACrzQf3yRscm8OsrtIVX4szwy3mYkmGj+0WOWj4hVavCCvdUPQ/FSnn6
 Y57JTST9bBWOAakygv2JuMSActCoJHhLyYdH
X-Google-Smtp-Source: AMsMyM6WSNzNJ+AO/XImlkdVAYNzLeemquv8VrA0CpgvBuvIMMIQxz8937S8LUxOdb/GthuNVDIwOw==
X-Received: by 2002:a05:6638:343:b0:375:8a1e:c186 with SMTP id
 x3-20020a056638034300b003758a1ec186mr4901678jap.92.1667502639612; 
 Thu, 03 Nov 2022 12:10:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q5-20020a02a985000000b003750f2bc28dsm476161jam.3.2022.11.03.12.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:10:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:10:37 -0600
Message-Id: <20221103191037.3911655-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NqAX9nJJUIu7uPH03lOjAfJ4lxdyvjFPCdHwB3I2YGM=;
 b=pu/fUTclI8rdWT+Vnwf97rS91AtFyPPxKdkJuLvkzTwqTghaWbcw2vBPjhVyG7m5J0
 358jI6kIjjTLNcrNcrxVGgI5oDM9DWydwNoqMsXDRpZQziYsEJLgj9rhrZpzaqyxU0k3
 LTven0gJgG/G2UFC8FHQ6c8xdiFWmGHp63X7C4MnAuShbVqTdgaTEv6ZmZS+sXno1Cem
 cjj19tDmjxmI+zRnVkZVhBbiYQ81NPBT9sXT7wKn4XQ2Hpcmd5eA/OJBAVh4KcX/PPZ1
 JUki83HHoNcF+RPEwsuj6BuQty1Sop7g03z2Ttn572WL4S4lRCy9Lzr+2DoJN1Z06Qft
 IocA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pu/fUTcl
Subject: [Buildroot] [PATCH 1/1] package/python-semantic-version: bump to
 version 2.10.0
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
 package/python-semantic-version/python-semantic-version.hash | 4 ++--
 package/python-semantic-version/python-semantic-version.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-semantic-version/python-semantic-version.hash b/package/python-semantic-version/python-semantic-version.hash
index 692905ec29..49e28c429a 100644
--- a/package/python-semantic-version/python-semantic-version.hash
+++ b/package/python-semantic-version/python-semantic-version.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semantic-version/json
-md5  76d7364def7ee487b6153d40b13de904  semantic_version-2.8.5.tar.gz
-sha256  d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54  semantic_version-2.8.5.tar.gz
+md5  e48abef93ba69abcd4eaf4640edfc38b  semantic_version-2.10.0.tar.gz
+sha256  bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c  semantic_version-2.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a85e7ef2fbc670d26781ed6844cd31a7e8ada65d21328f75a0b02402faae37ea  LICENSE
diff --git a/package/python-semantic-version/python-semantic-version.mk b/package/python-semantic-version/python-semantic-version.mk
index 2352690e26..76a65e734f 100644
--- a/package/python-semantic-version/python-semantic-version.mk
+++ b/package/python-semantic-version/python-semantic-version.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMANTIC_VERSION_VERSION = 2.8.5
+PYTHON_SEMANTIC_VERSION_VERSION = 2.10.0
 PYTHON_SEMANTIC_VERSION_SOURCE = semantic_version-$(PYTHON_SEMANTIC_VERSION_VERSION).tar.gz
-PYTHON_SEMANTIC_VERSION_SITE = https://files.pythonhosted.org/packages/d4/52/3be868c7ed1f408cb822bc92ce17ffe4e97d11c42caafce0589f05844dd0
+PYTHON_SEMANTIC_VERSION_SITE = https://files.pythonhosted.org/packages/7d/31/f2289ce78b9b473d582568c234e104d2a342fd658cc288a7553d83bb8595
 PYTHON_SEMANTIC_VERSION_SETUP_TYPE = setuptools
 PYTHON_SEMANTIC_VERSION_LICENSE = BSD-2-Clause
 PYTHON_SEMANTIC_VERSION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
