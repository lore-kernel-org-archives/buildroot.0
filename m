Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD6FC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3DC80B69;
	Sun, 15 Sep 2024 08:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDhrB77cJW5y; Sun, 15 Sep 2024 08:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F45480F38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F45480F38;
	Sun, 15 Sep 2024 08:13:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ADD81BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55FF6405E8
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8WcoezvB8bI for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EB41405E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EB41405E7
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EB41405E7
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:13:02 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-39f54079599so10531195ab.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 01:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726387981; x=1726992781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9TvRZK3Jp/kq0cszWreE6yfMOmVCmDfd+OOPHhCcAm8=;
 b=b3NGuQXREQB33h+HcPHbIXX2npfUdE0OAT1U+b5xRClYe1cPRaJ/jxTMr5A0XaLYJU
 /37oxOlB2iTHv3rBkuM00/pvgsUiZIDwIRxiSiTREsAnfWdb/QUMe4wPk56YtOPxuk+q
 oJiHWDErcxMmepTPI7Ens+uppDFGULS8UzppMT5LvPKjP+4S3pCmhECI4P1xtx86DCsO
 t3QyHQNwk+QVueclvnoE9osSGbWQi9DoY+AIDli7BxjdQX16nCeYC/VbrWnceNN3ocFc
 rjsty4xusrKLj+mPGC9mL+lZ6TJVdphaJjQNJwh5nvKPv+IgcV2zMQguzg0Ek9tp8imh
 dXDg==
X-Gm-Message-State: AOJu0YxvBFCAurZBhW3jC4z5V8kcpe/7FT/GQaYjA+SqrutfzNyir1QO
 u8x9hvJDTdlDLMW+EGns2Kh/Q0iDBmoJMz+E3nUg0te5M52RF1ZV49JSXg==
X-Google-Smtp-Source: AGHT+IFUKi3F8LvvAJExjmmlfXTSs4FmezjJ3G61bDgY6GgY0MWwr9V/DMYIsAdZmnILvTW0PQsM7A==
X-Received: by 2002:a05:6e02:17c9:b0:39f:558a:e414 with SMTP id
 e9e14a558f8ab-3a08462980bmr99801325ab.7.1726387974646; 
 Sun, 15 Sep 2024 01:12:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e7171asm9179655ab.56.2024.09.15.01.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:12:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 02:12:52 -0600
Message-Id: <20240915081252.1573662-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726387981; x=1726992781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9TvRZK3Jp/kq0cszWreE6yfMOmVCmDfd+OOPHhCcAm8=;
 b=VZLkrbDzJJik0NFX3Z68eLmgwQkG2P7TCaPTNV90AcEelYUlhVtlok3MJ8TtZSMtsP
 c8XKF5Al6NmeXIbfj0KfdVh0+xJ7dJ2Ei4URPzSsvBmp4j2mLiZs3bNoj8RVHh0Foqcz
 pB7ZouTbA6gmZqbKaTlRyyZXmWhMuTfziAf5qlzkgTQGtzvTypAkRevPQ+wTewsJs/F+
 NMRqTqj9hDsxp/bWFTrxWpOWfLVEQ+KqvwA+GXXX13I05zaW4jZNarv6CuEpO71UOpsa
 uwxUjuf6rBwnIG8xAPrIBaUEUektIpTwVnF5PQu5V+wbeHelYVVsbyEg6jGZSKfK8llW
 AULg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VZLkrbDz
Subject: [Buildroot] [PATCH 1/1] package/python-incremental: bump to version
 24.7.2
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
 package/python-incremental/python-incremental.hash | 4 ++--
 package/python-incremental/python-incremental.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
index 456e8ca16d..7707495a0a 100644
--- a/package/python-incremental/python-incremental.hash
+++ b/package/python-incremental/python-incremental.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/incremental/json
-md5  9fffa2490ca649550c79a78e85ef2eef  incremental-22.10.0.tar.gz
-sha256  912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c24c0bd0  incremental-22.10.0.tar.gz
+md5  d946fb1a369c77693b4dab8ac9b13596  incremental-24.7.2.tar.gz
+sha256  fb4f1d47ee60efe87d4f6f0ebb5f70b9760db2b2574c59c8e8912be4ebd464c9  incremental-24.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index 4b032d2649..9a1432ebd2 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INCREMENTAL_VERSION = 22.10.0
+PYTHON_INCREMENTAL_VERSION = 24.7.2
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/86/42/9e87f04fa2cd40e3016f27a4b4572290e95899c6dce317e2cdb580f3ff09
+PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/27/87/156b374ff6578062965afe30cc57627d35234369b3336cf244b240c8d8e6
 PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
