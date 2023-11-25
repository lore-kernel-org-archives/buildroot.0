Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA88C61DF7
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 07:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5755160D51;
	Sat, 25 Nov 2023 07:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5755160D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InltFE_InOUE; Sat, 25 Nov 2023 07:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C5160AF6;
	Sat, 25 Nov 2023 07:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C5160AF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B207F1BF3C3
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 07:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88EEF40189
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 07:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88EEF40189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TlFwC5CRL4j for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 07:07:09 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D06A4004A
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 07:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D06A4004A
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-35c88054e8cso1640205ab.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 23:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700896028; x=1701500828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V+wOZUuYDFo/BoSG3fBBtCdZfrYRG11OKDGpXZM0n8w=;
 b=o2eqkG3DEnBk3wQr7yizmikU6e7MPHANH8fiRNgOre8KhTIwSTMAPdhoFvYmVUxPot
 Lkoy6OM43L63XeiA0XOp/02MnIjkgnXM6uej6PEz9sfljWnXIPZN52zkdoRFhW7xuRBd
 pStJPNMzNrJX2EGJNYd8IoI+bPekIRJEWoC/vv2uO2TEeghGrhkWyWs8LE4aeoZBGRpk
 PPyoxGNmSZcvqoUVlfkeoiK2lJ4xYThROpVBT/eVDn4aBc9AXcPT/IM1crqmgIuFEoUO
 BIC7tDE5vHBxbpt/GdcFFoFwA7gZenjp+TrIIBXIjNHmo7f4KUc+bEuwcpu91kfRxqhH
 Fvzg==
X-Gm-Message-State: AOJu0YwJt5o1B+L/Z+MuZa/SdiPxPCPtToAQRquc6GCrL/9VlKU8gscJ
 IyPlwisGVCkO6F2TYx2jZWDlvL0JtEM=
X-Google-Smtp-Source: AGHT+IGC7Lfxl0U4UyxUAsX7kvH8tq/QflnnE20q1GY5f+Yg6gX/IAmA8e0Z/o5NipC+oB4wZEBXFA==
X-Received: by 2002:a05:6602:242f:b0:7a5:a391:73ae with SMTP id
 g15-20020a056602242f00b007a5a39173aemr662613iob.17.1700896027845; 
 Fri, 24 Nov 2023 23:07:07 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 b20-20020a05663801b400b0041e328a2084sm1210696jaq.79.2023.11.24.23.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 23:07:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 00:07:06 -0700
Message-Id: <20231125070706.841288-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700896028; x=1701500828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V+wOZUuYDFo/BoSG3fBBtCdZfrYRG11OKDGpXZM0n8w=;
 b=TbUdwNzJBJtdU8Gc+iLLU97rhT669MfXoT8N29EhVcFUmAGcvJWDSbjKzMCbWupJKy
 Bte+NCpQcLk/HHvk6IN8hsqq6pF/5mdwV/dIUduMZlSJqm1+Ibs9BgdZDYIRv7ZzE38w
 OQKGhWkdtWByAqKZRAxPiFImQ9a+om0FgCaPa8fEocHyYoNj8a9YqmhqncjONI3tvQBC
 AI615n+QoAM7gMabW7RVi3sab9ohcUCu/A8zAMbU+yX7nIs9R9a5TwyvfqBW1uWQyT+g
 1dFrHPdHvI66jp1rB+q+70hWOuUjdC8vAnNc2kJ1b0hQjoTbpYVOoSEkoQW95MhWJNkB
 7XCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TbUdwNzJ
Subject: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20231114.3
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 8ed25084d1..9f2ab55508 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  47f0425745bcd1bb413aa9208cd06b3c  pydal-20230521.1.tar.gz
-sha256  10478a61e627c5b8cb7691f7f7ebf7210845485316493d37d740c297fb6d1845  pydal-20230521.1.tar.gz
+md5  b2072b7b000223890b56830ca1ab3616  pydal-20231114.3.tar.gz
+sha256  c42d16fca9e3bb6d399aefb2434c0e70862ee13c75437852f421920432ee5fb1  pydal-20231114.3.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 1cc7e90b11..245383f244 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20230521.1
+PYTHON_PYDAL_VERSION = 20231114.3
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/b4/15dc227f965cc0525ca7f432368706cc4087ad6d587a5a05b251d133023e
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/0b/3b/86302e165af07bc3d9225aea6ed8f52386270220e4aac1aad0101a48aac1
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
