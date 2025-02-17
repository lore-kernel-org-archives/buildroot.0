Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E803DC0219E
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A81B408D8;
	Mon, 17 Feb 2025 11:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsE5Bbeta4ki; Mon, 17 Feb 2025 11:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F172408EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F172408EC;
	Mon, 17 Feb 2025 11:17:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D128C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09AD14026D
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsfNH3Q7sHPB for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:17:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAE8F400A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE8F400A8
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAE8F400A8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:17:47 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-85571df0265so225833839f.2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739791066; x=1740395866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVATUG7mnVDQwMeTYlXUTiKExbj1QRLLkwQfqnJuN1U=;
 b=SI4etCsVyY2zUsKV+sjqRYEqCBCY+2qAAnEhCYv/6E3wn9doQOV/ubUWibOIZWPC/O
 1eegXQJZkJaLawzGn1sKAT5ANYiVV5xHINNn+2iea14IohxtfP8nKlECxbxC9zvEltWd
 3gCOTWdLvKBmp1/0DPIJIxTjLEi3XqOm2Y85H/LizNE1fihc8wCgtNWz8JKPRSL8NydA
 7RzhQCZjqmgOT8OhcWFZ9DNXwohvLGyYeJL84MUjVJIArnpdOhlF4F4SvUX3IDgp6sAV
 73bmPTD+zOND2kEYD5Be9J3jYuuupVSmODmZHo7i1Ssh+32QIM5NxJx5i9lUSgGC/48J
 h87w==
X-Gm-Message-State: AOJu0YwTxEDZ7sQxUPHufp5ihvjwiD8RF9mMwT5ljv8AV2x0+B5cgMpK
 ea5ubsuZuS8GLGXB6JkQwHPYu/sTDsfOx9kWS+DQn7zSqkbIvyRXTWxeAQ==
X-Gm-Gg: ASbGncsP+yeqb2JKhllxmC8Fzkhs08SW7bt3xU5AP+LT8QZlK0nzZwpHUtSp7uJvSJL
 a18WqAvonK0AkmrRQZjkXZFiM7FXAqArJkNjm0XiZCq/Hdu35dDi5PRhml6GOSzBnhORvpgEDfX
 P365vBd1fTDU5Et6KfxhzFGyo7ySdwYmeZDahGzgsgKQhs2fw40Cdf/u356D1oUA5ae82bBwec4
 vOouIDxOl5olYk5jDSTsAeT2IEd3Xq63JX54EHZeafNkvlwVhOhjxeRoW4KUtRx+7vDzwSablOt
 S1pmcJZh2DgL40DILNGTHdxLBUZcT+GVyZjOSEYFGzteRIkz982qYrT19aELRyTRFg==
X-Google-Smtp-Source: AGHT+IH7Jj5L4FdI5aVRPOmNOAmr8L/dakFrzciSTaaPB8Dec67LI4wnw/ajND9LkwFVnT9x2MfGFg==
X-Received: by 2002:a05:6602:1489:b0:855:683d:d44f with SMTP id
 ca18e2360f4ac-85579fd3e47mr739538839f.0.1739791066249; 
 Mon, 17 Feb 2025 03:17:46 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85566f68efesm182867439f.30.2025.02.17.03.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:17:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:17:44 -0700
Message-Id: <20250217111744.1851201-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739791066; x=1740395866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mVATUG7mnVDQwMeTYlXUTiKExbj1QRLLkwQfqnJuN1U=;
 b=I6RRR961QUkBvXblgzu2niYHnSv2hU/JwXl1PwlE0abt43xFCLHX82M5VlVPreOdUt
 CZd2odXyYFiuZLYpa2HA88wHozsM/RHrvQ0A766xSQmAc7GA250LYCU9G3B+eU4ESoRF
 y3hBdih7byM+eAic2p/rHDQ0VkTe+8Q6b9Rw/1EgSjtIwTq4s2xmFRerXp0Krx2nZQPW
 mxNfjRDAICrI6DaLQ5NgKyRD5Mcs+HTS6pwC4Ij5K6rgBXOAS4aJDz+ZMdbgXxii+p7f
 9wt+iwdanzrjbToDDpdUK/fN8M5u5Tsh4kXNOAAnF+GBRl2Q3VjldV5eU4quR6EB4b/d
 ej7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I6RRR961
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 15.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 3e762c5029..3279977431 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  26d1dc6e53395f537667d66ba1832ea7  websockets-14.2.tar.gz
-sha256  5059ed9c54945efb321f097084b4c7e52c246f2c869815876a69d1efc4ad6eb5  websockets-14.2.tar.gz
+md5  753a523e3de5b0f32927e590b910dfde  websockets-15.0.tar.gz
+sha256  ca36151289a15b39d8d683fd8b7abbe26fc50be311066c5f8dcf3cb8cee107ab  websockets-15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 2de0b32d58..a39c7580ef 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 14.2
+PYTHON_WEBSOCKETS_VERSION = 15.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/94/54/8359678c726243d19fae38ca14a334e740782336c9f19700858c4eb64a1e
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/2e/7a/8bc4d15af7ff30f7ba34f9a172063bfcee9f5001d7cef04bee800a658f33
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
