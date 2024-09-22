Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B302CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4204605CA;
	Sun, 22 Sep 2024 08:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2Iq7jTwwhr9; Sun, 22 Sep 2024 08:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2C2360643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2C2360643;
	Sun, 22 Sep 2024 08:26:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFE0F1BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF6260643
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roKbpv7FUJdT for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7310605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7310605CA
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7310605CA
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:26:45 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b482so131128539f.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726993605; x=1727598405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HAng/T/2emUoy2BpQ2CFgwt6ojOPTn2atGMOPqCg6/Y=;
 b=ai3VdQ0TWPaQm2QGJ3oHQ2Ah6ioYt5g+uPiS+6c0RwEZEaDMq048Azzfl9KKQXpN7s
 /GfJBwOBTN7dioGRG7JZ8VqXVPQZn7RiRGj2Qrv7KGnhxZfS+i/ppoV2VXbxR5KBGD3A
 VhI63UJSYMFY2yyl3NiewwRJioT8fxrVXxb9z2DgHWxHErH0Z8Fqw1gxhneUrDBpRLfq
 kDpCuSUQOM4sx+QknVHN1FGzJ+aQshA0+4d/pe6qNXGXjhzs5zFyptCvSTNG8bOoHAib
 3z01ae3vVLV7rlu/8i7tLM9zbL+nBM3n2RHyRUj2xLjcMnYQ6lDidSLRVpucxNRty9vv
 q96Q==
X-Gm-Message-State: AOJu0YzF2as3wgNtbVRPKoPfhJ9y14HxQPDV+RFYPECMxIearmjya+fo
 0nay0dM5/+y2XzVMZsRfJbHtg7IhgXtBSNFuttFVy41SXEkguQAfs+d00g==
X-Google-Smtp-Source: AGHT+IGkgf2/137nPk2daJGefpyR/3WHAk+r/u0rifmFFdOUkWweADsj0PfdTyA0Aq6Z/BZ6IoF31g==
X-Received: by 2002:a05:6e02:1546:b0:3a0:98b2:8f2a with SMTP id
 e9e14a558f8ab-3a0c8c9a3eamr66621655ab.10.1726993604669; 
 Sun, 22 Sep 2024 01:26:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1add8sm4442165173.119.2024.09.22.01.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:26:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:26:42 -0600
Message-Id: <20240922082642.1004417-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726993605; x=1727598405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HAng/T/2emUoy2BpQ2CFgwt6ojOPTn2atGMOPqCg6/Y=;
 b=Ixv6P4wAPt4mbtppt9cpI6jzKrnGKqHXxjqKsgsQulMFCXJsB2FpnWRF8qNZE2Gh2P
 RUmyLOf89oqNHfIRLsJgNUKin9vy1ojPKCHbg9/34HwXLeow/WI6DwDvd9aYxbPmxDRL
 DjSjj41jjrZJCiT97emItx4smkWHkgt+VM9oVeLHRDz/uuRbbVeWOiIz3qStYRmjnvC2
 nQDoje9P6i1KBwO3fEgcSQShhcQY/qsiAfmKQhi1Ps7WywzKUFvCEdzqoA77ZlGK1sVQ
 uUKa7kf1voVGaWNuVK1CnSWsfEnONBeHeU1Shke/4GlZtTb1RfJ8lW/Wr93MoJB+Gobo
 WQ2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ixv6P4wA
Subject: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version 4.6.0
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
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index c1edeca10c..b378c32203 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  04346dd3631f405d0786ca0f441dace1  anyio-4.4.0.tar.gz
-sha256  5aadc6a1bbb7cdb0bede386cac5e2940f5e2ff3aa20277e991cf028e0585ce94  anyio-4.4.0.tar.gz
+md5  24b255a1f6c85757cea820e9355387df  anyio-4.6.0.tar.gz
+sha256  137b4559cbb034c477165047febb6ff83f390fc3b20bf181c1fc0a728cb8beeb  anyio-4.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 4f9cbb78f7..b63c83166e 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.4.0
+PYTHON_ANYIO_VERSION = 4.6.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/e6/e3/c4c8d473d6780ef1853d630d581f70d655b4f8d7553c6997958c283039a2
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/78/49/f3f17ec11c4a91fe79275c426658e509b07547f874b14c1a526d86a83fc8
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
