Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D12C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 18:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC60B81E38;
	Wed,  2 Nov 2022 18:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC60B81E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6IgMKxcM7I1; Wed,  2 Nov 2022 18:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178E981E32;
	Wed,  2 Nov 2022 18:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178E981E32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BEF31BF4DB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33A6560B88
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A6560B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SP4qFtTcrLHP for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 18:06:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07D4C60B70
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07D4C60B70
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 18:06:41 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id 7so9847221ilg.11
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 11:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sfN4i3WOvBegFa6FP482OzJk2hAvfzgKwtzE8tJEHMM=;
 b=fK1NRdPBiczkXL1FwUAr5NqETX86RwEfv/bBnAzXzcpll212OEssSf40xc8MjlchOa
 fhARCAz/RNr9FdK+10mtjtz/TDOLnKZADn0+MJHOBII73LynMbMJ1DSZZRi2xG/mSroJ
 r9qUPw+gn9zt1nIld9Ae5+YRUHsoqOKVT8EfGZwRkDi9GDlyyM5YEkUxVDcoqV4QKuN7
 xUMchz3ku7egRal1Xw02BL3LY+K288m5R2yOKnJT4r9TDfgl7LskFBhZK0zZ1FlEZZhq
 WPYt4ZOR/zjLhcG0BOcPqtLCrJ/YWkzmcWdlfcIMgKcRFJDx2WeJqa1eUzuSZ0tFCFed
 NsiQ==
X-Gm-Message-State: ACrzQf1ZhLpN26+kWvqsNK9r8WKPhHY8XnTT2RVSZXG/ZiUC04TDi0sD
 QrdRPN8gF6+7qMVvhUbp3pdEEuz1aw15gg==
X-Google-Smtp-Source: AMsMyM4fkUkFfX9fcN9xuMW2DQcYHKRm+juPCZdwPbUp7jU62UqhFRkmOz8LEj1mdfuDfwDf1sKIXg==
X-Received: by 2002:a92:c102:0:b0:300:cf38:1743 with SMTP id
 p2-20020a92c102000000b00300cf381743mr2856328ile.114.1667412400713; 
 Wed, 02 Nov 2022 11:06:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f19-20020a02a113000000b003754033c6aesm4950052jag.155.2022.11.02.11.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:06:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 12:06:38 -0600
Message-Id: <20221102180638.3644675-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sfN4i3WOvBegFa6FP482OzJk2hAvfzgKwtzE8tJEHMM=;
 b=ZV4c1InSz6gcRKE+gllgPpHyol75ksUrj9pg/MEITJ/jVd2DUV56/IpSGqd9JgGJqz
 80qu6dx/3bGMMQxKcP7u7WWGPy4LNgco9Cm82XKccVx0mqNLDg68R6fP833JTXr65Uza
 o+wWMIvAVb1Lia+cQJi8cx4TxfEp1pePFa8/OJ8HaXQHFO/Gmg9uVsEdobYWT3nUjtzn
 gmq5d7hVdbD9E74KLjhXDomoaL3ysDD8IWwJKw+YfyEaTSfNNN2UmoRmHwnZiSxkZsNH
 xq6MoVhth3o+v67nZ3W+dA2m7fsuVh04GLT62CGJUh6cvoMp6tObuHXTnClCrgBz/J8y
 1aZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZV4c1InS
Subject: [Buildroot] [PATCH 1/1] package/{avro-c,
 python-avro}: bump to version 1.11.1
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/avro-c/avro-c.hash           | 4 ++--
 package/avro-c/avro-c.mk             | 2 +-
 package/python-avro/python-avro.hash | 4 ++--
 package/python-avro/python-avro.mk   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index 7a4a6f7aca..b52a787ed5 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.0/c/avro-c-1.11.0.tar.gz.sha512
-sha512  5369ec11832e0ce1aa0181d594f657bae82ab5fb317ec1bee5ba190de9ed42956b425a5bf7e423940e8f871a54ae1246b92db2ce8562f270b4a05523ec4b60ae  avro-c-1.11.0.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.1/c/avro-c-1.11.1.tar.gz.sha512
+sha512  e72e8c245a8b86326bc18a5d5127e9beeaceaf805e8a62760fd88d627e29954c750346485bb43822df408c8a172d910c27ddf7e3815bddbdb04d16c54d859323  avro-c-1.11.1.tar.gz
 
 # License files
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index f55c579656..f217c1d7ed 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.11.0
+AVRO_C_VERSION = 1.11.1
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index d752fa8ae6..0d457a11fd 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.0/py/avro-1.11.0.tar.gz.sha512
-sha512  8af67deb33b9990b74ffd7ab5c3c55e13a649070b4623c7bbe2b278287fd0929e57ed6d0344f9e93f3eb79663b43f75891d0810812349dfaecce65fdd9b44e93  avro-1.11.0.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.1/py/avro-1.11.1.tar.gz.sha512
+sha512  bce5983cd7ed20be848cca41d143f16bf5bab57edc010d590fc1268405de4267e028ff7ec740282a03034aff5aa528feadb2be4e71ee6879b3080e0a9e19cb37  avro-1.11.1.tar.gz
 
 # License files
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 42aa11aa4e..6193cbbd8e 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.11.0
+PYTHON_AVRO_VERSION = 1.11.1
 PYTHON_AVRO_SITE = \
 	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
