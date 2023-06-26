Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74C0EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 08:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C62741040;
	Mon, 26 Jun 2023 08:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C62741040
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8N75-qPR2Dty; Mon, 26 Jun 2023 08:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4194941087;
	Mon, 26 Jun 2023 08:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4194941087
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F283E1BF390
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 08:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D800581F08
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 08:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D800581F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08QpTyNhbbxu for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 08:00:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF9C81E1E
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DF9C81E1E
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 08:00:25 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-780cf728871so123662139f.0
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 01:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687766424; x=1690358424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PgkfIf++oBbep6V0463JgETSh2wGvFn84smePCeNZQ8=;
 b=aqiD4VhSZWYGBKLm6hOGPVEYrhqrIXOLgtlROSNGX2vspLD+pA8eQeQJCottdLRXHu
 lZ3DUccxXfI/9MVKyngkv+5FXbCF0Y8lAEbbeQIQzGBSd/bw2Awj32kQwjsi98K4ZGfO
 Jpnq0x47w5mV9eyCvijhlWuIPlB5kHdHCnGSfJPiLa5aGRi2Z7/lUymO+tFdS6AJHHlh
 /DV5XYPjfpj9nYibK5ViDwxq+pI7TUCuLh3/3oSkzy+2qn29NCyxkYtznoKjqEBFrmEC
 Q2mMgcHPVuL18/7PXkpUVswSCr6jpiPXIiBSe01INPTVclMgChcKLETIoLcEWInj1P17
 aLxg==
X-Gm-Message-State: AC+VfDykr+Z1UXJtYdTcimUnCpkZjLViTmv/KHZwmfxbHu6xKKWs90WL
 FLw0R52dy4dOEfppAUetGc52R7rgKr0=
X-Google-Smtp-Source: ACHHUZ5ZrE8+OEEDUMgB9mQaC2l4snd0/V/lMYcptV1xMUWdUhyEbaZUrKomkGBSrZh8Zrm+aJSh4Q==
X-Received: by 2002:a92:d485:0:b0:345:6ffa:63c5 with SMTP id
 p5-20020a92d485000000b003456ffa63c5mr6591086ilg.32.1687766424092; 
 Mon, 26 Jun 2023 01:00:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 x3-20020a920603000000b00345ad48aa94sm322021ilg.58.2023.06.26.01.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 01:00:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 02:00:16 -0600
Message-Id: <20230626080016.2182278-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687766424; x=1690358424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PgkfIf++oBbep6V0463JgETSh2wGvFn84smePCeNZQ8=;
 b=hZIToG2UlClwS0cG+t7zx4X8L8alRhLuhZL2ThTbkFI7rkf+F3V1utUFGkP2z+lD07
 zLdOJ+s4Spxub2cY2E+BO3EbU9WX1wt9RkG0YFVAjOk2kTW3/Wx/aLg8xsh+O6o8tkw1
 3+fhSZ8hNnkZ/TbtGacnSYrwStD4zuxts3DAErB6z6D6vnwFpigH8NYxcePOAI5HmdIU
 en93Gg18FSdZ1gEG3ZOekzoC4i9lZV88GT9oaWUcSTI+bJtmCUSoeEPj21LeSFghA4s0
 BedSw5yReKNyOLGxV8F2/1ITimovImDVNIxI6xoN3tRfb830jtkutMqmuhUioKmGmilF
 ILIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hZIToG2U
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: add host cython
 dependency
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-python-cython for python-msgpack to build correctly.
This is a hard error when using a pep517 frontend.

Fixes:
* Getting build dependencies for wheel...
running egg_info
writing msgpack.egg-info/PKG-INFO
writing dependency_links to msgpack.egg-info/dependency_links.txt
writing top-level names to msgpack.egg-info/top_level.txt
reading manifest file 'msgpack.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
warning: no files found matching '*.c' under directory 'msgpack'
adding license file 'COPYING'
writing manifest file 'msgpack.egg-info/SOURCES.txt'

ERROR Missing dependencies:
	Cython~=0.29.30

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index d9304e4def..5241416fb1 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -10,5 +10,6 @@ PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/22/44/0829b19ac243
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
+PYTHON_MSGPACK_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
