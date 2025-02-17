Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E57C0219E
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F14CA40709;
	Mon, 17 Feb 2025 11:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bceu1z_OYRn0; Mon, 17 Feb 2025 11:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25E34075A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C25E34075A;
	Mon, 17 Feb 2025 11:13:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF1F1C0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BC44403AA
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkOWr8xhZlJZ for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:13:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 113D1400A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 113D1400A8
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 113D1400A8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:13:34 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-8559d67a0ebso17571039f.1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739790813; x=1740395613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yCr+H6bbsKMya2kkQlnDZ/cVYP/wnV47QGFk8iSfL8U=;
 b=oXbeCc9aRri85iGB+gfg40Xr2JD1QTEytKhdbFZVpfo7Jljj9etEXOG7727HdwuPEc
 vWwa75vR8sQzqZZkNfCwa/fwgF3C7wECZleIMwSnLlT8F6yrU+8eJWjzJaa8QZ9Tt6gL
 ERVOuCCxy1tnVPgw4lBIPHOXuCb155XPH6jl6QGOqa7wRJtDFUV1pE4RLjMZM0w+wUwU
 M1TGwF8TYhC/yh/bXGrkYqn9JUdTA90PWW4BSNBSFilbTY6xcIP1HTJzLOdAszgjzvpl
 bSJK7pTyG9eo4ch/+Qp7mpWsMMHJgepE8oIILdcd5GxjCo7YzWwLWxUt1q48nhwuGHsA
 D4Jw==
X-Gm-Message-State: AOJu0YxnlPQY2pTmNVPVAegYUz3eP8C3w6kRLjgWabYHW2JZTlY4S90A
 eg25DbcvOWe8MsK8A/YJ+zIeOE1It/nYY34OP3CRRgkUB+sKiCRIlTahmA==
X-Gm-Gg: ASbGncuW6A5apzu2uHRsuOsuc143Eq1W4te8nf/gVVEFuJ9qSIqOisRB+GPcyPlq1EK
 8wDAE/DUAjl4pw+l+yo9TW73/o+2THzu8dYxrrhrAk/7oWfK9oaHK/jzjloBei4mMcVOAkmdnwh
 mEcO+M2WLcaGC9f3CV9NqFX7Q9RDCK3n5SLc4UWarvg+mtic2IBHKMWzQLTRoVGtmwt3J21PiPF
 82mEaWbi2bTIoPSjfLQ3ZefKXmOK9znC4a8Xq3GnG1Naj31VfnpJK8GBUUUwNdyp+AL4AfsMnhc
 2o83ew4uuOPeshuI1lmt8IhGNcwFMFlRqkTsvbMnAspYNsIq9Hb/4RQVphkJdl/QWQ==
X-Google-Smtp-Source: AGHT+IFmbVscnlMLEl8JsI5ZfGdxl4i7KMsjJ9bFh4/ASwcldPSgbjiwM7BNCHfNl/l0ANShof0ZkQ==
X-Received: by 2002:a05:6602:2c95:b0:843:e9c0:8290 with SMTP id
 ca18e2360f4ac-8557a0cecf5mr735376039f.6.1739790813401; 
 Mon, 17 Feb 2025 03:13:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8558efb7606sm41510339f.45.2025.02.17.03.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:13:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:13:30 -0700
Message-Id: <20250217111330.1849773-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739790813; x=1740395613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yCr+H6bbsKMya2kkQlnDZ/cVYP/wnV47QGFk8iSfL8U=;
 b=NPuN0jnZk7I35bCL1oKag8MoO38jKUgdZr8U8jPn7o1Y+085H2RjD6pRPvND4BO3vs
 Hc239K/a2UF7/KVq2DqMe9E+MBgTWWyUkgAovgDUuBwbHNoRm4dgABpqkHzfA/tCVYmk
 MYsQ/cYl6FNQdZRv5K/1BprN6ebIUC4byrVJoNQqU2k71cQsW9oVyGZd+tuj7Kyv5GHy
 INbSgTgUGAWp1FQKVl5CJ//DkXC8tCvwv2j4NtS6GtS0QPJ4dg/Q17K6bfoDUwUYSpKK
 x2APNVsvj2wdfQgs5xmWjDDk080/tcoR7jB59Pvy7bFNR2XziacxaKNFo+bMqO3Gncqf
 cdaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NPuN0jnZ
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.8.6
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 8be892f221..38d921229b 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  60f37920f3fe9c178dad2d618d4c7794  pymodbus-3.8.3.tar.gz
-sha256  d886186bf7c3cc140f17e830919c23e4cc88334fbb91d6e5e1d7dd05860fe2c8  pymodbus-3.8.3.tar.gz
+md5  af760b61450c670a280c098e3484635d  pymodbus-3.8.6.tar.gz
+sha256  7689b56cc3ad05a594e1486e772abb9d9646c01737935df492db04455680baf6  pymodbus-3.8.6.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index e21c5c6a90..ff5a8eb725 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.8.3
+PYTHON_PYMODBUS_VERSION = 3.8.6
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/f7/c7/95ad9774e7ba8547f52d657b09fee7fa02d87532866f561c6d2bb9068b8c
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/47/3a/a6958507d6f9c0c50f11cd299b056161c10f3cef7c227b44bc183a7e7854
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
