Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D4DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 932EB4004A;
	Wed,  8 Nov 2023 23:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 932EB4004A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V49eIIApZXxc; Wed,  8 Nov 2023 23:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8058D40114;
	Wed,  8 Nov 2023 23:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8058D40114
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1EC1BF966
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BCF160B8E
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCF160B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFlc3kfbW2uc for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:20:10 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8667560B6F
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8667560B6F
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-359c1f42680so1105545ab.2
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699485609; x=1700090409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2N1RXHEGDOW3EAnxYFiP58U1WLn8SjbfJ999pkjUkPY=;
 b=a0xSLsRPfj7H8iIl9KZtTkROjEK0bSd1IkHmLwgQPKrESfWGGPi+fTs79l9hfpRtha
 7I33T5FU9AMeqpA0vbZtjQIwcWMkXwSVnOanYqGrv3lP6mnzFNa311fkvR7ijHX4LsKP
 EokxfqAOwF0paSpIOHNd0N9GZvxSauCVppvzUmn4rVKrqBwqbR2kxf2eMYdbiSJiN3bs
 WzBI2eH/RvTachmziv3Q8nCpk42ZBq1faoHjzUpvk9lNKZ8sg33zV7unEyn1d7/rBFa3
 JSo2D6wSm7tsL5ie1IhBAw05H4k9wfG8+bNG3g5eRIl0McguFgdzxmRmqq05OVEYUeJ4
 vvGA==
X-Gm-Message-State: AOJu0YyWhjnkW460u+01xTgMlCoYJn+uVcJrt1W1wwph86lH9a8BEcvt
 7Gm5R6tRJHL/tFbLCgzacqj348L/xZs=
X-Google-Smtp-Source: AGHT+IHYKROAg09MXkrga0/tW6iSoKrEU+WaxZmPsOh3hyA3diFsUvTt/OpKQfxXaG1BXONnUrACWQ==
X-Received: by 2002:a05:6e02:214b:b0:357:f12f:d192 with SMTP id
 d11-20020a056e02214b00b00357f12fd192mr3263413ilv.32.1699485609225; 
 Wed, 08 Nov 2023 15:20:09 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 g18-20020a02c552000000b0042b279bb086sm3557591jaj.66.2023.11.08.15.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:20:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:20:07 -0700
Message-Id: <20231108232007.3649417-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699485609; x=1700090409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2N1RXHEGDOW3EAnxYFiP58U1WLn8SjbfJ999pkjUkPY=;
 b=GdYs/axQTPjAotbcpzJaX2T3+Rh4ToA525Xv8wb3ZeSuqTAZQFAiYUWXnMAKSAQ7w9
 sy2Roe72nbFu5Qggb2t7de0uVgqQBnRZDg7PTX+dgzNxvLaudPuptaP9vwYe+1m60Mvy
 yin7IboVeRXvrpxeFayHJdpwgE69bagyTUcbfueWxLmz0ni8KcbEM9u4PWvIN3F67v2f
 2HULpPl4bOSUUl2Zf7Xx8/wKzhT1oQciU+Xu6v//oQkJ+gNDOz5FlwIjbTNBuf0a5ChK
 AYnDBKeIXo+j0GygUBOd4waigseJqpSRTRRdpRSX5hEtt41JUIt4cNtwvzqogN24BKmB
 0bHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GdYs/axQ
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to version
 2.4.10
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
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index f8582ba5b8..0e14f23261 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  bb3f451bed011a0d8959e3c1d5850c53  markdown2-2.4.6.tar.gz
-sha256  f65b4dbe1e16591b14fd40bc659b8b58d285eab70c1da21f390294fcdec42bb0  markdown2-2.4.6.tar.gz
+md5  a338c5be41a822914af8211b080659fd  markdown2-2.4.10.tar.gz
+sha256  cdba126d90dc3aef6f4070ac342f974d63f415678959329cc7909f96cc235d72  markdown2-2.4.10.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index b1c162e12f..b4719562fc 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.4.6
+PYTHON_MARKDOWN2_VERSION = 2.4.10
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/83/b7/24613765f558afde9f47b61fcd787a9856ac1515b53af38bd11bf2fb3c8c
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/8e/b3/64c459af88ea8c2eeb020d0edf3e36c62176e988c47e412133c37c5da5e7
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
