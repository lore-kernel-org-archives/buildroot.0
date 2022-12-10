Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A68C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96AC1813E9;
	Sat, 10 Dec 2022 21:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96AC1813E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyLl2koFLZ3y; Sat, 10 Dec 2022 21:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2711813E6;
	Sat, 10 Dec 2022 21:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2711813E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5DA61BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1325605F6
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1325605F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMwRRg1Gr_pt for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:15:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC24A605DB
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC24A605DB
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:15:06 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id h15so1602504ilh.12
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=krmz6z8d+uRYCfUT2HlpJVwKB4l0hQf3vmfBnNVAaO4=;
 b=naDvrOeUhWuucPmxl4wOMLxiA7Zc2cYwColoigmjYh3skA6ZcWEUjJnbYeMi2Gjr/z
 ad5zPN/7uf5xQaWWoikQpTtplYyNwHsavL/meicmMdcVQJUH/3reQgYoYj2a2u33+6OX
 yyCC9KwKRTjkv8VvL6qC1TurBDRHIEKzWuw7PXOwuW1D+6eBlONabmou9O4rcz1GWzie
 gdNqpJPlIdE4iPL28bYdbxjNvqkrvr50nRZgs0FDTAUQsOiVfB0imkXvs7ykQApsoqvy
 koubNvtWWrXVaiaq2juZX4DsRophgdJqJZb+sWQ8iwZ72Tf9byXfV5+O9s7I51C6ZKC3
 ok4Q==
X-Gm-Message-State: ANoB5pmYbu/ie6jS5NZlr8laa/xCf+NHirSDdfUurTojhwfs2AvZ6WAC
 uVfIglqAzkI8o27jT3bvmS8ykCjw3lraYpYC
X-Google-Smtp-Source: AA0mqf6JGsXaphC2xhd9Od72r0sT2z+hDs4L5HRQMFMuUvkkM3zmqSx9C7vJ5enYTgK5lFuYSrmWyw==
X-Received: by 2002:a92:c94a:0:b0:303:7134:3240 with SMTP id
 i10-20020a92c94a000000b0030371343240mr6426563ilq.8.1670706905615; 
 Sat, 10 Dec 2022 13:15:05 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y13-20020a927d0d000000b003032f7802ecsm1583808ilc.55.2022.12.10.13.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:15:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:15:03 -0700
Message-Id: <20221210211503.3676707-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=krmz6z8d+uRYCfUT2HlpJVwKB4l0hQf3vmfBnNVAaO4=;
 b=q17oMOG5xgZKBb+VmZ2VzqI2ttk4yqNnGypdbQQvetGORVB0pfviO7OMgvqFkJYecj
 O8cZM8Hnv7LP1LWxGHVEYLPxbwdscpjBgFNAyOkay/NS3tpijMeYn8qUFmlfIhsd3+Js
 mHB5bLEgn6mscqnmFI70qTGOEXG7dQZG1PDwgIeCUbwdnNhXT2/4lRN5dqdjq2F/ROYS
 me7xjJlCMLkFtMQEQ53TBUvNFiPJ7HjPD1L5QeIcig2sKqv8LxUE37JXFjGbWxjdd4sa
 p3RPj5Fx1ZbVCk9aBhZeGBjkUP4G5dWpUBFW96fx2sVWjylnWK8B1RMYBxeuAxEGIqWm
 SvVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q17oMOG5
Subject: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 5.5.2
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
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 6bab9d2c1c..7052f77899 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  644f7574b81710a21b1b738d448811e4  zope.interface-5.5.1.tar.gz
-sha256  6d678475fdeb11394dc9aaa5c564213a1567cc663082e0ee85d52f78d1fbaab2  zope.interface-5.5.1.tar.gz
+md5  5a383d71156ce6f89f59a86d957a8d65  zope.interface-5.5.2.tar.gz
+sha256  bfee1f3ff62143819499e348f5b8a7f3aa0259f9aca5e0ddae7391d059dce671  zope.interface-5.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 4f201e5cbf..2bada3a7d4 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 5.5.1
+PYTHON_ZOPE_INTERFACE_VERSION = 5.5.2
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/c5/ec/3e116b5c3c54f1fb7296a686c110c14d1242bbea17286c487892075d9858
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/38/6f/fbfb7dde38be7e5644bb342c4c7cdc444cd5e2ffbd70d091263b3858a8cb
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
