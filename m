Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6515FCEE330
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 183E2401F0;
	Wed,  9 Oct 2024 17:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECQ-dVMAoVFn; Wed,  9 Oct 2024 17:04:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF9440222
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF9440222;
	Wed,  9 Oct 2024 17:04:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB78E1BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAA9E60621
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LV8-UxE5VUen for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C475F605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C475F605C6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C475F605C6
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:04:16 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-37636c3872bso332715ab.3
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728493455; x=1729098255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVRv5Lih8BijUddmBpfYSSgYJPQ4xBspIhJaOswhwFI=;
 b=p1SnerEuwJX7xtRKBuCNvhM8HP7X5zckcHeAOUZ1iTxGL2b/B4/XrWQ3vH1BIUz2nO
 drmKRj/pGvZLvxQTcYtLxwMUI347JOFQhMsP5jDW85MQ6khKYWI4qP6td5+6QSUPZKWi
 93QYcVBM5a3KyCXRGW4CMgBVjkYBR7aBWPjWdDZ+R7/12Xuz1HTukoMmcATZSyARhtk8
 qrYcljSGPubGhthaaLaH4PKQHiz8nJUSJgvHQXEyJGw+aTtbe25DllDkiP/P2h+ScDZJ
 Ci5F/OFtfw7DSHWP6aFW3c0d5aKowJg+r0Kz+r1/GG0YegprzFfLdE3rtOJYzhl8vnFh
 bxeQ==
X-Gm-Message-State: AOJu0YxWd/ELpKA5y4aeDfLgGfYBUd9FgD6d2qsvRZOf1UVmu6ZLOTev
 pYq3bKKek9o1asc7t5xMwO1wyk4DEYNYVq+ajQhZhKq8rYBY+7Hw7JysUKu1
X-Google-Smtp-Source: AGHT+IEVweHwA45jKYGNpV23oajFk3g+yGfA8+1DNUh7idatFWGBYGyDcUe8ZmZF6Irckm02jjwdiw==
X-Received: by 2002:a05:6e02:1c81:b0:3a0:9c99:32d6 with SMTP id
 e9e14a558f8ab-3a397d3331bmr31285235ab.24.1728493455220; 
 Wed, 09 Oct 2024 10:04:15 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db91334e11sm1047676173.74.2024.10.09.10.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:04:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:04:10 -0600
Message-Id: <20241009170410.3833214-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728493455; x=1729098255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qVRv5Lih8BijUddmBpfYSSgYJPQ4xBspIhJaOswhwFI=;
 b=OsGGT6JMXJAmZZwNG8j6wfhprTMR21TkhPUlbafyxo4FwXeU4hXTHEopw6mT9JXe+S
 1O83yEUcCd6fXnA+ujGgtOxgqLyQXm7geiUPkdlfURdg4PQAXGPUT6k1PHjXe8iDdyPU
 R9G4VVH6XM6F63SgWYBLr5x5sm/Y3VmqoYp/3QQuRvlRJVazlVC+Y0gPYjI0lPnfuVTK
 0/I3PrEO4EFeKzbFplLy4KFDZQ3J9LToVKnwcKPljcT2xodXqlqn5O34ac4+OU3aiBiA
 14XblmI36LXGS2YBrtMwL57D260aLz84AvxtRNYHhxjTmpH1jd9YDsPxRC0K/+9y+ETa
 QdAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OsGGT6JM
Subject: [Buildroot] [PATCH 1/1] package/python-magic-wormhole: bump to
 version 0.16.0
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 53ce709541..fae8e189ec 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  1cbb945daa46aa801686603b353f7246  magic-wormhole-0.15.0.tar.gz
-sha256  be2563b5c5547ba333bc6608f048004c8f36d556139bf2ffe3d9f41da2797006  magic-wormhole-0.15.0.tar.gz
+md5  a90c49d375a014cff1b1fc0f4fdba833  magic-wormhole-0.16.0.tar.gz
+sha256  14e6c146898dbda7a6d190262623a69419955363e7e434d64aad2d233d6d94c9  magic-wormhole-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 680108d84b..1c55a7000a 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.15.0
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.16.0
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic-wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/9d/7b/9320062c8b11e58dccd079dd62e3525bf1dac7f2b441c885d64a7ca7f045
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/1a/55/b82ace1c0c090bc6f629a93f3fb1ed60436731b166de2454d1585532c86f
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
