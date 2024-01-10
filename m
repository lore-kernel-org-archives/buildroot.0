Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5087BC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 03:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF7840111;
	Wed, 10 Jan 2024 03:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF7840111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSYn0gUDClpZ; Wed, 10 Jan 2024 03:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88F92419F0;
	Wed, 10 Jan 2024 03:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88F92419F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B40221BF5B4
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 03:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99F35613C0
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 03:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F35613C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVh_-k1EUz4i for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 03:40:55 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7267A60B9C
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 03:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7267A60B9C
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3606e11d9cbso20541185ab.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 19:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704858054; x=1705462854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MZkXU/qEJqVUMvk8kZaS8Ds3BCcyOUK1pEgmgemwTE8=;
 b=OoBXLMPOZcXJ4ZMqKUhcyNz64Rx2gWt9tqLf8U4xMYcpwcQlnDXYzyXj3sCLfVaPbY
 gCSyTcmng15P/bqoxR0Hw0s0V44HXccMsjWRXR15Jk02itVGKnxr5Xo6lHk5Mi8XwoaW
 +4iU6HgTTPbvkU9VUbt0/PRRM3qxrASeQfRw/Ta/PQ7tlASMrH4xSOE3rquh8z1qH6rB
 JfmV8zaBDn1j6yCtkCw883TToyC59uFfoEWsA67YFJQxsovv4jME7Ovbi8VIGvk8+MQc
 M1VtEGxwa2/ZPOPag2UP0Q39HXC/x6/O1j6LiMHfZj5wu5ZlIo5rAg7vD1yKFHIYCVF1
 I1CQ==
X-Gm-Message-State: AOJu0YzZtu+Sm0jw1jskvS810XuXv8rMXG4NZn6pdg1yt9X8+kWYB/HT
 K8URpYhIMuqOgr2M5aL8cELIwAe7Y+KQeQ==
X-Google-Smtp-Source: AGHT+IESOZR/+ap7XIT9C0ZosAZ6P2sdUD4ndRFcPlmACOlWeW7c2gI+ut1qvbxdnbmgXUXMKWcttg==
X-Received: by 2002:a05:6e02:174c:b0:35f:fe74:2ca4 with SMTP id
 y12-20020a056e02174c00b0035ffe742ca4mr747283ill.26.1704858053934; 
 Tue, 09 Jan 2024 19:40:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bt6-20020a056638430600b0046e107e49c9sm1064174jab.155.2024.01.09.19.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 19:40:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 20:40:52 -0700
Message-Id: <20240110034052.931500-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704858054; x=1705462854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MZkXU/qEJqVUMvk8kZaS8Ds3BCcyOUK1pEgmgemwTE8=;
 b=eCITkrPAMvJA0olvjfx0zjXofhAxL6LQhTEc9d9Sjca2HqKveMXyk1/HTrQnk7IIhU
 EOdE336r+Y2NXTH2YkLBY1ljcZKJV/SGYtenEyn5PRFCCrEzYmxz3peY+9vkGif5+ymH
 8gD+ummoKfUy/awdPosdWQ+6a6BKWJcXJp9AMZCHL3bl/13thrvIb2v63DKh/H5YkZoA
 ZGM0uRSg+YUAX72h+sTly860ETpxs7S/OFljo4Xya3qzyCibXJe75rR1y6qJeVU+ZmKx
 Rmd66rq/KDe791BE7OLw1cX2ugI6Re2SkFjgxEdu2wbmyctITbQLEmVl8gL0F1QOhYGw
 1QMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eCITkrPA
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to version
 2.4.12
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
index 0e14f23261..0a76499185 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  a338c5be41a822914af8211b080659fd  markdown2-2.4.10.tar.gz
-sha256  cdba126d90dc3aef6f4070ac342f974d63f415678959329cc7909f96cc235d72  markdown2-2.4.10.tar.gz
+md5  69cdd2c9ee1f6837cb173a44d6a0622d  markdown2-2.4.12.tar.gz
+sha256  1bc8692696954d597778e0e25713c14ca56d87992070dedd95c17eddaf709204  markdown2-2.4.12.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index b4719562fc..4c21eb98e8 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.4.10
+PYTHON_MARKDOWN2_VERSION = 2.4.12
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/8e/b3/64c459af88ea8c2eeb020d0edf3e36c62176e988c47e412133c37c5da5e7
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/3c/e4/87a454674ac303e2ca6c25713845d2ae1b59c1a88576054cbec25aaebad1
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
