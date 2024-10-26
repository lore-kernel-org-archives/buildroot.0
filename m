Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2CCD10C03
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FDAE404CC;
	Sat, 26 Oct 2024 20:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfjVf2tSsRxF; Sat, 26 Oct 2024 20:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26CCF404AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26CCF404AA;
	Sat, 26 Oct 2024 20:28:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B037C5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 901FC404BF
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzEZEFHp--IZ for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84DEC404AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84DEC404AA
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84DEC404AA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:28:31 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a4e5a7b2dcso6249735ab.1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729974510; x=1730579310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RPkVgwn5KNoJO3xMtMEkUZfcmAgPXXmULexc2dMUKMg=;
 b=bHlQtbYw41Os3NamtXIykibJGOTYmVD5gZY3hcwqP/xhu1ZyI+NwquOBhQA73WkLAB
 ydYFi3QQiB0ObFAs3hQqOAMKghUDNW2+5yseMeH6hC79w0xKDWb42mkYSAfMkcEcvqfx
 G3X7zauz45CCvMaewJgbBdXifHFfMzZE0w1zSknIrT4iJOc1h74olqoaRcoFvCGKhWJZ
 1yR23H0nJEinibTM5Z8w/s+7qxdl5opACZTO2jdoy2AmYUGk+otTgAUYorWqWUJzMn96
 CLhJYkyg7HvXd9G/YL0i/vL+VWHVmGu/yImQBY9dE3QWzQGh3T655EfrwYaSnUiGJndO
 2Aig==
X-Gm-Message-State: AOJu0YziWWjFgsr6gBbbT+DRv0LwKnkn8rVpkQW0CQgbz9+H+uPDkmtJ
 6MIOZd+9SR0+F4FZmF3ReQEzVr7gc9+McwPlslaHcEj8GXNEx5jcp5i3JQ==
X-Google-Smtp-Source: AGHT+IGA0l7XdIvsfTsyXTEqksqVKEfMlpnaLpLKD6M6B+ImfBAyBJVVOte39w/rEOwKkXFOdlE0vg==
X-Received: by 2002:a05:6e02:16cf:b0:3a4:e8cc:2a9f with SMTP id
 e9e14a558f8ab-3a4ed293235mr33500845ab.11.1729974510177; 
 Sat, 26 Oct 2024 13:28:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc725eb4e4sm859658173.8.2024.10.26.13.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 13:28:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:28:27 -0600
Message-Id: <20241026202827.3612365-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729974510; x=1730579310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RPkVgwn5KNoJO3xMtMEkUZfcmAgPXXmULexc2dMUKMg=;
 b=ZeyGh9cxmd2gR9KEbi75reX0Po+tXsPF/2ihYJHwsqc7zfkS66RSq9pt8p+teo4hoP
 8lMlymFR+Lc6LeFmS1lerPXHeguboGjP0QElISMETFjMpPtnKd83GkvpUgxLk45F1HxQ
 liHl+GADeV6M48UjO7e/hECjN7qink+IcXbedjZe0E0zePexl+LWwv8v6rAkF0AbalDX
 LnsLsSXkE05sH8EFN5pvlO0EX+9CYPe7TR9KCHWQRF+Ha6+kzUPVj/mWgpypfx8frH9J
 S2ThND4pmYCN87BwQ/RFJAIGB9alrPLJT5wOmMddfrnOL+kAxc0zCxWlHQil7Y9vS4hi
 AZxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZeyGh9cx
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.67.0
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
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index c470f97e78..e47f73f694 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  e8adaa7345b99791542c7ca4245f30c0  grpcio-1.66.2.tar.gz
-sha256  563588c587b75c34b928bc428548e5b00ea38c46972181a4d8b75ba7e3f24231  grpcio-1.66.2.tar.gz
+md5  7f03599b67e1959d616b16a29f79a30d  grpcio-1.67.0.tar.gz
+sha256  e090b2553e0da1c875449c8e75073dd4415dd71c9bde6a406240fdf4c0ee467c  grpcio-1.67.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index 70af9b5c3a..6aad3445b5 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.66.2
+PYTHON_GRPCIO_VERSION = 1.67.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/71/d1/49a96df4eb1d805cf546247df40636515416d2d5c66665e5129c8b4162a8
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/ec/ae/3c47d71ab4abd4bd60a7e2806071fe0a4b6937b9eabe522291787087ea1f
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
