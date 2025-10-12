Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F36ACCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0308440B03;
	Sun, 12 Oct 2025 20:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPRcjF9diUTP; Sun, 12 Oct 2025 20:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04CEF40B08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04CEF40B08;
	Sun, 12 Oct 2025 20:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 264C512B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 170AE40B08
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IssQSWIJnXrk for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82CF240B03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82CF240B03
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82CF240B03
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7999EA4C6672;
 Sun, 12 Oct 2025 22:20:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Xy-000000004zD-3T8R;
 Sun, 12 Oct 2025 20:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:40 +0200
Message-ID: <20251012202002.178080-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300403;
 bh=yDq/pLsXakiaWKFKmMulNk+ICV7xHuHlC45Rb7NCCzI=;
 h=From:To:Cc:Subject:Date:From;
 b=kp7ht7fzfyvMxNqS0gFGoIaQzIlEpczaoxj4JuMxezonosaeIjSOGeUTm6QZzrX8a
 H6QA5yEH8GBE9xykGUvxBd+E9ZCzkLfO4AxlfLActL2a4TmzyKY+nykVnN7Ot0WN//
 luv0Kt0X4aEzuXj7bySLgeWX6JvqFLk/e97cxS3T/vfw7D1xenXAuBiAl6aCxscZl1
 aXbK3w+Y9c1X4Q10cxS2Fz221m5rI2Ywgm6g0s1Hz9NB+9BB/59TV+0caoi9sI/OvB
 aJE3ZDYynajChE6mxpEy29g68xkFLx7gxVZrVc7nRrAaoRWfBxyESEwlvsG47dv+Dp
 E/hP3ScBuiqAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=kp7ht7fz
Subject: [Buildroot] [PATCH 01/23] package/python-evdev: bump version to
 1.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-evdev/python-evdev.hash | 4 ++--
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index 733c0c9cda..c72a132277 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  c1440732b435dad5796bbb8e91d0340b  evdev-1.9.0.tar.gz
-sha256  38218bc95507cad756bc621a5fe7a77a41eb8d9c1213855de8e4ba0aba28e79f  evdev-1.9.0.tar.gz
+md5  7f0ec85ff4bda28ee25e400ec30adff4  evdev-1.9.2.tar.gz
+sha256  5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c95d1c87fb8f423069  evdev-1.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d4554960d6496150c88c1fd02d7973121a9a57b961ea58fe349fbf8ada3816b2  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index d24974a037..1bf95fb8c7 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.9.0
+PYTHON_EVDEV_VERSION = 1.9.2
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/8c/bf/0fe4d372ee62fe5aec06aae2e97c0603d131b8e3cbaffa2329e0bd763a98
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/63/fe/a17c106a1f4061ce83f04d14bcedcfb2c38c7793ea56bfb906a6fadae8cb
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
