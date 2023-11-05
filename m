Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C72AC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 06:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC4E81416;
	Sun,  5 Nov 2023 06:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBC4E81416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkcyOIHO1tWA; Sun,  5 Nov 2023 06:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBBC813F9;
	Sun,  5 Nov 2023 06:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CBBC813F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71AD81BF584
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46578813F7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46578813F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYUxp6EJoibH for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 06:40:01 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FD2B813F0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 06:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FD2B813F0
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-35957d77afcso6426535ab.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 23:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699166400; x=1699771200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=93MTmbnKc1WLHgcII2QhgtHDUzYoeNy5VuonsGfY3x8=;
 b=eMwPKDa8Kn7rw5GI5w1x4tKRG8Z9hg8fxJrAq3pSNgKRw5D4jps167gNLQtggnSrfc
 7bcMmRLarNQPiHwkeIaLQkrZhJwJ4bhAEzMRzvf3WT2vLjAIbMVQOhe5q9g5zt0XLhct
 Q+OB4F1NjIQKXym1HAlGzKX1B+L9d/LNwa+W2di7rPjYQ1IO3cLe9oiZwHFFnb5A1CaL
 fzEx3fuU04yrjYJeW4/awtTPeBV4fDKvBICS9VmlfLBPiph5lZgwNsL6i/gee4zWMylx
 Vc/n3ezck6B3eSqqfcoRIZBwRci/t7Ss+CJG39A7vSbPdP/TX3wPW6g17F7GJLFGG1+K
 AvTg==
X-Gm-Message-State: AOJu0YzqRFwg2QTPyHi26VKQ/7gKA7F7ZgI6Au5SHsyr/IXGNOtggXQf
 z63SnKZhbVh27gP/nbS5nGM8m7/iGSc=
X-Google-Smtp-Source: AGHT+IElOVWIdkVd97ZrMC2xWMWTR06w6RJzdq3ZbGRA9TEOVf/A0e1GPDdcONFrENYKuYTA32CPyw==
X-Received: by 2002:a05:6e02:320a:b0:357:d136:7218 with SMTP id
 cd10-20020a056e02320a00b00357d1367218mr6648950ilb.7.1699166399933; 
 Sat, 04 Nov 2023 23:39:59 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 h2-20020a92d082000000b0034e2572bb50sm1710205ilh.13.2023.11.04.23.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 23:39:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 00:39:58 -0600
Message-Id: <20231105063958.2861207-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699166400; x=1699771200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=93MTmbnKc1WLHgcII2QhgtHDUzYoeNy5VuonsGfY3x8=;
 b=dOsYmQCo/KJIv1nRre5WwkA6L5zGEYZd7DLouBxiWr28Ibs4matZEEYf55rLd9v1ar
 387Ib25RfRCkFdSug9G2kY7yKS/pp3RPL2KMSg9odfkKB0mustNOW4DiIkZNVpe1rCWB
 85CYGnWf3zwSt9U3UOr6jk45t0cwl+H1k1CQNH+Lw7Nb4xJ5mpiZ54ph8ai3axIIvLgC
 FBKilRqCaps/om4HIUh4/lL1OTQ5/Vep3GjBwh83L+v83bDxcf39OE3hC7QodGZse9+V
 Lf6hqeb8x0DCif2F8b8iO2QkT90BzItk1EzeeVGduUDmVc3ZXEf9BasxwKIiT67/cm+f
 Z26g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dOsYmQCo
Subject: [Buildroot] [PATCH 1/1] package/python-flask-wtf: bump to version
 1.2.1
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
 package/python-flask-wtf/python-flask-wtf.hash | 4 ++--
 package/python-flask-wtf/python-flask-wtf.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index 9d21ffab2f..f426757955 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-wtf/json
-md5  007c1ff973c63096dec0fa805412d8ad  Flask-WTF-1.1.1.tar.gz
-sha256  41c4244e9ae626d63bed42ae4785b90667b885b1535d5a4095e1f63060d12aa9  Flask-WTF-1.1.1.tar.gz
+md5  cbdd73ec30c7b3b887dc12026fd4954c  flask_wtf-1.2.1.tar.gz
+sha256  8bb269eb9bb46b87e7c8233d7e7debdf1f8b74bf90cc1789988c29b37a97b695  flask_wtf-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d5f19036451578cb36eeef04c99ebf7d7ca2e70dcf043636519bc420e15a7c62  LICENSE.rst
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index 7b4d37ef56..8274585ad3 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 1.1.1
-PYTHON_FLASK_WTF_SOURCE = Flask-WTF-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/80/55/5114035eb8f6200fbe838a4b9828409ac831408c4591bf7875aed299d5f8
+PYTHON_FLASK_WTF_VERSION = 1.2.1
+PYTHON_FLASK_WTF_SOURCE = flask_wtf-$(PYTHON_FLASK_WTF_VERSION).tar.gz
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9b/ef/b6ec35e02f479f6e76e02ede14594c9cfa5e6dcbab6ea0e82fa413993a2a
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
 PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
