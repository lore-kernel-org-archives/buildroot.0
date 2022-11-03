Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F78C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66DE680EE1;
	Thu,  3 Nov 2022 19:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DE680EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zeVvEZqoBPan; Thu,  3 Nov 2022 19:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A74E81BB0;
	Thu,  3 Nov 2022 19:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A74E81BB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA911BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17C3A404D8
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17C3A404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWfY_VgPC5dx for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:16:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21CB6403B7
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21CB6403B7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:16:27 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id b2so2164139iof.12
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ehTcexPRj3FXhimTMRCVEMG2WHKjkncVGKoEnfMQAxM=;
 b=hzQuR9U8+sTT9RJMEBZNxGnQio8U2UFe95uKRCBHzFrTrvUzwOHJbhOtS2uIjUtLD9
 JBk/tNHSND4+RqTyJqSqbiVDa4B1xbCZfgabXTd4stXTi14LyoUavO/drTG9aieMXWrY
 uAoapv7uwk3uEYsnfnpO8t5p+tggyMvmsWigKgQHGjXxuZKYaWJLmDAJfpiRLDvPcmbL
 lzn+26BkvfJbCjJRsXSGrziO5jTE1QRSIJKDKSE1BMBdqgc11Lw3XxJ0nXPzEgGX/lvO
 MYqEFM0Raz8l1C19jUHqZowlLea7N+gcZykqQm0cmuiEkTbyrmcdIEQye36qpRLfmBwK
 yrYg==
X-Gm-Message-State: ACrzQf1PvnZx1ejz8XWiQaDOx8dKlIvgO25I5davxjRctR639A9OfR/1
 5/QYLipXVdAaZkxgMXHAnjA0dQJyD3YzOXx6
X-Google-Smtp-Source: AMsMyM4s0bAGUUrD531PSkaGh8U6hCB361RDz2BjXnHzOIO5pyFK5a0hR0FJ66/+a9JAdiKAXr3Szg==
X-Received: by 2002:a05:6638:4186:b0:375:19d5:2a3b with SMTP id
 az6-20020a056638418600b0037519d52a3bmr19575581jab.101.1667502985914; 
 Thu, 03 Nov 2022 12:16:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r15-20020a02aa0f000000b00349c45fd3a8sm475663jam.29.2022.11.03.12.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:16:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:16:23 -0600
Message-Id: <20221103191623.95595-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ehTcexPRj3FXhimTMRCVEMG2WHKjkncVGKoEnfMQAxM=;
 b=MhOwZMljsbfpp36VpAPIeqCD7zwpJh5yKk5tcrWTHxa251YwNre7fSwwe4vB/Readp
 CPe/izalkaETfBJT2tzug/QgFjF6+Z3OAqy0bkYHrjZUlJXLXPSIBRsStNagOXRYaGpH
 x6UTD6tlB1PQiKphrUoeSJPoy+8h9bBTKC+kKcGMmnkyvwkmLbUUbirBayGPTDO5nIzS
 xhOCxKeBz3lxXOWQKAIQUPolsBHank48w9/N0tOtDZNMNSa+278S1ivkSIvwWF4J5A7y
 CivlSgHks51/+nNszdOHZ5R0yGGU1dm9tliCc2mJ3ih5q8geIQ9Cw7YvHxEYjZY1eiHh
 s9wg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MhOwZMlj
Subject: [Buildroot] [PATCH 1/1] package/python-setproctitle: bump to
 version 1.3.2
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

License hash changed due to date update:
https://github.com/dvarrazzo/py-setproctitle/commit/42831ad1dc71c7678f0492977f32b341df7f1a1a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setproctitle/python-setproctitle.hash | 6 +++---
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 88e4453277..ac8fed986a 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  9898587a1668f1c53f6699ca5d35256d  setproctitle-1.2.2.tar.gz
-sha256  7dfb472c8852403d34007e01d6e3c68c57eb66433fb8a5c77b13b89a160d97df  setproctitle-1.2.2.tar.gz
+md5  fa9771540422a59a8dee1331ad6fd3a9  setproctitle-1.3.2.tar.gz
+sha256  b9fb97907c830d260fa0658ed58afd48a86b2b88aac521135c352ff7fd3477fd  setproctitle-1.3.2.tar.gz
 # Locally computed
-sha256  85bd836337aa702e0a4e2a54676c6ae046ffb357dbf4a990189595a60fcd1648  COPYRIGHT
+sha256  4ace14d0836da75079088cfc5cef6f2ddc8ce16f600609b36ee1bf10f8101f61  COPYRIGHT
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 13e9e261be..7055920c08 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.2.2
+PYTHON_SETPROCTITLE_VERSION = 1.3.2
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/a1/7f/a1d4f4c7b66f0fc02f35dc5c85f45a8b4e4a7988357a29e61c14e725ef86
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/b5/47/ac709629ddb9779fee29b7d10ae9580f60a4b37e49bce72360ddf9a79cdc
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
