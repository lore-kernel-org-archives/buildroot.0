Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D31C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A0A481458;
	Wed,  2 Nov 2022 17:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A0A481458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9df-0Sfs7sWH; Wed,  2 Nov 2022 17:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 449A88140F;
	Wed,  2 Nov 2022 17:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 449A88140F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 287601BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 106E6408BB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106E6408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVtZeRXtXbdm for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:48:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1308B400AF
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1308B400AF
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:48:01 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id o65so15648515iof.4
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 10:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=USHFz4Lx3Di/yYKibdC5uIuWkWMwZ4dgKVVY+90b3nc=;
 b=BUd5EXhaCOgzekYO7nUq9mCB1arn1QsKixwKpwTLrUK443u4C7eVYBvZ06tnx5ohLg
 q2hsfjplQyu75vnChYovzYr2Ysnl0cZS074oRPutowwheLMdxfBh+TlxAWO+zImmxULw
 CvTugU+JQWg40We/H527A9OXRh7huvUvme0zVT3MD3pm7uBGhbAJ4NBezLgkPGc4Gq3B
 T5QOcdvmcOKhGzjAkkFHs/9LHqIt+qz8M9bXJs3GKAg2xYlopcfkT2ip2bN9RgqCd+s9
 dKAmRrF3/i//1J9veT0/aZGnJLiklbBfvzibKE0VN19mN+Aavoo6ep3J6IzByuhz6Qdp
 Fniw==
X-Gm-Message-State: ACrzQf2YJAkW31StwKR0Ritvw8FotuSjvkZ+/UoQxNVTwxSL8G89sLRp
 9nxNAknH1vsuOEnx4tRW+u36EfZL1jQ0fQ==
X-Google-Smtp-Source: AMsMyM58Ji4Ygq/YNLjQQ/OpxUJjIlhuZZpjpZtXWCA9mV6UV2Ky+Vs8lXM3Hy55vuQDx/Kob1ikyg==
X-Received: by 2002:a02:8487:0:b0:375:492f:d846 with SMTP id
 f7-20020a028487000000b00375492fd846mr15175707jai.302.1667411279897; 
 Wed, 02 Nov 2022 10:47:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q8-20020a0566022f0800b006cab79c4214sm3208423iow.46.2022.11.02.10.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:47:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 11:47:57 -0600
Message-Id: <20221102174757.2669530-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=USHFz4Lx3Di/yYKibdC5uIuWkWMwZ4dgKVVY+90b3nc=;
 b=LYt54M3dDK30HEUqJDtefXR3jLC01PtukFuroKMon9HMp5g1SIZfjmJ9jEkhjquZTB
 ooDMCv1CBCKNI4lcY3FurIqqgfq6M2ljmXqZp3QBVAFheszZWBzNMKFi9gJ55Ojxx/M0
 we2sCGkS7gFIBvBKpwDDwszJxP7/BjeJxocpgrQ8Knw8eS+ryujDy6Pf73Obx0lz1ws4
 YDAUzW37yWfky47ZVDAOOQ+mAJ6nBKmBQZbnt4/hJQFB9SW+LzWvAkotVpJ165e9nqCn
 QXlItlFzf4L/U38qo7Z/OURk0W6054+A6jNV6vzCOMQNlSUyq5sEi0eyh4Qp0rF5XwOg
 M5mQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LYt54M3d
Subject: [Buildroot] [PATCH 1/1] package/python-alsaaudio: bump to version
 0.9.2
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
 package/python-alsaaudio/python-alsaaudio.hash | 4 ++--
 package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index 8cc1788da4..af3d0faad2 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyalsaaudio/json
-md5  b46f69561bc85fc52e698b2440ca251e  pyalsaaudio-0.8.4.tar.gz
-sha256  84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085  pyalsaaudio-0.8.4.tar.gz
+md5  5408be7d7017ae9272706acb4a543c2f  pyalsaaudio-0.9.2.tar.gz
+sha256  e74a66d6c7a6bcceb990df66d3ebc0fe382fc9d765f35f050f9d98c695304b36  pyalsaaudio-0.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935  LICENSE
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 3344583cf7..205bfdb86c 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALSAAUDIO_VERSION = 0.8.4
+PYTHON_ALSAAUDIO_VERSION = 0.9.2
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/52/b6/44871791929d9d7e11325af0b7be711388dfeeab17147988f044a41a6d83
+PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/a9/bd/24f576c07953671edfeba2545c3c92c46e97384f622957ecf95967c2b456
 PYTHON_ALSAAUDIO_SETUP_TYPE = setuptools
 PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
