Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB331C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 02:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8012C40534;
	Thu, 11 Jan 2024 02:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8012C40534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLvr1Zp2k4H7; Thu, 11 Jan 2024 02:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 486EF43791;
	Thu, 11 Jan 2024 02:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 486EF43791
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A449F1BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8888761039
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8888761039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IP0aOqA7F2Pg for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 02:09:20 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0DEC60F3A
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0DEC60F3A
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso205533939f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 18:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704938959; x=1705543759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qz7lX7g0URysBUHfGcwurL072asM6q+UMSPn8aAutrs=;
 b=mdFmzImz1aAONZ4ZVk49/xehs8BcQTTd9cNZcQ8ViDuq0c1akxXTh47NsrhEHlkoFE
 IlFy3CFbr7mLtXZZmcEXUnbWOkprbU4lqiWKr4I9DLGHVh+FjeZukZ9oaXwtrX0I8Oz5
 7JVViFxs/qYXZdpOfhfL2cChahfDPgOBIFHCYlas+ZMqqHQqYFptmqsx8iykLE6GQKds
 qzEyNswgmrIzM5nTHhuIVa2G8q91BJn8R6DmOMPkeivGnWroKtNdJ3hItvHazdUorspy
 DEKo07Kmk4Alzto7y9xk7H1EpvaiDlMN6F+DXlYKJN0XWU3T0EROJPQtgSo+M0yOJ+XO
 uJbg==
X-Gm-Message-State: AOJu0Yy0d7cK5dESkeej/uRAsPoiwlck6aL7eKDbWpX5M0UlerMnCJWi
 vd9MhlzwSSjrU/82kAZlLx/rHhpoSLB2/Q==
X-Google-Smtp-Source: AGHT+IFe2I1ZEBKb0wI6W3SmYpjIByUYDxDvaawrxh2fo+IrKSVetZ+ele6MbFfUBQ8VD0HFdwbDHw==
X-Received: by 2002:a5e:890c:0:b0:7be:ea73:4ca1 with SMTP id
 k12-20020a5e890c000000b007beea734ca1mr614796ioj.24.1704938959288; 
 Wed, 10 Jan 2024 18:09:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 r4-20020a6b4404000000b007bc3ebacf3esm2545ioa.46.2024.01.10.18.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 18:09:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 19:09:17 -0700
Message-Id: <20240111020917.2651626-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704938959; x=1705543759; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qz7lX7g0URysBUHfGcwurL072asM6q+UMSPn8aAutrs=;
 b=NSZCXXi//ACJjJng86jeSJb7lj5MDQfR/2iYhu0SKCPfjIOjOoEwDoRLtuIcltbdnY
 l802DE0p10LxQ7LMTB6pNMSR4lfjw/hpHC9p0QsVN0IGiPdno530P+zx8FT2htE+7MUh
 U7TSj8FKMKLANfuQBPfiagWeYU1JFzTS7S6lieT13K6fNuT0dvapjK87GhCufMkcIaQI
 YEnn5OrW2FF/R3OQQQ3LoFqzloV8No2XWcBxeEnpL/bqJE5MwEDDQ3khsMkzj0ft9IK4
 h4C7Ls0o20CHcF2vwdYfua+AERLO1NW1ctWN+/Zejeo3TtumyqqP1lS4P4yBTCojCiTm
 J+tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NSZCXXi/
Subject: [Buildroot] [PATCH 1/1] package/python-pyroute2: bump to version
 0.7.10
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
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index bac8809f2d..87693d028b 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  caaef93e32f2c3aee305aefba7c8ad21  pyroute2-0.7.3.tar.gz
-sha256  7041040db1c2d187fbccd151485b1244c41d758be821785847946370eb6bb706  pyroute2-0.7.3.tar.gz
+md5  0566531c56ec453cc9ca0aff2c3f2f31  pyroute2-0.7.10.tar.gz
+sha256  cc2f90aad1517cb0b301041f678cc8d3c3427c26e53f15c78c93c67928d89a02  pyroute2-0.7.10.tar.gz
 # Locally computed sha256
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index fb4a1cbe5d..023b8e7c44 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.7.3
+PYTHON_PYROUTE2_VERSION = 0.7.10
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/9c/e6/8d163b1aea84223696fef8f8c55566adf166b79d614d602469d64af00226
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/18/44/930e15e4fd5d0c7c54dfd303f644a057d88f411a97581d6edc5cb9e16f9e
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
