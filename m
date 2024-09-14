Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E670FC021BA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85BF8401C4;
	Sat, 14 Sep 2024 21:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6GIuRVpNlfq; Sat, 14 Sep 2024 21:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3474F401C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3474F401C9;
	Sat, 14 Sep 2024 21:22:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 587CB1BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C116D81EE4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOYPlBHbpjot for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D082081ECB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D082081ECB
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D082081ECB
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:22:27 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-39f52e60a19so17798855ab.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726348946; x=1726953746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OX7zBP5q5vUfD+Z7pQJAY5gWAGXfWx0i86XaL/O4aec=;
 b=bPyq/P+hoPR3OcwmUd+IN9bj0BtYwvuzT190tNMkbGvFGg2oTpMKUrcaNxG/ewDEkB
 e3PJvvCifC99YjzK9KCMlxQe9ANsB+S2zXDQrpT0UxqQVV/XCWMOkyo8Y6cP2NQ0EqWH
 gq4CQ6z3Iuc1cLW5U3JPy/+aAEQpH06rB1FuNDpuVzQ3EDNPwaeXRW0+3h2B+7m47GaK
 +7NdL+dEIOM1iAdCkwqSugO1rQY945jvqbMsgTVsg9GIsAFe34NdZp3U8/C3hJBsZuUH
 X+3Gzqxvwsg5FkqP7Oew5CN7pYU7y0wf4sO6FeWNUPmAlTbdLJV1QIc3NCmGLrQGSfte
 nRzA==
X-Gm-Message-State: AOJu0Yz6WMFiOGOV8GFLo908puD6LjI0bWYY8lFjDGrK0Az6AU+KZwRf
 XAtaqUPSIbpdRypQV0jhSlXDDobF4udi+w1nM39KDeX4XG/pxSFDDTC2qQ==
X-Google-Smtp-Source: AGHT+IFgqjN1DtdRx4e+Pppfmcvi31/i3+yWF5yFMuGbEcxV7H2wVQzU9sd+mHXU8yDkyV0j2FMSRw==
X-Received: by 2002:a92:cd8f:0:b0:39d:2e35:4d8a with SMTP id
 e9e14a558f8ab-3a0848c8ed9mr99072745ab.10.1726348946405; 
 Sat, 14 Sep 2024 14:22:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13db4sm581257173.109.2024.09.14.14.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:22:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:22:24 -0600
Message-Id: <20240914212224.1272858-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726348946; x=1726953746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OX7zBP5q5vUfD+Z7pQJAY5gWAGXfWx0i86XaL/O4aec=;
 b=erVhx5DaBTRF4uggExqP3wHmI/OlhZJL+Ef8bR7OZxe0+Eul7a8c1HafAFMZ94+8Gv
 rndDVBqL9rswzdWD/lOlYuQMw/Scdr/GrtUMp6hC6yY6zdaVWtf3SnldPOaxsyOy1ppQ
 Bvpzv4BXtyQdi9xn/KoCcJmiJnJZyJcLA1XV+HMoVY+l11DvCIZAMradYfwjTVfgYcRr
 gMpDJJYFliPAaIFak3xfroB/3QB1L67OU6kxcOReY7OtzM+Q+KXsRPJsQ+46o6KzViSg
 ZdwO2j8UED9i0J0uZp9j10YJsHWyY6yBEFJtox6AuP7nGOyesKRsnzb8kdWdzOhCmE/4
 8Rdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=erVhx5Da
Subject: [Buildroot] [PATCH 1/1] package/python-apispec: bump to version
 6.6.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

License hash changed due to date removal:
https://github.com/marshmallow-code/apispec/commit/3de29d7896ac01cb3f40d73ff226b64853064f6f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-apispec/python-apispec.hash | 6 +++---
 package/python-apispec/python-apispec.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index 9c47a2c1a6..a11c7af9b6 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  1aa13f34a226fca977d72f061360e96e  apispec-6.3.1.tar.gz
-sha256  b38e4479916d43f2b1e88ce15fc2fae93adf2e8d55cb59ec74ac66a827941483  apispec-6.3.1.tar.gz
+md5  6d4983057ff8ddb5d9ab328fec6abea0  apispec-6.6.1.tar.gz
+sha256  f5caa47cee75fe03b9c50b5594048b4c052eeca2c212e0dac12dbb6175d9a659  apispec-6.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a452afcef750956a8396f7e7a6f913a117d28ef99a13170c29dc74c3b7a95f29  LICENSE
+sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index aee0e16840..f9b6682943 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.3.1
+PYTHON_APISPEC_VERSION = 6.6.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/ff/0c/e70aa981d8ebe2e8a500a85c923579ce3363feccd704268e6ff8053875dd
-PYTHON_APISPEC_SETUP_TYPE = setuptools
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/ab/5b/5d94e1ec6a8e487c026b2a7518dfb7ea90c4c82db48de33c227b7c9141fb
+PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
