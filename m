Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5FDC43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 12:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDFDC612CB;
	Wed, 29 Jun 2022 12:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDFDC612CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmJ2wAMtQyAg; Wed, 29 Jun 2022 12:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8AF3612D0;
	Wed, 29 Jun 2022 12:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8AF3612D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8DC61BF407
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B30714049F
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B30714049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cf2hDUv78yCy for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 12:04:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C4C040002
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C4C040002
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:04:49 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id k7so10115891ils.8
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Mq774gXY/bkuGYrYn6hjQeHW9aL/vVKwxFnd5hdFss=;
 b=NwzceAHBWMTMz9fEvqvjrURHCKygRCJxvlwF2Tu7UyNI+mUs39BXVrrpN5tV6zHgrZ
 q0I0QNmBd6XEyLEDVe5htOQYgLnWkK1cVsuRE1DR52RrZSKwuCLIwxSCxwTK1g4decWj
 wtEgx5YXc3uMec4jYu9Ol1L5CE0t87pgnjD8gJJ72ChAZuJ4qqUsvXNVL1NHiMnR4cZ2
 1ec8h8lEQaOFg/kZ/+rc+XbjBY/3kL/ZvQwc7BIP0DUA6alLBbccLW5D347PNaUvezJr
 Zh1PJaayoufeilR12qNbbsWBNJeELm31PNI4dUL/ak3S2Zh5FuQehGJ/myg545eJlRvj
 s7lw==
X-Gm-Message-State: AJIora/Lqq/4vx8y3I6yA4+2pTqC1GnhkyHoL0/As2ltHpK9whLm9Bcu
 OHs2qUJ+udSseg86r48M5EhIIJ5aAO8=
X-Google-Smtp-Source: AGRyM1vr3Xk3HJuB4KVRii2uWnS7W30Qp/OsLFfp6ys1MkeoxRXmUkxkA5QfLtsZVVa0ktGq1s7b1Q==
X-Received: by 2002:a05:6e02:118f:b0:2da:6c3b:d56c with SMTP id
 y15-20020a056e02118f00b002da6c3bd56cmr1833639ili.297.1656504288235; 
 Wed, 29 Jun 2022 05:04:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5e8c02000000b00669ab35d790sm7824433ioj.8.2022.06.29.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:04:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 06:04:45 -0600
Message-Id: <20220629120445.2341504-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Mq774gXY/bkuGYrYn6hjQeHW9aL/vVKwxFnd5hdFss=;
 b=QnIIMAeKLdnH42on36h1oxM8XJBKFxTcvWVvVbIvKUYHl3VAjTQBc/IldPAmIS7Uxn
 7ep7IwfK7ckyV5jetevVAw7enPHftU62KpaAvwEz/rZqUcmWdm2n68U/ReTChWEpXgby
 o6GdO7La6ekpgre/aHg+lxbOKxjEywphEBTufJjfRlrQiFLsOtxdsM66dmF86Nmz4s91
 irROWaEZTLF+PZo8bVC/RidRDoHwyBD/5o5KDuCJ54UyI9CMYXkCSg4tF1sP9u/asDmn
 +Ne2BIGVH8a/kbFN1G1+gfl1pgcWFZkK4BxNnySPiy2P+6lMCD6DdzR0C7gzVvFPPXo7
 u3Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QnIIMAeK
Subject: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to version
 2.4.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cssutils/python-cssutils.hash | 4 ++--
 package/python-cssutils/python-cssutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index 13459f7270..065c8ac1f3 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  4ae0e6c670483043260363f593e96a69  cssutils-2.4.0.tar.gz
-sha256  2d97210a83b0a3fe1e4469f5ff9a6420b078572035188b1bab7103c3a36dc89b  cssutils-2.4.0.tar.gz
+md5  3b9acf80a22c44d2d12eb7e20533934a  cssutils-2.4.2.tar.gz
+sha256  877818bfa9668cc535773f46e6b6a46de28436191211741b3f7b4aaa64d9afbb  cssutils-2.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index fc65c893ac..beb5f1c8ff 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.4.0
+PYTHON_CSSUTILS_VERSION = 2.4.2
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/f4/ea/d09b04b5cf6ad84f45ca4c523d3e153dd9be1f12650c825d1c92ca0618a2
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/d4/12/1aba9a6c91d92de011ff97a9320ad37e5565adfe0cc324deee58d5891d7a
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
