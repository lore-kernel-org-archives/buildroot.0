Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407B0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:02:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D975C60FF2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D975C60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5F1B401D3;
	Tue, 28 Sep 2021 11:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYsZT14C41sp; Tue, 28 Sep 2021 11:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94CC64012A;
	Tue, 28 Sep 2021 11:02:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29A8D1BF84C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1077D403BB
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VWjunL2yDWK for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 11:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FF5F40331
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 11:02:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k7so5417407wrd.13
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywpfblgZ5H9X5A73DlyzOZbNyxKbQkqUhUoP6MER1i4=;
 b=ePMpErruudR1I+S9DNLjVQZ7msn63hyCC5J9XzOknw9zA99ptBAYkL6o/dBIDkUVEf
 f3W389oQRpJLAIQ10Rwn8djyia/NQ8c13WzQX7lPUqdlGy6Upb9DHgl5P9jCyp7NLMzR
 dLXmon2HJLucXUIkcucT1rEstFBTa/Y07jBmgOUnAmVLztnlyzNafUBJsfSDDUPhTDya
 BF80/Z/xvEtLQ1dLOZt7nwWwgdDX2Oiq70P5FPGLhcdP9Np/tKnqZkCYsnol42KxWHFw
 phYEpI+ebJKXaTf+aG/vrmVczh+dHo2SUUPbaFzV/hMXH8zcFo10BT/zXkDxOvD9/1Eo
 1M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywpfblgZ5H9X5A73DlyzOZbNyxKbQkqUhUoP6MER1i4=;
 b=G8D2F1RjiPmub0iqhV1I+9+r/xv48jhb82leymG1bTSGZMfbi7vUsjfHY55C/ZMu2y
 R8wF/d6O/dRe6dqfObODngQjb1INyqKkA50lsqJR1xhQL2h2+wR4EPQPXylWcAfN05o2
 N+prgQz1zTk6OQUj1ACFKB4lx5APKSmCq23ML4fBDfuCjrkGUqnNnYpvVwSRXs8+vgSQ
 vwMQsNm0E2KyqTv1M3abvHGb/O46YVdU9SQx+I9I6uqSLMzUortfD6MQc/6G5HZGDrcH
 vguq4lKstumywAvmOvqX13UmgG4vZBZkH02jJKJpqypBJb++qcslh1RG+gcDYnnzwHaY
 yRLQ==
X-Gm-Message-State: AOAM532VTELAgRfvLsqE0fJ6/94QQ0d8rrMbGC6cI3m08kWtZeXX0u7i
 vad8YZC9UfPOjdUrw8vY5+3cu+U3EGM=
X-Google-Smtp-Source: ABdhPJyoP8GnKxlp70Ip826gn/t6uqrupmGqwkwX2wrKEoKjXdOlL/0TwAwhADK7lCZHN6Be8v0Zmg==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr5670707wru.110.1632826941154; 
 Tue, 28 Sep 2021 04:02:21 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1254:64a2:465:81e0])
 by smtp.gmail.com with ESMTPSA id c4sm19432155wrt.23.2021.09.28.04.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 04:02:20 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 14:02:09 +0300
Message-Id: <20210928110212.596939-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928110212.596939-1-asafka7@gmail.com>
References: <20210928110212.596939-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-priority: bump to version
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-priority/Config.in            | 1 +
 package/python-priority/python-priority.hash | 8 ++++----
 package/python-priority/python-priority.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-priority/Config.in b/package/python-priority/Config.in
index b73b7e2ad4..8ac2d13824 100644
--- a/package/python-priority/Config.in
+++ b/package/python-priority/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PRIORITY
 	bool "python-priority"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A pure-Python implementation of the HTTP/2 priority tree.
 
diff --git a/package/python-priority/python-priority.hash b/package/python-priority/python-priority.hash
index c947375700..88fc9adac1 100644
--- a/package/python-priority/python-priority.hash
+++ b/package/python-priority/python-priority.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/priority/json
-md5	4f1ff52f7fa448e9d9cb46337ae86d1e  priority-1.3.0.tar.gz
-# Locally computed
-sha256	6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe  priority-1.3.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/priority/json
+md5  149531bf0e754782cf218bfc8cc994ae  priority-2.0.0.tar.gz
+sha256  c965d54f1b8d0d0b19479db3924c7c36cf672dbf2aec92d43fbdaf4492ba18c0  priority-2.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  f3e9c29e3db36dc305a4be68a8a225f93949852ce2d19b5b0a3c099eee6509c5  LICENSE
diff --git a/package/python-priority/python-priority.mk b/package/python-priority/python-priority.mk
index 8b6dbc1e4f..6e141c3e37 100644
--- a/package/python-priority/python-priority.mk
+++ b/package/python-priority/python-priority.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PRIORITY_VERSION = 1.3.0
+PYTHON_PRIORITY_VERSION = 2.0.0
 PYTHON_PRIORITY_SOURCE = priority-$(PYTHON_PRIORITY_VERSION).tar.gz
-PYTHON_PRIORITY_SITE = https://pypi.python.org/packages/ba/96/7d0b024087062418dfe02a68cd6b195399266ac002fb517aad94cc93e076
+PYTHON_PRIORITY_SITE = https://files.pythonhosted.org/packages/f5/3c/eb7c35f4dcede96fca1842dac5f4f5d15511aa4b52f3a961219e68ae9204
 PYTHON_PRIORITY_SETUP_TYPE = setuptools
 PYTHON_PRIORITY_LICENSE = MIT
 PYTHON_PRIORITY_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
