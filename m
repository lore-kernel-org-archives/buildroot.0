Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F0DC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337128134F;
	Sun, 15 Sep 2024 22:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ob6J7_pm-Azm; Sun, 15 Sep 2024 22:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378C68137C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 378C68137C;
	Sun, 15 Sep 2024 22:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE9201BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8C98608A7
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wd5o6ekFzsf6 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7227608A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7227608A6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7227608A6
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:37:45 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-39f51934f61so8333235ab.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726439864; x=1727044664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/dzxV4Zdinl2da/Ay5YQf3O/9PA1VfDqNSqa8f3WqqA=;
 b=mTScupGzDn1rvou6gL0OH2WmyHQ2wwaKX/rcHLIEeMl8FCMeLYNfeSwvHkU1N4LwFx
 gS0EoJbfEOrGqXBuen4xGCAY4QPK81xk36AtPeBVW8UoeRn505bhJubQ2Og06oFmr0mx
 mW8k1Bj5dgTcZSz0bYhkscdiPE3tspNi8m10CDeCE27BNZs+5cmv75mnY9iFkL2D2iIe
 yUz8pKWbu2Vl/DCLUhauow/wsFApW/Rmp2ZqoAUr1+zH2E8TNC76z1jiLH8LHknpZFtt
 M1fCjqeyaUocJyPlzPbrEcW9xw8ZXZWy2iZVLrMpqzEXLW1miP0icn3TmLrWiCIM9A3y
 O3pQ==
X-Gm-Message-State: AOJu0YzOmoKPrYYLyQbFQyw23bFhF6U9jND4NNT5IQPhiPvlt0urTs/I
 e1Pex9z4nU0lPH0S4AI9PIYiEO4RjqYfrHIGFF9pH6ZEvKVw0t6G9mMxaA==
X-Google-Smtp-Source: AGHT+IG//xktXQO1FMfHaH2fxeuhk/t9bbRk05xlFQfPqhctqYPtvjjht0UtDRCubqnr3Y6yowKPCA==
X-Received: by 2002:a92:b705:0:b0:3a0:8c5f:90b4 with SMTP id
 e9e14a558f8ab-3a08c5f9187mr61429295ab.4.1726439864187; 
 Sun, 15 Sep 2024 15:37:44 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed19032sm1135905173.99.2024.09.15.15.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 15:37:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:37:42 -0600
Message-Id: <20240915223742.1668848-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726439864; x=1727044664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/dzxV4Zdinl2da/Ay5YQf3O/9PA1VfDqNSqa8f3WqqA=;
 b=WXm7vZ5BRR8e/1rouzCk8vofMwoRfJGtnGsgCPRECibSMNp/pTs/LoougAnOI3pss9
 As9Gb/jRgqDrIZReG6VyorIq6EX1GzRaWHju2wTf31MydhhMnFXpWNm+qyuyjlXnzcpd
 dn4Pp8cUNGtb1XCjjuZ5LKvWiIpszj+PTVelwsQxCtD4cQnLtFsNHUSobT6RD6NF27RT
 FcPYErObAs0Z5jqrwX4kZZQ9d4+4yf2XLHLhBLX6XYhLMzj6QS9Faau6DmBRtxUQUtQx
 k0fh1wKrKXPGtEd2IDK5W30KU9KYvnoSiwDHIZfl1sL0gv2qLiuDQsPhgizQoKj0Za+T
 Dw8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WXm7vZ5B
Subject: [Buildroot] [PATCH 1/1] package/python-matplotlib-inline: bump to
 version 0.1.7
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
 .../python-matplotlib-inline/python-matplotlib-inline.hash  | 4 ++--
 .../python-matplotlib-inline/python-matplotlib-inline.mk    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.hash b/package/python-matplotlib-inline/python-matplotlib-inline.hash
index 7382fc3406..1925a09808 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.hash
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib-inline/json
-md5  aded9a57e2f526f76b3a4851d5528d4f  matplotlib-inline-0.1.6.tar.gz
-sha256  f887e5f10ba98e8d2b150ddcf4702c1e5f8b3a20005eb0f74bfdbd360ee6f304  matplotlib-inline-0.1.6.tar.gz
+md5  96fe871bf30dc414e6724423c1e2ebb1  matplotlib_inline-0.1.7.tar.gz
+sha256  8423b23ec666be3d16e16b60bdd8ac4e86e840ebd1dd11a30b9f117f2fa0ab90  matplotlib_inline-0.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  8521b036c6448e0e0aa7213d4713b6fdee0f4c64c9f320450f77346bf5c0e8e4  LICENSE
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.mk b/package/python-matplotlib-inline/python-matplotlib-inline.mk
index c9c22605ca..961b50120a 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.mk
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_INLINE_VERSION = 0.1.6
-PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib-inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
-PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/d9/50/3af8c0362f26108e54d58c7f38784a3bdae6b9a450bab48ee8482d737f44
+PYTHON_MATPLOTLIB_INLINE_VERSION = 0.1.7
+PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib_inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
+PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/99/5b/a36a337438a14116b16480db471ad061c36c3694df7c2084a0da7ba538b7
 PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = setuptools
 PYTHON_MATPLOTLIB_INLINE_LICENSE = BSD-3-Clause
 PYTHON_MATPLOTLIB_INLINE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
