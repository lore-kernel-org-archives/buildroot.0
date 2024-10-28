Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E1D13590
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 862C9607C8;
	Mon, 28 Oct 2024 01:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15j-yKC4tjua; Mon, 28 Oct 2024 01:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EB58607DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EB58607DA;
	Mon, 28 Oct 2024 01:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E7DAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8ADB607DA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVjOIOFvtcnC for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:53:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2DB3607C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2DB3607C8
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2DB3607C8
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:53:27 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a3bd42955bso14808505ab.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730080406; x=1730685206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LFaGPVvHSl+p9b2v0x99sOc5c5loghHelenGhM6tBw=;
 b=jD7lQDUqvSw23VKiezmD4ugSSxCr1SrS63QZfS8KfmpTW8bKjXTjWfvX2tAQ8kcckq
 STJqbfKA1Zz7WMdDCClqK0wtva9NJKIF94ceos8yi78Lwibuw9/YOko4Xmbn+lGyYhlm
 57ccFgc3C2FFUfkD6VsOj7CEg/SetDZLZN55UOFz6wT7+Ctbcmeuw1BA27MxzhTVfang
 ypJ3EhG0sqGfFsDlvkqqRsdF8KhSULjIgzW5LHRIEZc6g+jLUXTP01+a8LUVqwkbJqWv
 046hZgN00crHmp/zfZ5OclYzmlfLA7Muf07PRvuJTipf58FxNaY+mlwJ71kjCw99YIPI
 edRA==
X-Gm-Message-State: AOJu0YymEHUwBvHcN3yjhXuzjhxV1ZAMyi3jT5Bc34vuwfpqckXrlL+F
 H6f2XcWCI0jNuds+VAAoxmZ19zOrUXvhpI50Ksgl88uuRBnhZuGnbArCDQ==
X-Google-Smtp-Source: AGHT+IGQLdxjMcImqprTzVQwerORouxQ3UieCxmQKYRodRaBU71/XA7XuCOFdaF4nk7L+gk/rv5/uw==
X-Received: by 2002:a92:cdac:0:b0:396:e8b8:88d with SMTP id
 e9e14a558f8ab-3a4ed29b811mr52044065ab.11.1730080406649; 
 Sun, 27 Oct 2024 18:53:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e7fb99sm13844525ab.88.2024.10.27.18.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:53:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:53:24 -0600
Message-Id: <20241028015324.4145862-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730080406; x=1730685206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5LFaGPVvHSl+p9b2v0x99sOc5c5loghHelenGhM6tBw=;
 b=QJol/hZX/luIce5o4Z1JAQIpLliJaAoi/T1EZtTAqhGMoiKvM4whXWuOGldFtmp+RS
 44/x6cYudiFWvB164IPB9XOjmPvau2Z1nssBXyn5OGNOF1Hi9zb/ukSTO+3ubB5O8h+c
 b87VPC+/E7UnaJ6w1vj3ilRjP5dZO06qgKCrpmeLkuklPkAtBWQQ7M8ntwtTF6ABxIgn
 KW1xwj1ValN4B+SzxqdhG1iit7m1gkdC+h9fHjCWSM/3ke7Ag/r/MPCuQJ6CVc0TvvsF
 L3hhkabb3k9USTm7RO9Ux7iJNStjgqwH+SYdVCd9MZL3kd4gdtkq0IuEA9cH6OFZpX26
 Jc2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QJol/hZX
Subject: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 7.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 149e8ad675..a580b5dff7 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  4d644f1167c8a6b19b3690d301641820  zope_interface-7.1.0.tar.gz
-sha256  3f005869a1a05e368965adb2075f97f8ee9a26c61898a9e52a9764d93774f237  zope_interface-7.1.0.tar.gz
+md5  38f56d8efc8eda2cc40c206d7fd2a016  zope.interface-7.1.1.tar.gz
+sha256  4284d664ef0ff7b709836d4de7b13d80873dc5faeffc073abdb280058bfac5e3  zope.interface-7.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 7eafa80460..b2e3b8a561 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 7.1.0
-PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/e4/1f/8bb0739aba9a8909bcfa2e12dc20443ebd5bd773b6796603f1a126211e18
+PYTHON_ZOPE_INTERFACE_VERSION = 7.1.1
+PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/3c/f5/1079cab32302359cc09bd1dca9656e680601e0e8af9397322ab0fe85f368
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
