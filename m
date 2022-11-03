Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F59C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EDBA81F9E;
	Thu,  3 Nov 2022 20:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EDBA81F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wowebd64TU_V; Thu,  3 Nov 2022 20:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C7DA81F9C;
	Thu,  3 Nov 2022 20:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C7DA81F9C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C50541BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0EE140BC0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0EE140BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AsPgjFXb8wUK for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:46:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0A8440138
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0A8440138
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:46:46 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id p141so2387161iod.6
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZwPLyM6SS51Eslbm8r0270vE6Y9vL5OLbHTmrXJeD8c=;
 b=bi4JX9rKsFAyOXKEpZGqXUZVR//7sYV5y8PyAVxKdBWRG9/ONdqSFbmvC7HwRpqy0Z
 RpF8f/R+RkPnHbvgYLhuKC8+nvGThKc62oVDS24ci75SWHl1+IYoOeWtdn7fUOP77X07
 v6jErjzBowUYYZzLzDiKojPFIrJ7hPpEoI5/fpjmVIscmcJKthfjA4lPhOlFZcTRO0hN
 LqPE2RP0U6WyzNdicvPK4KFRZFgnQT2lOFtbXMVSbXXxcwtKLkC1BBWq/DdIBj4B4Sz3
 0w66Xz2uvUuINsgJclINY3jZrIUwbpFhe+9o3ri3I++vnkowh+VG3laQdKE4rEmH+dep
 QT6Q==
X-Gm-Message-State: ACrzQf12qkhdZj/fH63LDrXSJV4avHDezuphLMXRu6DL50nsHE05fcbQ
 i5JKssJHGJxNabFasWf7L5p3a78T1HuaeAVn
X-Google-Smtp-Source: AMsMyM4liOihWVBQH6kcO7kq1MNBe6wrkzM26A2sHrtLFOhEUlKI97/OmgeNY/d1i1bAddRU3U4TBA==
X-Received: by 2002:a5e:9e0a:0:b0:6c0:dbd0:cfac with SMTP id
 i10-20020a5e9e0a000000b006c0dbd0cfacmr20063580ioq.106.1667508405475; 
 Thu, 03 Nov 2022 13:46:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m18-20020a026d12000000b00372f8e38931sm522559jac.111.2022.11.03.13.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:46:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:46:43 -0600
Message-Id: <20221103204643.1608896-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZwPLyM6SS51Eslbm8r0270vE6Y9vL5OLbHTmrXJeD8c=;
 b=jC1obPfK76sldPuqTJdhQCWi0lP5CE50d0zJ6HDeQt469EH2btwluH/puqDcG7i9yO
 cjst16NDJW/6mJkTCNowEqpsaC3fQfMX8qJ+rDyYfUAVBeB/jNwVlqYn2YLEU+g6SRiy
 KFmUmzoMId54g4CeMgpPUI5y/AFsYxDRsqv4zLNah0IIypJP7RjEhcvALStVpXpmj/Ay
 wev3K5ZmOHt4liBK+/ms/vVOomlhlpxGGCbgVNMlbh1yCGREFfUcDPrsI2tp1gt1YqZg
 ldAhj/eXWBIsZcw3P3e4Y7SgsahbP6nTxFo9Gy/hp2AxQknd4a4S08KuGhw8fwrF6jVu
 1DMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jC1obPfK
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 10.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index cec1d1599c..62c7cb8467 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  ebb9e4930bf2c35cd3723be0dfa83d89  websockets-10.0.tar.gz
-sha256  c4fc9a1d242317892590abe5b61a9127f1a61740477bfb121743f290b8054002  websockets-10.0.tar.gz
+md5  d6b1a2cb5e194ae43f849c125b71c8db  websockets-10.4.tar.gz
+sha256  eef610b23933c54d5d921c92578ae5f89813438fded840c2e9809d378dc765d3  websockets-10.4.tar.gz
 # Locally computed sha256 checksums
 sha256  daeca11bf3608da35e546ea0c32be18958a8be1441fa3de9cbd20e4c8bc718e6  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 9f4c5f1da7..7f721220a5 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 10.0
+PYTHON_WEBSOCKETS_VERSION = 10.4
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/1c/f4/61aee1eb4baadf8477fb7f3bc6b04a50fe683ef8ad2f60282806821e4b3b
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/85/dc/549a807a53c13fd4a8dac286f117a7a71260defea9ec0c05d6027f2ae273
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
