Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13F7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 06:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55198408E2;
	Mon, 10 Jan 2022 06:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbaMOmuJabvT; Mon, 10 Jan 2022 06:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6FDD408E0;
	Mon, 10 Jan 2022 06:20:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B78D71BF37C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 06:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3DBC405B4
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 06:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mtl6jKeubIIY for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 06:20:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B85840122
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 06:20:18 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id y11so16128124iod.6
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 22:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=877XKfXINVcL/NvdL8kvl7/pGV6TrKK5q0x6FVboH9E=;
 b=QS0Z/sqls7p+m2iiouc0de1V5shw03p3NQpanR0czj5DI6YWwCZDLoxguSDuXMv0Y2
 ROJYlrghw7HowrtopayjwWUhOjNSayIFsXP/MnQZDgzVvwQ9ga3qi8SEYmqCWL41Q3VK
 M2b3feiE0PZWQ43AyElF+Djy2riJAoXfUNVkqC+vTPS6aBdZrM+cW44NwgtkLx+Ef5Ur
 B1FfOoWpQHx+zLpQM8gK1aJSZYqPOFH3LqzvDmuMTOdQEWJp7Vk60XqUykZGM2ljaSm2
 KAogq/Z8gE9PdVvz8xlMI28qnvj5sG8WhpUyLZ7bHxfTgFm94ZHzC92/fBp1WMHN1Mrn
 SRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=877XKfXINVcL/NvdL8kvl7/pGV6TrKK5q0x6FVboH9E=;
 b=M20Hv5DaUgkLfRK9Y0d88uxfOeuzVzPqIhOk1ayCF/O5deSxOv2vD4lEBBOKWmv8w2
 exd7RT/KCkepLwNxEosNq2k//VmpZpa9GR28fmgPcD9OoO1jr38pBSSTptzXjG0phSIY
 2dcb31anqIiGRGejHoySEzWqex/5BBULd1hR/RCe8/2QsBzCLDnvHbh/uQedqVmdCcXT
 98UeNZDYUyGJTLZmqOnp3rFPxGe9667lFITpGQMgHW9neHDJ31I/6ztbzK/4Ahg7FvGw
 H7e8f6afsqfWa/scgtrGdX5mpmKja1DDrumee+fcfStjRALFuLkMRAgQjioqkLuVrZLC
 7wIg==
X-Gm-Message-State: AOAM532/PPf3I06Q+OY7tRWkL5PeJjoFak1goqBSpl6Pgewk3QY5YsHC
 ldFWkz3cpt/Lxl4zPy5S1/YHQq7xyJ8=
X-Google-Smtp-Source: ABdhPJypqmdYHi9qiw1pDyDPyHHictWu2x+yKAEUHgjkYDm8thKmdGY6SwtpFaf2gcMZ0WQfk2GM4g==
X-Received: by 2002:a05:6602:168e:: with SMTP id
 s14mr5656616iow.202.1641795617540; 
 Sun, 09 Jan 2022 22:20:17 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id n2sm4057140ioc.0.2022.01.09.22.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 22:20:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:20:15 -0700
Message-Id: <20220110062015.1299719-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-packaging: bump to version
 21.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index 0c23a5f71c..0f353a9e36 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  240ba5823ed31051a1254e74c9d18d55  packaging-21.0.tar.gz
-sha256  7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7  packaging-21.0.tar.gz
+md5  e713c1939f294fd729af4a7be40dd141  packaging-21.3.tar.gz
+sha256  dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb  packaging-21.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index e2fb9b120b..569dc0bf58 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 21.0
+PYTHON_PACKAGING_VERSION = 21.3
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3afd461faecf9955a6501c4999933a48394e90f03cd512aad844
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/9e/d1a7217f69310c1db8fdf8ab396229f55a699ce34a203691794c5d1cad0c
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
