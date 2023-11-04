Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8806C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF4D60D7B;
	Sat,  4 Nov 2023 23:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF4D60D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlUlGjnNc02x; Sat,  4 Nov 2023 23:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A060C60C17;
	Sat,  4 Nov 2023 23:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A060C60C17
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7BB61BF2F3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 867EB821CE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 867EB821CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CBzGTD9vul0o for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:27:35 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1A7E821CD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A7E821CD
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7a6acc8e222so122818839f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699140454; x=1699745254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KagSH9cgfMto8hLxNBTrf4vs39OWbn1Vctbz4CnWkOg=;
 b=XS7hp54+fjiPtQKoV+DTHpYjj+noUmayK7toIvMOdsGgYuqQgc3QjJIlnRC7GHQcIz
 pfV2QP3nSg8aoeHc142rlbjTjS7yumCDvCRhVNPIcrycZxnPcoMGHqoGIBtzDgMoZ6WD
 uuXbE/uZeTSR2tWvXp0Y8rrnTPA0yA6oX+RnyanyeOsiP1IwfeaR+owhXcGw/Bn0VmVI
 Ny28XN8zhHfOp8MqWQxh4YG6Y1kncz7zSb76Vghwray9sKof4EOVLS14cj7D1qbZcJG4
 i+oQtsv//oJ03+lKG7Dmcg3zroW+lOJkvSrIbxXB/kI/4y2rPtxSMxsJmGIjvv07JIwO
 3n8Q==
X-Gm-Message-State: AOJu0YxxHAZ6UxO7r8f0pTCj3nHvOJih32zlwxMICvNCisowzM+qVNuS
 XNCNVi8/Z+QkwCFyBuKNamwlg0V8jik=
X-Google-Smtp-Source: AGHT+IE7x1KPo4aOJAZLDYAi/N3jj8F6TvMfxv5r0ZKlJaVTvF30s9TqV5L7svlXyTQYmiXyt2qwWA==
X-Received: by 2002:a05:6602:2cd4:b0:798:3cb5:ad30 with SMTP id
 j20-20020a0566022cd400b007983cb5ad30mr35870299iow.7.1699140454206; 
 Sat, 04 Nov 2023 16:27:34 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 o20-20020a02cc34000000b0045c8e7e68a3sm1339988jap.105.2023.11.04.16.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:27:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:27:32 -0600
Message-Id: <20231104232732.2676337-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699140454; x=1699745254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KagSH9cgfMto8hLxNBTrf4vs39OWbn1Vctbz4CnWkOg=;
 b=Tk6H0jKq4xQRNvYpxORL7jEe75gcygc19YmBJqn/sw0yFYkhfDzbyTq8mVkPW/1n1K
 h+7uvmgXk8wYViSzhpud2OodH9II466YZrAroEC6dwesVHQhJqc7/GOXo+BtCs3OLHv9
 SciLbOQDLrhQsuFMXw0WCC85WihKpeWxIWrVTdD+k60b7uODQC7Bz1Afkidc6zHGpLkl
 xRP4cw66elGCvUULEiLC3Sr82W9V7IJRf7nrzZ+cupXfA3Guw0xokSlMwCJBdpZMTbRz
 /R0fKw1YOv/JwWjjTwhhVNL/2vA4hbItUzkiBXwN5tXy+f8Ckq015ngRPvFanw/GdUUN
 oDIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tk6H0jKq
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.8.6
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
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index ec8334b193..35c899cb0f 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  4bb59a17563df9a692c64418224ade12  aiohttp-3.8.5.tar.gz
-sha256  b9552ec52cc147dbf1944ac7ac98af7602e51ea2dcd076ed194ca3c0d1c7d0bc  aiohttp-3.8.5.tar.gz
+md5  bdf57b82c0d1804f458e10320bb0dcd5  aiohttp-3.8.6.tar.gz
+sha256  b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c  aiohttp-3.8.6.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 50b8268070..e814fc9224 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.8.5
+PYTHON_AIOHTTP_VERSION = 3.8.6
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/d6/12/6fc7c7dcc84e263940e87cbafca17c1ef28f39dae6c0b10f51e4ccc764ee
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/fd/01/f180d31923751fd20185c96938994823f00918ee5ac7b058edc005382406
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
