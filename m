Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC8AC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 05:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 912E8404E3;
	Sun, 15 Sep 2024 05:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YM6ag1q5UzLd; Sun, 15 Sep 2024 05:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38DA740457
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38DA740457;
	Sun, 15 Sep 2024 05:52:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED4C31BF293
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC4AE80F34
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMUVyoJGQtgk for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 05:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E904A80F2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E904A80F2F
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E904A80F2F
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 05:51:58 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a09d785423so759995ab.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726379517; x=1726984317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mE4iLAQBzAAMlzVlOmY7IjeDs0BIr6DcUYInEvnmt58=;
 b=Fl8rcKAvw0wTxIjdU9v0Gua8q94RivG/YDOCx+H+vExgbpZmA4RA51ugiG7nrD2TSc
 fM1YQRU9+MA/usq/u7Qu7VtY/AGianO7ejiPo1onoacTe4jtiVPC/Vq4R9tqy2GBSsGA
 c2kpRoXwN1w0HxWoOsnkZixBdJz4ZjnysCt/7c2eYOH7NW4jtgE7F1h/EwPCeAY2QKYZ
 FrpFYjUqjO/3vly2x5p+nOE5lLUeNpRNg8Z1AnCkcBFkcYhJQA1c1HCIdgcbwlH1At5D
 47NV+O8354NFiRbZediVet+r2B+w4fC5cNKQIVO7ebIZIqMWEkvLrpdrNum7g/U/hqFt
 4s+Q==
X-Gm-Message-State: AOJu0YwCRzS9fHuu4ocFo99I2H7j68mQ8fLBcn62T/Letvednl2IQ6hT
 lC0r4U7YjbB9x0OjRVRytIV9AmKY9Ai/9Bn/smyC9Zvlav2Rx5L12bmagg==
X-Google-Smtp-Source: AGHT+IH51gqfLxYALqLbNBW4jO72jwc0bTVnmJVyxxQEBwsH442dg5NPQ9So+UK+6GtbpzcGlxuPFw==
X-Received: by 2002:a05:6602:1611:b0:82a:2053:e715 with SMTP id
 ca18e2360f4ac-82d1f998e38mr1432167339f.14.1726379517545; 
 Sat, 14 Sep 2024 22:51:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49269d18sm78871939f.3.2024.09.14.22.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 22:51:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:51:55 -0600
Message-Id: <20240915055155.1426990-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726379517; x=1726984317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mE4iLAQBzAAMlzVlOmY7IjeDs0BIr6DcUYInEvnmt58=;
 b=AOejL5U/2iruIWPsfYOhE72+n6OAai9fIMnjF34u7NWxjw7Lym6tunjRDGMMgRfL8q
 e6A4jj0yvrKe783jrNB1J0npjY5Lumh0bfFKp5FCEDILQXsM1YIZZkAbDFTVbBI12RMk
 6F2wYembRm6hm82nXGf0O5k0ZR3GfjBtutGvgveKbtMA38BYBgF8LCTYWsPoDEr8mZFC
 q6cc1eVEDxs7xSEhvf+k8rDulJNWC0a/eRiQzZzWExLJ1i9CIapbNMPuBMwZLtFKhoDD
 CnKCToB5TAbAjtK2aOOPz4Nszm9ytwsaD1YdH/BQanqq/1WFPPirqYjMX7Ov0hXHqx2K
 UH9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AOejL5U/
Subject: [Buildroot] [PATCH 1/1] package/python-fastui: bump to version 0.7.0
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
 package/python-fastui/python-fastui.hash | 4 ++--
 package/python-fastui/python-fastui.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastui/python-fastui.hash b/package/python-fastui/python-fastui.hash
index 50f49824e0..37e7f0216b 100644
--- a/package/python-fastui/python-fastui.hash
+++ b/package/python-fastui/python-fastui.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastui/json
-md5  c8e7d060c0ad3a7ad1237dac3555b83e  fastui-0.5.2.tar.gz
-sha256  854a7a7fce4c08efd9caff1a331d222007b3708b133d996528e3f40996c96091  fastui-0.5.2.tar.gz
+md5  bfc873f6ec7ab9cd406822793168ee7e  fastui-0.7.0.tar.gz
+sha256  08ec1b8437653fc37caaf3dae46566a43dbda3f190c62c43f8f3d063261dd1e8  fastui-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1c39900853b2c98a5c98e1acc10e54ef06ba2693cdf85e8b28e3ede658888d79  LICENSE
diff --git a/package/python-fastui/python-fastui.mk b/package/python-fastui/python-fastui.mk
index e143c9978c..7ed2eb39a9 100644
--- a/package/python-fastui/python-fastui.mk
+++ b/package/python-fastui/python-fastui.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTUI_VERSION = 0.5.2
+PYTHON_FASTUI_VERSION = 0.7.0
 PYTHON_FASTUI_SOURCE = fastui-$(PYTHON_FASTUI_VERSION).tar.gz
-PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/64/11/515c9b5cb6e885f4ba8c325f75b95a754d99b8296bdc9f134dc90a79019f
+PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/87/97/3f001410200256026ff98a4588ec8cb4f3b48bc74a28325e32bfb3b08ffd
 PYTHON_FASTUI_SETUP_TYPE = pep517
 PYTHON_FASTUI_LICENSE = MIT
 PYTHON_FASTUI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
