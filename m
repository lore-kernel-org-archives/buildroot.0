Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F226C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D31DF60806;
	Sat, 10 Dec 2022 16:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D31DF60806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIW8w6t1XumB; Sat, 10 Dec 2022 16:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF59607F1;
	Sat, 10 Dec 2022 16:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FF59607F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9611BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E810840376
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E810840376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-b-10LqQBql for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:15:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EB54400AF
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EB54400AF
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:15:01 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id h15so1366842ilh.12
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZTf3rjWfhVbBKZNHwOY69+l0YLjJlKbvu3QCW30qSUI=;
 b=doC953JRFlxsAsOlSm4hWNhNpKf2hfpGMXrJ7MWzVkBDp+8SPIe4u5i7P35ZgcwF3f
 81Dx8D0qdN5gygghmf//6LJymyI8x9sjdL5kudaqY6bhb6t7z1pmnfRXmSJRXtoid0CG
 h48Qs0omQuOslHfowaVutd16ghuiGG7Ah69pMEG8T19t1PlJbDDTGJWf+n9bSi2zC3MC
 NkgLjSdp37aixiIESxI0qUvdZyHHet+i0GCIwt51ebVJTGXl9erhI2j9MO23wii6IK0d
 YMICnBIsp54SxxBWyY3tTdR9DqkwNvJBFv5HzrGDRlmL+9LxPzpAZmBlIhK3nd6vVI/m
 VCcQ==
X-Gm-Message-State: ANoB5pkz5p/gZHUL/dLQGWDR3H0qsaMdignOrrrJ2jWWea3P1F+NBnCu
 u4OfHLotKS6Q8JeJeCBa4XdFlNWh/qoGFw==
X-Google-Smtp-Source: AA0mqf5e4Ry/GR2kSA3jBuD0trcbaRL1g8K+lE0TItbxW7cfzbLBLJphdbvWKpJ9LJkDMNroyUSpsw==
X-Received: by 2002:a92:60c:0:b0:303:567:2064 with SMTP id
 x12-20020a92060c000000b0030305672064mr6307585ilg.15.1670688900459; 
 Sat, 10 Dec 2022 08:15:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 a5-20020a056e020e0500b00302632f0d20sm1423948ilk.67.2022.12.10.08.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:15:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:14:58 -0700
Message-Id: <20221210161458.2450292-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTf3rjWfhVbBKZNHwOY69+l0YLjJlKbvu3QCW30qSUI=;
 b=q2EV+xTIKOZRhK5DHbawegsNryb1WUHiNkXSvTKlpzsM37Xv/sUe5Y0V+DG19UtcSn
 grgL8RatdcjHHMXA0+P5fG9OcYFwXxEOzzEFHDwYfXkpYAG/+IuTXZFHFr+oRVm5nRUq
 fBC3DgZmtRv7GOhNHEqHpcm1l6OFzNjvl4V6XvgL6uxb658yXXKEeNORSMqC+ueempbx
 P+5Ss/0fiF3/NJ6htk+aCRx5iKLLbKuF67/Xz8OaGKAVKV83ClqIOqz0x7MC4eZJI9jd
 NGjg6DtvYaHdd1dU1kkLrcavG6HEugJoFX2pG46BzWF0mc1X+Ql5osaBHdm9YS63Y5s+
 x1Qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q2EV+xTI
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.4.6
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
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 6098273aa1..70c35ca864 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  358b18e2a96ab96945e33417d5c8cb31  cbor2-5.4.3.tar.gz
-sha256  62b863c5ee6ced4032afe948f3c1484f375550995d3b8498145237fe28e546c2  cbor2-5.4.3.tar.gz
+md5  74512376482be8a6af10596a63b6d254  cbor2-5.4.6.tar.gz
+sha256  b893500db0fe033e570c3adc956af6eefc57e280026bd2d86fd53da9f1e594d7  cbor2-5.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 743ae4ef6f..a2fcd73b74 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.3
+PYTHON_CBOR2_VERSION = 5.4.6
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9d/c9/cfa5c35a62642a19c14bf9a12dfbf0ee134466be1f062df2258a2ec2f2f7
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/69/de486293f5211d2e8fe1a19854e69f2811a18448162c52b48c67f8fbcac3
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
