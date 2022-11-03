Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEE0C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0627C60F6C;
	Thu,  3 Nov 2022 00:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0627C60F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSxOmDqr78ir; Thu,  3 Nov 2022 00:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 294CB60AC0;
	Thu,  3 Nov 2022 00:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 294CB60AC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90A091BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 755BE40112
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755BE40112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81C11RSSgz5b for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:26:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A9D9400D0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A9D9400D0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:26:25 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id 11so208042iou.0
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IwMhP7juaWBjjUHstj3kZRLOoDZeo8KCFSzua5FK+34=;
 b=TIWH0cBeaTgXEqN72v0gOIrDJAyO/2Sdt5UlQds9Y3OHmmmHDyyHDwwB+9KtrccbJa
 cCaGqfCZeUNwqYCJZYYDBt/JsNpz0IxyZvcWaJhaks4qmhsXANyA8G3B1rZeTg5njXPT
 79kJ15TBpjear7iI1ENqZlXGBXN8YPey7VihFxkpVMX0uG6uAqmzNiftiWVHPu+XoZJb
 CT/IvBs0IkquLdHreOHl8aY9r0kk6jtfyVTaGW+vGl18mc9kM5FmBnsf8/TYP/+D78om
 9SfI9eATsJ2i+TE2PbHvGLmKe7Hw8eSn/Cgs1P5oExVAwt+AX8Sl31enEz7AATQIg6WR
 srng==
X-Gm-Message-State: ACrzQf0YNZOdNiusDC+eFcukO2IL9ZCrZGYW338zbufN93TymW/pKPhj
 hh0/yvKJWIfwYb5lhWtvsSUj7RygWVI04Q==
X-Google-Smtp-Source: AMsMyM6TiqNCPOi2Nl3eENYA+2/9FeT42+40cvwZs7DBdnpStb65SlU7jtf18J1qAtCVZbIi4zMvOA==
X-Received: by 2002:a05:6638:3289:b0:375:30ec:eb98 with SMTP id
 f9-20020a056638328900b0037530eceb98mr16383543jav.73.1667435184228; 
 Wed, 02 Nov 2022 17:26:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05663814ce00b0037108a00c73sm2788922jak.139.2022.11.02.17.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:26:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:26:21 -0600
Message-Id: <20221103002621.2593969-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IwMhP7juaWBjjUHstj3kZRLOoDZeo8KCFSzua5FK+34=;
 b=l54xqkn85JenffpWAULdYsCdrHJClDt4sW1BOwsDu2F32pwr3Q/In4v1aly+x6KqDB
 lFg1qZnFJlW3joErfqSvru7oO4BxTGk+JzBEBMNH7jNpceKxt4YfqkV4zbS1qDP5oFCI
 VLLMEYoTOoiNnlbgObZbq8jyQQmxJ7v7vrU5e36im8CP8As+mQYcXpfCxbdetghuzo+F
 Gv1pqdPFJ2zl/rtM46YCV+2VI2TXMk/FNkiy+nh5aiYvuhca0s6Xnc/su0twHRUALnpT
 TtGHjmPLavUUeYwzBae+1se5bE67z1hJD6fB6O662StJ1dKnmYbO38l7FZJVvu8EFjn2
 bBPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l54xqkn8
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to version
 2.4.6
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
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index a3e310aacf..f8582ba5b8 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  6134fce06c4783b3178a90a719fa9d91  markdown2-2.4.1.tar.gz
-sha256  ce9265cf179c4e07934e7b6a4b03f3edb7891e66e6d0f7017755f6064bbbe13f  markdown2-2.4.1.tar.gz
+md5  bb3f451bed011a0d8959e3c1d5850c53  markdown2-2.4.6.tar.gz
+sha256  f65b4dbe1e16591b14fd40bc659b8b58d285eab70c1da21f390294fcdec42bb0  markdown2-2.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 6acfad2ccb..b1c162e12f 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.4.1
+PYTHON_MARKDOWN2_VERSION = 2.4.6
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/fb/10/4f327f4517fa5dda90021618fe174d1f4aff3c4e06abcd7f77685a455511
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/83/b7/24613765f558afde9f47b61fcd787a9856ac1515b53af38bd11bf2fb3c8c
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
