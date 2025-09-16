Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C3CCAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3E7A406D9;
	Tue, 16 Sep 2025 00:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTY4-tfo42TN; Tue, 16 Sep 2025 00:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD42406DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD42406DD;
	Tue, 16 Sep 2025 00:21:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6778B22F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D2E2406D5
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnC21-iXrw_3 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78658406C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78658406C6
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78658406C6
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:21:53 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-88762f20125so372581139f.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757982112; x=1758586912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SKmePd1Ill4Z+m+PTZAsoepsDgxrOeUCD9oX2y+T1YM=;
 b=K0q28CTJoiZkCI/yI0wJxVjBXgXYQI3UAWU7G5eylRHspmlR2gn7pWgx9QufweI5/R
 TR40k6PeAyi7MRqCpQqcS0eTpDBrxV9pSlgulNEf93jpzwKDDf1S1YYa1YBqBGa5QDut
 nAYgJXVEMrcBbjnBVWRvqwuV1bb02vcS4GHh11iyp/EcxVa2sxMzg7/P4c7TGw3kBibG
 D1zN7H9BqLtID1055+MAQ4gaRzGWbsctb02a8D4S4ItjitTOWXrS01+Nag74yBrFH8Dn
 p/QFGGvHUTX2y87+162Uam+hvFlAdOdSk5sS9aAhxfNbNjbWmu9HLxrj60xkwwFC1ZL3
 mBDg==
X-Gm-Message-State: AOJu0YwiW7OPnSHKJu8acCmFIou3eb7Oe+mdlaNd8bnbbSYdj/hEU98b
 hKUPxLHD5/7jTpUgRcSBTR3CRLO1hjSrOIzlnXdIZ+I+UR5edkPHerZ9M3Q5dA==
X-Gm-Gg: ASbGncvoYUhUxh9rMZkbNj6Qm6rdwPLDlmxIlO2/G/CrXHH4lESjnTVjRiXu4O8Yq7l
 aho3qLIWU3NW/2ZZi2FQlNa7jAOHo8x/cyeOk3wn/FrAFgXMcr89dPXPq2EWoiOJE/yan6K8SFk
 N9B1eJkUY2Kk1hPoNIL1v16Yp30J3m0/SrQPY8yatXgPSrkMIPsFyFspGCBnYSXY6K4dJymFy2W
 I/mKGUnjR7B78n4aMunvQjMvlArzoL48/bGoFMZk50PMR41lvWkL+V06NfFgzuZLLGdUxF5wNlE
 qdvx1nZYukKqwyZZQJgMe1cqGnYC8XgIylxGd6/P72zMtZAVbHedqtofnYN01NUnyvr4aVuq+fc
 YD+Nh7vznXn9b2tguU5eMWsq6smrslvS/GS9nSEtBs7zmwLm3yGrBPmhYq2dST/8BL23krP28Gv
 NK
X-Google-Smtp-Source: AGHT+IFYGkTZy4avjQy0N7SquyeuiYKdD1+Bo8iVNMdftRdhun72mwKDnOdOE9z3taJMYn2KWr8gYA==
X-Received: by 2002:a05:6602:2cc1:b0:896:db58:683 with SMTP id
 ca18e2360f4ac-896db580791mr3945439f.2.1757982112252; 
 Mon, 15 Sep 2025 17:21:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-88f300980f8sm522662439f.28.2025.09.15.17.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:21:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:21:50 -0600
Message-ID: <20250916002150.2485263-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757982112; x=1758586912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SKmePd1Ill4Z+m+PTZAsoepsDgxrOeUCD9oX2y+T1YM=;
 b=idQVjY0Y9ytLFn1LyL3VXOlvQv5oeuoEVFpQysTU3SgSsj+WUL24656QcKBZdeGU5L
 vR0v8L5egy+1Df041tpqnytg85RqGVXNmQLYXbi0INWcqjR0lzCuFA6ZugQICNVaMiUp
 G1gw82l8uCpJb6H7IFAhAz9Cw7QVwT0rccZv9wMWl8hvfOhjMK4BM3whagox/ZzQ9ByX
 YPkcZUZ8VRM2G7Ua+cRd/QrSQ3iSi+ApAR5froV/Gsc2xg2z3n4WRYvYDq4w6dDFdL9j
 NhRPjziuVcsOlKXJyqY7iUHXWzVwq2sdYyuS4Q9EbQZ+ojOpNOIFFjUdBOJubNEASPI6
 8lAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=idQVjY0Y
Subject: [Buildroot] [PATCH 1/1] package/python-pyaml: bump to version 25.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyaml/python-pyaml.hash | 4 ++--
 package/python-pyaml/python-pyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyaml/python-pyaml.hash b/package/python-pyaml/python-pyaml.hash
index 29863ed502..c1029bba59 100644
--- a/package/python-pyaml/python-pyaml.hash
+++ b/package/python-pyaml/python-pyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyaml/json
-md5  ce3505d0331fdfc05c98f0a514308063  pyaml-25.1.0.tar.gz
-sha256  33a93ac49218f57e020b81e280d2706cea554ac5a76445ac79add760d019c709  pyaml-25.1.0.tar.gz
+md5  b5b6dc631c2c117ba3373faecf6d72f5  pyaml-25.7.0.tar.gz
+sha256  e113a64ec16881bf2b092e2beb84b7dcf1bd98096ad17f5f14e8fb782a75d99b  pyaml-25.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc1342cc1cb49e24c1c9e8a495acc9625ce2e04146c116279af0ab0949cd829c  COPYING
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
index 06e3871b5a..a39f6d5568 100644
--- a/package/python-pyaml/python-pyaml.mk
+++ b/package/python-pyaml/python-pyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYAML_VERSION = 25.1.0
+PYTHON_PYAML_VERSION = 25.7.0
 PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
-PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/f4/06/04b9c1907c13dc81729a9c6b4f42eab47baab7a8738ed5d2683eac215ad0
+PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/c4/01/41f63d66a801a561c9e335523516bd5f761bc43cc61f8b75918306bf2da8
 PYTHON_PYAML_SETUP_TYPE = setuptools
 PYTHON_PYAML_LICENSE = WTFPL
 PYTHON_PYAML_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
