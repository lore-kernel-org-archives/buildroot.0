Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4D6C47073
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 02:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F39FD83A3C;
	Thu, 11 Jan 2024 02:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F39FD83A3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdvPI3M6LyCq; Thu, 11 Jan 2024 02:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557F883A0C;
	Thu, 11 Jan 2024 02:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557F883A0C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10C661BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA7B641BAA
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7B641BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zzr1q8qtRqOH for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 02:34:35 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 133EA41833
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 133EA41833
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7ba903342c2so303282239f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 18:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704940473; x=1705545273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QBd7SfjxqtoDDb0pi9Fe8yAxb7tXynd5tnWNIUAB1qA=;
 b=nsCHVGEm8OhW7kD0r0cV+j6mks1HEAErCTLFU+ZBFMBNL5WaDzNg+xfK1/SDWKtmCn
 VW3EYo0VaX9ewYQKPagjn3jnqFG0h5fuhE1azgNA3sWf0DvniLVePvzTNn0Nrk44RpQr
 BNFddtr8DCBJo8eGyN5pUwnPMEpcD91Em/yoc/ctnrBUNGOy2M91N3MYoz2w6TzsvDR8
 fyR8WfmovdfGZBkTOjTMbUPojDDAQSBTKIVF74AxLSP96AMnKSFnBvdHj5FDv6tVWUhQ
 LzNZC8Vw/nDpYeipSbFApupsr+F+xUFZpHnX8NfMD32uRelEdx4p1oLG03WCy9bFzZ/t
 21YQ==
X-Gm-Message-State: AOJu0Yx4DpD0t0sdr6MJhRfNuja01szN3QpCFQ5HwBbIrXAl90tYoeZy
 2p1nchCjS+zUP9G3+zKJ9F2AVeagybLdoQ==
X-Google-Smtp-Source: AGHT+IGHs7Tzyk7BMfNboeUZ2txdbDaz+XrHnGfUXpirL/PMIXN23Lkgz/cIgsvck8AcomFeGTwdLA==
X-Received: by 2002:a5d:9946:0:b0:7bf:e63:6876 with SMTP id
 v6-20020a5d9946000000b007bf0e636876mr92294ios.33.1704940473147; 
 Wed, 10 Jan 2024 18:34:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 m11-20020a02c88b000000b0046b59ded0eesm46086jao.59.2024.01.10.18.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 18:34:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 19:34:29 -0700
Message-Id: <20240111023429.2663712-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704940473; x=1705545273; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QBd7SfjxqtoDDb0pi9Fe8yAxb7tXynd5tnWNIUAB1qA=;
 b=eOrHVt/vlP9ncaR6i0HqZs8LHO+H4R5qYbzrACaLvl/u2JUEBvMIK3bLeq59AeXpMP
 6hjFeGCKifFVlarfkiOzW/veR720Fph0Gd6tR84Fv3L3/NZZKb0oD+fk1VkyDsI3DnEn
 109SQJ8Q/aigolv2N1jl7s2lXNVp4HaNIhmi87S3Wv+ja2YlElbZrgiq4XuYIc07IhCF
 SYMr9rehqdjuab3uHpolVpMYc/anoiCKEsDG5KaipiKTYh9RPKbjC4L9UGfziu+VcMuq
 bHvCDfqJApeF5v6eY5+LqUI7zf9x4x8C9QnOqBWZ1VEeeWHcRIIpep8eTTZyyprAHsbf
 3QFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eOrHVt/v
Subject: [Buildroot] [PATCH 1/1] package/python-pyspnego: bump to version
 0.10.2
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
 package/python-pyspnego/python-pyspnego.hash | 7 +++----
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 0ae6cf1d4e..dc808d4204 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  93ab1a088d65e6a7c97efdb567ba37b0  pyspnego-0.7.0.tar.gz
-sha256  da78096fd7c9f40e716f6fbe3e30d913103d75fd676f839f98fc3a6fee92fbe3  pyspnego-0.7.0.tar.gz
-
-# Locally computed
+md5  b633cab73a1481c5dbc2d6f6857569d0  pyspnego-0.10.2.tar.gz
+sha256  9a22c23aeae7b4424fdb2482450d3f8302ac012e2644e1cfe735cf468fcd12ed  pyspnego-0.10.2.tar.gz
+# Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 2fbb779d98..740e6eec15 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.7.0
+PYTHON_PYSPNEGO_VERSION = 0.10.2
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/97/f3/bdf3cd5f4c5a1bf9e1d4bb771c133850ee08241c18cafd90a6d872937a9f
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/3a/c3/401a5ae889b51f80e91474b6acda7dae8d704c6fe8424fd40e0ff0702812
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
