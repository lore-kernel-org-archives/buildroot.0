Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD041C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F84541802;
	Thu,  3 Nov 2022 13:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F84541802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azYWPnt_dXC4; Thu,  3 Nov 2022 13:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D8E4417D1;
	Thu,  3 Nov 2022 13:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D8E4417D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A72581BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 828174049C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 828174049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmLSpUmGSu0C for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:57:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD89C4049A
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD89C4049A
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:57:31 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id b2so1336122iof.12
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VZDb3OTOI82YeTS1yyzTdLS1nN4vPEYvjRfjbiC4MWc=;
 b=Xr6qT+WK0vTzEX9BYlF2b6+6eNeiZml76bfOERKFKiUIMIac7pz7+XtUArVXNu2+yO
 CWvLTULY9IobzVZ0UJGusoeH6aKEGAxvZAcY9tL77QDDr/PnfrC4vost6DrtH8O51S65
 5UApxNvRjrxbw10wSBZONK5ShoBzzJY+FYzIiGjeDBKcL05l3L+61LjKCdHTGR0Gk5ND
 lLjoB9xByzQWFfxxuVAez/1AiJg/wisidBkQLqqVpVb2/wTDfFoItDO+/5NYfXHg2lR3
 rLtsLSsJnQq5cOWxEoPWoiS26Nu0sGw2MdxgOQZ4Yq7acyBGU/XpSSiQlu5fKFloAymR
 ixrw==
X-Gm-Message-State: ACrzQf2WWrFb0CRz32+9oLNPuaYTLKbnON5V8tN9QrttUGGDj5pvxUeU
 0JQEs2ckGPW2H2jTTT0QoSH4bOWJhLvRL0eU
X-Google-Smtp-Source: AMsMyM75oUhEes0+aX+KCkcEDFkgtgN+cOOyWUv27fpY89MjdxGg/pmb4XHzfgaaHG/lW39vohJ7Sg==
X-Received: by 2002:a02:a0ce:0:b0:375:631f:10b1 with SMTP id
 i14-20020a02a0ce000000b00375631f10b1mr13320250jah.11.1667483850465; 
 Thu, 03 Nov 2022 06:57:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 b19-20020a026f53000000b003743cc92b27sm227007jae.157.2022.11.03.06.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:57:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:57:28 -0600
Message-Id: <20221103135728.3519806-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VZDb3OTOI82YeTS1yyzTdLS1nN4vPEYvjRfjbiC4MWc=;
 b=ImM1X/4Ea/KleuxvY6x+IRxhHSoSMFg+CdVpOnn9NyvpzIFsDHbPSJS3/ddxt7xuF2
 celYF6k7st+pXyqy43efbDhE/9Dk2Lz9/FXqatmvkwjnWqGQ93OthX8fve6UpoJLeWXf
 +r0VEN5TnuEvbr9n6mmRfa+GOaSld1AxZEpghm0Mfhl6u8fk07owtbdQELfXWt7Wse7J
 e7wYwdvRVWA8zcq9x1tQpSWRNyLzTbYUEkITa5Y9OarGJpybZ5Z9afBQqmWwgkfoP2yK
 5UTA7gq1L5paUH7XhOORcExS7DvomLctgQicqsoECg+49dV2JODNMmDJU0U/wg8wHBmN
 NIoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ImM1X/4E
Subject: [Buildroot] [PATCH 1/1] package/python-pudb: bump to version
 2022.1.2
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
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index fc19f589d9..d9943a3601 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  100b955e103b72279604420bbdcd07a5  pudb-2021.1.tar.gz
-sha256  309ee82b45a0ffca0bc4c7f521fd3e357589c764f339bdf9dcabb7ad40692d6e  pudb-2021.1.tar.gz
+md5  c2b4275b76068f18d630f7bae889345b  pudb-2022.1.2.tar.gz
+sha256  6b83ab805bddb53710109690a2237e98bf83c0b3a00033c517cdf5f6a8fa470d  pudb-2022.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 31df3147d0..7df38f0f02 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2021.1
+PYTHON_PUDB_VERSION = 2022.1.2
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/c7/69/813e93519fc28744457ff68fa2eaac3b4ea30dda1e6994e969fe9d3008d9
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/8b/ef/6dea7c63fdddd7753e2a2930e59799ef32247f2499c0d9bcd233439e7483
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
