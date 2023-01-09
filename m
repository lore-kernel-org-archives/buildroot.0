Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89808C54EBC
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E6B960A8C;
	Mon,  9 Jan 2023 03:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6B960A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id us0ArUkO0g4d; Mon,  9 Jan 2023 03:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FFE5607BC;
	Mon,  9 Jan 2023 03:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FFE5607BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 188901BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0193440140
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0193440140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3GvJ09dNE03 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:14:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1599140120
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1599140120
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:14:11 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id a9so3709559ilp.6
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EXlV3Lc0mFXHq0OoFgSeZ4cixvXB2EbdRdv5mhcYaNA=;
 b=xYiJFYEmHxzDPeHZ1G9EGvR0jW1qAoliqFe3YELXkD/kUh1Z46eZxrqt9LWjSKh4Yu
 j6v0lTIN0FCelzjP/Zy5cefEwhCJ1wIA/QXihRegcIqGqQFBuVfDaTX4mgPQeYyaquSY
 tgLJW+VheNjYxiadn7qxvmBOdPo87apFkuzwoZhvrP6a3PFNxduON9hZ/CXduq9kSU1T
 zY1aWI/2L0ecbxqbczgdpl6M50G9Wb+3YelbsGFi4V4/bzWaQs0/jGvyHc3tDzAyWEVI
 MVQ9s0ANRFd7uNJ7kzI8Puz3WP88Y0+NGOrNDauoQNGlOHZgyANC7BYSvP6u/deLWJWF
 ptUA==
X-Gm-Message-State: AFqh2kpS8Nh4j/+R548yRG3K/Pn1sgZVmaKjTy9SiyZ4wIct+C3cNMhD
 uR3EM2dzeX4YF0G79TGdJNwHEGqEFog3hw==
X-Google-Smtp-Source: AMrXdXttMPk0KVDdS6cK/SbwHSlNZkXTjsT/bOGusDbQhCq82oBryENlhva/2rLdD3a/DpDbTrB+CQ==
X-Received: by 2002:a05:6e02:525:b0:30c:2bb4:a2ea with SMTP id
 h5-20020a056e02052500b0030c2bb4a2eamr23551273ils.13.1673234049986; 
 Sun, 08 Jan 2023 19:14:09 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c16-20020a92cf50000000b002e939413e83sm2428935ilr.48.2023.01.08.19.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:14:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:14:07 -0700
Message-Id: <20230109031407.2029410-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EXlV3Lc0mFXHq0OoFgSeZ4cixvXB2EbdRdv5mhcYaNA=;
 b=SIiO4+Jd3dap6g4eWbTpXH33KeLJd7+JT0HgCh1gySoxbMqzyXpoFCOw6J66n2PAgo
 qHZyVkTF/owhlZzpUq8zsTUXlyZfdgYfQpbGfVDmF7eQV8ORZ25U/T9TQz2X8n/Su/Jc
 1be9xOmdGDT52BN3ykdnrUVvB4eVFhhZhx5xNQ89vp7shPN9cNBoG3akoknqmR7TcHBl
 x+lunW1WLe3lQnPlgnYqHoo2HXB8pXJnHdIpwGQVLbTjcSFyID2UcOyihQTo4JwZ3Pon
 wONAMvyJ1ksWxRCRvUzSf3HtnzLonINQggmA2CHWnKXnH0oYwBqeKUUCQJwgeYgr+wKv
 c//Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SIiO4+Jd
Subject: [Buildroot] [PATCH 1/1] package/python-bidict: bump to version
 0.22.1
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
 package/python-bidict/python-bidict.hash | 4 ++--
 package/python-bidict/python-bidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
index fe9a94af53..bcb9ea3f34 100644
--- a/package/python-bidict/python-bidict.hash
+++ b/package/python-bidict/python-bidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bidict/json
-md5  da3d37ae93c740c191b5666918c3164f  bidict-0.22.0.tar.gz
-sha256  5c826b3e15e97cc6e615de295756847c282a79b79c5430d3bfc909b1ac9f5bd8  bidict-0.22.0.tar.gz
+md5  67dd74f41341e7ff437d69e00a6fd514  bidict-0.22.1.tar.gz
+sha256  1e0f7f74e4860e6d0943a05d4134c63a2fad86f3d4732fb265bd79e4e856d81d  bidict-0.22.1.tar.gz
 # Locally computed sha256 checksums
 sha256  be0487398bba08e7772b4077b637787b94973b53c44b3cbdd6c7dab10ed15035  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index 7ba15db605..ae3a1ee024 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BIDICT_VERSION = 0.22.0
+PYTHON_BIDICT_VERSION = 0.22.1
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
-PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/2b/84/159749556b9c49ea4489dadeb94d44f05d6033d1db3af4c83120ecac5b15
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/f2/be/b31e6ea9c94096a323e7a0e2c61480db01f07610bb7e7ea72a06fd1a23a8
 PYTHON_BIDICT_SETUP_TYPE = setuptools
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
