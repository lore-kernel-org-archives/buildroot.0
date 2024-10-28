Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396ADD13591
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D40A58129B;
	Mon, 28 Oct 2024 01:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lsHr4St2lrZ; Mon, 28 Oct 2024 01:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFAEE812A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFAEE812A7;
	Mon, 28 Oct 2024 01:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EEB8AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E23D812A9
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwnuMrmJrh3S for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FDDE8129B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FDDE8129B
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FDDE8129B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:50:21 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83ab6cbd8b1so160596239f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730080220; x=1730685020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xFwJdTHaSXMxEv+RAGHyQsuCyQGdEDm1x4IHV+zbApc=;
 b=nssbcramMuG5vK5BlppUEZixa256LZzDHcxgsKm7PVeAvvx16Hy0WemueuM5tpAlKX
 wbgktpzn+Ai9ui9cV/6xeyqFZF/fHc1WkP6NpI5oYhsk8gAoyuaiW/hEFCGJYG4OaTxH
 iuhbt03zDXvlZ0tiRBKh7zwyN5lUJUv9mgcVZyx7AEvUS0odV2U+WJ1eARQ1CGjnUuQG
 Nt0M6nUn/7j1RoV1WJTfefNg2puvsQOtQrsUUcOoGDyvO2KVEA7wN8P2WOwuKcHTwjI2
 9zGOA7TAC4TCYDxK+KK2Zs/GdILBprvWN5OfNbHQtBrr4hmIoOe86jxgqx0ehv4Pw525
 q80A==
X-Gm-Message-State: AOJu0YxbPcDkqHZiI8cKeM12VicmOH6sFq9uK13rCUtSoBu3gtcPd6NJ
 hDWR77+6C+vl/QKUaVwPHdlW4uUdGJ8R1i4R5BD4e/g4OZ8yTbvrCHAruw==
X-Google-Smtp-Source: AGHT+IFNFLgTTUs0f6gb2SZk8w7q+OVCHd0XoZDEazpqrSEk9toNIdru77dh4b5vu4KDTf7EuWAeJg==
X-Received: by 2002:a05:6602:2b86:b0:834:f2ff:ad66 with SMTP id
 ca18e2360f4ac-83b1c3edc46mr676234039f.5.1730080219360; 
 Sun, 27 Oct 2024 18:50:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137de504sm123607139f.19.2024.10.27.18.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:50:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:50:17 -0600
Message-Id: <20241028015017.4144067-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730080220; x=1730685020; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xFwJdTHaSXMxEv+RAGHyQsuCyQGdEDm1x4IHV+zbApc=;
 b=KlwBuX3OxWk3RkfTZeqWjEF8OjQ2bFrqyGxlxjAQAqd/85BIQxIeTpzAX/15Sz2F6W
 S4b1ZX4Y0YLlRL740tP6GxsJSV7BBs680DLAIDR9bJO8s4Yw5TroO38CE1q7Qj89CRmh
 qjxcxtp6itsvmdMvDNvVXlW9UQ/lHwXRcY1D+ht+4pbkU3yoZoLYjoU6cGm/HNrWgcjT
 /U/XZCbCFyH3x/yL4Z+KHLZfdcFavKaHjWIdkuhQ3TM/E+KMXCkad63Hzl2l5UN0RQq3
 EcKXsqVHol2qlXmNQlGIYutK2DzG+Zm555/0HdPYLgaqqB13brd3K9knJqXCY+JIB0zm
 DlNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KlwBuX3O
Subject: [Buildroot] [PATCH 1/1] package/python-zipstream-ng: bump to
 version 1.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 package/python-zipstream-ng/python-zipstream-ng.hash | 4 ++--
 package/python-zipstream-ng/python-zipstream-ng.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-zipstream-ng/python-zipstream-ng.hash b/package/python-zipstream-ng/python-zipstream-ng.hash
index dd714389b2..6feb23834d 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.hash
+++ b/package/python-zipstream-ng/python-zipstream-ng.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zipstream-ng/json
-md5  2b7cd8d72a047dd23363415d47096d6a  zipstream-ng-1.7.1.tar.gz
-sha256  f92023b9ca578cd7fdd94ec733c65664ecf7ee32493e38cdf8e365a1316e9ffc  zipstream-ng-1.7.1.tar.gz
+md5  f30b8347aaceee3f4ddc01bda851790a  zipstream_ng-1.8.0.tar.gz
+sha256  b7129d2c15d26934b3e1cb22256593b6bdbd03c553c26f4199a5bf05110642bc  zipstream_ng-1.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  LICENSE
diff --git a/package/python-zipstream-ng/python-zipstream-ng.mk b/package/python-zipstream-ng/python-zipstream-ng.mk
index 5e26c9303f..289e03b10a 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.mk
+++ b/package/python-zipstream-ng/python-zipstream-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZIPSTREAM_NG_VERSION = 1.7.1
-PYTHON_ZIPSTREAM_NG_SOURCE = zipstream-ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
-PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/74/8c/682c8bb3085d2089e09c0b9393a12721d059dc0009da4e0b6faff6370679
+PYTHON_ZIPSTREAM_NG_VERSION = 1.8.0
+PYTHON_ZIPSTREAM_NG_SOURCE = zipstream_ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
+PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/ac/16/5d9224baf640214255c34a0a0e9528c8403d2b89e2ba7df9d7cada58beb1
 PYTHON_ZIPSTREAM_NG_SETUP_TYPE = setuptools
 PYTHON_ZIPSTREAM_NG_LICENSE = LGPL-3.0
 PYTHON_ZIPSTREAM_NG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
