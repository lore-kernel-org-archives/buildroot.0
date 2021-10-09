Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78526C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C1160F39
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41C1160F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A24D40603;
	Sat,  9 Oct 2021 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3kB7tVsXqjS; Sat,  9 Oct 2021 20:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 204B1405F9;
	Sat,  9 Oct 2021 20:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FBCE1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B9A44057C
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wagpYVJtr23w for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ACAF406C6
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:40 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so10442199pjb.0
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=En0KmrppT23qEN37qHwykE7axgiUxNg1oAtpbvcPvas=;
 b=TEg5Pj721srx0mLTgghWXhC92mU554v1jMKm1uAxMlJ5zXCYDLMAU9E6CWS77XQl+u
 b3ma55X2q0I1s0Cjrd2veCDWILH8WlcreQJKJsjSx6x601moQD5tmgzu9A0N/3lVdtvb
 eSieFnqmjQ/LWErj9wdBuwK48MWMsTYWJ2B0+o4I+59tYUu8vczbiIdnA44wEM3u9UUu
 KAYvbhuDeGpTNVOZ8bOuSWhizvI6EhyXD2y3jXCVAzac9aVfHbhyvkXC88PRypVVlrXJ
 JVyIwGs78TUZM8MdFzMlaCDpgb7fj6srrDjQnP7BSneU8y28TqzBqo2NCFYnK+FeSsKQ
 FneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=En0KmrppT23qEN37qHwykE7axgiUxNg1oAtpbvcPvas=;
 b=qHmHhftzJSENZ04JK69M9BAm8zSPL9WGCwksmwQoIsefoojEWirtWk3bLm50RS0jMw
 jA4fcjxyKOSgs4++JaxI7vF3S+cjGh/kcjV9RfU9e2BLEgbeQNgJ0I98c7iUFZM+8WEB
 pUVmonpTdJYERjyJxp0n/ASUOxWka0ABBIUL+b6LBFS12rA6upinDSfhmltmmriB5Jbs
 qxZj5wr3ZeJOtExh2hAj3ln+Gi0D+zlvJtXffTkuJaz4mooGswhQQjMrx8fzrNtQekPV
 19TAVoHfPaE6lkuD/7fNdrdwlZQqW2Tu1Cueax4gAjcps0ZU29ynO2mqgGE+gbmCL9vB
 nQNg==
X-Gm-Message-State: AOAM530R3NHcyFaVh82ZG5AeIJC9uyFk8Eh+MH/swHjBaqnbe+wTbL8f
 V+0uftrpQZjR5hLBjAoYJWD/jLqg975eYg==
X-Google-Smtp-Source: ABdhPJxFpZTEPuEVem96xAZZYIwiauk1dDJPjdOHpJ1/pKfMdrGyzML/Uh15l2P7hGYoTikbtcolNg==
X-Received: by 2002:a17:90b:3687:: with SMTP id
 mj7mr17069405pjb.196.1633812939538; 
 Sat, 09 Oct 2021 13:55:39 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:39 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:15 -0700
Message-Id: <20211009205523.3137859-13-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 12/20] package/python-watchdog: bump to version
 2.1.6
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-watchdog/python-watchdog.hash | 11 +++++------
 package/python-watchdog/python-watchdog.mk   |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 701c7991a5..3b633f9156 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,7 +1,6 @@
-# md5, sha256 from https://pypi.python.org/pypi/watchdog/json
-md5	7cdc103f607e72fc32c206301a72d1b2  watchdog-0.9.0.tar.gz
-sha256	965f658d0732de3188211932aeb0bb457587f04f63ab4c1e33eab878e9de961d  watchdog-0.9.0.tar.gz
-
-# Hash for license files
-sha256  14e636faf5889138a1bb7a8498ccbb0266aee31d2dc475201a10448e56ed3d96  COPYING
+# md5, sha256 from https://pypi.org/pypi/watchdog/json
+md5  6aac660b0f3358c63658806a0579b832  watchdog-2.1.6.tar.gz
+sha256  a36e75df6c767cbf46f61a91c70b3ba71811dfa0aca4a324d9407a06a8b7a2e7  watchdog-2.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 44929a65ac..2dafef97e1 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 0.9.0
+PYTHON_WATCHDOG_VERSION = 2.1.6
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://pypi.python.org/packages/bb/e3/5a55d48a29300160779f0a0d2776d17c1b762a2039b36de528b093b87d5b
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/e8/a8/fc4edd7d768361b00ea850e5310211d157df6b5a1db6148dd434e787d898
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
