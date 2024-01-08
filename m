Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CCBC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 06:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D0F560D88;
	Mon,  8 Jan 2024 06:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D0F560D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VTTKE-QKfGv; Mon,  8 Jan 2024 06:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E7360783;
	Mon,  8 Jan 2024 06:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E7360783
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44EAF1BF387
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24EDD400CB
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24EDD400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNT7MLQB6SMY for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 06:48:24 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25722400A4
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 06:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25722400A4
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3607828cbf2so5634745ab.1
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 22:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704696503; x=1705301303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3/0RRYWivQV+tx92coP1fw4dcHulTTHLT1HgeJd8vE0=;
 b=LRvnUQsHvCTjx9LV5s+7iAYL0hSNGepPAmxza/o5/k7eAEfv7McTqcDUPeXkLkytjE
 OqbNKDkwYIOrPv2Kdq/Rza9f0MsRTDPYJuVM1esJjp6txY8Bzg9t+iUpNzAuKMU+umbR
 oQNYX+4x/8OEPriYcBXbAiKnQ2gVDTLZ7ax+g47sm1fi3VIqE+GK1j+mr75opK9wp6IS
 fSZWJS+APCICARkyQH3CmM5GaftQcooBZ76BtTE7vEBR5jU+nN5NQDc4hsTZOBG/l+A1
 a65bHqyUMOQ8YZwjODnk/1YWsr9RZa2/uioUJpU3gxAAZvNU4kvs1E6iDjv7Q/6uL86K
 8Vqw==
X-Gm-Message-State: AOJu0Yx1NS1ZwIMBYQzYjE1TWShb62THktCuJVuj1awCEMqRkRm9+JVu
 6ZiRty4VcMkCsH++yAFlTJUAOLUfaWQupg==
X-Google-Smtp-Source: AGHT+IFSpHWwzDJXnfrTJu1Pd2sZUarJb2MxNPUY+RSvd4eP/nAaH6vyLDGe1lRJYJEK5UBrEUX5HQ==
X-Received: by 2002:a05:6e02:1a8f:b0:360:6260:7d4 with SMTP id
 k15-20020a056e021a8f00b00360626007d4mr4394598ilv.27.1704696502705; 
 Sun, 07 Jan 2024 22:48:22 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 fg7-20020a056638620700b0046e1c810f96sm857938jab.128.2024.01.07.22.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 22:48:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 23:48:20 -0700
Message-Id: <20240108064820.3450359-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704696503; x=1705301303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3/0RRYWivQV+tx92coP1fw4dcHulTTHLT1HgeJd8vE0=;
 b=Yk/XaiN/+qOMZUWl+wXdIKIHKo6Uqm6Gv8iuP2xvw39aqEDuVbLoeMD6KN1QQrBSIm
 csOxH57kBp/bEA7Ld7tc17WE8BdOvuM7gStE5SU0b8p1blUvLTeW6rG3u5N6BRFCzZR4
 cWaOFl9BeMsLKYBw397PsX73ytuVqk6gd8P9mxc9Pg7Sw4GzrOxi+9m+3alVRIODhsHg
 ZGJMBBQ6sRSqbMMPNI5YJjL+lzSW0qBXLVp/8YWDCk+DtJG70vIs796cWFsykglTyhVN
 rCmPEUAnB9syG/YVlSlaY/GPGLOmzfO4/uyNS7NZzeTc9YvoE4EM3Vmjr/apLyk8fD64
 XnpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yk/XaiN/
Subject: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version 4.2.0
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
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 1cea549bc1..e77d30249c 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  58d288dd84e28e2507ff9ce7e4620010  anyio-3.7.1.tar.gz
-sha256  44a3c9aba0f5defa43261a8b3efb97891f2bd7d804e0e1f56419befa1adfc780  anyio-3.7.1.tar.gz
+md5  22e660fff1a584e72281f0d6a083e4e0  anyio-4.2.0.tar.gz
+sha256  e1875bb4b4e2de1669f4bc7869b6d3f54231cdced71605e6e64c9be77e3be50f  anyio-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 80404ac660..32c2286157 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 3.7.1
+PYTHON_ANYIO_VERSION = 4.2.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/28/99/2dfd53fd55ce9838e6ff2d4dac20ce58263798bd1a0dbe18b3a9af3fcfce
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/2d/b8/7333d87d5f03247215d86a86362fd3e324111788c6cdd8d2e6196a6ba833
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
