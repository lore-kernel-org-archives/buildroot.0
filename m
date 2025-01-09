Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7352E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 19:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E866076C;
	Thu,  9 Jan 2025 19:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsViveMLNhKD; Thu,  9 Jan 2025 19:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 795B660893
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 795B660893;
	Thu,  9 Jan 2025 19:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36C2476C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 251016076C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJAQTzL2uCJ0 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 19:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2467A606C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2467A606C8
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2467A606C8
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:08:22 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3ce464e52bdso4116555ab.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 11:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736449702; x=1737054502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O1DCcInZMGnXs4PkjZNd+zW7trLxoxNbXc4rYNJDAAs=;
 b=bhXpsDDPdVHdpVH0ZC+Rju4wsb37lKfiKBq/3vvjw3c0Fjn3BR0MhYPa5smTsLVXvQ
 CnmAlzEG67kw+tAhRsZ4vP3uwBCTgzESdg0P+92pFuHLUvIbfqHs30sANZvkHaBMztVl
 vDpNxvniKY0ZUzWGt41qmOpaldtIQqWyBdkYa1N6txwSp4i9V0aotBlSXXBNFPg5A4jX
 38Uf477EXRkYuHU5/jhc6NSDj4SB5hxUb9tcr24rOfL7ivNnYKUkXJh4eik2gVlKYLkr
 MmFVjNpzdbVf4qUouztm1jfx0dyAEumZcwXjrd6uqnuy5Lllnea1NE4J3bBrY1fYRWC0
 kxEA==
X-Gm-Message-State: AOJu0Yw/56VpuxAaNFlMkefzHuJCzgGLSZ1HRAmokps/imKuOye28s86
 devlPAmgUdfv09DFFMUvtLSbKPR0L8ooxuSG5CHNInyUo0ud8WdUaYskQ2gnpdQ=
X-Gm-Gg: ASbGncsGAIvuNmZYEQoMDackR7qVkPzxwXTWiIpaaJvpe5/1Tn8NF+mP9i8DxYrtwSV
 O9gUTETbBY0LryPnIs90xd5+nRNwt2CEY7cbeuTXgpw4EjAePoAD2SVef/ppyv1v1WUGtWb0ZkM
 0btWWdoEZEDQWDy8SVopwPsPU2UQOF1powaDGxHvDoWBycwJOxp90z44Vy0nLBTM3ofRb2AntoH
 l9Sq59xCXAYuvHsXYIeJzJetdCZJFU31mJOmOjlAABjKLsXeABjiXL1hGFh1SQgepDpqRVcubU2
 kivZRNnGi+wmLfmnHgHmKOyS2bcoGTs=
X-Google-Smtp-Source: AGHT+IF0sl1v0K0iJFN2+9n8MHQ4YW9hpk/P+rQGW6MJGEA3PDcGSiSnTCQrZqefaQZYVyUtT4eM0A==
X-Received: by 2002:a05:6e02:1948:b0:3a7:e4c7:ad18 with SMTP id
 e9e14a558f8ab-3ce3aa540d2mr51791945ab.18.1736449701775; 
 Thu, 09 Jan 2025 11:08:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7488casm453621173.135.2025.01.09.11.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 11:08:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 12:08:20 -0700
Message-Id: <20250109190820.2353626-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736449702; x=1737054502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O1DCcInZMGnXs4PkjZNd+zW7trLxoxNbXc4rYNJDAAs=;
 b=TGfPnwazeoxDcdFAea537HJClZYsLPqU38T3xVrLej3EBctQt2oSCzramAZYJlRoQd
 QAp8ojz1Msxsk01RP0lVW+xVrpAG8Q9/P7J9Cjrbro8ADQBciyp+7knmeRYMJjv6xsFz
 qutMRWC6sIZ5NySaQkXgeHcu+1nD/rCkUi/LzYyvrK8n89XeBY5ODW3vD2H38EJu4usQ
 6R2AKNHuFMwyLOjQ0Ipb2XwvmeLNfMS0ySJ0Px+AYEUeUSa0oeRC1lDn5HNI3lw5L1k7
 pi9DDAqrvpxXk720KFy3Lvm3gPuC0A74HnU630UrLTDfW2KUoxWpAZd0T7BkVX3Pb/hZ
 Ru9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TGfPnwaz
Subject: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version 4.8.0
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
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 6896b7d516..4ff6955ae5 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  6d0431fec06206d2bdbf57d449f1616b  anyio-4.7.0.tar.gz
-sha256  2f834749c602966b7d456a7567cafcb309f96482b5081d14ac93ccd457f9dd48  anyio-4.7.0.tar.gz
+md5  ad00874069a6685b2e3e84c5a2e045cb  anyio-4.8.0.tar.gz
+sha256  1d9fe889df5212298c0c0723fa20479d1b94883a2df44bd3897aa91083316f7a  anyio-4.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 8c814abfdd..4f38e12794 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.7.0
+PYTHON_ANYIO_VERSION = 4.8.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/f6/40/318e58f669b1a9e00f5c4453910682e2d9dd594334539c7b7817dabb765f
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/a3/73/199a98fc2dae33535d6b8e8e6ec01f8c1d76c9adb096c6b7d64823038cde
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
